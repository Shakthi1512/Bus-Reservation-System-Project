<%@ Page Language="C#" EnableViewState="true" AutoEventWireup="true" CodeBehind="CancelTicketPage.aspx.cs" Inherits="Demo1.CancelTicketPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cancel Passengers</title>
    <link href="Css/CustomStyles.css" rel="stylesheet" />
</head>
<body style="background-image:url(Images/b3.png); background-size:cover; background-repeat: no-repeat;">
    <form id="form1" runat="server">
        <div style="align-self: auto; padding-left: 21%; padding-top: 15%; font-size: 125%; font-family: 'Comic Sans MS'">
            <asp:ListView ID="PassengerList" runat="server" ItemType="Demo1.Models.Passenger" DataKeyNames="SeatNumber">
                <ItemTemplate>
                    <div style="padding: 5px; border: 1px solid #ccc; margin-bottom: 5px; background-color:#ffcc00; width:50%">
                        <center>
                            <table>
                                <tr>
                                    <td style="color:black;width:15%"><b>Name</b></td>
                                    <td style="color:blue;width:25%"><asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
                                    <td style="color:black;width:15%"><b>Age</b><br /></td>
                                    <td style="color:blue;width:25%"><asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>'><br /></asp:Label></td>
                                    <td rowspan="2"><center><div>Tricket Status<br /><asp:CheckBox ID="lblStatus" runat="server" Checked='<%# Eval("Status").ToString().Equals("1") %>' /></div></center></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td style="background-color:blue;color:whitesmoke;font-size:medium"><center><div>SEAT NUMBER</div></center></td>
                                    <td style="background-color:blue;color:whitesmoke"><center><div><b><asp:Label ID="lblSeatNumber" runat="server" Text='<%# Eval("SeatNumber") %>'></asp:Label></b></div></center></td>
                                    <td></td>
                                </tr>
                            </table>
                        </center>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    No items to display.
                </EmptyDataTemplate>
            </asp:ListView>
            <div style="width:50%">
            <center><asp:Button ID="Submit" runat="server" Text="SUBMIT" OnClick="Submit_Click" Font-Size="Medium" BackColor="Black" ForeColor="WhiteSmoke" BorderColor="WhiteSmoke" Width="75" Height="35" /></center></div>
        </div>
    </form>
</body>
</html>
