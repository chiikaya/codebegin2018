<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_SelectStudentMajorInfo.aspx.cs" Inherits="ForeignStudentManager.t_SelectStudentMajorInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        学生类型：<asp:DropDownList ID="ddlStudentType" runat="server" 
           >
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp; 所在学院：<asp:DropDownList ID="ddlDepartment" runat="server" 
            AutoPostBack="True" onselectedindexchanged="ddlDepartment_SelectedIndexChanged" 
            >
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp; 专业：<asp:DropDownList ID="ddlMajor" runat="server" 
            AutoPostBack="True" onselectedindexchanged="ddlMajor_SelectedIndexChanged" 
           >
        </asp:DropDownList>
        &nbsp; 导师姓名:<asp:DropDownList ID="ddlTutors" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddlTutors_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:Button ID="btnSelect" runat="server" onclick="btnSelect_Click" Text="查询" 
            style="height: 21px" />
        <br />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
        <asp:GridView ID="grdStudent" runat="server" CellPadding="4" 
            ForeColor="#333333" Height="40px" 
            style="text-align:center;" Width="1375px" sort AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="#C1E9F2" />
            <Columns>
                <asp:BoundField DataField="学号" HeaderText="学号" SortExpression="学号" />
                <asp:BoundField DataField="英文名" HeaderText="英文名" SortExpression="英文名" />
                <asp:BoundField DataField="中文名" HeaderText="中文名" SortExpression="中文名" />
                <asp:BoundField DataField="学生类型" HeaderText="学生类型" SortExpression="学生类型" />
                <asp:BoundField DataField="所在学院" HeaderText="所在学院" SortExpression="所在学院" />
                <asp:BoundField DataField="专业" HeaderText="专业" SortExpression="专业" />
                <asp:BoundField DataField="导师姓名" HeaderText="导师姓名" SortExpression="导师姓名" />
                <asp:BoundField DataField="导师联系方式" HeaderText="导师联系方式" 
                    SortExpression="导师联系方式" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <EmptyDataTemplate>
                没有数据可以显示。
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
            SelectCommand="select StudentBaseInfo.StudentID as 学号,PassportName as  英文名,ChineseName as 中文名,StudentType as 学生类型, Department as 所在学院, Major as 专业,TutorName as  导师姓名, TutorPhone as  导师联系方式
from StudentBaseInfo,StudentEducationInfo
where StudentBaseInfo.StudentID=StudentEducationInfo.StudentID
 order by StudentBaseInfo.StudentID desc;">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
