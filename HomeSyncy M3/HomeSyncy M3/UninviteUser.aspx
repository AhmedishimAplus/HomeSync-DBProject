<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UninviteUser.aspx.cs" Inherits="HomeSyncy_M3.UninviteUser" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="messageid" runat="server" Text="message"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Enter id of the user you want to uninvite"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Event id"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" Text="uninvite" OnClick="Button1_Click" Width="160px" />
        </br>
         <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" Width="99px" />
               
         <asp:Button ID="Button3" runat="server" Text="Home" OnClick="Button3_Click" Width="126px" />
    </form>
</body>
</html>