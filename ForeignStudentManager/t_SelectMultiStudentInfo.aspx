<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_SelectMultiStudentInfo.aspx.cs" Inherits="ForeignStudentManager.t_SelectMultiStudentInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <h1>学生综合信息查询</h1><br />
     <asp:GridView ID="grdStudent" runat="server" CellPadding="4" 
            ForeColor="#333333" Height="40px" 
            style="text-align:center;" Width="1375px" sort AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="#C1E9F2" />
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="学号" 
                    SortExpression="StudentID" />
                <asp:BoundField DataField="PassportNO" HeaderText="护照号" 
                    SortExpression="PassportNO" />
                <asp:BoundField DataField="PassportName" HeaderText="护照姓名" 
                    SortExpression="PassportName" />
                <asp:BoundField DataField="ChineseName" HeaderText="中文名" 
                    SortExpression="ChineseName" />
                <asp:BoundField DataField="Nationality" HeaderText="国籍" 
                    SortExpression="Nationality" />
                <asp:BoundField DataField="Gender" HeaderText="性别" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="BirthDay" HeaderText="出生日期" 
                    SortExpression="BirthDay" />
                <asp:BoundField DataField="StudentType" HeaderText="学生类型" 
                    SortExpression="StudentType" />
                <asp:BoundField DataField="LengthSchool" HeaderText="学制" 
                    SortExpression="LengthSchool" />
                <asp:BoundField DataField="ReligiousBelif" HeaderText="宗教信仰" 
                    SortExpression="ReligiousBelif" />
                <asp:BoundField DataField="StudentState" HeaderText="学生状态" 
                    SortExpression="StudentState" />
                <asp:ImageField DataImageUrlField="Photo" ControlStyle-Width="30px" ControlStyle-Height="40px"  AlternateText="照片" HeaderText="照片" />
                
                <asp:BoundField DataField="DateArrivalChina" HeaderText="入境时间" 
                    SortExpression="DateArrivalChina" />
                <asp:BoundField DataField="DateArrivalUniversity" 
                    HeaderText="到校时间" SortExpression="DateArrivalUniversity" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="移动电话" 
                    SortExpression="PhoneNumber" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="EmergencyContactPhone" 
                    HeaderText="紧急联系电话" SortExpression="EmergencyContactPhone" />
                <asp:BoundField DataField="Wechat" HeaderText="微信" 
                    SortExpression="Wechat" />
                <asp:BoundField DataField="HomeAddress" HeaderText="家庭住址" 
                    SortExpression="HomeAddress" />
                <asp:BoundField DataField="AccommodationType" HeaderText="住宿类型" 
                    SortExpression="AccommodationType" />
                <asp:BoundField DataField="ScholarshipID" HeaderText="奖学金类型ID" 
                    SortExpression="ScholarshipID" />
                <asp:BoundField DataField="EducationType" HeaderText="教育类型" 
                    SortExpression="EducationType" />
                <asp:BoundField DataField="Department" HeaderText="学院" 
                    SortExpression="Department" />
                <asp:BoundField DataField="Major" HeaderText="专业" SortExpression="Major" />
                <asp:BoundField DataField="TutorName" HeaderText="导师姓名" 
                    SortExpression="TutorName" />
                <asp:BoundField DataField="TutorPhone" HeaderText="导师联系方式" 
                    SortExpression="TutorPhone" />
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
            SelectCommand="SELECT * FROM [StudentBaseAndEdu]">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
