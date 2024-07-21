<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStatus.aspx.cs" Inherits="HomeSyncy_M3.ViewStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Insert Task ID"></asp:Label>
            <asp:TextBox ID="InsertID" runat="server"></asp:TextBox>
            <asp:Button ID="Status" runat="server" Text="View Status" OnClick="ViewingStatus" />
             <asp:Label ID="Exception" runat="server" Text=""></asp:Label>

        </div>
    </form>
</body>
</html>
