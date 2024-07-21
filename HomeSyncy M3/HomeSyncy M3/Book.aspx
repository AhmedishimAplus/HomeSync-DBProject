<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="HomeSyncy_M3.Book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Room Booking</title>
    <link rel="stylesheet" type="text/css" href="fofo_books.css" />
   <style>
    .transparent-container {
        background-color: rgba(255, 255, 255, 0.7);
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 10px; /* Add margin-bottom to create space between containers */
        float: left;
        clear: left; /* Ensure that the next container starts below the previous one */
    }
</style>


</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Label ID="Label1" runat="server" Text="Please enter which room you wanna book"></asp:Label>
            <div style="text-align: right;">
                <asp:Button ID="Button7" runat="server" style="width: 230px; margin-right: 10px;" Text="Rooms Settings" OnClick="RoomSettings" />
                <asp:Button ID="Button6" runat="server" style="width: 203px" Text="Home" OnClick="Home" />
            </div>
            <br />
            RoomID:
            <p>
                <asp:TextBox ID="RoomIDBox" runat="server"></asp:TextBox>
            </p>
            <asp:Button ID="submit" runat="server" Text="Book" OnClick="BookButton" Width="116px" />
            <asp:Label ID="SuccessLabel" runat="server" ForeColor="Green"></asp:Label>
            <asp:Label ID="FailureLabel" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
