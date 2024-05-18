<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProfilePage.aspx.cs" Inherits="Demo1.ViewProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
    <link href="Css/CustomStyles.css" rel="stylesheet" />
</head>
<body style="background-image:url(Images/b1.png); background-size:cover; background-repeat: no-repeat;">
    <form id="form1" runat="server">
        <div style="align-self: auto; padding-left: 20%; padding-top: 10%; font-size: 125%; font-family: 'Comic Sans MS'">
            <asp:Table ID="Table1" runat="server" BorderColor="WhiteSmoke" BorderWidth="5" BorderStyle="Dotted" CellSpacing="5" BackColor="BlueViolet" CssClass="custom-table">
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Name&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="Name" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">User ID&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="UserID" runat="server" Enabled="false" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="UserID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Password&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="Password" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Mail ID&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="MailID" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="MailID" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="" Text="Invalid Mail ID" ControlToValidate="MailID" ForeColor="Red" ValidationExpression="\w+([-+,.']\w+)*@gmail.com"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <br />
                        <asp:Button ID="Update" runat="server" Text="UPDATE" Font-Size="Large" OnClick="Update_Click" BackColor="Black" ForeColor="WhiteSmoke" BorderColor="WhiteSmoke" Width="150" Height="35" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <br />
                        <asp:Label ID="InvalideLabel" runat="server" Text="Invalid Username or Password" Font-Size="Large" ForeColor="Red" Visible="false" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>