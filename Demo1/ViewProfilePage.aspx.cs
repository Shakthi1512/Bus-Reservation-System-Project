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
    public partial class ViewProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();
                    string query = $"select * from UserDetails where UserID = '{Session["UserID"]}'";
                    //string insertQuery = "sel into Student values('" + Name.Text + "','" + UserID.Text + "','" + CourseSection.Text + "','" + Mailid.Text + "','"+Password.Text+"')";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        UserID.Text = reader["UserID"].ToString();
                        Password.Text = reader["Password"].ToString();
                        Name.Text = reader["Name"].ToString();
                        MailID.Text = reader["MailID"].ToString();
                    }
                    conn.Close();
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

        protected void Update_Click(object sender, EventArgs e)
        {
            if (!Name.Text.Equals("") && !UserID.Text.Equals("") && !MailID.Text.Equals("") && !Password.Text.Equals(""))
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();
                    string UpdateQuery = $"Update UserDetails SET Password = '{Password.Text}', Name = '{Name.Text}', MailID = '{MailID.Text}' where UserID = '{Session["UserID"]}'";
                    SqlCommand cmd = new SqlCommand(UpdateQuery, conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("Updated Successfully");
                    Response.Redirect("HomePage.aspx");
                }
                catch (Exception)
                {
                    //Response.Write(ex.Message);
                    InvalideLabel.Visible = true;
                }
            }
        }
    }
}