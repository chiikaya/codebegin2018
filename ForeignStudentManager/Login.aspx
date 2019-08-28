<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ForeignStudentManager.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>欢迎进入东北林业大学留学生管理与安全预警系统</title>
     <link rel="Stylesheet" href="css\base.css" />
    <style type="text/css">
        .style2
        {
            height: 20px;
             width: 200px;
             text-align:right;
        }
        .style3
        {
            height: 20px;
            width: 450px;
            text-align:left;
        }
       
         body {  
     margin: 0;    
    background-color: #99d9ea;  
        }  

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Layer1" style="position:absolute; width:100%; height:100%; left: 0px; top: 0px;  background-color: #22C3AA; z-index:-1" >      
          <img src="img\login.jpg" height="100%" width="100%"/>      
   </div> 

   <div style="position:absolute; margin-left:0px;margin-top:0px; z-index: 1; left: 50%; top:50%; height: 40%; width: 40%px; color: #000000;"> 
    
        <table  width="100%">
            <tr>
                <td class="style2">用户名：</td>
                <td class="style3">
                    <asp:TextBox ID="txtUserName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">密码：</td>
                <td  class="style3">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">用户类型：</td>
                <td  class="style3">
                    <asp:RadioButtonList ID="radUserType" runat="server" RepeatColumns="3" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem>学生</asp:ListItem>
                        <asp:ListItem>管理员</asp:ListItem>
                        <asp:ListItem>管理人员</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td  class="style2">
                    <asp:Button ID="btnOK" runat="server" Text="登录" onclick="btnOK_Click" /></td>
                <td  class="style3">
                    <asp:Label ID="lblResult" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
