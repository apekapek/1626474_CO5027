<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
     <section id="first_content">
        <h2>Product List</h2>
        <asp:Repeater ID="rptrProducts" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate><div></HeaderTemplate>
            <ItemTemplate>
                <div class="rptrProduct">
                    <a href="<%# Eval ("ProductID", "Product.aspx?Id={0}") %>">
                        <div>
                            <asp:Image ID="displayProductImage" runat="server" Height="200px" ImageUrl='<%# Eval("ProductImage") %>' Width="200px" AlternateText='<%# Eval("ProductDesc") %>' />

                        </div>
                        <div><%# Eval ("ProductName") %></div>
                        <div><asp:Label ID="lblProductPrice" runat="server" Text="$"></asp:Label><%# Eval ("ProductPrice") %></div>
                        <div><asp:Label ID="lblProductQty" runat="server" Text="Qty: "></asp:Label><%# Eval ("ProductQuantity") %></div>
                    </a>
                </div>
            </ItemTemplate>
            <FooterTemplate></div></FooterTemplate>
        </asp:Repeater>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_1626474_co5027_asgConnectionString1 %>" SelectCommand="SELECT * FROM [tblProducts]"></asp:SqlDataSource>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GoogleMap" runat="server">
</asp:Content>
