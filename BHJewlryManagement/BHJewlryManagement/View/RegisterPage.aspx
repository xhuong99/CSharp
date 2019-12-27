<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="BHJewlryManagement.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Page</title>
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
                <div style="float: right; margin-right: 30px; width: 150px">
                    <asp:Label ID="IDAcc" runat="server" Visible="False"></asp:Label>,
                <div style="float: right; font-size: 80%; color: aliceblue;">
                    <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click">Login</asp:LinkButton>
                </div>
                </div>
            </div>
            <article style="width: 100%">
                <br />
                <div class="contact" style="margin-left: 25%; border-style: none">

                    <asp:Label ID="Label1" runat="server" Text="Username" ForeColor="#996600"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="usernameErr" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>

                    <br />

                    <asp:Label ID="Label2" runat="server" Text="Password" ForeColor="#996600"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="passwordErr" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
                    <br />

                    <asp:Label ID="Label3" runat="server" Text="Fullname" ForeColor="#996600"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtFullname" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="nameErr" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />

                    <asp:Label ID="Label4" runat="server" Text="Phone Number" ForeColor="#996600"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="phoneErr" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />

                    <asp:RadioButtonList ID="listGen" runat="server" Height="30px" Width="193px" ForeColor="#996600">
                        <asp:ListItem Text="Male" Value="Male" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:RadioButtonList>

                    <asp:Label ID="Label6" runat="server" Text="Email" ForeColor="#996600"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="emailErr" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />

                    <asp:Label ID="Label5" runat="server" Text="Address" ForeColor="#996600"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="addressErr" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />
                    <br />

                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                </div>
            </article>
            <footer>
            </footer>
        </div>
    </form>
</body>
</html>
