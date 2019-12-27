<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDetailsBill.aspx.cs" Inherits="BHJewlryManagement.ViewDetailsBill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Details Bill</title>
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

                        <asp:HyperLink ID="lnkProfile" runat="server" Text='<%# Eval("NameAcc") %>' NavigateUrl="~/View/ViewProfile.aspx" Style="font-size: 100%;" Visible="False"></asp:HyperLink>
                    </div>
                    <div style="float: right; font-size: 80%; color: aliceblue; width: 40%">
                        <asp:LinkButton ID="lnkLoginout" runat="server" OnClick="lnkLoginout_Click">Logout</asp:LinkButton>
                    </div>
                </div>
            </div>
            <article style="width: 100%; color: darkgoldenrod">
                <div class="main" style="margin-left: 20%">
                    <br />
                    <asp:GridView ID="gvBills" runat="server" AutoGenerateColumns="False" Height="275px" Width="716px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                        <Columns>
                            <asp:BoundField HeaderText="Name" DataField="NamePro" />
                            <asp:BoundField HeaderText="Type" DataField="IDCate" />
                            <asp:BoundField HeaderText="Quantity" DataField="QuanOrdD" />
                            <asp:BoundField HeaderText="Unit Price" DataField="PricePro" />
                            <asp:TemplateField HeaderText="Total" FooterStyle-HorizontalAlign="Center">

                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Style="text-align: center" Text='<%# Eval("Total") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lbTotal" runat="server" Style="text-align: center" Text="0.0"></asp:Label>
                                </FooterTemplate>

<FooterStyle HorizontalAlign="Center"></FooterStyle>

                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                    <asp:Label ID="lbTotal" runat="server" Text="0.0" Style="margin-left:65%; font-size:20px" ForeColor="#993333"></asp:Label>
                </div>
            </article>
            <footer>
            </footer>
        </div>
    </form>
</body>
</html>
