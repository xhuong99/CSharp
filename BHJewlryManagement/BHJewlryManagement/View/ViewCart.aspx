<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="BHJewlryManagement.ViewCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Cart</title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="formViewCart" runat="server">
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
            <article style="width: 100%">
                    <div class="main">
                        <asp:DataList ID="dl" runat="server" RepeatColumns="1" Width="100%"
                        BackColor="White" BorderWidth="1px" CellPadding="2" ForeColor="Black">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="White" />
                        <HeaderStyle BackColor="White" Font-Bold="True" />
                        <ItemTemplate>
                            <br />
                            <table style="width: 100%; border-bottom: 1px solid">
                                <tr>
                                    <td style="width: 300px;">
                                        <asp:Label ID="lbName" runat="server" Text='<%# Eval("NamePro") %>' Style="color: darkred; font-size: 20px;" />
                                    </td>
                                    <%--<td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Size") %>' Style="color: darkred; font-size: 20px;" />
                                        </td>--%>
                                    <td style="width: 300px;">
                                        <asp:Label ID="Label1" runat="server" Text="Quality: " Style="color: darkred; font-size: 20px;" />
                                        <asp:Label ID="lbQuan" runat="server" Text='<%# Eval("Quantity") %>' Style="color: darkred; font-size: 20px; width:20px;" />
                                        <asp:Button ID="btnSub" CommandArgument='<%# Bind("NamePro") %>' runat="server" Text="-1" OnClick="btnSub_Click" />
                                        <asp:Button ID="btnAdd" CommandArgument='<%# Bind("NamePro") %>' runat="server" Text="+1" OnClick="btnAdd_Click" />
                                    </td>
                                    <td style="width: 300px;">
                                        <asp:Label ID="Label4" runat="server" Text="Unit Price: " Style="color: darkred; font-size: 20px;" />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("UnitPrice") %>' Style="color: darkred; font-size: 20px;" />
                                    </td>
                                    <td style="width: 300px;">
                                        <asp:Label ID="lbSubTotal" runat="server" Text="SubTotal: " Style="color: darkred; font-size: 20px;" />
                                        <asp:Label ID="Label5" runat="server" Text='<%# float.Parse(Eval("UnitPrice").ToString()) * float.Parse(Eval("Quantity").ToString()) %>' Style="color: darkred; font-size: 20px;" />
                                    </td>
                                    </td>
                                        <td style="width: 300px;">
                                            <asp:Button ID="btnRemove" runat="server" Text="Remove" OnClick="btnRemove_Click" CommandArgument='<%# Bind("NamePro") %>' />
                                        </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    </asp:DataList>
                    <div align="right" style="margin-right: 40%; font-size: 23px; font-weight: bold">
                        <asp:Label ID="Label1" runat="server" Text="Total: " Style="color: darkred; font-size: 20px;" />
                        <asp:Label ID="lbTotal" runat="server" ForeColor="#993333"></asp:Label><br />
                    </div>
                        <br />
                    <div align="center">
                        <asp:Button ID="btnCheckOut" runat="server" Text="Pay Bill" OnClick="btnCheckOut_Click" Font-Size="20px" />
                    </div>
                    </div>
            </article>
            <footer>
            </footer>
        </div>
    </form>
</body>
</html>
