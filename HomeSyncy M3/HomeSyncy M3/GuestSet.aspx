<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestSet.aspx.cs" Inherits="HomeSyncy_M3.GuestSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 85px">
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Titlelabel" runat="server" Text="Please enter Number to update your allowed guests:"></asp:Label>
            </br>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></br>
            <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click"  />
            <asp:Button ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
             </br>
            <asp:Label ID="MessageID" runat="server" Text="Label"></asp:Label>
        </div>
            
            
            
    </form>
</body>
</html>