<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePage.aspx.cs" Inherits="BHJewlryManagement.UpdatePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Product</title>
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
            <article style="width: 100%;">
                <div class="main" style="margin-left: 25%;">
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Category" ForeColor="DarkGoldenrod"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="listCategory" runat="server" DataTextField="NameCate" DataValueField="IDCate">
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Color" ForeColor="DarkGoldenrod"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="listColor" runat="server" DataTextField="NameCol" DataValueField="IDCol">
                    </asp:DropDownList>
                    <br />

                    <asp:Label runat="server" Text="Name" ForeColor="DarkGoldenrod"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
            <asp:Label ID="nameErr" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br />

                    <asp:Label ID="Label4" runat="server" Text="Price" ForeColor="DarkGoldenrod"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;<asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
            <asp:Label ID="priceErr" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    <br /><br />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </div>
            </article>
            <footer>
            </footer>
        </div>
    </form>
</body>
</html>
