<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="s_LookRoomInfo.aspx.cs" Inherits="ForeignStudentManager.s_LookRoomInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link rel="Stylesheet" href="css\base.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="InCampus" runat="server" visible="true">
        <table id="Table1" border="1" width="700px" runat="server">
          <tr>
             <td id="Td1" width="30%"  class="leftTab"  runat="server">
                 宿舍：</td>
             <td id="Td2" class="rightTab" runat="server">
                 <asp:Label ID="lblBuilding" runat="server" Text=""></asp:Label>
             </td>
          </tr>
          <tr>
             <td id="Td3" width="30%"  class="leftTab"  runat="server">
                  楼层：</td>
             <td id="Td4" class="rightTab" runat="server">
                 <asp:Label ID="lblFloor" runat="server" Text=""></asp:Label>
             </td>
          </tr>
                    <tr>
             <td id="Td5" width="30%"  class="leftTab"  runat="server">
                 宿舍类型：</td>
             <td id="Td6" class="rightTab" runat="server">
                 <asp:Label ID="lblRoomType" runat="server" Text=""></asp:Label>
             </td>
          </tr>
          <tr>
             <td id="Td7" width="30%"  class="leftTab"  runat="server">
                 住宿费：</td>
             <td id="Td8" class="rightTab" runat="server">
                 <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>元/月
             </td>
          </tr>
                    <tr>
             <td id="Td9" width="30%"  class="leftTab"  runat="server">
                 入住人数：</td>
             <td id="Td10" class="rightTab" runat="server">
                 <asp:Label ID="lblStudentNumber" runat="server" Text=""></asp:Label>
             </td>
          </tr>
                    <tr>
             <td id="Td11" width="30%"  class="leftTab"  runat="server">
                 房屋状态：</td>
             <td id="Td12" class="rightTab" runat="server">
                 <asp:Label ID="lblRoomState" runat="server" Text=""></asp:Label>
             </td>
          </tr>
          </table> 
    </div>
    <div id="OutCampus" runat="server" visible="false">
     <table id="Table2" border="1" width="700px" runat="server">
          <tr>
             <td id="Td13" width="30%"  class="leftTab"  runat="server">
                 租房详细地址：</td>
             <td id="Td14" class="rightTab" runat="server">
                 <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
             </td>
          </tr>
          <tr>
             <td id="Td15" width="30%"  class="leftTab"  runat="server">
                  &nbsp;房东姓名：</td>
             <td id="Td16" class="rightTab" runat="server">
                 <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
             </td>
          </tr>
                    <tr>
             <td id="Td17" width="30%"  class="leftTab"  runat="server">
                 房东电话：</td>
             <td id="Td18" class="rightTab" runat="server">
                 <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
             </td>
          </tr>
          <tr>
             <td id="Td19" width="30%"  class="leftTab"  runat="server">
                 租房合同：</td>
             <td id="Td20" class="rightTab" runat="server">
                 <asp:HyperLink ID="linkContract" runat="server">合同复印件</asp:HyperLink>
                 
             </td>
          </tr>
                    <tr>
             <td id="Td21" width="30%"  class="leftTab"  runat="server">
                 租房时间：</td>
             <td id="Td22" class="rightTab" runat="server">从
                 <asp:Label ID="lblDateStart" runat="server" Text=""></asp:Label>             
                 到
                 <asp:Label ID="lblDateEnd" runat="server" Text=""></asp:Label>
             </td>

          </tr>
          <tr>
          <td clospan="2" style="text-align: right">
              <asp:Button ID="btnUpdate" CssClass="buttoncontrol" runat="server" Text="更新" 
                  onclick="btnUpdate_Click" />
          </td>
          </tr>
          </table> 
    </div>
    </form>
</body>
</html>
