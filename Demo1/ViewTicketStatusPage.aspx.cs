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
    public partial class ViewTicketStatusPage : System.Web.UI.Page
    {
        List<Passenger> passengers = new List<Passenger>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Session["TicketID"].ToString()))
                {
                    TicketID.Text = Session["TicketID"].ToString();
                }
                if (!string.IsNullOrEmpty(TicketID.Text.ToString()))
                {
                    try
                    {
                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";Integrated Security=True;MultipleActiveResultSets=True;");
                        conn.Open();
                        string query = $"Select * from Passenger where ReservationID = {TicketID.Text}";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                passengers.Add(new Passenger { Name = reader["Name"].ToString(), Age = int.Parse(reader["Age"].ToString()), Sex = reader["Sex"].ToString(), Mobile = reader["Mobile"].ToString(), SeatNumber = reader["SeatNumber"].ToString(), Status = int.Parse(reader["Status"].ToString()) });
                            }
                            PassengerList.DataSource = passengers;
                            PassengerList.DataBind();
                        }
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.ToString());
                    }
                }
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            PassengerList.DataSource = null;
            PassengerList.DataBind();
            if (!string.IsNullOrEmpty(TicketID.Text.ToString()))
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";Integrated Security=True;MultipleActiveResultSets=True;");
                    conn.Open();
                    string query = $"Select * from Passenger where ReservationID = {TicketID.Text}";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            passengers.Add(new Passenger { Name = reader["Name"].ToString(), Age = int.Parse(reader["Age"].ToString()), Sex = reader["Sex"].ToString(), Mobile = reader["Mobile"].ToString(), SeatNumber = reader["SeatNumber"].ToString(), Status = int.Parse(reader["Status"].ToString()) });
                        }
                        PassengerList.DataSource = passengers;
                        PassengerList.DataBind();
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }
    }
}