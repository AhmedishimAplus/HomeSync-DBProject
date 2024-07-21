<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomsUser.aspx.cs" Inherits="HomeSyncy_M3.RoomsUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <style>
       body {
    background-image: url('sea.jpg'); /* Replace with your image path */
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
        <div>
            <asp:Button ID="Button1" runat="server" OnClick="BookRoomButton" style="z-index: 1; left: 10px; top: 15px; position: absolute; width: 183px" Text="BookRoom" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" OnClick="ViewAssignButton" style="z-index: 1; left: 238px; top: 15px; position: absolute; width: 186px; margin-bottom: 0px" Text="View Assigned Room" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button6" runat="server" style="z-index: 1; left: 475px; top: 17px; position: absolute; width: 203px" Text="Home" OnClick="Home" />

        </div>
    </form>
</body>
</html>
