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
using Backend.Libraries.MovieDB;
using Backend.Models;
using Backend.Controllers;

namespace Backend.Controllers
{
    [EnableCors(origins: "http://localhost:3000", headers: "*", methods: "*")]
    public class ViewingsController : ApiController
    {
        public int GetSeats(int viewingID ,int numberOfSeats)
        {
            //Debug.WriteLine(numberOfSeats.seats);
            int seatsLeft = numberOfSeats;
            var seats = db.MemberViewings.Where(x => x.ViewingID == viewingID).ToList();

            //Debug.WriteLine(seats);
            foreach (var tickets in seats)
            {
                //Debug.WriteLine("hej " + tickets.Tickets);
                seatsLeft = seatsLeft - tickets.Tickets;
            }
            //Debug.WriteLine(seatsLeft);
            return seatsLeft;
        }

        private FilmerEntities db = new FilmerEntities();

        // GET: api/Viewings
        public List<ViewvingsViewModel> Getmovies()
        {
            var listOfMovies = db.Viewings.Include("Salon").Include("MovieApi").OrderBy(v => v.ViewingDate); // Get movies and sort them in date order
            var resultList = new List<ViewvingsViewModel>(); // Define the return structure
          
            foreach (var item in listOfMovies) // For each movie in the viewings table (plus lounge information)
            {
               /* try
                {*/
                    var movieFromMovieDB = MovieFetcher.GetMovie(item.MovieApi.MovieKey); // Make a fetch to Movie DB to get information about a movie
                    // To the return list, add a View Model and add the information from both the Viewing, Lounge and MovieDB into a single object
                    resultList.Add(new ViewvingsViewModel
                    {
                        Id = item.ViewingID,
                        MovieName = movieFromMovieDB.Title, // Title for the Movie from the MovieDB
                        Length = movieFromMovieDB.Runtime ?? 0, // The runtime from MovieDB
                        Adult = movieFromMovieDB.Adult, // If it's a adult movie, from MovieDB
                        LoungeName = item.Salon.SalonNumber.ToString(),// The lounge name from Lounge entity in the database (contected using Entity Framework)
                        ViewingDate = item.ViewingDate, // Date of the viewing from the Viewing entity in the database
                        TotalSeats = GetSeats(item.ViewingID, item.Salon.MaxSeats) // And number of seats in the Lounge
                    });
                /*}
                catch
                {
                    return new List<ViewvingsViewModel>();
                }*/
            }

            return resultList; // Return the list of Movies

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
            db.SaveChanges();
  
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