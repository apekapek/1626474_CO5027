<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Assignment.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Contact Us
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
    Please Contact us for enquiry
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
   <div id="contact_form">
                   <form method="post" name="contact" action="#">
                        
                        <label for="author">Name:</label> <input type="text" id="author" name="author" class="required input_field" />
                        <div class="cleaner h10"></div>
                        <label for="email">Email:</label> <input type="text" id="email" name="email" class="validate-email required input_field" />
                        <div class="cleaner h10"></div>
                        
                        <label for="phone">Phone:</label> <input type="text" name="phone" id="phone" class="input_field" />
                        <div class="cleaner h10"></div>
        
                        <label for="text">Message:</label> <textarea id="text" name="text" rows="0" cols="0" class="required"></textarea>
                        <div class="cleaner h10"></div>
                        
                        <input type="submit" class="submit_btn" name="submit" id="submit" value="Send" />
                        
                    </form>
                </div>


</asp:Content>
