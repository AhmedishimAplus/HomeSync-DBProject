<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DevicesUser.aspx.cs" Inherits="HomeSyncy_M3.DevicesUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Devices</title>
           <style>
       body {
    background-image: url('devices3.jpg'); /* Replace with your image path */
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
        <asp:Label  ID="Label1" runat="server" Text="Device page Guest:" Font-Size="Large"></asp:Label>
<div >

    <asp:Button ID="Button1" runat="server" OnClick="DeviceCharge" Text="Device Charge" Width="141px"  />
     <asp:Button ID="Button6" runat="server" OnClick="Back" Text="View Page" Width="140px" />
</div>
    </form>
</body>
</html>
