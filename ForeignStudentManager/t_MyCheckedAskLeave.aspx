<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_MyCheckedAskLeave.aspx.cs" Inherits="ForeignStudentManager.t_MyCheckedAskLeave" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <asp:GridView ID="grdAskLeave" runat="server" CellPadding="4" ForeColor="#333333" 
           Height="40px" Width="1500px" style="text-align:center;"
           >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
        
        <asp:TemplateField>
           <HeaderTemplate>
               详细信息
           </HeaderTemplate>
           <ItemTemplate>
               <asp:HyperLink ID="btnLookContent" runat="server" NavigateUrl='<%# "~/t_CheckAskLeaveAllContent.aspx?LeaveID="+ Eval("请假条编号") %>'  Text="详细内容"></asp:HyperLink>
           </ItemTemplate>
        </asp:TemplateField>
            
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <EmptyDataTemplate>
            您没有已经审批的请假条。
        </EmptyDataTemplate>
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
