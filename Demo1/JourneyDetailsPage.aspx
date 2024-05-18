<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JourneyDetailsPage.aspx.cs" Inherits="Demo1.BookTicketPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JourneyDetails</title>
</head>
<body style="background-image:url(Images/b3.png); background-size:cover; background-repeat: no-repeat; color:whitesmoke">
    <form id="form1" runat="server">
        <center>
            <div style="margin-top:100px;background-color:blueviolet;opacity:0.9;width:35%">
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <center><div>
                                <asp:DropDownList ID="FromPlace" runat="server" Width="200" Height="35" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff">
                                    <asp:ListItem Text="Select Source" Value="-1" />
                                </asp:DropDownList>
                            </div></center>
                        </asp:TableCell>
                        <asp:TableCell>
                            <center><div>
                                <asp:DropDownList ID="ToPlace" runat="server" Width="200" Height="35" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff">
                                    <asp:ListItem Text="Select Destination" Value="-1" />
                                </asp:DropDownList>
                            </div></center>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <center>
                                <div>
                                    <asp:Label ID="JourneyDate" runat="server"></asp:Label><br />
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                        BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                        ForeColor="#663399" ShowGridLines="True" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged"
                                        OnVisibleMonthChanged="Calendar1_VisibleMonthChanged">
                                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                        <SelectorStyle BackColor="#FFCC66" />
                                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                        <OtherMonthDayStyle ForeColor="#CC9966" />
                                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                    </asp:Calendar>
                                    <br />
                                    <b></b>
                                </div>
                            </center>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <div>
                                <div>Male Adult&nbsp;&nbsp;&nbsp;</div>
                                <center><div>
                                    <asp:TextBox ID="MaleAdultCount" runat="server" Width="60" Height="35" TextMode="Number" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revInput1" runat="server" ControlToValidate="MaleAdultCount" ErrorMessage="Please enter a positive integer." ValidationExpression="^\d*[1-9]\d*$" />
                                </div>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div>
                                <div>Female Adult&nbsp;&nbsp;&nbsp;</div>
                                <div>
                                    <asp:TextBox ID="FemaleAdultCount" runat="server" Width="60" Height="35" TextMode="Number" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revInput2" runat="server" ControlToValidate="FemaleAdultCount" ErrorMessage="Please enter a positive integer." ValidationExpression="^\d*[1-9]\d*$" />
                                </div>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <div>
                                <div>Child Male&nbsp;&nbsp;&nbsp;</div>
                                <div>
                                    <asp:TextBox ID="ChildMaleCount" runat="server" Width="60" Height="35" TextMode="Number" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revInput3" runat="server" ControlToValidate="ChildMaleCount" ErrorMessage="Please enter a positive integer." ValidationExpression="^\d*[1-9]\d*$" />
                                </div>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <div>
                                <div>Child Female&nbsp;&nbsp;&nbsp;</div>
                                <div>
                                    <asp:TextBox ID="ChildFemaleCount" runat="server" Width="60" Height="35" TextMode="Number" Font-Size="Large" Font-Names="Cursive" BorderColor="#3399ff" BorderWidth="3" BackColor="#ccffff"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revInput4" runat="server" ControlToValidate="ChildFemaleCount" ErrorMessage="Please enter a positive integer." ValidationExpression="^\d*[1-9]\d*$" />
                                </div>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <center>
                                <div>
                                    <asp:Button ID="Search" runat="server" OnClick="Search_Click" Text="SEARCH" Font-Size="Medium" BackColor="Black" ForeColor="WhiteSmoke" BorderColor="WhiteSmoke" Width="100" Height="35" />
                                </div>
                            </center>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </center>
    </form>
</body>
</html>
