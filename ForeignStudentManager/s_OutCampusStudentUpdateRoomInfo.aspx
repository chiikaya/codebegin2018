<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="s_OutCampusStudentUpdateRoomInfo.aspx.cs" Inherits="ForeignStudentManager.s_OutCampusStudentUpdateRoomInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="Stylesheet" href="css\base.css" />
    <style type="text/css">
        .style1
        {
            text-align: left;
            margin-left: 10px;
            padding-left: 10px;
            height: 40px;
            width: 853px;
        }
        .style2
        {
            text-align: right;
            margin-right: 10px;
            height: 40px;
            width: 17%;
        }
        .style3
        {
            width: 17%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table id="Table2" border="1" runat="server">
         <tr>
           <td id="Td1"  class="style2"  runat="server">
                 信息编号：</td>
             <td id="Td2" class="style1" runat="server">
                 <asp:Label ID="lblRendID" runat="server" Text=""></asp:Label>
                
             </td>
         </tr>
          <tr>
             <td id="Td13"  class="style2"  runat="server">
                 租房详细地址：</td>
             <td id="Td14" class="style1" runat="server">
                
                 <asp:TextBox ID="txtAddress" runat="server" Width="508px"></asp:TextBox>
             </td>
          </tr>
          <tr>
             <td id="Td15"  class="style2"  runat="server">
                  &nbsp;房东姓名：</td>
             <td id="Td16" class="style1" runat="server">
                 <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
             </td>
          </tr>
                    <tr>
             <td id="Td17"  class="style2"  runat="server">
                 房东电话：</td>
             <td id="Td18" class="style1" runat="server">
                 <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
             </td>
          </tr>
          <tr>
             <td id="Td19"  class="style2"  runat="server">
                 租房合同：</td>
             <td id="Td20" class="style1" runat="server">
                 <asp:FileUpload ID="filePath" runat="server" />
&nbsp;<asp:Button ID="btnUpload" runat="server" onclick="Button1_Click" Text="上传" />
                 <asp:Label ID="Label1" runat="server" Text="请上传租房合同复印件！"></asp:Label>
                 
             </td>
          </tr>
                    <tr>
             <td id="Td21"  class="style2"  runat="server">
                 租房时间：</td>
             <td id="Td22" class="style1" runat="server">从
                  
                 <asp:TextBox ID="DateStart" runat="server" TextMode="Date"></asp:TextBox>
                 到
                  
                 <asp:TextBox ID="DateEnd" runat="server" TextMode="Date"></asp:TextBox>
                 。</td>

          </tr>
          <tr>
          <td clospan="2" style="text-align: right" class="style3">
              <asp:Button ID="btnUpdate" CssClass="buttoncontrol" runat="server" Text="确定" 
                  onclick="btnUpdate_Click" />
          </td>
          </tr>
          </table> 
    </div>
    </form>
</body>
</html>
