using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo1.Models
{
    public class Bus
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string DepartureTime {  get; set; }
        public string ArrivalTime { get; set; }
        public double Price {  get; set; }
        public int SeatCount {  get; set; }
        public string Distance { get; set; }
        public string Via { get; set; }
    }
}