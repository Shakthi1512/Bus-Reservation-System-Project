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
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (!UserID.Text.Equals("") && !Password.Text.Equals(""))
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();
                    string query = "select Password from UserDetails where UserID = '" + UserID.Text + "'";
                    //string insertQuery = "sel into Student values('" + Name.Text + "','" + UserID.Text + "','" + CourseSection.Text + "','" + Mailid.Text + "','"+Password.Text+"')";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    object obj = cmd.ExecuteScalar();
                    conn.Close();

                    if (obj != null && ((string)obj).Equals(Password.Text))
                    {
                        Session["UserID"] = UserID.Text.ToString();
                        Response.Redirect("HomePage.aspx");
                    }
                    else
                    {
                        InvalideLabel.Visible = true;
                    }
                }
                catch (Exception)
                {
                    //Response.Write(ex.Message);
                    InvalideLabel.Visible = true;
                }

            }
            else
            {
                //Response.Write("Enter All Values");
            }

        }
    }
}