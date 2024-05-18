<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Demo1.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Css/CustomStyles.css" rel="stylesheet" />
</head>
<body style="background-image:url(Images/b2.png); background-size:cover; background-repeat: no-repeat;">
    <form id="form1" runat="server">
        <center>
            <div>
                <div style="float: right; padding: 1%">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RegisterPage.aspx" ForeColor="Red" Font-Size="Large">Register</asp:HyperLink>
                </div>
                <div style="align-self: auto; padding-top: 15%; font-size: 125%; font-family: 'Comic Sans MS';">
                    <asp:Table ID="Table1" runat="server" BorderColor="WhiteSmoke" BorderWidth="5" BorderStyle="Dotted" CellSpacing="5" BackColor="BlueViolet" CssClass="custom-table">
                        <asp:TableRow>
                            <asp:TableCell ForeColor="WhiteSmoke">
                            <br />User ID&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                                <br />
                                <asp:TextBox ID="UserID" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ForeColor="WhiteSmoke">Password&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox><br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                <br />
                                <asp:Button ID="Submit" runat="server" Text="Login" Font-Size="Large" OnClick="Submit_Click" BackColor="Black" ForeColor="WhiteSmoke" BorderColor="WhiteSmoke" Width="100" Height="35" />
                                <br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                <br />
                                <asp:Label ID="InvalideLabel" runat="server" Text="Invalid Username or Password" Font-Size="Large" ForeColor="Red" Visible="false" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UserDetails]"></asp:SqlDataSource>
                </div>
            </div>
        </center>
    </form>
</body>
</html>
