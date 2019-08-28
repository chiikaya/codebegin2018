<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_CheckAskLeaveAllContent.aspx.cs" Inherits="ForeignStudentManager.t_CheckAskLeaveAllContent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="Stylesheet" href="css\base.css" />
    <style>
    table,table tr th, table tr td { border:2px solid #000; margin:5px;}
     table { min-height: 45px; line-height: 45px; text-align: center; border-collapse: collapse; padding:2px;}   

    </style>
</head>
<body style="background-color:#FFF;">
    <form id="form1" runat="server">
    <div id="AddAskLeave" runat="server" style="margin-left:40px;">
      <h1 style="text-align: left;margin-left:200px;">请假条</h1>
        <table id="Table1" border="1" width="700px" runat="server">
         <tr>
             <td id="Td13" width="30%"  class="leftTab"  runat="server">
                 请假条编号：</td>
             <td id="Td14" class="rightTab" runat="server">
                 <asp:Label ID="lblAskLeaveID" class="rightTab" runat="server" Text=""></asp:Label>
             </td>
          </tr>
           <tr>
             <td id="Td15" width="30%"  class="leftTab"   runat="server">
                 学生姓名：</td>
             <td id="Td16" class="rightTab" runat="server">
                <asp:Label ID="lblStudentName" class="rightTab" runat="server" Text=""></asp:Label>
             </td>
          </tr>
          <tr>
             <td id="Td1" width="30%"   class="leftTab"   runat="server">
                 请假类型：</td>
             <td id="Td2" class="rightTab" runat="server">
                <asp:Label ID="lblAskLeaveType" class="rightTab" runat="server" Text=""></asp:Label>
             </td>
          </tr>
         
           <tr>
              <td id="Td3" width="30%"   class="leftTab"  runat="server">
                 目的地：</td>
             <td id="Td4" class="rightTab" runat="server">
                 <asp:Label ID="lblDestination" runat="server" class="rightTab" Text=""></asp:Label>
             &nbsp;</td>
          </tr>
          <tr>
              <td id="Td5" width="30%"  class="leftTab"  runat="server">
                 请假时间：</td>
             <td id="Td6" class="rightTab"  runat="server">
                
                 <asp:Label ID="lblTime" runat="server" class="rightTab" Text=""></asp:Label>
             </td>
          </tr>
          <tr>
              <td id="Td7" width="30%"  class="leftTab"   runat="server">
                 请假内容：</td>
             <td id="Td8" class="rightTab"  runat="server">

                  <asp:Label ID="lblContent" runat="server" class="rightTab" Text=""></asp:Label>

             </td>
          </tr>
          <tr>
              <td id="Td9" width="30%"  class="leftTab"   runat="server">
                 辅导员审批情况：</td>
             <td id="Td10"  class="rightTab"  runat="server">
                 <asp:Label ID="lblTutor" runat="server" class="rightTab"></asp:Label>

             </td>
          </tr>
           <tr>
              <td id="Td17" width="30%"  class="leftTab"   runat="server">
                教务管理部门审批情况：</td>
             <td id="Td18"  class="rightTab"  runat="server">
                 <asp:Label ID="lblTeaching" runat="server" class="rightTab"></asp:Label>

             </td>
          </tr>
          <tr>
              <td id="Td19" width="30%"  class="leftTab"   runat="server">
                 生活服务部门审批情况：</td>
             <td id="Td20"  class="rightTab"  runat="server">
                 <asp:Label ID="lblService" runat="server" class="rightTab"></asp:Label>

             </td>
          </tr>
                    <tr>
              <td id="Td21" width="30%"  class="leftTab"   runat="server">
                 主管领导审批情况：</td>
             <td id="Td22"  class="rightTab"  runat="server">
                 <asp:Label ID="lblManager" runat="server" class="rightTab"></asp:Label>

             </td>
          </tr>
        
        </table>
        <br/>
        <asp:Button ID="btnReturn" CssClass="buttoncontrol" runat="server" Text="返回" 
            onclick="btnReturn_Click" />
    </div>
    </form>
</body>
</html>
