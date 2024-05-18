<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Demo1.WelcomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
</head>
<body style="background-color: blueviolet">
    <form id="form1" runat="server">
        <center>
            <div style="align-self: auto; padding-top: 5%; font-size: 125%; font-family: 'Comic Sans MS'">
                <asp:Table ID="Table1" runat="server" BackColor="#cc33ff" CellSpacing="3" CellPadding="3">
                    <asp:TableRow BackColor="DarkViolet">
                        <asp:TableCell Height="100" Width="100" BorderStyle="Dotted" BorderColor="WhiteSmoke">
                            <center>
                                <div style="font-size: 10px; color: whitesmoke; box-shadow: inset; text-shadow: initial">
                                    <asp:ImageButton ID="BookTktImgBtn" runat="server" ImageUrl="~/Images/book.png" Width="80" Height="80" OnClick="BookTktImgBtn_Click" />
                                    Book Ticket
                                </div>
                            </center>
                        </asp:TableCell>
                        <asp:TableCell Height="100" Width="100" BorderStyle="Dotted" BorderColor="WhiteSmoke">
                            <center>
                                <div style="font-size: 10px; color: whitesmoke; box-shadow: inset; text-shadow: initial">
                                    <asp:ImageButton ID="CancelTktImgBtn" runat="server" ImageUrl="~/Images/cancel.png" Width="80" Height="80" OnClick="CancelTktImgBtn_Click" />
                                    Cancel Ticket
                                </div>
                            </center>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow BackColor="DarkViolet">
                        <asp:TableCell Height="100" Width="100" BorderStyle="Dotted" BorderColor="WhiteSmoke">
                            <center>
                                <div style="font-size: 10px; color: whitesmoke; box-shadow: inset; text-shadow: initial">
                                    <asp:ImageButton ID="ViewTktImgBtn" runat="server" ImageUrl="~/Images/tickets.png" Width="80" Height="80" OnClick="ViewTktImgBtn_Click" />
                                    View Tickets
                                </div>
                            </center>
                        </asp:TableCell>
                        <asp:TableCell Height="100" Width="100" BorderStyle="Dotted" BorderColor="WhiteSmoke">
                            <center>
                                <div style="font-size: 10px; color: whitesmoke; box-shadow: inset; text-shadow: initial">
                                    <asp:ImageButton ID="ViewTktStsImgBtn" runat="server" ImageUrl="~/Images/ticket_status.png" Width="80" Height="80" OnClick="ViewTktStsImgBtn_Click" />
                                    View Ticket Status
                                </div>
                            </center>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow BackColor="DarkViolet">
                        <asp:TableCell Height="100" Width="100" ColumnSpan="2" BorderStyle="Dotted" BorderColor="WhiteSmoke">
                            <center>
                                <div style="font-size: 10px; color: whitesmoke; box-shadow: inset; text-shadow: initial">
                                    <asp:ImageButton ID="ViewProfileImgBtn" runat="server" ImageUrl="~/Images/profile.png" Width="80" Height="80" OnClick="ViewProfileImgBtn_Click" />
                                    <br />View Profile
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
