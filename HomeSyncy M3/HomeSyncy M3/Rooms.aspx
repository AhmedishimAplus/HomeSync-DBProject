<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="HomeSyncy_M3.Rooms" EnableViewState="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rooms</title>
   <style>
       body {
    background-image: url('sea.jpg'); /* Replace with your image path */
    background-size: cover;
    background-position: center;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
}

       .container {
           text-align: center;
           background-color: rgba(255, 255, 255, 0.8); /* Adjust background color and opacity as needed */
           padding: 20px;
           border-radius: 10px;
       }

   </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Button ID="Button1" runat="server" style="height: 37px; width: 188px" Text="Book Room" OnClick="BookRoomButton" />
            <asp:Button ID="Button2" runat="server" Text="View Assigned Room" OnClick="ViewAssignedRoom" Height="33px" />
            <asp:Button ID="Button4" runat="server" OnClick="ChangeStatus" style="width: 240px" Text="Change status" />
            <asp:Button ID="Button5" runat="server" style="width: 237px" Text="View Unused Rooms" OnClick="Button5_Click" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" style="width: 235px" Text="Create Schedule" />
            <asp:Button ID="Button6" runat="server" style="width: 203px" Text="Home" OnClick="Home" />
        </div>
    </form>
</body>
</html>
