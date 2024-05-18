using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;
using System.Data.SqlClient;

namespace Demo1
{
    public partial class BookTicketPage : System.Web.UI.Page
    {
        static Hashtable HolidayList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HolidayList = Getholiday();
                Calendar1.FirstDayOfWeek = FirstDayOfWeek.Sunday;
                Calendar1.NextPrevFormat = NextPrevFormat.ShortMonth;
                Calendar1.TitleFormat = TitleFormat.Month;
                Calendar1.ShowGridLines = true;
                Calendar1.DayStyle.Height = new Unit(15);
                Calendar1.DayStyle.Width = new Unit(30);
                Calendar1.DayStyle.HorizontalAlign = HorizontalAlign.Center;
                Calendar1.DayStyle.VerticalAlign = VerticalAlign.Middle;
                Calendar1.OtherMonthDayStyle.BackColor = System.Drawing.Color.AliceBlue;

                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();
                    string query1 = "select DISTINCT Source from Route";
                    string query2 = "select DISTINCT Destination from Route";
                    SqlCommand cmd = new SqlCommand(query1, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            FromPlace.Items.Add(reader.GetString(0));
                        }
                    }
                    reader.Close();
                    cmd = new SqlCommand(query2, conn);
                    reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            ToPlace.Items.Add(reader.GetString(0));
                        }
                    }

                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }

        }
        private Hashtable Getholiday()
        {
            Hashtable holiday = new Hashtable();
            holiday["1/1/2024"] = "New Year";
            holiday["1/5/2024"] = "Guru Govind Singh Jayanti";
            holiday["1/8/2024"] = "Muharam (Al Hijra)";
            holiday["1/14/2024"] = "Pongal";
            holiday["1/26/2024"] = "Republic Day";
            holiday["2/23/2024"] = "Maha Shivaratri";
            holiday["3/10/2024"] = "Milad un Nabi (Birthday of the Prophet";
            holiday["3/21/2024"] = "Holi";
            holiday["3/21/2024"] = "Telugu New Year";
            holiday["4/3/2024"] = "Ram Navmi";
            holiday["4/7/2024"] = "Mahavir Jayanti";
            holiday["4/10/2024"] = "Good Friday";
            holiday["4/12/2024"] = "Easter";
            holiday["4/14/2024"] = "Tamil New Year and Dr Ambedkar Birth Day";
            holiday["5/1/2024"] = "May Day";
            holiday["5/9/2024"] = "Buddha Jayanti and Buddha Purnima";
            holiday["6/24/2024"] = "Rath yatra";
            holiday["8/13/2024"] = "Krishna Jayanthi";
            holiday["8/14/2024"] = "Janmashtami";
            holiday["8/15/2024"] = "Independence Day";
            holiday["8/19/2024"] = "Parsi New Year";
            holiday["8/23/2024"] = "Vinayaka Chaturthi";
            holiday["9/2/2024"] = "Onam";
            holiday["9/5/2024"] = "Teachers Day";
            holiday["9/21/2024"] = "Ramzan";
            holiday["9/27/2024"] = "Ayutha Pooja";
            holiday["9/28/2024"] = "Vijaya Dasami (Dusherra)";
            holiday["10/2/2024"] = "Gandhi Jayanti";
            holiday["10/17/2024"] = "Diwali & Govardhan Puja";
            holiday["10/19/2024"] = "Bhaidooj";
            holiday["11/2/2024"] = "Guru Nanak Jayanti";
            holiday["11/14/2024"] = "Children's Day";
            holiday["11/28/2024"] = "Bakrid";
            holiday["12/25/2024"] = "Christmas";
            holiday["12/28/2024"] = "Muharram";
            return holiday;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            JourneyDate.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            JourneyDate.Text = e.NewDate.ToShortDateString();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (HolidayList[e.Day.Date.ToShortDateString()] != null)
            {
                Literal literal1 = new Literal();
                literal1.Text = "<br/>";
                e.Cell.Controls.Add(literal1);
                Label label1 = new Label();
                label1.Text = (string)HolidayList[e.Day.Date.ToShortDateString()];
                label1.Font.Size = new FontUnit(FontSize.Small);
                e.Cell.Controls.Add(label1);
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            bool BusAvailable = false;

            int MaleAdult = MaleAdultCount.Text == null || MaleAdultCount.Text == string.Empty ? 0 : int.Parse(MaleAdultCount.Text);
            int FemaleAdult = FemaleAdultCount.Text == null || FemaleAdultCount.Text == string.Empty ? 0 : int.Parse(FemaleAdultCount.Text);
            int MaleChild = ChildMaleCount.Text == null || ChildMaleCount.Text == string.Empty ? 0 : int.Parse(ChildMaleCount.Text);
            int FemaleChild = ChildFemaleCount.Text == null || ChildFemaleCount.Text == string.Empty ? 0 : int.Parse(ChildFemaleCount.Text);

            if ((MaleChild > 0 || FemaleChild > 0) && (MaleAdult < 1 && FemaleAdult < 1))
            {
                Response.Write("Child cannot travel without Adult");
            }
            else if (FromPlace.SelectedIndex > 0 && ToPlace.SelectedIndex > 0 && !JourneyDate.Text.ToString().Equals(string.Empty) && (!MaleAdultCount.Text.ToString().Equals(string.Empty) || !FemaleAdultCount.Text.ToString().Equals(string.Empty)))
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();
                    string query = $"select b.ID From Bus b Join Route r ON b.RouteID = r.ID where r.Source = '{FromPlace.Text}' and r.Destination = '{ToPlace.Text}'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        BusAvailable = true;
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }

                if (BusAvailable)
                {
                    Session["FromPlace"] = FromPlace.SelectedItem.ToString();
                    Session["ToPlace"] = ToPlace.SelectedItem.ToString();
                    Session["JourneyDate"] = JourneyDate.Text.ToString();
                    Session["MaleCount"] = MaleAdult;
                    Session["FemaleCount"] = FemaleAdult;
                    Session["ChildMaleCount"] = MaleChild;
                    Session["ChildFemaleCount"] = FemaleChild;
                    Response.Redirect("BusDetailsPage.aspx");
                }
                else
                {
                    Response.Write($"There is no bus from {FromPlace.Text} to {ToPlace.Text}");
                }
            }
            else
            {
                Response.Write("Please provide all required details");
            }
        }
    }
}