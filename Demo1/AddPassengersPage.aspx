<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPassengersPage.aspx.cs" Inherits="Demo1.AddPassengersPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Passengers</title>
    <link href="Css/CustomStyles.css" rel="stylesheet" />
</head>
<body style="background-image:url(Images/b3.png); background-size:cover; background-repeat: no-repeat;">
    <form id="form1" runat="server">
        <center><div style="align-self: auto; padding-top: 18%; font-size: 125%; font-family: 'Comic Sans MS'">
            <asp:Table ID="Table1" runat="server" BorderColor="WhiteSmoke" BorderWidth="5" BorderStyle="Dotted" CellSpacing="5" BackColor="BlueViolet" CssClass="custom-table">
                
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <center><div style="color: yellow"><b>&nbsp;* * * * *&nbsp;<asp:Label ID="Count" runat="server" />&nbsp;* * * * *&nbsp;</b></div></center><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Name&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="Name" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Age&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="Age" runat="server" TextMode="Number" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="Age" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Mobile Number&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="Mobile" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="" Text="&nbsp;*" ControlToValidate="Mobile" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ForeColor="WhiteSmoke">Gender&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                        <asp:DropDownList ID="Gender" runat="server" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff">
                            <asp:ListItem Text="Select Gender" Value="-1" />
                            <asp:ListItem Text="Male" Value="1" />
                            <asp:ListItem Text="Female" Value="2" />
                            <asp:ListItem Text="Other" Value="3" />
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <br />
                        <asp:Button ID="AddPassenger" runat="server" Text="ADD" Font-Size="Large" OnClick="AddPassenger_Click" BackColor="Black" ForeColor="WhiteSmoke" BorderColor="WhiteSmoke" Width="150" Height="35" /><br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="InvalideLabel" runat="server" Text="Something went wrong" Font-Size="Large" ForeColor="Red" Visible="false" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Passenger]"></asp:SqlDataSource>
            </div>
        </div></center>
    </form>
</body>
</html>