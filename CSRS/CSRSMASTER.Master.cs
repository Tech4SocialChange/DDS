using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSRS
{
    public partial class CSRSMASTER : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        //    if (Session["IsAdmin"] == null){
        //        Response.Redirect("CSR.aspx");
        //    }
            
        //    if (Convert.ToBoolean(Session["IsAdmin"]) == true)
        //    {
            //if (Session["IsAdmin"].ToString() == "True")
            //{
                //menuAdmin.Visible = true;
                //menuAll.Visible = true;
            //}
            //else
            //{
            //    menuAdmin.Visible = true;
            //    menuAll.Visible = false;
            //}
        //    }
        //    else
        //    {
                //menuAll.Visible = true;
                //menuAdmin.Visible = false;
        //    }

            //lblAdminName.Text = Session["UserName"].ToString();
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}