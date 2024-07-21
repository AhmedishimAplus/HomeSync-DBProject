<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="HomeSyncy_M3.ViewProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <style>
        /* Centering profile details */
        #profile-container {
            text-align: center;
            margin-top: 20px; /* Adjust as needed */
        }
    </style>
</head>
<body>
    <!-- Your ASPX content here -->
    <form id="form1" runat="server">
        <div id="buttonContainer">
            <asp:Button ID="btnRooms" runat="server" OnClick="RoomsButton" Text="Rooms"  />
            <asp:Button ID="btnTasks" runat="server" OnClick="TasksButton_Click" Text="Tasks"  />
            <asp:Button ID="btnDevices" runat="server" OnClick="DevicesButton" Text="Devices"  />
            <asp:Button ID="btnEvents" runat="server" OnClick="EventsButton" Text="Events"  />
            <asp:Button ID="guestsetter1" runat="server" OnClick="guestsetter" Text="setNumberofguest"  />
            <asp:Button ID="guestget1" runat="server" OnClick="guestgetter" Text="number of guests now"  />
            <asp:Button ID="deleteaguest1" runat="server" OnClick="guestDeleter" Text="delete a guest"  />


        </div>
        <div id="profile-container">
            <!-- Profile details will be dynamically added here -->
        </div>
    </form>
    <style>

#buttonContainer{
    text-align:center;
   
}
 {
  

  
}


</style>
    <div class="wave"></div>
    <div class="wave"></div>
    <div class="wave"></div>
    
    
</body>
</html>

