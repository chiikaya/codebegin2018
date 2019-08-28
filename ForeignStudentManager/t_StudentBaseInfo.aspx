<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_StudentBaseInfo.aspx.cs" Inherits="ForeignStudentManager.t_StudentBaseInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>查询学生基本信息</title><link rel="Stylesheet" href="css\base.css" />
</head>
<body>
    <form id="form1" runat="server">
            请选择查询字段：<asp:DropDownList 
                ID="ddlField" runat="server" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            请选择查询方式：<asp:DropDownList ID="ddlMethod" runat="server">
            </asp:DropDownList>
            <br />
            查询条件：<asp:TextBox 
            ID="txtID" runat="server" Width="244px" ></asp:TextBox>
&nbsp;<asp:Button ID="btnselect" runat="server" Text="查询" onclick="btnselect_Click" />
    <div id="StudentSelect" runat="server" style="margin-top:20px;" >
    
        <br />

        <asp:Label ID="lblResult" runat="server"></asp:Label>

        <br />
        <br />
    
    <asp:GridView ID="grdStudent" runat="server" CellPadding="4" 
            ForeColor="#333333" Height="40px" 
            style="text-align:center;" Width="1375px" sort AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="#C1E9F2" />
            <Columns>
               
                <asp:BoundField DataField="学号" HeaderText="学号" SortExpression="学号" />
                <asp:BoundField DataField="护照号" HeaderText="护照号" SortExpression="护照号" />
                <asp:BoundField DataField="英文名" HeaderText="英文名" SortExpression="英文名" />
                <asp:BoundField DataField="中文名" HeaderText="中文名" SortExpression="中文名" />
                <asp:BoundField DataField="国籍" HeaderText="国籍" SortExpression="国籍" />
                <asp:BoundField DataField="性别"  HeaderText="性别" SortExpression="性别" />
                <asp:BoundField DataField="出生日期" HeaderText="出生日期" SortExpression="出生日期" 
                    DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="学生类型" HeaderText="学生类型" SortExpression="学生类型" />
                <asp:BoundField DataField="联系电话" HeaderText="联系电话" SortExpression="联系电话" />
               
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <EmptyDataTemplate>
                没有符号条件的学生信息。
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
            SelectCommand="select StudentID as 学号,PassportNO as 护照号,PassportName as  英文名,ChineseName as 中文名,Nationality as 国籍,Gender as 性别,BirthDay as 出生日期,StudentType as 学生类型,PhoneNumber as 联系电话 from StudentBaseInfo order by StudentID desc;">
        </asp:SqlDataSource>
    </div>
    </div>


    </form>
</body>
</html>
