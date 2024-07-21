<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveEvent.aspx.cs" Inherits="HomeSyncy_M3.RemoveEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Label ID="Label9" runat="server" Text="Enter id of the user you want to remove"></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label10" runat="server" Text="Event id"></asp:Label>
        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="Button2" runat="server" Text="Remove" OnClick="Button2_Click" />
        </p>
        <asp:Label ID="Message1" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Message2" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Message3" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>