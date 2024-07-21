<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventsUser.aspx.cs" Inherits="HomeSyncy_M3.EventsUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            EVENTS</p>
        <div>
            <asp:Button ID="Create_Button1" runat="server" Text="Create" Width="111px" OnClick="Create_Button1_Click" />
            <asp:Button ID="Assign_Button2" runat="server" Text="Assign" Width="111px" OnClick="Assign_Button2_Click" />
            <asp:Button ID="View_Button4" runat="server" Text="view" Width="111px" OnClick="View_Button4_Click" />
            <asp:Button ID="Button_uninvite" runat="server" Text="Uninvite" OnClick="Button_uninvite_Click" />
            <asp:Button ID="Remove" runat="server" Text="RemoveEvent" OnClick="Remove_Click" />
        </div>
    </form>
</body>
</html>