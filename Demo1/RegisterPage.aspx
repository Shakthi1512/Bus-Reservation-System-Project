<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="Demo1.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link href="Css/CustomStyles.css" rel="stylesheet" />
</head>
<body style="background-image:url(Images/b1.png); background-size:cover; background-repeat: no-repeat;">
    <form id="form1" runat="server">
        <center><div>
            <div style="float: right; padding: 1%">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoginPage.aspx" ForeColor="Red" Font-Size="Large">Login</asp:HyperLink>
            </div>
        </div>
        <div style="align-self: auto; padding-left:20%; padding-top: 10%; font-size: 125%; font-family: 'Comic Sans MS'">
            <asp:Table ID="Table1" runat="server" BorderColor="WhiteSmoke" BorderWidth="5" BorderStyle="Dotted" CellSpacing="5" BackColor="BlueViolet" CssClass="custom-table">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                    <center><div style="color: yellow"><b>* * * * *   Enter all details   * * * * *</b></div></center>
                    <br />
                </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Name&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="Name" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Mobile Number&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="UserID" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="UserID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Password&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="Password" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Mail ID&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="MailID" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="MailID" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="" Text="Invalid Mail ID" ControlToValidate="MailID" ForeColor="Red" ValidationExpression="\w+([-+,.']\w+)*@gmail.com"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <br />
                        <asp:Button ID="Register" runat="server" Text="Register" Font-Size="Large" OnClick="Register_Click" BackColor="Black" ForeColor="WhiteSmoke" BorderColor="WhiteSmoke" Width="150" Height="35" /><br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="InvalideLabel" runat="server" Text="User already EXISTS - Try login" Font-Size="Large" ForeColor="Red" Visible="false" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UserDetails]"></asp:SqlDataSource>
        </div></center>
    </form>
</body>
</html>
