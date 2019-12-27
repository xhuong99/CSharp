<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailPage.aspx.cs" Inherits="BHJewlryManagement.ProductDetailPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Details Product</title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <style>
        .left, .right {
            width: 300px;
            height: 300px;
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <img src="../Img/79496533_455510962007448_2810540849480335360_n.jpg" />
            </header>

            <div class="nav">
                <a href="ShoppingPage.aspx">HOME</a>
                <div class="dropdown">
                    <a href="#" class="dropbtn">PRODUCT</a>
                    <div class="dropdown-content">
                        <asp:Repeater ID="listCategory" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkCate" runat="server" Text='<%#  Eval("NameCate") %>' NavigateUrl='<%# "~/View/ShoppingPage.aspx?IDCate=" +Eval("IDCate")  %>' />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>
                <a href="ViewCart.aspx">CART</a>
                <div style="float: right; margin-right: 30px; width: 170px;">
                    <div style="float: left; width: 60%; margin-top: 5px">
                        <asp:HyperLink ID="lnkProfile" runat="server" Text='<%# Eval("NameAcc") %>' NavigateUrl="~/View/ViewProfile.aspx" Style="font-size: 100%;" Visible="False"></asp:HyperLink>
                    </div>
                    <div style="float: right; font-size: 80%; color: aliceblue; width: 40%">
                        <asp:LinkButton ID="lnkLoginout" runat="server" OnClick="lnkLoginout_Click" Visible="False">Logout</asp:LinkButton>
                    </div>
                </div>
            </div>

            <br />
            <article>
                <div class="main" style="margin-left: 15%">
                    <div class="left" style="color: darkgoldenrod; font-size: 25px">
                        Name:&emsp;<asp:Label ID="lbName" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        Category:&emsp;<asp:Label ID="lbCate" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        Type:&emsp;<asp:Label ID="lbCol" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        Price:&emsp;<asp:Label ID="lbPrice" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        Quantity:&emsp;<asp:TextBox ID="txtQuantity" TextMode="Number" runat="server" Width="46px" Min="1" Height="19px"></asp:TextBox>

                    </div>
                    <div class="right" style="text-align: center">
                        <asp:Image ID="imgItem" ImageUrl='<%# Eval("Image") %>' runat="server" Height="200" Width="200" />
                        <br />
                        <br />
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CommandArgument='<%# Bind("IDPro") %>' Height="49px" Width="188px" OnClick="btnAddToCart_Click" Font-Size="20px" />
                    </div>
                </div>
            </article>
            <aside>
                <h2>Your Cart</h2>
                <br />
                <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="Name" DataField="NamePro" />
                        <asp:BoundField HeaderText="Quantity" DataField="Quantity" />
                        <asp:BoundField HeaderText="UnitPrice" DataField="UnitPrice" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="DarkGoldenrod" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="White" ForeColor="DarkGoldenrod" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <br />
                <asp:Button ID="btnCheckOut" runat="server" Text="Checkout" Visible="false" CommandArgument='<%# Bind("IDPro") %>' Height="39px" Width="360px" OnClick="btnCheckOut_Click" Font-Size="20px" />
            </aside>
            <footer>
            </footer>
        </div>
    </form>
</body>
</html>
