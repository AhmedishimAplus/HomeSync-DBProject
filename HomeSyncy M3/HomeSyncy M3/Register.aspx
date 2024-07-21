<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HomeSyncy_M3.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        body {
            background-image: url('home.jpg'); /* Replace with your image path */
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
            width: 400px; /* Adjust container width as needed */
        }

        /* Style the input fields and buttons */
        input[type="text"],
        input[type="password"],
        input[type="button"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
        }

        input[type="button"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #45a049;
        }

        /* Style the Back To Login button */
        #Button2 {
            margin-top: 20px;
            background-color: #3498db;
        }

        #Button2:hover {
            background-color: #2980b9;
        }

        /* Style the insertion message label */
        #insertionMessageLabel {
            color: green;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            Please enter your account details:<br />
            UserType (Admin/Guest):
            <asp:TextBox ID="userTypeBox" runat="server"></asp:TextBox>
            <br />
            Email:
            <asp:TextBox ID="emailBox" runat="server"></asp:TextBox>
            <br />
            Password:
            <asp:TextBox ID="PasswordBox" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            First Name:
            <asp:TextBox ID="FirstNameBox" runat="server"></asp:TextBox>
            <br />
            Last Name:
            <asp:TextBox ID="LastNameBox" runat="server"></asp:TextBox>
            <br />
            Birthdate:
            <asp:TextBox ID="BirthBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Sign Up" />
            <br />
            <asp:Label ID="insertionMessageLabel" runat="server" Text="" Visible="false"></asp:Label>
        </div>
        <asp:Button ID="Button2" runat="server" OnClick="login" Text="Back To Login" />
    </form>
</body>
</html>
