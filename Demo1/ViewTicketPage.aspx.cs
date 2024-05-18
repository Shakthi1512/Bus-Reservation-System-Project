using Demo1.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo1
{
    public partial class ViewTicketPage : System.Web.UI.Page
    {
        List<Ticket> tickets = new List<Ticket>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";Integrated Security=True;MultipleActiveResultSets=True;");
                conn.Open();
                string query = $"select t.ID, b.ID as BusID, b.Name as BusName, r.Source, r.Destination, r.DepartureTime, r.ArrivalTime, t.JourneyDate, t.SeatCount from Reservation t Join Bus b ON t.BusID = b.ID Join Route r ON t.RouteID = r.ID  where t.UserID = '{Session["UserID"]}'";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        tickets.Add(new Ticket { ReservationID = int.Parse(reader["ID"].ToString()), BusID = reader["BusID"].ToString(), BusName = reader["BusName"].ToString(), Source = reader["Source"].ToString(), Destination = reader["Destination"].ToString(), DepartureTime = reader["DepartureTime"].ToString(), ArrivalTime = reader["ArrivalTime"].ToString(), JourneyDate = reader["JourneyDate"].ToString(), SeatCount = int.Parse(reader["SeatCount"].ToString()) });
                    }
                    TicketList.DataSource = tickets;
                    TicketList.DataBind();
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }

        protected void TicketList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string TicketID = e.CommandArgument.ToString();
                Session["TicketID"] = TicketID;
                if (Session["AboutTicket"].ToString().Equals("Cancel"))
                {
                    Response.Redirect("CancelTicketPage.aspx");
                }
                else
                {
                    Response.Redirect("ViewTicketStatusPage.aspx");
                }
            }
        }
    }
}