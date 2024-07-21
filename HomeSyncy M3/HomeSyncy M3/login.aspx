<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HomeSyncy_M3.login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="yy.css">
    <title>ABDO</title>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="form-box">
                <div class="form-value">
                    <h2>login</h2>
                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="email" id="Email" runat="server" required />
                        <label for="Email">Email</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" id="Password" runat="server" required />
                        <label for="Password">Password</label>
                    </div>
                   
                    <button id="LoginButton" runat="server" onserverclick="LoginButton_ServerClick">Log in</button>
                    <div class="register">
                        <p>No Account Yet? <a href='#' id="SignUpLink" runat="server" onserverclick="SignUpButton_ServerClick">Register Now</a></p>
                    </div>
                </div>
            </div>
        </section>
    </form>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>