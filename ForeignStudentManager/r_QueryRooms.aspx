<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="r_QueryRooms.aspx.cs" Inherits="ForeignStudentManager.r_roomanager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="width: 1349px">
    <form id="form1" runat="server">
    <br />
    楼号：<asp:DropDownList ID="DropDownList1" runat="server">
    </asp:DropDownList>
&nbsp; 房间类型：<asp:DropDownList ID="DropDownList2" runat="server">
    </asp:DropDownList>
&nbsp; 房间状态：<asp:DropDownList ID="DropDownList3" runat="server">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="查询" 
        Width="89px" />
    <br />
    <asp:Label ID="QRresult" runat="server" Text="QRresult"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="RoomID" HeaderText="RoomID" 
                SortExpression="RoomID" />
            <asp:BoundField DataField="楼号" HeaderText="楼号" SortExpression="楼号" />
            <asp:BoundField DataField="房间号" HeaderText="房间号" SortExpression="房间号" />
            <asp:BoundField DataField="楼层" HeaderText="楼层" SortExpression="楼层" />
            <asp:BoundField DataField="房间类型" HeaderText="房间类型" SortExpression="房间类型" />
            <asp:BoundField DataField="每学年住宿费用" HeaderText="每学年住宿费用" 
                SortExpression="每学年住宿费用" />
            <asp:BoundField DataField="已入住人数" HeaderText="已入住人数" SortExpression="已入住人数" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
        SelectCommand="SELECT Rooms.RoomID, Rooms.Building AS 楼号, Rooms.RoomNo AS 房间号, Rooms.Floor AS 楼层, RoomType.RoomType AS 房间类型, Rooms.RoomPrice AS 每学年住宿费用, Rooms.StudentNumber AS 已入住人数, RoomSate.RoomState AS 房间状态 FROM Rooms INNER JOIN RoomType ON Rooms.RoomType = RoomType.RoomTypeID INNER JOIN RoomSate ON Rooms.State = RoomSate.RoomStateID ORDER BY Rooms.RoomID DESC">
    </asp:SqlDataSource>
    </form>
</body>
</html>
