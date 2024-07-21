<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestDel.aspx.cs" Inherits="HomeSyncy_M3.GuestDel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="topright">

             <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="homebutton.jpg" OnClick="back_Click1" />
        </div>
        <div id="LOL">
            <asp:Label ID="Label1" runat="server" Text="Please EnterId"></asp:Label>
             </br>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </br>
             </br>
             
            <asp:Button ID="removegees" runat="server" Text="Remove" OnClick="removegees_Click1" />
           <!-- <asp:Button ID="back" runat="server" Text="back" OnClick="back_Click1" />-->
             </br>
            <asp:Label ID="MessageID" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
    <style>
        #removegees {
            background-color:black;
            width:90px;
            height:50px;
               font-size:20px;
               border-radius: 10px;
               color:white;
        }
            #removegees:hover {
                background-color:red;
            }
         #back {
     background-color:black;
     width:90px;
     height:50px;
        font-size:20px;
        border-radius: 10px;
        color:white;
        font-style:Sans-serif;
 }
     #back:hover {
         background-color:beige;
         color:black
     }
        #TextBox1 {
        background-color:beige;
        color:black;
      
        text-align:center
        
        }
        #Label1 {
        font-size:20px;
        
        }
        #LOL{
            text-align:center;
            background-color:beige;
            text-align: center; 
   vertical-align: middle;
   border: solid;
   border-color:black;
   margin-top: 50px;
   margin-left:800px;
   margin-Right:800px;
   border-radius: 20px;
        }
         body {
      
      background-image: url('5235.jpg');  
      background-size: cover; 
      background-repeat: no-repeat; 
      
     }
        #topright {
        text-align:right;
        }
        #ImageButton1 {
        height:20px;
        width:20px
        }
    </style>
</body>
</html>
