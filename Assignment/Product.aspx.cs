using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal.Api;

namespace Assignment
{
    public partial class Product : System.Web.UI.Page
    {
   
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        protected void purchase_Click(object sender, EventArgs e)
        {
            //decimal postagePackagingCost = 3.95m;
            //decimal productPrice = 10.00m;
            //int quantityOfProduct = int.Parse(ddlQuantity.SelectedValue);
            //decimal subTotal = (quantityOfProduct * productPrice);
            //decimal total = subTotal + postagePackagingCost;

            //var config = ConfigManager.Instance.GetProperties();
            //var accessToken = new OAuthTokenCredential(config).GetAccessToken();

            ////Get APIcontext 
            //var apiContext = new APIContext(accessToken);


            ////items transaction and payment objects
            //var penItem = new Item();
            //penItem.name = "Product";// get value
            //penItem.currency = "GBP";
            //penItem.price = productPrice.ToString();
            //penItem.sku = "PEPCO5027";//get value (ProductID)
            //penItem.quantity = ddlQuantity.ToString();

            ////subtotal
            //var transactionDets = new Details();
            //transactionDets.tax = "0";
            //transactionDets.shipping = postagePackagingCost.ToString();
            //transactionDets.subtotal = subTotal.ToString();

            ////amount object compromising total amount
            //var transactionAmount = new Amount();
            //transactionAmount.currency = "GBP";
            //transactionAmount.total = total.ToString("0.00");
            //transactionAmount.details = transactionDets;

            ////transaction object
            //var transobj = new Transaction();
            //transobj.description = "your items";
            //transobj.invoice_number = Guid.NewGuid().ToString();
            //transobj.amount = transactionAmount;
            //transobj.item_list = new ItemList
            //{
            //    items = new List<Item> { penItem }
            //};

            ////buyer object
            //var buyer = new Payer();
            //buyer.payment_method = "paypal";

            ////redirect to avoid error 404
            //var redirection = new RedirectUrls();
            ////redirection.cancel_url = "http://1624968.studentwebserver.co.uk/CO5027/Product.aspx";
            ////redirection.return_url = "http://1624968.studentwebserver.co.uk/CO5027/purchased.aspx";
            //redirection.cancel_url = "http://" + HttpContext.Current.Request.Url.Authority + "/Default.aspx";
            //redirection.return_url = "http://" + HttpContext.Current.Request.Url.Authority + "/CompletePurchase.aspx";

            ////payment object
            //var pay = Payment.Create(apiContext, new Payment
            //{
            //    intent = "sale",
            //    payer = buyer,
            //    transactions = new List<Transaction> { transobj },
            //    redirect_urls = redirection
            //}
            //    );

            ////create session
            //Session["paymentId"] = pay.id;

            ////URL to send user to from the links in the payment object
            //foreach (var link in pay.links)
            //{
            //    if (link.rel.ToLower().Trim().Equals("approval_url"))
            //    {
            //        //send user to the appropritate link if link is found
            //        Response.Redirect(link.href);
            //    }
            //}
            //new paypal below



            DropDownList DDLProductQty = (DropDownList)FormView1.FindControl("ddlQuantity");
            Label productPrice = (Label)FormView1.FindControl("ProductPriceLabel");
            Label prodID = (Label)FormView1.FindControl("ProductIDLabel");
            decimal shippingPackagingCost = 5.00m;
            int productPrice1;// = (int) productPrice;
            int.TryParse((string)productPrice.Text, out productPrice1);
            int quantityOfProducts = int.Parse(DDLProductQty.SelectedValue);
            decimal subTotal = (quantityOfProducts * productPrice1);
            decimal totalAmount = subTotal + shippingPackagingCost;

            //Authenticate with PayPal
            var config = ConfigManager.Instance.GetProperties();
            var accessToken = new OAuthTokenCredential(config).GetAccessToken();
            //Get APIContext Object
            var apiContext = new APIContext(accessToken);

            var productStock = new Item();
            productStock.name = "Products";
            productStock.currency = "SGD";
            productStock.price = productPrice1.ToString();
            productStock.sku = prodID.Text; //sku is stock keeping unit e.g. manufacturer code
            productStock.quantity = quantityOfProducts.ToString();



            var transactionDetails = new Details();
            transactionDetails.tax = "0";
            transactionDetails.shipping = shippingPackagingCost.ToString();
            transactionDetails.subtotal = subTotal.ToString("0.00");

            var transactionAmount = new Amount();
            transactionAmount.currency = "SGD";
            transactionAmount.total = totalAmount.ToString("0.00");
            transactionAmount.details = transactionDetails;

            var transaction = new Transaction();
            transaction.description = "Your order from Faber Castell";
            transaction.invoice_number = Guid.NewGuid().ToString(); // this should ideally be the id of a record storing the order
            transaction.amount = transactionAmount;
            transaction.item_list = new ItemList
            {
                items = new List<Item> { productStock }
            };

            var payer = new Payer();
            payer.payment_method = "paypal";

            var redirectUrls = new RedirectUrls();
            string strPathAndQuery = HttpContext.Current.Request.Url.PathAndQuery;
            string strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");

            redirectUrls.cancel_url = strUrl + "cancel.aspx";
            redirectUrls.return_url = strUrl + "completePurchase.aspx";

            var payment = Payment.Create(apiContext, new Payment
            {
                intent = "sale",
                payer = payer,
                transactions = new List<Transaction> { transaction },
                redirect_urls = redirectUrls
            });

            Session["paymentId"] = payment.id;

            foreach (var link in payment.links)
            {
                if (link.rel.ToLower().Trim().Equals("approval_url"))
                {
                    //found the appropriate link, send the user there
                    Response.Redirect(link.href);
                }
            }
        }

      
    }

    
}