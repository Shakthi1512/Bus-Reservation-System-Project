<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTicketPage.aspx.cs" Inherits="Demo1.ViewTicketPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tickets</title>
    <link href="Css/CustomStyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
                <asp:ListView ID="TicketList" runat="server" DataKeyNames="ReservationID" OnItemCommand="TicketList_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton BackColor="#ffcc00" EnableViewState="false" ID="lnkSelect" runat="server" Width="50%" CssClass="noUnderline" CommandName="Select" CommandArgument='<%# Eval("ReservationID") %>'>
                            <div style="padding: 5px; border: 1px solid #ccc; margin-bottom: 5px;">
                                <center>
                                    <table>
                                        <tr>
                                            <td style="width: 25%; font-size: x-large; color: black">Ticket ID</td>
                                            <td style="width: 50%">
                                                <asp:Label ID="lblReservationID" runat="server" Font-Bold="true" Font-Size="X-Large" ForeColor="Red" Text='<%# Eval("ReservationID") %>'></asp:Label></td>
                                            <td style="width: 25%">
                                                <asp:Label ID="lblBusID" runat="server" Font-Bold="true" ForeColor="#3333cc" Text='<%# Eval("BusID") %>'></asp:Label>
                                                <br />
                                                <asp:Label ID="lblBusName" runat="server" Font-Bold="true" ForeColor="#3333cc" Text='<%# Eval("BusName") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <center>
                                                    <div>
                                                        <asp:Label ID="lblSource" ForeColor="Black" runat="server" Text='<%# Eval("Source") %>'></asp:Label><br />
                                                        <asp:Label ID="lblDepartureTime" runat="server" ForeColor="Black" Text='<%# Eval("DepartureTime") %>'></asp:Label>
                                                    </div>
                                                </center>
                                            </td>
                                            <td>
                                                <center>
                                                    <h5>
                                                        <asp:Label ID="lblJourneyDate" ForeColor="Gray" runat="server" Text='<%# Eval("JourneyDate") %>'></asp:Label>

                                                        <div class="line"></div>
                                                        <asp:Label ID="lblDistance" runat="server" ForeColor="Gray" Text='<%# Eval("Destination") + " KM" %>'></asp:Label>
                                                    </h5>
                                                </center>
                                            </td>
                                            <td>
                                                <center>
                                                    <div>
                                                        <asp:Label ID="lblDestination" ForeColor="Black" runat="server" Text='<%# Eval("Destination") %>'></asp:Label><br />
                                                        <asp:Label ID="lblArrivalTime" runat="server" ForeColor="Black" Text='<%# Eval("ArrivalTime") %>'></asp:Label>
                                                    </div>
                                                </center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <center>
                                                    <div style="font-size: medium; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
                                                        <b>No. of Seats&nbsp;&nbsp;&nbsp;</b>

                                                        <asp:Label ID="lblSeatCount" runat="server" CssClass="center-align" BackColor="Blue" ForeColor="WhiteSmoke" Font-Size="Large" Width="30%" Height="100%" Text='<%# Eval("SeatCount") + " seats" %>'></asp:Label>
                                                    </div>
                                                </center>
                                            </td>
                                        </tr>
                                    </table>
                                </center>
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        No items to display.
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </center>
    </form>
</body>
</html>
