<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewMyTasks.aspx.cs" Inherits="HomeSyncy_M3.ViewMyTasks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Label ID="Label1" runat="server" Text="Label" ></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Finish tasks" OnClick="FinishMethod"></asp:Button>
        <asp:TextBox ID="TaskName" runat="server" ></asp:TextBox>
          
         <asp:Label ID="Label2" runat="server" Text="Label" ></asp:Label>
        
    </form>
</body>
</html>