<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="r_QueryStudents.aspx.cs" Inherits="ForeignStudentManager.r_QueryStudents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        寝室楼号：<asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
&nbsp;&nbsp; 学生国籍：<asp:DropDownList ID="DropDownList2" runat="server">
        </asp:DropDownList>
&nbsp; 学生类型：<asp:DropDownList ID="DropDownList3" runat="server">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="QSButton" runat="server" onclick="QSButton_Click" Text="查询" 
            Width="112px" />
        <br />
        <asp:Label ID="QSresult" runat="server" Text="QSresult"></asp:Label>
        <br />
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="SqlDataSource1" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="RoomID" HeaderText="RoomID" 
                    SortExpression="RoomID" />
                <asp:BoundField DataField="楼号" HeaderText="楼号" SortExpression="楼号" />
                <asp:BoundField DataField="房间号" HeaderText="房间号" SortExpression="房间号" />
                <asp:BoundField DataField="楼层" HeaderText="楼层" SortExpression="楼层" />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" 
                    SortExpression="StudentID" />
                <asp:BoundField DataField="中文名字" HeaderText="中文名字" SortExpression="中文名字" />
                <asp:BoundField DataField="国籍" HeaderText="国籍" SortExpression="国籍" />
                <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别" />
                <asp:BoundField DataField="学生类型" HeaderText="学生类型" SortExpression="学生类型" />
                <asp:BoundField DataField="联系方式" HeaderText="联系方式" SortExpression="联系方式" />
                <asp:BoundField DataField="紧急联系方式" HeaderText="紧急联系方式" 
                    SortExpression="紧急联系方式" />
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
            
            SelectCommand="SELECT Rooms.RoomID, Rooms.Building AS 楼号, Rooms.RoomNo AS 房间号, Rooms.Floor AS 楼层, StudentBaseInfo.StudentID, StudentBaseInfo.ChineseName AS 中文名字, StudentBaseInfo.Nationality AS 国籍, StudentBaseInfo.Gender AS 性别, StudentBaseInfo.StudentType AS 学生类型, StudentBaseInfo.PhoneNumber AS 联系方式, StudentBaseInfo.EmergencyContactPhone AS 紧急联系方式 FROM StudentBaseInfo INNER JOIN StudentInCampusInfo ON StudentBaseInfo.StudentID = StudentInCampusInfo.StudentID INNER JOIN Rooms ON StudentInCampusInfo.RoomID = Rooms.RoomID ORDER BY Rooms.RoomID DESC" 
            onselecting="SqlDataSource1_Selecting">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
