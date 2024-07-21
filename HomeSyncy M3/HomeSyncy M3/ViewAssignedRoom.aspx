<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssignedRoom.aspx.cs" Inherits="HomeSyncy_M3.ViewAssignedRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assigned Room</title>
       <style>
       body {
    background-image: url('lol.jpg'); /* Replace with your image path */
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
        <div>
            View Assigned Room Details                       <asp:Button ID="Button6" runat="server" style="z-index: 1; left: 330px; top: 20px; position: absolute; width: 203px" Text="RoomSettings" OnClick="RoomSettings" />
            <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 574px; top: 18px; position: absolute; width: 203px" Text="Home" OnClick="Home" />

</div>
    </form>
</body>
</html>