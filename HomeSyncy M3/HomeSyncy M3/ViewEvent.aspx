<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEvent.aspx.cs" Inherits="HomeSyncy_M3.ViewEvents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         
     
     <asp:Label ID="Label1" runat="server" Text="Label" ></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="one" runat="server" Text="Check" OnClick="one_Click" />
        </br>
         <asp:Button ID="Button1" runat="server" Text="Back" OnClick="two_Click" />
        <asp:Button ID="Button2" runat="server" Text="Home" OnClick="three_Click" />
    </form>
</body>
</html>