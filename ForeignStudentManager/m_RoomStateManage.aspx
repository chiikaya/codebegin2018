<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_RoomStateManage.aspx.cs" Inherits="ForeignStudentManager.m_RoomStateManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>宿舍状态类型信息管理</title>
     <link rel="Stylesheet" href="css\base.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="text-align: left">
        <asp:Button ID="btnInsert" runat="server" Text="添加" CssClass="buttoncontrol" 
            onclick="btnInsert_Click" />
        &nbsp;&nbsp;
        <asp:Button ID="btnDelMany" runat="server" CssClass="widbuttoncontrol"  
            Text="批量删除" onclick="btnDelMany_Click" />
&nbsp;
        <asp:Label ID="lblResult" runat="server"></asp:Label>
        <br />
        <div id="RoomStateAdd" runat="server" style="margin-top:20px;" 
            visible="false">
        <table border="1" cellspacing="4"  cellpadding="0"  rules="all" style="width: 488px; height: 111px;color:#333333;border-collapse:collapse;" >
            <tr>
               <td width="30%" style="text-align:right;">
                   房屋类型编号：
               </td>
               <td width="70%" style="text-align:left;">
                   <asp:Label ID="lblRoomStateID" runat="server" style="margin-left:10px;" 
                        Width="200px" Text="Label"></asp:Label>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;">
                   房屋状态说明：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtRoomState" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;">
                   <asp:Button ID="btnOK" runat="server" Text="确定" style="margin-right:10px;" CssClass="buttoncontrol" onclick="btnOK_Click" />
               </td>
               <td width="70%" style="text-align:left;">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="buttoncontrol" onclick="btnCancel_Click" />
               </td>
            </tr>
        </table>
            <br />
            </div>
            </div>
        <br />
        <asp:GridView ID="grdRoom" RowStyle-HorizontalAlign="Center" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="StudentDataSource" ForeColor="#333333" 
            onselectedindexchanged="grdRoom_SelectedIndexChanged" Width="741px" 
            BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" 
             DataKeyNames="RoomStateID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                  <HeaderTemplate>
                    <asp:CheckBox ID="chkHeader" Text="全选" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged" />
                  
                  </HeaderTemplate>
                  <ItemTemplate>
                    <asp:CheckBox ID="chkSelect" Text="" runat="server"/>
                  </ItemTemplate>
                 <InsertItemTemplate>
                    <asp:TextBox ID="RoomStateID" runat="server" />
                    <asp:TextBox ID="RoomState" runat="server" />
                 </InsertItemTemplate>
                
                </asp:TemplateField>
                <asp:BoundField DataField="RoomStateID" HeaderText="状态编号" 
                    SortExpression="RoomStateID" ReadOnly="True" />
                <asp:BoundField DataField="RoomState" HeaderText="状态说明" 
                    SortExpression="RoomState" />

                <asp:CommandField ButtonType="Button" HeaderText="修改" ShowEditButton="True" 
                    UpdateText="确定" EditText="修改" />
                <asp:CommandField ButtonType="Button" HeaderText="删除" ShowDeleteButton="True" />
                
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
           
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="StudentDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
            SelectCommand="SELECT * FROM [RoomSate]" 
            DeleteCommand="DELETE FROM [RoomSate] WHERE [RoomStateID] = @RoomStateID" 
            InsertCommand="INSERT INTO [RoomSate] ([RoomStateID], [RoomState]) VALUES (@RoomStateID, @RoomState)" 
            UpdateCommand="UPDATE [RoomSate] SET [RoomState] = @RoomState WHERE [RoomStateID] = @RoomStateID"  >
            <DeleteParameters>
                <asp:Parameter Name="RoomStateID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RoomStateID" Type="Int32" />
                <asp:Parameter Name="RoomState" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RoomState" Type="String" />
                <asp:Parameter Name="RoomStateID" Type="Int32" />
            </UpdateParameters>
           
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
