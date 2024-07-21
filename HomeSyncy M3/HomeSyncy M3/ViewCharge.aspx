<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCharge.aspx.cs" Inherits="HomeSyncy_M3.ViewCharge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Device Charge</title>
           <style>
       body {
    background-image: url('mainDevices.jpg'); /* Replace with your image path */
    
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
<body >
    <form id="form1" runat="server">
 <div class="container">

            Enter DeviceID:<br />
            <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Check" />

            <asp:Button ID="Button2" runat="server" Text="Go Back" OnClick="Button2_Click" />
      <p>
     <asp:Label ID="Label1" runat="server" Text="Message: "></asp:Label>
 </p>
        </div>
       
       
    </form>
</body>
</html>
