<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="r_changeRoom.aspx.cs" Inherits="ForeignStudentManager.r_changeRoom" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学生调宿</title>
    <link rel="Stylesheet" href="css\base.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: x-large">
    
        学生调宿</div>
    <asp:Panel ID="Panel1" runat="server">
        学生ID：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="sqstudent" runat="server" Text="学生查询" 
            onclick="sqstudent_Click" />
        <br />
        <asp:Label ID="ssresult" runat="server" Text="ssresult"></asp:Label>
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="SqlDataSource1" Height="206px" style="margin-right: 0px" 
            Width="1195px">
            <Columns>
                <asp:BoundField DataField="楼号" HeaderText="楼号" SortExpression="楼号" />
                <asp:BoundField DataField="房间号" HeaderText="房间号" SortExpression="房间号" />
                <asp:BoundField DataField="楼层" HeaderText="楼层" SortExpression="楼层" />
                <asp:BoundField DataField="学生学号" HeaderText="学生学号" SortExpression="学生学号" />
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
            ConnectionString="<%$ ConnectionStrings:Conn1 %>" SelectCommand="SELECT  Rooms.Building AS 楼号, Rooms.RoomNo AS 房间号, Rooms.Floor AS 楼层, StudentBaseInfo.StudentID as 学生学号, StudentBaseInfo.ChineseName AS 中文名字, StudentBaseInfo.Nationality AS 国籍, StudentBaseInfo.Gender AS 性别, StudentBaseInfo.StudentType AS 学生类型, StudentBaseInfo.PhoneNumber AS 联系方式, StudentBaseInfo.EmergencyContactPhone AS 紧急联系方式 
FROM StudentBaseInfo INNER JOIN StudentInCampusInfo ON 
StudentBaseInfo.StudentID = StudentInCampusInfo.StudentID INNER JOIN Rooms ON StudentInCampusInfo.RoomID = Rooms.RoomID 
ORDER BY Rooms.RoomID DESC"></asp:SqlDataSource>
        <br />
        宿舍楼号： 
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        &nbsp; 宿舍类型：<asp:DropDownList ID="DropDownList2" runat="server">
        </asp:DropDownList>
        &nbsp;宿舍状态：<asp:DropDownList ID="DropDownList3" runat="server">
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:Button ID="sqroom" runat="server" onclick="sqroom_Click" Text="宿舍查询" />
        <br />
        <asp:Label ID="srresult" runat="server" Text="srresult"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="SqlDataSource2" Height="237px" Width="1200px" 
            DataKeyNames="RoomID">
            <Columns>
                <asp:TemplateField HeaderText="  ">
                    <ItemTemplate>
                        <asp:CheckBox ID="RoomSelector" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RoomID" HeaderText="RoomID" 
                    SortExpression="RoomID" />
                <asp:BoundField DataField="楼号" HeaderText="楼号" SortExpression="楼号" />
                <asp:BoundField DataField="房间号" HeaderText="房间号" SortExpression="房间号" />
                <asp:BoundField DataField="楼层" HeaderText="楼层" SortExpression="楼层" />
                <asp:BoundField DataField="房间类型" HeaderText="房间类型" SortExpression="房间类型" />
                <asp:BoundField DataField="每学年住宿费用" HeaderText="每学年住宿费用" 
                    SortExpression="每学年住宿费用" />
                <asp:BoundField DataField="房间状态" HeaderText="房间状态" SortExpression="房间状态" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
            SelectCommand="SELECT Rooms.RoomID, Rooms.Building AS 楼号, Rooms.RoomNo AS 房间号, Rooms.Floor AS 楼层, RoomType.RoomType AS 房间类型, Rooms.RoomPrice AS 每学年住宿费用, RoomSate.RoomState AS 房间状态 FROM Rooms INNER JOIN RoomType ON Rooms.RoomType = RoomType.RoomTypeID INNER JOIN RoomSate ON Rooms.State = RoomSate.RoomStateID ORDER BY Rooms.RoomID DESC">
        </asp:SqlDataSource>
        <br />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center">
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="确认换寝" onclick="Button1_Click" 
            Width="102px" />
    </asp:Panel>
    </form>
</body>
</html>
