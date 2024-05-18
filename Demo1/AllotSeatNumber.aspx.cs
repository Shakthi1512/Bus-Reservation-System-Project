using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo1
{
    public partial class AllotSeatNumber : System.Web.UI.Page
    {
        static List<string> LoakSeat = new List<string>();
        static int seatCount;
        static List<string> SeatID = new List<string>();

        private Dictionary<Color, List<Color>> colorMappings = new Dictionary<Color, List<Color>>
        {
            { Color.LightGray, new List<Color>{Color.Green,Color.White} },
            { Color.Green, new List<Color>{Color.LightGray, Color.Black} },
            { Color.LightSalmon, new List<Color>{Color.BlueViolet, Color.White} },
            { Color.BlueViolet, new List<Color>{Color.LightSalmon, Color.Black} },
            { Color.LightPink, new List<Color>{Color.DeepPink, Color.White} },
            { Color.DeepPink, new List<Color>{Color.LightPink, Color.Black} },
        };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoakSeat.Clear();
                SeatID.Clear();
            }
            {
                //BusID.Text = Session["BusID"].ToString();

                try
                {
                    //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    //conn.Open();
                    //string query = "select SeatCount from Bus where ID = '" + BusID.Text + "'";
                    //SqlCommand cmd = new SqlCommand(query, conn);
                    //object obj = cmd.ExecuteScalar();

                    //query = $"Select p.SeatNumber from Passenger p Join Reservation r ON p.ReservationID = r.ID where r.BusID='{BusID.Text}' and r.JourneyDate='{Session["JourneyDate"]}' and p.Status=1";
                    //cmd = new SqlCommand(query, conn);
                    //SqlDataReader reader = cmd.ExecuteReader();

                    //if (reader.HasRows)
                    //{
                    //    while (reader.Read())
                    //    {
                    //        SeatID.Add(reader[0].ToString());
                    //    }
                    //}

                    //conn.Close();

                    //seatCount = int.Parse(obj.ToString());
                    seatCount = 30;
                    int numberOfColumns = 4;
                    int numberOfRows = (int)Math.Ceiling((double)seatCount / numberOfColumns);

                    // Create a Table control to hold the buttons
                    Table table = new Table();

                    // Loop through each row
                    for (int i = 0; i < numberOfRows; i++)
                    {
                        TableRow row = new TableRow();

                        // Loop through each column in the current row
                        for (int j = 0; j < numberOfColumns; j++)
                        {
                            // Calculate the index of the button to be created
                            int buttonIndex = i * numberOfColumns + j;

                            if (buttonIndex < seatCount)
                            {
                                TableCell cell = new TableCell();
                                cell.Width = 50;
                                cell.Height = 50;

                                // Create a new button
                                Button button = new Button();
                                button.Width = 50;
                                button.Height = 50;
                                button.ID = "btn" + buttonIndex; // Assign a unique ID to the button
                                button.Text = "" + (buttonIndex + 1); // Set button text
                                if (SeatID.Contains(button.Text.ToString()))
                                {
                                    if ((buttonIndex + 1) == 1)
                                    {
                                        button.BackColor = Color.BlueViolet;
                                    }
                                    else if ((buttonIndex + 1) == 3 || (buttonIndex + 1) == 4 || (buttonIndex + 1) == 7 || (buttonIndex + 1) == 8)
                                    {
                                        button.BackColor = Color.DeepPink;
                                    }
                                    else
                                    {
                                        button.BackColor = Color.Blue;
                                    }
                                    button.Enabled = false;
                                    button.ForeColor = Color.White;
                                }
                                else
                                {
                                    if ((buttonIndex + 1) == 1)
                                    {
                                        button.BackColor = Color.LightSalmon;
                                    }
                                    else if ((buttonIndex + 1) == 3 || (buttonIndex + 1) == 4 || (buttonIndex + 1) == 7 || (buttonIndex + 1) == 8)
                                    {
                                        button.BackColor = Color.LightPink;
                                    }
                                    else
                                    {
                                        button.BackColor = Color.LightGray;
                                    }
                                }

                                // Add the button click event handler
                                button.Click += new EventHandler(Button_Click);

                                // Add the button to the cell
                                cell.Controls.Add(button);

                                // Add the cell to the row
                                if (buttonIndex % 2 == 0 && buttonIndex % 4 != 0)
                                {
                                    row.Cells.Add(new TableCell());
                                    row.Cells.Add(new TableCell());
                                }
                                row.Cells.Add(cell);
                            }
                        }

                        // Add the row to the table
                        table.Rows.Add(row);
                    }

                    table.CellSpacing = 10;
                    table.BackColor = Color.Gray;

                    form1.Controls.Add(table);
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message.ToString());
                }
            }
        }
        protected void Button_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string index = button.CommandArgument;

            if (colorMappings.ContainsKey(button.BackColor))
            {
                button.ForeColor = colorMappings[button.BackColor][1];
                button.BackColor = colorMappings[button.BackColor][0];
                if (LoakSeat.Contains(button.Text))
                {
                    LoakSeat.Remove(button.Text);
                }
                else
                {
                    LoakSeat.Add(button.Text);
                }
            }
        }

        protected void Next_Click(object sender, EventArgs e)
        {
            int mac = int.Parse(Session["MaleCount"].ToString());
            int fac = int.Parse(Session["FemaleCount"].ToString());
            int cmc = int.Parse(Session["ChildMaleCount"].ToString());
            int cfc = int.Parse(Session["ChildFemaleCount"].ToString());
            int countSeats = mac + fac + cmc + cfc;
            if (countSeats == LoakSeat.Count)
            {
                Session["LockedSeats"] = LoakSeat;
                Response.Redirect("AddPassengersPage.aspx");
            }
            else
            {
                Response.Write($"Pick required {countSeats} seats");
            }
        }
    }
}