<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomScheduleAdmin.aspx.cs" Inherits="HomeSyncy_M3.RoomSchedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set Room Schedule</title>
    <style>
        body {
            background-image: url('set2.jpg'); /* Replace with your image path */
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
            justify-content: center;
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
            margin: 0 10px; /* Add margin between buttons if needed */
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
        <div>
            <asp:Label ID="Label1" runat="server" Text="Enter Schedule details "></asp:Label>
            <br />
            RoomID:
            <p>
                <asp:TextBox ID="RoomID" runat="server"></asp:TextBox>
            </p>
            <p>
                StartTime:
            </p>
            <p>
                <asp:TextBox ID="Start" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            </p>
            <p>
                EndTime:
            </p>
            <p>
                <asp:TextBox ID="End" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            </p>
            <p>
                Action:
            </p>
            <p>
                <asp:TextBox ID="Action" runat="server"></asp:TextBox>
            </p>
            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="SubmitButton_Click" Width="116px" />
        </div>
        <asp:Label ID="InsertionLabel" runat="server" Text="" CssClass="insertion-message"></asp:Label>
        <div class="button-group">
            <asp:Button ID="Button7" runat="server" Text="RoomSettings" OnClick="RoomSettings" CssClass="button-styled" />
            <asp:Button ID="Button6" runat="server" Text="Home" OnClick="Home" CssClass="button-styled" />
        </div>
    </form>
</body>
</html>
