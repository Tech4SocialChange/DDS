using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppManagerLib;

namespace PSMS
{
    public partial class Login : System.Web.UI.Page
    {
        AppManager am = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            am = new AppManager("cnCSRS", "Login", true, false);
            tbxLgnUserName.Focus();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable dt = am.ADO.RecordSet("SELECT * FROM [User] WHERE UserName=@UserName AND Password=@Password", new string[] { tbxLgnUserName.Text, tbxLgnPassword.Text });

            if (dt.Rows.Count > 0)
            {
                Session["IsAdmin"] = dt.Rows[0]["IsAdmin"].ToString();
                Session["ReportTo"] = dt.Rows[0]["SuperVID"].ToString();
                Session["UserID"] = dt.Rows[0]["UserID"].ToString();
                Session["UserName"] = tbxLgnUserName.Text;
                Session["OrgID"] = dt.Rows[0]["OrgID"].ToString();
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblError.Text = "You are not a valid user or password incorrect!!";
                return;
            }

         //am.Validation.Validate

            //    Session["IsAdmin"] = false;
            //    Response.Redirect("CSR.aspx");
            //}
            //return;

            //if (am != null)
            //{
            //    string sEmail = tbxLgnUserName.Text.Replace("@savethechildren.org", "").Trim() + "@savethechildren.org";
            //    bool IsValidLogin = am.AppLogin.IsValidLogin_SCIMail(this.Page, sEmail, tbxLgnPassword.Text.Trim());

            //    if (IsValidLogin)
            //    {
            //        Session["EID"] = "";
            //        Session["ISADMIN"] = "";
            //        Session["UPASS"] = "";
            //        Session["IsLogedIn"] = "";

            //        string sSQL =
            //        "SELECT EmployeeID EID FROM BDCOMIS.HRGW.dbo.EmployeeInfo WHERE Email=@Email AND Active=@Active";
            //        DataTable dt = am.DataAccess.RecordSet(sSQL, new string[] { sEmail, "A" });
            //        DataRow row = dt.NewRow();
            //        dt.Rows.Add(row);

            //        if (dt != null && dt.Rows.Count > 0)
            //        {
            //            Session["EID"] = "592";// dt.Rows[0]["EID"].ToString();
            //            Session["UEMAIL"] = sEmail;
            //            Session["UEPASS"] = tbxLgnPassword.Text;
            //            Session["IsLogedIn"] = "done";

            //            Session["ISADMIN"] = am.DataAccess.GetScalarValue("SELECT IsAdmin FROM Login WHERE Email=@Email", new string[] { sEmail });

            //            Response.Redirect("Default.aspx");
            //        }
            //    }
            //    else
            //    {
            //        am.Utility.ShowHTMLMessage(
            //            Page, ErrorNumber.SetType(
            //            ErrorNumber.PermissionDenied, errorType.LoginError), "Login Failure. You are not authorized user!!"
            //            );
            //    }
            //}
        }

        void DataAccess_OnShowError(string ErrorCode, string ErrorMessage)
        {
            if (am != null)
                am.Utility.ShowHTMLMessage(this.Page, ErrorCode, ErrorMessage);
        }
    }
}