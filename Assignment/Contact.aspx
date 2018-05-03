<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Assignment.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
    Contact Us
            
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <p>Fill in the form below and we'll get back to you within 24 hours.</p>
            <p>Thank you in advance for your feedback.</p>
    <div class="content2">
			
			    
			
			     <div class="CtnRight">
			         
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
			</div>	
			
			
		
		<div class="CtnLeft">
	
					
			     <h1>Faber Castell</h1>
    <p>Please contact us</p>
    <div class="det"><i class="fa fa-map-marker"></i> Roof Top, Plaza Abdul Razak,

Jalan Laksamana Abdul Razak, Bandar Seri Begawan

Negara Brunei Darussalam</div>
    <div class="det"><i class="fa fa-phone"></i> 0011223344</div>
 <asp:Label ID="lblName" runat="server" Text="Name:" class="style-label" AssociatedControlID="txtName"></asp:Label>
            <p><asp:RequiredFieldValidator ID="reqNameValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtName" class="validation" ValidationGroup="validatedControls" ></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtName" runat="server" placeholder="Name is required" class="style-input" TabIndex="1"></asp:TextBox>
            </p>
                <p><asp:Label ID="lblEmail" runat="server" Text="Email:" class="style-label" AssociatedControlID="txtEmail"></asp:Label>
            <asp:RequiredFieldValidator ID="reqEmailValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtEmail" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Address is required" class="style-input" TabIndex="2"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regExprChkEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*e.g. someone@example.com" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" class="validation" ValidationGroup="validatedControls"></asp:RegularExpressionValidator>
            </p>
                    <p><asp:Label ID="lblSubject" runat="server" Text="Subject:" class="style-label" AssociatedControlID="txtSubject"></asp:Label><asp:RequiredFieldValidator ID="reqSubjectValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtSubject" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject is required" class="style-input" TabIndex="3"></asp:TextBox>
            </p>
                        <p><asp:Label ID="lblMessage" runat="server" Text="Message:" class="style-label" AssociatedControlID="txtMessage"></asp:Label><asp:RequiredFieldValidator ID="reqMessageValidator" runat="server" ErrorMessage="*Required" ControlToValidate="txtMessage" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtMessage" runat="server" placeholder="Message is required" class="style-input" TextMode="MultiLine" TabIndex="4"></asp:TextBox>
            <asp:Button ID="btnSendEmail" runat="server" Text="Send" OnClick="btnSend_Clicks" title="Submit" class="style-button" ValidationGroup="validatedControls"  />
            </p><span class="literal">
                <asp:Literal ID="litResult" runat="server"></asp:Literal></span>	
									  
		
				</div>
		</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GoogleMap" runat="server">
</asp:Content>
