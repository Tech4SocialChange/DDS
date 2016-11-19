using AppManagerLib;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Telerik.Web.UI;

namespace CSRS
{
    public partial class Default : System.Web.UI.Page
    {
        AppManager am;

        private XmlNamespaceManager namespaceManager;

        public XmlNamespaceManager NamespaceManager
        {
            get
            {
                return namespaceManager;
            }
        }

        protected string GetDayOfWeek(string dateTimeString)
        {
            DateTime result = DateTime.Parse(dateTimeString);
            string dayOfWeek = Enum.GetName(typeof(DayOfWeek), result.DayOfWeek);

            return dayOfWeek;
        }

        protected string GetTimeOnly(string dateValue)
        {
            return System.DateTime.Parse(dateValue).ToString("hh:mm");
        }

        protected string GetDateOnly(string dateValue)
        {
            return System.DateTime.Parse(dateValue).ToString("ddd, MMM d, yyyy");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            XmlDocument blogs = new XmlDocument();
            try
            {
                blogs.Load(new XmlTextReader("http://feeds.feedburner.com/Telerik"));
           
                namespaceManager = new XmlNamespaceManager(blogs.NameTable);
                namespaceManager.AddNamespace("be", "http://www.w3.org/2005/Atom");
                XmlNodeList blogsList = blogs.DocumentElement.SelectNodes("be:entry", NamespaceManager);
                RadRotator1.DataSource = blogsList;
                RadRotator1.DataBind();
            }
            catch
            {
                RadRotator1.Visible = false;
                lblMessage.Visible = true;
                lblMessage.Text = "No Data Available.";
            }

            am = new AppManager("cnCSRS", "SummaryCSR", true, false);
            am.Utility.LoadGrid(RadGrid2, "Select * From SMSMessage order by [SerialNO] desc", new string[] { });
            EmployeeWisePRAssign();
        }

        private void EmployeeWisePRAssign()
        {
            try
            {
                DataTable dt = new DataTable();
                string qry = "GetLastFiveYearCycloneReport";
                dt = am.ADO.RecordSet(qry, null);
                ChartHelper ch = new ChartHelper("Chart1", 460, 300, Telerik.Web.UI.HtmlChart.ChartLegendPosition.Bottom);
                ch.CreateChart(Chart1, ChartHelper.ChartType.PieChart, dt, new string[] { "Salmon", "RosyBrown","CadetBlue","DarkKhaki","Gold","Olive","LightSkyBlue" });

                //DataTable dt4 = new DataTable();
                //string qry4 = "GetYearwiseFloodReport";
                //dt4 = am.ADO.RecordSet(qry4, null);
                //ChartHelper ch4 = new ChartHelper("Chart5", 410, 270, Telerik.Web.UI.HtmlChart.ChartLegendPosition.Bottom);
                //ch4.CreateChart(Chart5, ChartHelper.ChartType.BarChartVartical, dt4, new string[] { "Crimson", "BurlyWood", "Red", "Green" });

                DataTable dt5 = new DataTable();
                string qry5 = "GetYearwiseFloodReport";
                dt5 = am.ADO.RecordSet(qry5, null);
                ChartHelper ch5 = new ChartHelper("Chart6", 410, 270, Telerik.Web.UI.HtmlChart.ChartLegendPosition.Bottom);
                ch5.CreateChart(Chart6, ChartHelper.ChartType.LineChart, dt5, new string[] { "IndianRed", "SandyBrown", "Red", "Green" });
            }
            catch (Exception ex)
            {
                //throw ex;
            }
        }
    }
}