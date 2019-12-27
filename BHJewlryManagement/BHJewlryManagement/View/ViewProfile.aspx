<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="BHJewlryManagement.ViewProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Profile</title>
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
                                <asp:HyperLink ID="lnkCate" runat="server" Text='<%#  Eval("NameCate") %>' NavigateUrl='<%# "~/View/ShoppingPage.aspx?IDCate=" +Eval("IDCate")  %>' />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <a href="ViewCart.aspx">CART</a>
                <div style="float: right; margin-right: 30px; width: 170px;">
                    <div style="float: left; width: 60%; margin-top: 5px">
                        
                        <asp:HyperLink ID="lnkProfile" runat="server" Text='<%# Eval("NameAcc") %>' NavigateUrl="~/View/ViewProfile.aspx" Style="font-size:100%;" Visible="False"></asp:HyperLink>
                    </div>
                    <div style="float: right; font-size: 80%; color: aliceblue; width: 40%">
                        <asp:LinkButton ID="lnkLoginout" runat="server" OnClick="lnkLoginout_Click">Logout</asp:LinkButton>
                    </div>
                </div>
            </div>
            <article style="width: 100%; color: darkgoldenrod">
                <div class="main" style="margin-left: 10%; color: darkgoldenrod; font-size: 25px">
                    <br />
                    Name:&emsp;<asp:Label ID="lbName" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    Phone:&emsp;<asp:Label ID="lbPhone" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    Address:&emsp;<asp:Label ID="lbAddress" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                </div>
                <div class="main" style="margin-left: 20%">
                    <asp:GridView ID="gvBills" runat="server" AutoGenerateColumns="false" Width="743px">
                        <Columns>
                            <asp:BoundField HeaderText="Bill ID" DataField="IDOrd" />
                            <asp:BoundField HeaderText="Date Order" DataField="DateOrd" />
                            <asp:TemplateField HeaderText="Details">
                                <ItemTemplate>
                                    <asp:HyperLink ID="Details" NavigateUrl='<%# "~/View/ViewDetailsBill.aspx?IDOrd=" +Eval("IDOrd") %>' runat="server" >View details...</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Total Price" DataField="TotalPrice" />
                        </Columns>
                    </asp:GridView>
                </div>
            </article>
            <footer>
            </footer>
        </div>
    </form>
</body>
</html>
