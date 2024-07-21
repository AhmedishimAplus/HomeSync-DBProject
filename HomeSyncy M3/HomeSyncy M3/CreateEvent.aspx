<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="HomeSyncy_M3.CreateEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set Room Schedule</title>
    <style>
        body {
            background-image: url('cal.jpg'); /* Replace with your image path */
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
            margin: 0 10px;
            height: 35px;
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
             EventID:
 <p>
     <asp:TextBox ID="Event" runat="server"></asp:TextBox>
 </p>
           
            <p>
                Reminder date:
            </p>
            <p>
                <asp:TextBox ID="Reminder" runat="server"></asp:TextBox>
            </p>
           
            <p>
                Location:
            </p>
            <p>
                <asp:TextBox ID="Location" runat="server"></asp:TextBox>
            </p>
                Description:
</p>
<p>
    <asp:TextBox ID="Description" runat="server"></asp:TextBox>
</p>
            <p>
    Other user:
</p>
<p>
    <asp:TextBox ID="other" runat="server"></asp:TextBox>
</p>
            <p>
    Name:
</p>
<p>
    <asp:TextBox ID="Name" runat="server"></asp:TextBox>
</p>
            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="SubmitButton_Click" Width="116px" />
        </div>
        <asp:Label ID="InsertionLabel" runat="server" Text="" CssClass="insertion-message"></asp:Label>
        <div class="button-group">
            <asp:Button ID="Button7" runat="server" Text="Event Settings" OnClick="EventButton" CssClass="button-styled" />
            <asp:Button ID="Button6" runat="server" Text="Home" OnClick="Home" CssClass="button-styled" />
        </div>
    </form>
</body>
</html>