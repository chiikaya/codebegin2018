<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="top_en.aspx.cs" Inherits="ForeignStudentManager.top_en" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Overseas Student Management and Security Early Warning System of NEFU</title>
    <style type="text/css">
         body
         {
margin-top:20px;
background-color:#99d9ea;
font-family :楷体GB2312;
font-size:40px;
text-align:center;
vertical-align:bottom;
color : #2c537e;
          }

        .style1
        {
            font-size: 30px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
   Welcome to Overseas Student Management and Security Early Warning System of NEFU
    </div>
    <div style="text-align: left;font-size:15px;margin-left:100px;">
         <asp:Label ID="lblHello" runat="server" Text=""></asp:Label>
        
        <a href="Login.aspx" target="_top">Log out</a>
    </div>
    </form>
</body>
</body>
</html>
