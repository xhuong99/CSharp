<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProductPage.aspx.cs" Inherits="BHJewlryManagement.AddProductPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Product</title>
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
                <div style="float: right; margin-right: 30px; width: 150px">
                    <asp:Label ID="IDAcc" runat="server" Visible="False"></asp:Label>,
                <div style="float: right; font-size: 80%; color: aliceblue;">
                    <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click" Visible="False">Logout</asp:LinkButton>
                </div>
                </div>
            </div>
            <article style="width: 100%">
                <br />
                <div class="contact" style="margin-left: 25%">
                    <asp:Label ID="Label6" runat="server" Text="ID Product" ForeColor="#996600"></asp:Label>&nbsp;&nbsp; 
                    <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;<br />
                    <asp:Label ID="idErr" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />

                    <asp:Label ID="Label8" runat="server" Text="Category" ForeColor="#996600"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:DropDownList ID="listCategory" runat="server" DataTextField="NameCate" DataValueField="IDCate">
                    </asp:DropDownList>
                    <br />

                    <asp:Label ID="Label9" runat="server" Text="Color" ForeColor="#996600"></asp:Label>
                    &nbsp;&emsp;&emsp;&nbsp;&emsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="listColor" runat="server" DataTextField="NameCol" DataValueField="IDCol">
                    </asp:DropDownList>
                    <br />

                    <asp:Label ID="Label10" runat="server" Text="Name Product" ForeColor="#996600"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;<br />
                    <asp:Label ID="nameErr" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />

                    <asp:Label ID="Label12" runat="server" Text="Price" ForeColor="#996600"></asp:Label>
                    &emsp;&emsp;&emsp; &ensp;&nbsp;<asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;<br />
                    <asp:Label ID="priceErr" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Add Product" OnClick="btnAdd_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Reset" OnClick="btnReset_Click" />
                </div>

            </article>
            <footer>
            </footer>
        </div>
    </form>
</body>
</html>
