using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo1
{
    public partial class WelcomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BookTktImgBtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("JourneyDetailsPage.aspx");
        }

        protected void CancelTktImgBtn_Click(object sender, ImageClickEventArgs e)
        {
            Session["AboutTicket"] = "Cancel";
            Response.Redirect("ViewTicketPage.aspx");
        }

        protected void ViewTktImgBtn_Click(object sender, ImageClickEventArgs e)
        {
            Session["AboutTicket"] = "View";
            Response.Redirect("ViewTicketPage.aspx");
        }

        protected void ViewTktStsImgBtn_Click(object sender, ImageClickEventArgs e)
        {
            Session["TicketID"] = "";
            Response.Redirect("ViewTicketStatusPage.aspx");
        }

        protected void ViewProfileImgBtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ViewProfilePage.aspx");
        }
    }
}