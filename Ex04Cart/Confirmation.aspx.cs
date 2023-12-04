using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Caching;

namespace Ex04Cart
{
    public partial class Confirmation : System.Web.UI.Page
    {
        private CartItemList cart;
        protected void Page_Load(object sender, EventArgs e)
        {
            var customer = (Customer)Session["Customer"];

            string message =
                "Contact information\n" +
                "    Email: " + customer.EmailAddress + "\n" +
                "    First name: " + customer.FirstName + "\n" +
                "    Last name: " + customer.LastName + "\n" +
                "    Phone number: " + customer.Phone + "\n" +
                "Billing address\n" +
                "    Address: " + customer.Address + "\n" +
                "    City: " + customer.City + "\n" +
                "    State: " + customer.State + "\n" +
                "    Zip code: " + customer.Zip + "\n" +
                "Let me know about\n" +
                "    New products: " + customer.NewProductsInfo + "\n" +
                "    Special offers: " + customer.SpecialPromosInfo + "\n" +
                "    New editions: " + customer.NewRevisionsInfo + "\n" +
                "    Local events: " + customer.LocalEventsInfo + "\n" +
                "Contact me via: " + customer.ContactVia + "\n";

            txtData.Text = message;

            cart = CartItemList.GetCart();
            if (!IsPostBack)
            {
                this.DisplayCart();
            }

            // get timestamp from cache, then display it
            // or set timestamp in cache to now plus 10, then display
            object cacheTimestamp = Cache.Get("Timestamp");
            if (cacheTimestamp == null)
            {
                cacheTimestamp = DateTime.Now;
                Cache.Insert("Timestamp", cacheTimestamp, null,
                DateTime.Now.AddMinutes(10), Cache.NoSlidingExpiration);
            }
            lblCacheTimestamp.Text = cacheTimestamp.ToString();
        }

        public void DisplayCart()
        {
            lstCart.Items.Clear();         //listCart is the list box display in the design view
            CartItem item;
            for (int i = 0; i < cart.Count; i++)    //add the items in the cart to the listCart for display
            {
                item = cart[i];
                lstCart.Items.Add(item.Display());
            }

            if (cart.Count > 0)
            {
                lblMessage.Text = "Total Price : " + cart.calculateTotal();
            }
        }
    }
}