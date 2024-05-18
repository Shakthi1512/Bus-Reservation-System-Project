using Demo1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo1
{
    public partial class AddPassengersPage : System.Web.UI.Page
    {
        static List<Passenger> Passengers = new List<Passenger>();
        static int i = 1;
        static int countSeats = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Passengers.Clear();
                int mac = int.Parse(Session["MaleCount"].ToString());
                int fac = int.Parse(Session["FemaleCount"].ToString());
                int cmc = int.Parse(Session["ChildMaleCount"].ToString());
                int cfc = int.Parse(Session["ChildFemaleCount"].ToString());
                countSeats = mac + fac + cmc + cfc;
                if (countSeats > 0)
                {
                    Count.Text = "Enter Passenger 1 details";
                }
            }
            if (countSeats == i)
            {
                AddPassenger.Text = "Preview Details";
            }
        }

        protected void AddPassenger_Click(object sender, EventArgs e)
        {
            InvalideLabel.Visible = false;

            if (!Name.Text.Equals("") && !Mobile.Text.Equals("") && !Age.Text.Equals("") && !Gender.SelectedValue.ToString().Equals("-1"))
            {
                Passengers.Add(new Passenger
                {
                    Name = Name.Text,
                    Age = int.Parse(Age.Text.ToString()),
                    Mobile = Mobile.Text,
                    Sex = Gender.Text,
                });
                Name.Text = Age.Text = Mobile.Text = "";
                Gender.SelectedValue = "-1";

                if (AddPassenger.Text.ToString().Equals("Preview Details"))
                {
                    Session["Passengers"] = Passengers;
                    Response.Redirect("PreviewBookingPage.aspx");
                }

                if (countSeats > i)
                {
                    Count.Text = "Enter Passenger " + (++i).ToString() + " details";
                }
                if (countSeats == i)
                {
                    AddPassenger.Text = "Preview Details";
                }

            }
            else
            {
                InvalideLabel.Visible = true;
            }
        }
    }
}