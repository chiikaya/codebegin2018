<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="s_AskLeaveAdd.aspx.cs" Inherits="ForeignStudentManager.s_AskLeaveAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="Stylesheet" href="css\base.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="AddAskLeave" runat="server">
        <table border="1" width="700px" runat="server">
          <tr>
             <td width="30%"  class="leftTab"  runat="server">
                 请假类型：</td>
             <td class="rightTab" runat="server">
                 <asp:DropDownList ID="ddlLeaveType" CssClass="textboxControl" runat="server" 
                     DataSourceID="SqlDataSource1" DataTextField="ReasonLeave" 
                     DataValueField="ReasonLeave" AutoPostBack="True">
                 </asp:DropDownList>
             </td>
          </tr>
           <tr>
              <td width="30%"  class="leftTab" runat="server">
                 目的地：</td>
             <td class="rightTab" runat="server">
                 <asp:TextBox ID="txtDestination"  CssClass="textboxControl" runat="server"></asp:TextBox>
             </td>
          </tr>
          <tr>
              <td width="30%" class="leftTab" runat="server">
                 请假时间：</td>
             <td class="rightTab"  runat="server">
                从 
                 <asp:TextBox ID="txtStart" runat="server" 
                     TextMode="Date" AutoPostBack="True" ontextchanged="txtStart_TextChanged"></asp:TextBox>到<asp:TextBox ID="txtEnd" 
                     runat="server" TextMode="Date" AutoPostBack="True" 
                     ontextchanged="txtEnd_TextChanged"></asp:TextBox>共<asp:Label
                    ID="lblDaysLeave" runat="server" Text="  "></asp:Label>天
             </td>
          </tr>
          <tr>
              <td width="30%" class="leftTab"  runat="server">
                 请假内容：</td>
             <td class="rightTab"  runat="server">

                 <asp:TextBox ID="txtContent" runat="server" Height="90px" TextMode="MultiLine" 
                     Width="392px"></asp:TextBox>

             </td>
          </tr>
          <tr>
              <td width="30%" class="leftTab"  runat="server">
                 佐证材料：</td>
             <td  class="rightTab"  runat="server">
                 <asp:FileUpload ID="upLoadProof" runat="server" Height="35px" Width="247px" 
                     Font-Size="15px" />
                 &nbsp;&nbsp;
                 <asp:Button ID="btnUpload" runat="server" CssClass="buttoncontrol" Text="上传" Font-Size="15px" />

                 <br />
                 <asp:Label ID="lblUpLoad" runat="server"></asp:Label>

             </td>
          </tr>
          <tr>
              <td width="30%" class="leftTab" runat="server" >
                  <asp:Button ID="btnSave" runat="server"  CssClass="buttoncontrol" Text="保存" 
                      onclick="btnSave_Click" />
                </td>
             <td class="rightTab" runat="server">
                 <asp:Button ID="btnCancel" runat="server" CssClass="buttoncontrol" Text="取消" 
                     onclick="btnCancel_Click" />
             </td>
          </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
        SelectCommand="SELECT [ReasonLeave] FROM [ReasonLeave]"></asp:SqlDataSource>
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    <br />
   <div style="height: 235px">
    <asp:GridView ID="grdAskLeave" runat="server" CellPadding="4" ForeColor="#333333" 
           Height="40px" Width="1244px" style="text-align:center;"
           onselectedindexchanged="grdAskLeave_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText="操作" 
                SelectText="提交" />
                <asp:TemplateField>
                <HeaderTemplate>
                删除
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnDelete" CommandArgument='<%# Eval("请假条编号") %>' 
                        runat="server" Text="删除" onclick="btnDelete_Click" />
                </ItemTemplate>
                </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    </div>
    </form>
</body>
</html>
