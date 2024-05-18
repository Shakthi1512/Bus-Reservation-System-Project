using Demo1.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo1
{
    public partial class PreviewBookingPage : System.Web.UI.Page
    {
        static int RouteID = 0;
        static int countSeats = 0;
        static List<string> LockedSeats = new List<string>();
        static List<Passenger> passengers = new List<Passenger>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LockedSeats.Clear();
                passengers.Clear();
            }
            LockedSeats = (List<string>)(Session["LockedSeats"]);
            passengers = (List<Passenger>)Session["Passengers"];
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string query = "select b.ID, b.Name, b.RouteID, r.Source, r.Destination, r.DepartureTime, r.ArrivalTime, r.Fare from Bus b Join Route r ON b.RouteID = r.ID where b.ID = '" + Session["BusID"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        int mac = int.Parse(Session["MaleCount"].ToString());
                        int fac = int.Parse(Session["FemaleCount"].ToString());
                        int cmc = int.Parse(Session["ChildMaleCount"].ToString());
                        int cfc = int.Parse(Session["ChildFemaleCount"].ToString());
                        countSeats = mac + fac + cmc + cfc;

                        ArrivalTime.Text = reader["ArrivalTime"].ToString();
                        DepartureTime.Text = reader["DepartureTime"].ToString();
                        BusID.Text = reader["ID"].ToString();
                        BusName.Text = reader["Name"].ToString();
                        Price.Text = (int.Parse(reader["Fare"].ToString()) * LockedSeats.Count).ToString();
                        SeatsCount.Text = countSeats.ToString();
                        JourneyDate.Text = Session["JourneyDate"].ToString();

                        RouteID = int.Parse(reader["RouteID"].ToString());

                        AllotedSeats.Text = "";
                        for (int i = 0; i < LockedSeats.Count; i++)
                        {
                            AllotedSeats.Text += LockedSeats[i];
                            if (i < LockedSeats.Count - 1)
                            {
                                AllotedSeats.Text += ", ";
                            }
                        }
                        PassengerList.DataSource = passengers;
                        PassengerList.DataBind();
                    }
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                var passengerTable = new DataTable();
                passengerTable.Columns.Add("Name", typeof(string));
                passengerTable.Columns.Add("Age", typeof(int));
                passengerTable.Columns.Add("Sex", typeof(string));
                passengerTable.Columns.Add("Mobile", typeof(string));
                passengerTable.Columns.Add("SeatNumber", typeof(string));
                passengerTable.Columns.Add("Status", typeof(int));

                foreach (var (passenger, seatAlloted) in passengers.Zip(LockedSeats, (x, y) => (x, y)))
                {
                    passengerTable.Rows.Add(passenger.Name, passenger.Age, passenger.Sex, passenger.Mobile, seatAlloted, 1);
                }


                //string query = "select Password from UserDetails where UserID = '" + UserID.Text + "'";
                //string insertQuery = "sel into Student values('" + Name.Text + "','" + UserID.Text + "','" + CourseSection.Text + "','" + Mailid.Text + "','"+Password.Text+"')";
                SqlCommand cmd = new SqlCommand("CompleteReservation", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@p_UserID", Session["UserID"].ToString());
                cmd.Parameters.AddWithValue("@p_RouteID", RouteID);
                cmd.Parameters.AddWithValue("@p_BusID", Session["BusID"].ToString());
                cmd.Parameters.AddWithValue("@p_JourneyDate", Session["JourneyDate"].ToString());
                cmd.Parameters.AddWithValue("@p_SeatCount", countSeats);
                cmd.Parameters.AddWithValue("@p_Status", 1);

                var parameter = cmd.Parameters.AddWithValue("@p_passengers", passengerTable);
                parameter.SqlDbType = SqlDbType.Structured;
                parameter.TypeName = "dbo.PassengerType";

                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("HomePage.aspx");

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}