<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="top.aspx.cs" Inherits="ForeignStudentManager.m_top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>东北林业大学留学生管理与安全预警系统</title>
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

</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    欢迎进入东北林业大学留学生管理与安全预警系统
    </div>
    <div style="text-align: left;font-size:15px;margin-left:100px;">
         <asp:Label ID="lblHello" runat="server" Text=""></asp:Label>
        
        <a href="Login.aspx" target="_top">退出系统</a>
    </div>
    </form>
</body>
</html>
