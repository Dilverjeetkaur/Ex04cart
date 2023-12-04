using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Caching;

namespace Ex04Cart
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //HttpCookie firstName = Request.Cookies["FirstName"];
                //HttpCookie lastName = Request.Cookies["LastName"];
                txtFirstName.Text = (String) Session["FirstName"];
                txtLastName.Text = (String)Session["LastName"];

                Application.Lock();
                int hitCount = Convert.ToInt32(Application["HitCount"]);
                hitCount++;
                Application["HitCount"] = hitCount.ToString();
                Application.UnLock();

                lblPageHits.Text = hitCount.ToString();
            }

            //// get timestamp from cache, then display it
            //// or set timestamp in cache to now plus 10, then display
            //object cacheTimestamp = Cache.Get("Timestamp");
            //if (cacheTimestamp == null)
            //{
            //    cacheTimestamp = DateTime.Now;
            //    Cache.Insert("Timestamp", cacheTimestamp, null,
            //    DateTime.Now.AddMinutes(10), Cache.NoSlidingExpiration);
            //}
            //lblCacheTimestamp.Text = cacheTimestamp.ToString();
        }


        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                //DateTime expiry = DateTime.Now.AddMinutes(5);
                //SetCookie("FirstName", txtFirstName.Text, expiry);
                //SetCookie("LastName", txtLastName.Text, expiry);
                Session["FirstName"] = txtFirstName.Text;
                Session["LastName"] = txtLastName.Text;
            }
            Response.Redirect("~/Order.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //Session.Clear();
            //DateTime expiry = DateTime.Now.AddMinutes(5);
            //SetCookie("FirstName", " ", expiry);
            //SetCookie("LastName", " ", expiry);
            //HttpContext.Current.Request.Cookies.Clear();
            //HttpContext.Current.Request.Cookies.Clear();
            //Request.Cookies.Clear();

            Session.Remove("FirstName");
            Session.Remove("LastName");

            Response.Redirect("~/LogIn.aspx");
        }

        private void SetCookie(string name, string value, DateTime expiry)
        {
            HttpCookie cookie = new HttpCookie(name, value);
            cookie.Expires = expiry;
            Response.Cookies.Add(cookie);
        }
    }
}