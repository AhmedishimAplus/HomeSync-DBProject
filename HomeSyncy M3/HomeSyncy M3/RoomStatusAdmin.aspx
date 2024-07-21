<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomStatusAdmin.aspx.cs" Inherits="HomeSyncy_M3.RoomStatusAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Room Status</title>
    <style>
        body {
            background-image: url('status.jpg'); /* Replace with your image path */
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
    <form id="form1" runat="server" class="container centered-content">
        <div class="top-right">
            <asp:Button ID="Button6" runat="server" Text="Room Settings" OnClick="RoomSettings" CssClass="button-styled" />
            <asp:Button ID="Button1" runat="server" Text="Home" OnClick="Home" CssClass="button-styled" />
        </div>

        <div class="form-section">
            <h2>Room Status Admin</h2>
            <p>Please enter the location of the room and the status you want to set.</p>
            
            <div class="input-group">
                <label for="LocationTextBox">Location (RoomID):</label>
                <asp:TextBox runat="server" ID="LocationTextBox" CssClass="button-styled"></asp:TextBox>
            </div>

            <div class="input-group">
                <label for="StatusTextBox">Status:</label>
                <asp:TextBox runat="server" ID="StatusTextBox" CssClass="button-styled"></asp:TextBox>
            </div>

            <div class="button-group">
                <asp:Button runat="server" ID="SubmitButton" OnClick="SubmitButton_Click" Text="Submit" CssClass="button-styled" />
                <asp:Label ID="InsertionLabel" runat="server" Text="" CssClass="insertion-message"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
