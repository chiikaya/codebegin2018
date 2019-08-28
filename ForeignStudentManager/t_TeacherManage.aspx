<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_TeacherManage.aspx.cs" Inherits="ForeignStudentManager.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> 查看教师信息
    </title>
     <link rel="Stylesheet" href="css\base.css" />
    
    <style type="text/css">
        .style1
        {
            width: 496px;
        }
        .style2
        {
            width: 496px;
            height: 27px;
        }
        .style4
        {
            width: 238px;
        }
        .style5
        {
            width: 496px;
            height: 21px;
        }
        .style6
        {
            width: 238px;
            height: 21px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        EmptyDataText="没有可显示的数据记录。" Width="472px" AllowPaging="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" BackColor="White" 
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:BoundField DataField="TeacherID" HeaderText="TeacherID" 
                SortExpression="TeacherID" />
            <asp:BoundField DataField="TeacherName" HeaderText="TeacherName" 
                SortExpression="TeacherName" />
            <asp:BoundField DataField="TeacherGender" HeaderText="TeacherGender" 
                SortExpression="TeacherGender" />
            <asp:BoundField DataField="Post" HeaderText="Post" SortExpression="Post" />
            <asp:BoundField DataField="WorkType" HeaderText="WorkType" 
                SortExpression="WorkType" />
            <asp:BoundField DataField="OfficeAddress" HeaderText="OfficeAddress" 
                SortExpression="OfficeAddress" />
            <asp:BoundField DataField="OfficeTelephone" HeaderText="OfficeTelephone" 
                SortExpression="OfficeTelephone" />
            <asp:BoundField DataField="TeacherPhone" HeaderText="TeacherPhone" 
                SortExpression="TeacherPhone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
        
        
        SelectCommand="SELECT DISTINCT [TeacherID], [TeacherName], [TeacherGender], [Post], [WorkType], [OfficeAddress], [OfficeTelephone], [TeacherPhone], [Email] FROM [TeacherManager] WHERE ([TeacherID] = @TeacherID)">
        <SelectParameters>
            <asp:SessionParameter Name="TeacherID" SessionField="UserName" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    </form>
</body>
</html>