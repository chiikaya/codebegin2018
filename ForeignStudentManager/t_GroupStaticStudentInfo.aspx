<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_GroupStaticStudentInfo.aspx.cs" Inherits="ForeignStudentManager.t_GroupStaticStudentInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      请选择分组字段：<asp:DropDownList 
                ID="ddlField" runat="server"  >
            </asp:DropDownList>
            &nbsp;&nbsp; <asp:Button ID="btnselect" runat="server" Text="查询" onclick="btnselect_Click" />
            <div id="StudentSelect" runat="server" style="margin-top:20px;" >
    
                <asp:Label ID="lblResult" runat="server"></asp:Label>
    
        <br />
    
    <asp:GridView ID="grdStudent" runat="server" CellPadding="4" 
            ForeColor="#333333" Height="40px" 
            style="text-align:center;" Width="584px" sort AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="#C1E9F2" />
            <Columns>
                <asp:BoundField DataField="类型" HeaderText="类型" SortExpression="类型" />
                <asp:BoundField DataField="人数" HeaderText="人数" ReadOnly="True" 
                    SortExpression="人数" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <EmptyDataTemplate>
                没有符号条件的分组统计信息。
            </EmptyDataTemplate>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
           
        </asp:GridView>
        
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
                    SelectCommand="select Nationality as 类型, count(*) as 人数 from StudentBaseAndEdu group by Nationality order by 类型;">
                </asp:SqlDataSource>
        
    </div>
    </div>

    </form>
</body>
</html>
