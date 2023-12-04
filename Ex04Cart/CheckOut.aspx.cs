using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ex04Cart
{
    public partial class CheckOut : System.Web.UI.Page
    {
        private Customer customer;
        private CartItemList cart;
        protected void Page_Load(object sender, EventArgs e)
        {
            cart = CartItemList.GetCart();
            if (!IsPostBack)
            {
                customer = (Customer)Session["Customer"];
                this.LoadCustomerData();
                this.DisplayCart();
            }
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
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                this.GetCustomerData();
                Response.Redirect("~/Confirmation.aspx");
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            Session.Remove("Customer");
            Response.Redirect("~/Order.aspx");
        }
        private void LoadCustomerData()
        {
            if (customer != null)
            {
                txtFirstName.Text = customer.FirstName;
                txtLastName.Text = customer.LastName;
                txtEmail1.Text = customer.EmailAddress;
                txtPhone.Text = customer.Phone;
                txtAddress.Text = customer.Address;
                txtCity.Text = customer.City;
                txtZip.Text = customer.Zip;
                ddlState.SelectedValue = customer.State;
                rblContactVia.SelectedValue = customer.ContactVia;
                cblAboutList.Items[0].Selected = customer.NewProductsInfo;
                cblAboutList.Items[1].Selected = customer.SpecialPromosInfo;
                cblAboutList.Items[2].Selected = customer.NewRevisionsInfo;
                cblAboutList.Items[3].Selected = customer.LocalEventsInfo;
            }
        }
        private void GetCustomerData()
        {
            if (customer == null) customer = new Customer();
            customer.FirstName = txtFirstName.Text;
            customer.LastName = txtLastName.Text;
            customer.EmailAddress = txtEmail1.Text;
            customer.Phone = txtPhone.Text;
            customer.Address = txtAddress.Text;
            customer.City = txtCity.Text;
            customer.Zip = txtZip.Text;
            customer.State = ddlState.SelectedValue;
            customer.ContactVia = rblContactVia.SelectedValue;
            customer.NewProductsInfo = cblAboutList.Items[0].Selected;
            customer.SpecialPromosInfo = cblAboutList.Items[1].Selected;
            customer.NewRevisionsInfo = cblAboutList.Items[2].Selected;
            customer.LocalEventsInfo = cblAboutList.Items[3].Selected;

            Session["Customer"] = customer;
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {

        }
    }
}