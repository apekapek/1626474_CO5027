<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Assignment.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <form id="form1" runat="server">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <p>
            <asp:Label ID="Label1" runat="server" Text="Enter Your Email"></asp:Label>
            <asp:TextBox ID="EmailForUser" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regValidEmail" runat="server" ErrorMessage="enter a valid email" ControlToValidate="EmailForUser" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="reqEmails" runat="server" ControlToValidate="EmailForUser" Display="None" ErrorMessage="please fill in email"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblSubject" runat="server" Text="Subject"></asp:Label>
            <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqSubjectField" runat="server" ControlToValidate="txtSubject" ErrorMessage="Please enter Subject" Display="None"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblBody" runat="server" Text="Body"></asp:Label>
            <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqBodyField" runat="server" ControlToValidate="txtBody" ErrorMessage="please fill in the blank" Display="None"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Button ID="btnSendEmail" runat="server" Text="Send Email" OnClick="btnSendEmail_Click" />
        </p>
        <p>
            <asp:Literal ID="litResult" runat="server"></asp:Literal>
        </p>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GoogleMap" runat="server">
     <div id="map">
    <script>
      var map;
      function initMap() {
          
              
              var collegeLatLng = { lat: 4.885731, lng: 114.931669 };
              var map = new google.maps.Map(document.getElementById('map'), {
                  zoom: 19,
                  center: collegeLatLng
              });
              
              var contentString1 = '<div id="content">' +
                  '<div id="siteNotice">' +
                  '</div>' +
                  '<h1 id="firstHeading" class="firstHeading">Laksamana College of Business</h1>' +
                  '<div id="bodyContent">' +
                  '<p><b>College located here!</b></p>' +
                  '</div>' +
                  '</div>';
              
              var infowindow1 = new google.maps.InfoWindow({
                  content: contentString1
              });
             
             
              var marker1 = new google.maps.Marker({
                  position: collegeLatLng,
                  map: map,
                  title: 'Laksamana College of Business'
              });
              marker1.addListener('click', function () {
                  infowindow1.open(map, marker1);
              });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3Jd9nrI76Iz0Nl3qA4sHLh4eF02sVTM8&callback=initMap"
    async defer></script>
    </div>
</asp:Content>

