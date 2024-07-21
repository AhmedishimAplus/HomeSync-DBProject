<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestGet.aspx.cs" Inherits="HomeSyncy_M3.GuestGet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="topright">

     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="homebigger.jpg" OnClick="back_Click" />
</div>
        <div id="middle">
            <asp:Label ID="MessageID" runat="server" Text="nothing"></asp:Label>
        </div>
       <!-- <asp:Button ID="back" runat="server" Text="Home" OnClick="back_Click" />-->
        <styles>

        </styles>
    </form>
        <style>




            #MessageID {
            font-size:50px;
            font-family:sans-serif;
            
            }
    

 /* Styles when mouse hovers over the element */
 #back:hover {
     
     background-color: blue;
     color:white;
     
 }
            #middle {
               text-align:center;
               border:thin;
               border-radius:20px;
               background-color:beige;
               margin-top: 200px;
               margin-left: 200px;
               margin-right: 200px
               
            }
            #topright {
            text-align:right;
            }  
            
                body {
 

    /* Replace 'image.jpg' with the path to your image */
    background-image: url('board.jpg');
    /* Optional background properties */
    background-size: cover; /* Adjust the image size to cover the whole body */
    background-repeat: no-repeat; /* Prevent the image from repeating */
    /* Other styles */
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Set the font family */
    /* Additional styles as needed */


 
}
            #ImageButton1 {
            background-color:white
            }

</style>
</body>
</html>
