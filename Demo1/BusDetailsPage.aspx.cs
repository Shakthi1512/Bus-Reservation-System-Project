using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Demo1.Models;

namespace Demo1
{
    public partial class BusDetailsPage : System.Web.UI.Page
    {
        List<Bus> buses = new List<Bus>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            //if (!IsPostBack)
            {
                JourneyDate.Text = Session["JourneyDate"].ToString();
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";Integrated Security=True;MultipleActiveResultSets=True;");
                    conn.Open();
                    //string query = "select * from Bus where FromPlace = '" + Session["FromPlace"].ToString() + "' and ToPlace = '" + Session["ToPlace"].ToString() +"'";
                    //string query = "select * from Bus where FromPlace = 'Chennai' and ToPlace = 'Bengaluru'";
                    string query = $"select b.ID, b.Name, b.SeatCount, r.DepartureTime, r.ArrivalTime,r.Fare, r.Distance, r.Via from Bus b Join Route r ON b.RouteID = r.ID where r.Source = '{Session["FromPlace"]}' and r.Destination = '{Session["ToPlace"]}'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            int availableSeats = 0;
                            //string seatCountQuery = $"SELECT COUNT(p.ReservationID) FROM Bus b Join Reservation r ON b.ID = r.BusID Join Passenger p ON p.ReservationID = r.ID where b.ID = '{reader["b.ID"]}' and r.JourneyDate='{Session["JourneyDate"]}'";
                            string seatCountQuery = $"select sum(SeatCount) from Reservation where BusID = '{reader["ID"]}' and JourneyDate='{JourneyDate.Text}'";
                            //string seatCountQuery = $"select sum(SeatCount) From Reservation where BusID = 'KA01AA7298' and JourneyDate='5/1/2009'";
                            SqlCommand seatCountCmd = new SqlCommand(seatCountQuery, conn);
                            Object obj = seatCountCmd.ExecuteScalar();
                            if (obj != DBNull.Value)
                            {
                                availableSeats = Convert.ToInt32(reader["SeatCount"]) - Convert.ToInt32(obj);
                            }
                            else
                            {
                                availableSeats = Convert.ToInt32(reader["SeatCount"]);
                            }


                            buses.Add(new Bus { ArrivalTime = reader["ArrivalTime"].ToString(), DepartureTime = reader["DepartureTime"].ToString(), ID = reader["ID"].ToString(), Name = reader["Name"].ToString(), Price = int.Parse(reader["Fare"].ToString()), SeatCount = availableSeats, Distance = reader["Distance"].ToString(), Via = reader["Via"].ToString() });
                        }
                        BusList.DataSource = buses;
                        BusList.DataBind();
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
            catch
            {
                Response.Redirect("HomePage.aspx");
            }
        }   

        protected void BusList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string  BusID = e.CommandArgument.ToString();
                Session["BusID"] = BusID;
                Response.Redirect("AllotSeatNumber.aspx");
            }
        }
    }
}