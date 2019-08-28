<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_CheckStudentAskLeave.aspx.cs" Inherits="ForeignStudentManager.t_CheckStudentAskLeave" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="ReasonReject" runat="server" visible="false">
            请输入拒绝编号为<asp:Label ID="lblLeaveID" runat="server" Text=""></asp:Label>
            的请假条的理由：<br />
            <asp:TextBox ID="txtReason" runat="server" Width="299px"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnSubmit"  runat="server" Text="确定" onclick="btnSubmit_Click" />
        </div>
        <div style="height: 235px">
    <asp:GridView ID="grdAskLeave" runat="server" CellPadding="4" ForeColor="#333333" 
           Height="40px" Width="1500px" style="text-align:center;"
           onselectedindexchanged="grdAskLeave_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
        <asp:TemplateField>
         <HeaderTemplate>
               审批操作
           </HeaderTemplate>
           <ItemTemplate>
               <asp:Button ID="btnOK" runat="server" CommandArgument='<%# Eval("请假条编号") %>' 
                   Visible="true" Text="同意" onclick="btnOK_Click" />
               <asp:Button ID="btnReject" runat="server" CommandArgument='<%# Eval("请假条编号") %>' 
                   Visible="true" Text="不同意" onclick="btnReject_Click" />
     
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
           <HeaderTemplate>
               <asp:CheckBox ID="chk_AllSelect" runat="server" Text="全选" AutoPostBack="True" 
                   oncheckedchanged="chk_AllSelect_CheckedChanged" />
           </HeaderTemplate>
           <ItemTemplate>
               <asp:CheckBox ID="chk_Select" runat="server" />
           </ItemTemplate>
        </asp:TemplateField>
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
            您没有要审批的请假条。
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
    </div>
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    </form>
</body>
</html>
