<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreviewBookingPage.aspx.cs" Inherits="Demo1.PreviewBookingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Preview Details</title>
    <link href="Css/CustomStyles.css" rel="stylesheet" />
</head>
<body style="background-image:url(Images/b3.png); background-size:cover; background-repeat: no-repeat;">
    <form id="form1" runat="server">
        <div style="padding-top:10%">
            <center>
                <div style="align-self: auto; font-size: 125%; font-family: 'Comic Sans MS';background-color:#ffcc00;opacity:0.9;width:30%;height:auto">
                    <asp:Table ID="Table1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>Bus Name&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                                <asp:Label ID="BusName" runat="server" Font-Size="Large" Font-Names="Cursive" Text="Bus Name" ForeColor="Blue"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Bus ID&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                                <asp:Label ID="BusID" runat="server" Font-Size="Large" Font-Names="Cursive" Text="Bus ID" ForeColor="Blue"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Journey Date&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                                <asp:Label ID="JourneyDate" runat="server" Font-Size="Large" Font-Names="Cursive" Text="Journey Date" ForeColor="Blue"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Departure Time&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                                <asp:Label ID="DepartureTime" runat="server" Font-Size="Large" Font-Names="Cursive" Text="Departure Time" ForeColor="Blue"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Arrival Time&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                                <asp:Label ID="ArrivalTime" runat="server" Font-Size="Large" Font-Names="Cursive" Text="Arrival Time" ForeColor="Blue"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Alloted Seats&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                                <asp:Label ID="AllotedSeats" runat="server" Font-Size="Large" Font-Names="Cursive" Text="Alloted Seats" ForeColor="Blue"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Seats Count&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                                <asp:Label ID="SeatsCount" runat="server" Font-Size="Large" Font-Names="Cursive" Text="Seats Count" ForeColor="Blue"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Price&nbsp;&nbsp;&nbsp;</asp:TableCell><asp:TableCell>
                                <asp:Label ID="Price" runat="server" Font-Size="Large" Font-Names="Cursive" Text="Price" ForeColor="Blue"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2"><center><div style="color:red"><b>Passenger Details</b></div></center></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2"><center><div>
                                <asp:ListView ID="PassengerList" runat="server">
                                    <ItemTemplate>
                                        <div style="padding: 5px; border: 1px solid #ccc; margin-bottom: 5px;background-color:burlywood">
                                            <center>
                                                <table>
                                                    <tr>
                                                        <td style="color: black; width: 15%"><b>Name</b></td>
                                                        <td style="color: blue; width: 25%">
                                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="color: black; width: 15%"><b>Age</b><br />
                                                        </td>
                                                        <td style="color: blue; width: 25%">
                                                            <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>'><br /></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </center>
                                        </div>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        No items to display.
                                    </EmptyDataTemplate>
                                </asp:ListView></div></center>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                <br />
                                <asp:Button ID="Submit" runat="server" Text="Confirm" OnClick="Submit_Click" Font-Size="Large" BackColor="Black" ForeColor="WhiteSmoke" BorderColor="WhiteSmoke" Width="100" Height="35" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </center>
        </div>
    </form>
</body>
</html>