<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="BHJewlryManagement.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Product</title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <img src="../Img/79496533_455510962007448_2810540849480335360_n.jpg" />
            </header>

            <div class="nav">
                <a href="AdminPage.aspx">HOME</a>
                <a href="AddProductPage.aspx">ADD NEW</a>
                <div style="float: right; margin-right: 30px; width: 170px;">
                    <div style="float: left; width: 60%; margin-top: 5px">
                        <asp:Label ID="IDAcc" runat="server" Visible="False"></asp:Label>,
                    </div>
                    <div style="float: right; font-size: 80%; color: aliceblue; width: 40%">
                        <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click" Visible="False">Logout</asp:LinkButton>
                    </div>
                </div>
            </div>

            <div style="float: right; margin-right: 1%">
                Search: 
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                &nbsp;<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="GO" />
            </div>
            <br />
            <article style="width:100%">
                <div class="main" style="margin-left:25%">
                    &nbsp;<asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="IDPro" />
                            <asp:BoundField HeaderText="Category" DataField="IDCate" />
                            <asp:BoundField HeaderText="Color" DataField="IDCol" />
                            <asp:BoundField HeaderText="Name" DataField="NamePro" />
                            <asp:BoundField HeaderText="Price" DataField="PricePro" />
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="btnDelete" CommandArgument='<%# Bind("IDPro")%>' Text="Delete" OnClick="btnDelete_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField HeaderText="Edit" Text="Edit" DataNavigateUrlFields="IDPro" DataNavigateUrlFormatString="UpdatePage.aspx?IDPro={0}" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                </div>
            </article>
            <footer>
            </footer>
        </div>

    </form>
</body>
</html>
