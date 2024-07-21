<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TasksAdmin.aspx.cs" Inherits="HomeSyncy_M3.TasksAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="viewButton" runat="server" Text="ViewMytasks" OnClick="viewButton_Click" />
            <asp:Button ID="Status" runat="server" Text="ViewStatus" OnClick="Status_Click" />
            <asp:Button ID="Addreminder" runat="server" Text="Add Reminder" OnClick="Addreminder_Click" />
            <asp:Button ID="Update" runat="server" Text="Update Deadline" OnClick="Update_Click" />

            <asp:Button ID="back" runat="server" Text="Home" OnClick="back_Click" />

        </div>
    </form>
</body>
</html>
