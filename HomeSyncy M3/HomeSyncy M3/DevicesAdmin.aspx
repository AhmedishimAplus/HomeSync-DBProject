<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DevicesAdmin.aspx.cs" Inherits="HomeSyncy_M3.DevicesAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Devices</title>
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
        <asp:Label ID="Label1" runat="server" Text="Device page Admin:" Font-Size="Large" ></asp:Label>
            
        <div >

            <asp:Button ID="Button1" runat="server" OnClick="DeviceCharge" Text="Device Charge"  />
             <asp:Button ID="Button2" runat="server" OnClick="AddDevice1" Text="Add Device" />
             <asp:Button ID="Button3" runat="server" OnClick="FindBattery1" Text="Find Out Of Battery Devices" />
            <asp:Button ID="Button4" runat="server" OnClick="ChangeStatus1" Text="Change Status To Charging" Width="177px" />
            <asp:Button ID="Button5" runat="server" OnClick="Rooms1" Text="Rooms" Width="57px" />
            <asp:Button ID="Button6" runat="server" OnClick="Back" Text="View Page" Width="96px" />
           
            </br>
             <asp:Label ID="MessageID" runat="server" Text=""></asp:Label>
             <br />
            </div>
             </br>
           
               
       <!-- 
             <p id="paragrapgh">this is the Device page as a user you are allowed to to view charge of a particular device
     if you select Device charge Buttons it will take you to another webpage where you type id of the device you want
     to know its battery percentage. Add button allows you to add a device to a room and input it's battery status very simple.Find Out Of Battery Devices
     once clicked it takes you to a seperate webpage where you can can see the devices which ran out of battery along with their room Id.
     Change Status to charging from it's name it charges all out of battery devices. and finally Rooms once clicked You can see the location where
     it has more than two devices out of charge.
 </p> 
           -->
        </div>
    </form>
    <!--- styles--->
    <Styles>
        
    
    </styles>
</body>
</html>
