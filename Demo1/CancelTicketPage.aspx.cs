using Demo1.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo1
{
    public partial class CancelTicketPage : System.Web.UI.Page
    {
        List<Passenger> passengers = new List<Passenger>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";Integrated Security=True;MultipleActiveResultSets=True;");
                    conn.Open();
                    string query = $"Select * from Passenger where ReservationID = {Session["TicketID"]} and Status = 1";
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
        protected void Submit_Click(object sender, EventArgs e)
        {
            foreach (ListViewItem item in PassengerList.Items)
            {
                CheckBox statusCheckBox = (CheckBox)item.FindControl("lblStatus");
                Label seatNumber = (Label)item.FindControl("lblSeatNumber");
                if (statusCheckBox != null)
                {
                    try
                    {
                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";Integrated Security=True;MultipleActiveResultSets=True;");
                        conn.Open();
                        int status = 0;
                        if(statusCheckBox.Checked)
                        {
                            status = 1;
                        }
                        string UpdateQuery = $"Update Passenger SET Status = {status} where ReservationID = {Session["TicketID"]} and SeatNumber = {int.Parse(seatNumber.Text)}";
                        //string UpdateQuery = $"Update Passenger SET Status = {status} where ReservationID = 1001 and SeatNumber = {int.Parse(seatNumber.Text)}";
                        SqlCommand cmd = new SqlCommand(UpdateQuery, conn);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.ToString());
                    }
                }
            }
            Response.Write("Status updated successfully");
            Response.Redirect("HomePage.aspx");
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        //public IQueryable<Demo1.Models.Passenger> PassengerList_GetData()
        //{
        //    return null;
        //}
    }
}