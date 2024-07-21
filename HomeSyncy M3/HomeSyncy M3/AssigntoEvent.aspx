<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssigntoEvent.aspx.cs" Inherits="HomeSyncy_M3.AssigntoEvent" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assign User to Event</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Assign User to Event</h2>

            <label>Event ID:</label>
            <asp:TextBox ID="event_id" runat="server" CssClass="form-control"></asp:TextBox>

            <label>User ID:</label>
            <asp:TextBox ID="user_id" runat="server" CssClass="form-control"></asp:TextBox>

            <asp:Button ID="assignButton" runat="server" Text="Assign User" OnClick="SendButton" CssClass="btn btn-primary" />
            <asp:Button ID="homeButton" runat="server" Text="Go Home" OnClick="Home" CssClass="btn btn-secondary" />

            <div>
                <asp:Literal ID="resultMessage" runat="server" EnableViewState="False"></asp:Literal>
            </div>
        </div>
    </form>
</body>
</html>