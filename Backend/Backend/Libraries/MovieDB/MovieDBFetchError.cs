using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Backend.Libraries.MovieDB
{
    public class MovieDBFetchError : Exception
    {
        public MovieDBFetchError(string message, Exception innerException)
        {
            // TODO: Init an Exception
        }
    }
}