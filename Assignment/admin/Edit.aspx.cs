using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace Assignment.admin
{
    public partial class Edit1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // string productId = Request.QueryString["Id"];
            //string filename = productId + ".jpg";
            // string saveLocation = Server.MapPath("~/admin/ProductImages/" + filename);

            //imageFileUploadControl.SaveAs(saveLocation);
            
            //string path = Server.MapPath("~/admin/ProductImage/");

            //if(imageFileUploadControl.HasFile)
            //{
            //    string ext = Path.GetExtension(imageFileUploadControl.FileName);
            //    if (ext == ".jpg" || ext == ".png")
            //    {
            //        imageFileUploadControl.SaveAs(path + imageFileUploadControl.FileName);
            //        string name = "~admin/ProductImage/" + imageFileUploadControl.FileName;
            //        //string ss = "insert into blog("
            //    }
            //}
            //else
            //{

            //}

        }



        protected void Button3_Click(object sender, EventArgs e)
        {
            FileUpload file = (FileUpload)FormView1.FindControl("FileUpload") as FileUpload;
            string extension = (System.IO.Path.GetExtension(file.FileName).ToLower());
            if (file.HasFile)
            {
                if (extension == ".png" || extension == ".jpeg" || extension == ".gif" || extension == ".jpg")
                {
                    file.SaveAs(Server.MapPath("~/ProductImages/" + file.FileName));
                    Label saveProduct = (Label)FormView1.FindControl("saveLabel") as Label;
                    saveProduct.Text = "~/ProductImages/" + file.FileName;
                    img_lit.Text = "File successfully uploaded";
                }
                else
                {
                    img_lit.Text = "invalid image file type";
                }

            }
        }
    }
}