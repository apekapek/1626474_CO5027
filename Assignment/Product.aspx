<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Assignment.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Product
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Banner" runat="server">
    alum ada
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" runat="server">
    Item Description
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
 <div class="single-item">
  <div class="left-set">
      <img src="Image/Ballpoint%20pen%20Essentio%20Black%20Carbon%20gift%20box.jpg" />
  </div>
  <div class="right-set">
    <div class="name">Ballpoint pen Essentio Black Carbon</div>
   
    <div class="price">$65</div>
    <div class="description">
    <p>
        Beautiful to look at, comfortable to hold, 
        and a pleasure to write with – those are the qualities of Essentio writing implements. 
        In a contrasting colour and with a softtouch coating, 
        the ergonomic grip zones are attractively combined with chrome-plated metal.
    </p>
    </div>
    <button>ADD TO CART</button>
  </div>
</div>
    
</asp:Content>
