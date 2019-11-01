using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using Backend.Libraries.Utilities;
using Backend.Models;

namespace Backend.Controllers
{

    [EnableCors(origins: "http://localhost:3000", headers: "*", methods: "*")]
    public class MemberViewingsController : ApiController
    {

        private FilmerEntities db = new FilmerEntities();

        [Route("MakeBooking")]
        [HttpPost]
        public string MakeBooking(MemberViewingViewModel booking)
        {
            var token = db.accesstokens.Where(a => a.token == booking.token.accessToken).FirstOrDefault();

            if (token != null)
            {
                // Check expire date
                if (token.expires >= DateTime.Now)
                {
                    // Alright, make booking
                    var credentials = Base64.Decode(token.token);
                    int separator = credentials.IndexOf(':');
                    string email = credentials.Substring(0, separator);
                    string guid = credentials.Substring(separator + 1);

                    var currentUser = db.Members.Where(u => u.Email == email).FirstOrDefault();

                    db.MemberViewings.Add(new Models.MemberViewing { ViewingID = booking.movieId, Tickets = booking.tickets, MemberID = currentUser.MemberID});
                    db.SaveChanges();

                    return "ok";

                }
                else
                {
                    // Token Expired
                    return "failed";
                }
            }
            else
            {
                // Not a valid token
                return "failed";
            }
        }
        [Route("GetSeats")]
        [HttpGet]
        public int getSeats(AmountOfSeatsModel numberOfSeats)
        {
            var seats = db.MemberViewings.Where(x => x.ViewingID.Equals(numberOfSeats.viewingID));
            int bookedSeats = 0;
            foreach(var tickets in seats)
            {
                bookedSeats = bookedSeats + tickets.Tickets;
            }
            int seatsLeft = bookedSeats - numberOfSeats.seats;

            return seatsLeft;
        }
        // GET: api/MemberViewings
        public IQueryable<MemberViewing> GetMemberViewings()
        {
            return db.MemberViewings;
        }

        // GET: api/MemberViewings/5
        [ResponseType(typeof(MemberViewing))]
        public IHttpActionResult GetMemberViewing(int id)
        {
            MemberViewing memberViewing = db.MemberViewings.Find(id);
            if (memberViewing == null)
            {
                return NotFound();
            }

            return Ok(memberViewing);
        }

        // PUT: api/MemberViewings/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutMemberViewing(int id, MemberViewing memberViewing)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != memberViewing.MemberViewingID)
            {
                return BadRequest();
            }

            db.Entry(memberViewing).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MemberViewingExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/MemberViewings
        [ResponseType(typeof(MemberViewing))]
        public IHttpActionResult PostMemberViewing(MemberViewing memberViewing)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.MemberViewings.Add(memberViewing);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = memberViewing.MemberViewingID }, memberViewing);
        }

        // DELETE: api/MemberViewings/5
        [ResponseType(typeof(MemberViewing))]
        public IHttpActionResult DeleteMemberViewing(int id)
        {
            MemberViewing memberViewing = db.MemberViewings.Find(id);
            if (memberViewing == null)
            {
                return NotFound();
            }

            db.MemberViewings.Remove(memberViewing);
            db.SaveChanges();

            return Ok(memberViewing);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool MemberViewingExists(int id)
        {
            return db.MemberViewings.Count(e => e.MemberViewingID == id) > 0;
        }
    }
}