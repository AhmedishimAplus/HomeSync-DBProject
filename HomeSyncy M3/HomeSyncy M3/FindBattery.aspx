<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FindBattery.aspx.cs" Inherits="HomeSyncy_M3.FindBattery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>i am tired</title>
               <style>
       body {
    background-image: url('charge3.jpg'); /* Replace with your image path */
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
        <div id="firstdiv">

            <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" />
             <asp:Button ID="Button2" runat="server" Text="Home" OnClick="Button2_Click" />
            </br>
             <asp:Label ID="Label1" runat="server" Text="Locations:"></asp:Label>
        </div >
             </div>
        
       
    </form>
</body>
</html>
