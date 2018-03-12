<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <form id="form1" runat="server">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        Username<asp:TextBox ID="txtRegUserName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqUsername" runat="server" ControlToValidate="txtRegUserName" ErrorMessage="please enter the username" Display="None"></asp:RequiredFieldValidator>
        <br />
        <br />
        Password<asp:TextBox ID="txtRegPassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqPass" runat="server" ControlToValidate="txtRegPassword" Display="None" ErrorMessage="please enter password"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnReg" runat="server" Text="Register" OnClick="btnReg_Click" />
        <br />
        <br />
        <asp:Literal ID="litRegisterError" runat="server"></asp:Literal>
</form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GoogleMap" runat="server">
</asp:Content>
