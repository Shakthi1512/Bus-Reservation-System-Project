<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllotSeatNumber.aspx.cs" Inherits="Demo1.AllotSeatNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lock Seats</title>
    <link href="Css/CustomStyles.css" rel="stylesheet" />
</head>
<body style="background-image:url(Images/b3.png); background-size:cover; background-repeat: no-repeat;">
    <center>
        <form id="form1" runat="server" style="font-size: xx-large;opacity:0.9">
            <div style="background-color: blueviolet; width: 100%">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 90%; padding-top: 3px;" colspan="9">
                            <center>
                                <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><asp:Label ID="BusID" runat="server" Font-Size="X-Large" ForeColor="WhiteSmoke"></asp:Label></b></div>
                            </center>
                        </td>
                        <td style="width: 5%; padding: 5px; padding-top: 0px">
                            <asp:Button ID="Next" runat="server" Text="Next >" OnClick="Next_Click" Font-Size="Medium" BackColor="Black" ForeColor="WhiteSmoke" BorderColor="WhiteSmoke" Width="75" Height="35" /></td>
                    </tr>
                </table>
            </div><br /><br />
            <div style="width: 100%;color:whitesmoke;font-size:x-small">
                <table border="1" style="border-color:lightgray;background-color:midnightblue">
                    <tr>
                        <td style="padding:5px;width:fit-content"><center><asp:Button runat="server" Enabled="false" Height="35" Width="35" BackColor="LightGray" /></center></td>
                        <td style="padding:5px;width:fit-content"><center><asp:Button runat="server" Enabled="false" Height="35" Width="35" BackColor="Green" /></center></td>
                        <td style="padding:5px;width:fit-content"><center><asp:Button runat="server" Enabled="false" Height="35" Width="35" BackColor="Blue" /></center></td>
                        <td style="padding:5px;width:fit-content"><center><asp:Button runat="server" Enabled="false" Height="35" Width="35" BackColor="LightSalmon" /></center></td>
                        <td style="padding:5px;width:fit-content"><center><asp:Button runat="server" Enabled="false" Height="35" Width="35" BackColor="BlueViolet" /></center></td>
                        <td style="padding:5px;width:fit-content"><center><asp:Button runat="server" Enabled="false" Height="35" Width="35" BackColor="LightPink" /></center></td>
                        <td style="padding:5px;width:fit-content"><center><asp:Button runat="server" Enabled="false" Height="35" Width="35" BackColor="DeepPink" /></center></td>
                    </tr>
                    <tr>
                        <td style="padding:5px;width:fit-content"><div><center><asp:Label runat="server" Text="Empty Seat" Enabled="false" /></center></div></td>
                        <td style="padding:5px;width:fit-content"><div><center><asp:Label runat="server" Text="Selected Seat" Enabled="false" /></center></div></td>
                        <td style="padding:5px;width:fit-content"><div><center><asp:Label runat="server" Text="Blocked Seat" Enabled="false" /></center></div></td>
                        <td style="padding:5px;width:fit-content"><div><center><asp:Label runat="server" Text="Physically<br/> Challenged<br/> Seat" Enabled="false" /></center></div></td>
                        <td style="padding:5px;width:fit-content"><div><center><asp:Label runat="server" Text="Physically<br/> Challenged<br/> Blocked Seat" Enabled="false" /></center></div></td>
                        <td style="padding:5px;width:fit-content"><div><center><asp:Label runat="server" Text="Availabe<br/> Ladies Seat" Enabled="false" /></center></div></td>
                        <td style="padding:5px;width:fit-content"><div><center><asp:Label runat="server" Text="Blocked<br/> Ladies Seat" Enabled="false" /></center></div></td>
                    </tr>
                </table>
            </div>
            <br />
        </form>
    </center>
</body>
</html>
