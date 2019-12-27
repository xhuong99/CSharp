<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="BHJewlryManagement.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
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
                                <asp:HyperLink ID="lnkCate" runat="server" Text='<%#  Eval("NameCate") %>' NavigateUrl='<%# "~/View/ShoppingPage.aspx?IDCate=" +Eval("IDCate")  %>'  />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <a href="ViewCart.aspx">CART</a>
                <div style="float: right; margin-right: 30px; width: 170px;">
                    <div style="float: left; width: 60%; margin-top: 5px">
                        <asp:Label ID="IDAcc" runat="server" Visible="False" ForeColor="White"></asp:Label>,
                    </div>
                    <div style="float: right; font-size: 80%; color: aliceblue; width: 40%">
                        <asp:LinkButton ID="lnkLoginout" runat="server" OnClick="lnkLoginout_Click" Visible="false">Logout</asp:LinkButton>
                    </div>
                </div>
            </div>

            <article style="width: 100%">
                <br />
                <div class="contact" style="margin-left: 25%; border-style: none">
                    <asp:Label ID="Label1" runat="server" Text="Username" ForeColor="#996600"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Password" ForeColor="#996600"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;<br />
                    <asp:Label ID="loginErr" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                    <br />
                    <br />

                    <asp:LinkButton ID="lnkRegister" runat="server" OnClick="lnkRegister_Click">Don't have account? Register!!!</asp:LinkButton>
                </div>

            </article>
            <footer>
            </footer>
        </div>
    </form>
</body>
</html>
