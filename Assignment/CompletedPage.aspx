<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompletedPage.aspx.cs" Inherits="Assignment.CompletedPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <section id="welcome">
        <h1>Complete Your Purchase</h1>
    </section>
    <section id="first_content">
        <p>By clicking Confirm Order button, you are agree to proceed the order.</p>
        <asp:Button ID="btnConfirmOrder" runat="server" Text="Confirm Order" OnClick="btnConfirmOrder_Click" />
        <div class="literal">
            <asp:Literal ID="litResult" runat="server"></asp:Literal>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GoogleMap" runat="server">
</asp:Content>
