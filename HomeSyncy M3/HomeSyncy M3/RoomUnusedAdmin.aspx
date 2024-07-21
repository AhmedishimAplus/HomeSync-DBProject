<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomUnusedAdmin.aspx.cs" Inherits="HomeSyncy_M3.RoomUnusedAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unused Rooms</title>
    <style>
    body {
        background-image: url('unused.jpg'); /* Replace with your image path */
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif;
    }

    .container {
        text-align: center;
        background-color: rgba(255, 255, 255, 0.8); /* Adjust background color and opacity as needed */
        padding: 20px;
        border-radius: 10px;
        position: relative;
    }

    .centered-content {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .form-section {
        margin-top: 20px;
    }

    .input-group {
        margin-bottom: 10px;
    }

    .button-group {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }

    .insertion-message {
        color: green;
        font-weight: bold;
        margin-top: 10px;
    }

    /* Style the buttons */
    .button-styled {
        width: 203px;
    }

    /* Move buttons to top right */
    .top-right {
        position: absolute;
        top: 20px;
        right: 20px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>Unused Rooms:                    <asp:Button ID="Button6" runat="server" style="z-index: 1; left: 641px; top: 15px; position: absolute; width: 203px" Text="RoomSettings" OnClick="RoomSettings" />
                                                               <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 409px; top: 13px; position: absolute; width: 203px" Text="Home" OnClick="Home" />

        </div>
    </form>
</body>
</html>
