<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingPage.aspx.cs" Inherits="BHJewlryManagement.ShoppingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>B&H Jewelry Shopping </title>
    <link href="StyleSheet1.css" rel="stylesheet" />
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
                                <asp:LinkButton runat="server" ID="lnkProduct" CommandArgument='<%# Eval("IDCate") %>' Text='<%# Eval("NameCate") %>' OnClick="lnkProduct_Click"></asp:LinkButton>
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
                        <asp:LinkButton ID="lnkLoginout" runat="server" OnClick="lnkLoginout_Click">Logout</asp:LinkButton>
                    </div>
                </div>
            </div>
            <article>
                <div class="main">
                    <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="100%"
                        DataKeyField="IDPro" BackColor="White" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="White" />
                        <HeaderStyle BackColor="White" Font-Bold="True" />
                        <ItemTemplate>
                            <div style="text-align: center">
                                <br />
                                <asp:Image ID="imgItem" ImageUrl='<%# Eval("Image") %>' runat="server" Height="200" Width="200" />
                                <br />
                                <br />
                                <asp:HyperLink ID="lnkDetails" runat="server" Text='<%# Eval("NamePro") %>' NavigateUrl='<%# "~/View/ProductDetailPage.aspx?IDPro=" +Eval("IDPro")+"&IDCate=" +Eval("IDCate")  %>' Style="text-decoration: none; color: darkgoldenrod; font-size: 22px" />
                            </div>
                            <br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    </asp:DataList>
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
