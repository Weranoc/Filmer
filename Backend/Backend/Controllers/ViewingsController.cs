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
using Backend.Models;

namespace Backend.Controllers
{
    [EnableCors(origins: "http://localhost:3000", headers: "*", methods: "*")]
    public class ViewingsController : ApiController
    {
        private FilmerEntities db = new FilmerEntities();

        // GET: api/Viewings
        public IQueryable<Viewing> GetViewings()
        {
            return db.Viewings.Include(u => u.Salon.CinemaLocation);
        }

        // GET: api/Viewings/5
        [ResponseType(typeof(Viewing))]
        public IHttpActionResult GetViewing(int id)
        {
            Viewing viewing = db.Viewings.Find(id);
            if (viewing == null)
            {
                return NotFound();
            }

            return Ok(viewing);
        }

        // PUT: api/Viewings/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutViewing(int id, Viewing viewing)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != viewing.ViewingID)
            {
                return BadRequest();
            }

            db.Entry(viewing).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ViewingExists(id))
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

        // POST: api/Viewings
        [ResponseType(typeof(Viewing))]
        public IHttpActionResult PostViewing(Viewing viewing)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Viewings.Add(viewing);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ViewingExists(viewing.ViewingID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = viewing.ViewingID }, viewing);
        }

        // DELETE: api/Viewings/5
        [ResponseType(typeof(Viewing))]
        public IHttpActionResult DeleteViewing(int id)
        {
            Viewing viewing = db.Viewings.Find(id);
            if (viewing == null)
            {
                return NotFound();
            }

            db.Viewings.Remove(viewing);
            db.SaveChanges();

            return Ok(viewing);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ViewingExists(int id)
        {
            return db.Viewings.Count(e => e.ViewingID == id) > 0;
        }
    }
}