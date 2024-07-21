<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADDREM.aspx.cs" Inherits="HomeSyncy_M3.ADDREM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Please Enter task ID in first TextBox"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
              <asp:Label ID="Label2" runat="server" Text="Please add Reminder"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Add" />
             <asp:Label ID="Exception" runat="server" Text=""></asp:Label>

        </div>
    </form>
</body>
</html>
