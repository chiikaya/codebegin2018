<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="s_EducationInfo.aspx.cs" Inherits="ForeignStudentManager.s_EducationInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="Stylesheet" href="css\base.css" />
    </head>
<body>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" EmptyDataText="没有可显示的数据记录。">
        <Columns>
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" 
                SortExpression="StudentID" />
            <asp:BoundField DataField="EducationType" HeaderText="EducationType" 
                SortExpression="EducationType" />
            <asp:BoundField DataField="Department" HeaderText="Department" 
                SortExpression="Department" />
            <asp:BoundField DataField="Major" HeaderText="Major" SortExpression="Major" />
            <asp:BoundField DataField="TutorName" HeaderText="TutorName" 
                SortExpression="TutorName" />
            <asp:BoundField DataField="TutorPhone" HeaderText="TutorPhone" 
                SortExpression="TutorPhone" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
        SelectCommand="SELECT DISTINCT * FROM [StudentEducationInfo] WHERE ([StudentID] = @StudentID)">
        <SelectParameters>
            <asp:SessionParameter Name="StudentID" SessionField="UserName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="EducationInfo" runat="server">
    </div>
    </form>
</body>
</html>
