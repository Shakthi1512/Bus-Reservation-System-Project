using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo1.Models
{
    public class Ticket
    {
        public int ReservationID { get; set; }
        public string BusID { get; set; }
        public string BusName { get; set; }
        public string Source { get; set; }
        public string Destination { get; set; }
        public string DepartureTime { get; set; }
        public string ArrivalTime { get; set; }
        public string JourneyDate { get; set; }
        public int SeatCount { get; set; }
    }
}