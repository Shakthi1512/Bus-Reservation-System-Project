<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTicketStatusPage.aspx.cs" Inherits="Demo1.ViewTicketStatusPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: blueviolet; color: whitesmoke">
            <center>
                <table>
                    <tr>
                        <td><b>
                            <asp:Label Text="Ticket ID" runat="server" Font-Bold="true" Font-Size="Larger" /></b></td>
                        <td>
                            <asp:TextBox ID="TicketID" runat="server" TextMode="Number" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff" /></td>
                        <td>
                            <asp:Button ID="Search" runat="server" Text="SEARCH" OnClick="Search_Click" Font-Size="medium" BackColor="Black" ForeColor="WhiteSmoke" BorderColor="WhiteSmoke" Width="100" Height="25" /></td>
                    </tr>
                </table>
            </center>
        </div><center>
        <div style="align-self: auto; padding-top: 5%; font-size: 125%; font-family: 'Comic Sans MS';width:50%">
            <asp:ListView ID="PassengerList" runat="server">
                <ItemTemplate>
                    <div style="padding: 5px; border: 1px solid #ccc; margin-bottom: 5px;">
                        <center>
                            <table style="background-color:white;width:100%;background-color:burlywood">
                                <tr>
                                    <td style="width: 20%;height:5%;color:black"><div><b>Name</b></div></td>
                                    <td style="width: 25%;height:5%;color:blue"><b><asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></b></td>
                                    <td style="width: 25%;height:5%;background-color:blue;color:whitesmoke"><center><b><asp:Label ID="lblSeatNumber" runat="server" Text='<%# Eval("SeatNumber") %>'></asp:Label></b></center></td>
                                </tr>
                                <tr>
                                    <td style="width: 20%;height:5%;color:black"><div><b>Age</b></div></td>
                                    <td style="width: 25%;height:5%;color:blue"><b><asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>'></asp:Label></b></td>
                                    <td style="width: 25%;height:5%;background-color:blue;color:whitesmoke"><center><div><b><asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status").ToString().Equals("1") ? "Confirm" : "Canceld" %>' /></b></div></center></td>
                                </tr>
                            </table>
                        </center>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    No items to display.
                </EmptyDataTemplate>
            </asp:ListView>
        </div></center>
    </form>
</body>
</html>