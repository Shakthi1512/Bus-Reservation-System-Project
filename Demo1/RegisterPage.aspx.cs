using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Demo1.Models;

namespace Demo1
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Register_Click(object sender, EventArgs e)
        {
            InvalideLabel.Visible = false;

            if (!Name.Text.Equals("") && !UserID.Text.Equals("") && !MailID.Text.Equals("") && !Password.Text.Equals(""))
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();
                    UserDetail User = new UserDetail { UserID = UserID.Text, MailID=MailID.Text, Name = Name.Text, Password = Password.Text};
                    string insertQuery = "insert into UserDetails values('" + User.UserID + "','" + User.Password + "','" + User.Name + "','" + User.MailID + "')";
                    SqlCommand cmd = new SqlCommand(insertQuery, conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("LoginPage.aspx");
                }
                catch (Exception)
                {
                    InvalideLabel.Visible = true;
                }
            }
        }
    }
}