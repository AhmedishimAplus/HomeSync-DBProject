<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDevice.aspx.cs" Inherits="HomeSyncy_M3.AddDevice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Devices</title>

</head>
<body>
    <form id="form1" runat="server">
         <div class="container">
        <div id="border">
        
        <asp:Label ID="Label1" runat="server" Text="DeviceId:"></asp:Label>
        <p>
            <asp:TextBox ID="Idbox" runat="server"></asp:TextBox>
        </p>
        Status:<br />
        <asp:TextBox ID="Status" runat="server"></asp:TextBox>
        <br />
        In Room:<br />
        <asp:TextBox ID="RoomBox" runat="server"></asp:TextBox>
        <br />
        Type:<br />
        <asp:TextBox ID="TypeBox" runat="server"></asp:TextBox>
        <br />
        Battery:<br />
        <asp:TextBox ID="BatteryBox" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Enter" />
            <asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" />
        </p>
        <asp:Label ID="Message" runat="server" Text="Message:"></asp:Label>
            </div>
             </div>
    </form>
    <style>
    
    #Button1 {
        text-align: left;
        background-color: aqua;
        border-radius: 10px;
        font-size:50px;
    }

 
    #Button1:hover {
        
        background-color: blue;
        color:white;
        
    }
     #back {
     text-align: left;
     background-color: aqua;
     border-radius: 10px;
     font-size:50px;
      
 }

 /* Styles when mouse hovers over the element */
 #back:hover {
     
     background-color: blue;
     color:white;
     
 }
        #border {
         text-align: center; 
            vertical-align: middle;
            border: solid;
            border-color:black;
            margin-top: 50px;
            margin-left:300px;
            margin-Right:300px;
            
        }
      input[type="text"] {
             background-color: aqua;
             color:black;
        }
</style>
</body>
</html>
