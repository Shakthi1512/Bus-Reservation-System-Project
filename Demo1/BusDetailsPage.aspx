<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusDetailsPage.aspx.cs" Inherits="Demo1.BusDetailsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bus Details</title>
    <link href="Css/CustomStyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
                <div style="background-color:blueviolet;height:auto">
                    <asp:Label ID="JourneyDate" runat="server" Font-Size="X-Large" ForeColor="WhiteSmoke" Text="Date"></asp:Label>
                </div><br />
                <div>
                    <asp:ListView ID="BusList" runat="server" DataKeyNames="ID" OnItemCommand="BusList_ItemCommand">
                        <ItemTemplate>
                            <asp:LinkButton EnableViewState="false" Width="50%" ID="lnkSelect" runat="server" CssClass="noUnderline" CommandName="Select" CommandArgument='<%# Eval("ID") %>'>
                                <div style="padding: 5px; border: 1px solid #ccc; margin-bottom: 5px;">
                                    <center><table style="background-color:white;width:100%">
                                        <tr>
                                            <td style="width: 20%;height:5%">
                                                <asp:Label ID="lblName" runat="server" Font-Bold="true" Font-Size="Larger" ForeColor="Black" Text='<%# Eval("Name") %>'></asp:Label></td>
                                            <td></td>
                                            <td style="width: 20%">
                                                <asp:Label ID="lblPrice" runat="server" Font-Bold="true" Font-Size="Larger" ForeColor="Red" Text='<%# "₹ "+Eval("Price").ToString() %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblDepartureTime" runat="server" ForeColor="Black" Text='<%# Eval("DepartureTime") %>'></asp:Label></td>
                                            <td>
                                                <center><h5><asp:Label ID="lblDistance" runat="server" ForeColor="Gray" Text='<%# Eval("Distance") + " KM" %>'></asp:Label>

                                                <div class="line"></div>
                                                    <asp:Label ID="lblVia" runat="server" ForeColor="Gray" Text='<%# "Via : " + Eval("Via") %>'></asp:Label>
                                                </h5></center>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblArrivalTime" runat="server" ForeColor="Black" Text='<%# Eval("ArrivalTime") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Font-Bold="true" Text='<%# Eval("ID") %>'></asp:Label></td>
                                            <td></td>
                                            <td>
                                                <asp:Label ID="lblSeatCount" runat="server" CssClass="center-align" BackColor="Blue" ForeColor="WhiteSmoke" Font-Size="Large" Width="80%" Height="100%" Text='<%# Eval("SeatCount") + " seats" %>'></asp:Label></td>
                                        </tr>
                                    </table></center>
                                </div>
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            No items to display.
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
                <br />
            </div>
        </center>
    </form>
</body>
</html>