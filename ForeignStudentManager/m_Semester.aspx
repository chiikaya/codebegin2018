<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_Semester.aspx.cs" Inherits="ForeignStudentManager.m_Semester" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <div id="SemesterInsert" runat="server" style="margin-top:20px;" 
            visible="false">
        <table border="1" cellspacing="4"  cellpadding="0"  rules="all" style="width: 488px; height: 222px;color:#333333;border-collapse:collapse;" >
            <tr>
               <td width="30%" style="text-align:right;">
                   学期编号：
               </td>
               <td width="70%" style="text-align:left;">
                   <asp:Label ID="lblSemesterID" runat="server" style="margin-left:10px;" 
                        Width="200px" Text="Label" Height="16px"></asp:Label>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;">
                   学期说明：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtSemesterName" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;">
                   起始日期：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtDateStart" style="margin-left:10px;" runat="server" 
                       Width="200px" TextMode="Date"></asp:TextBox>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;">
                   结束日期：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtDateEnd" style="margin-left:10px;" runat="server" 
                       Width="200px" TextMode="Date"></asp:TextBox>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;">
                   年份：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtYear" style="margin-left:10px;" runat="server" 
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
       <asp:GridView ID="grdSemester" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="SemesterID" DataSourceID="SqlDataSource1" 
        EmptyDataText="没有可显示的数据记录。" ForeColor="#333333" 
        style="text-align: center" Width="900px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="chk_Allselect" runat="server" Text="全选" AutoPostBack="True" 
                        oncheckedchanged="chk_Allselect_CheckedChanged" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chk_Select" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SemesterID" HeaderText="学期编号" ReadOnly="True" 
                SortExpression="SemesterID" />
            <asp:BoundField DataField="SemesterName" HeaderText="学期" 
                SortExpression="SemesterName" />
            <asp:BoundField DataField="DateStart" HeaderText="起始时间" 
                SortExpression="DateStart" />
            <asp:BoundField DataField="DateEnd" HeaderText="结束时间" 
                SortExpression="DateEnd" />
            <asp:BoundField DataField="Year" HeaderText="年份" SortExpression="Year" />
            <asp:CommandField ButtonType="Button" EditText="修改" HeaderText="修改" 
                ShowEditButton="True" UpdateText="确定" />
            <asp:CommandField ButtonType="Button" HeaderText="删除" ShowDeleteButton="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
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
        DeleteCommand="DELETE FROM [Semester] WHERE [SemesterID] = @SemesterID" 
        InsertCommand="INSERT INTO [Semester] ([SemesterID], [SemesterName], [DateStart], [DateEnd], [Year]) VALUES (@SemesterID, @SemesterName, @DateStart, @DateEnd, @Year)" 
        SelectCommand="SELECT * FROM [Semester]" 
        UpdateCommand="UPDATE [Semester] SET [SemesterName] = @SemesterName, [DateStart] = @DateStart, [DateEnd] = @DateEnd, [Year] = @Year WHERE [SemesterID] = @SemesterID">
        <DeleteParameters>
            <asp:Parameter Name="SemesterID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SemesterID" Type="Int32" />
            <asp:Parameter Name="SemesterName" Type="String" />
            <asp:Parameter Name="DateStart" Type="DateTime" />
            <asp:Parameter Name="DateEnd" Type="DateTime" />
            <asp:Parameter Name="Year" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SemesterName" Type="String" />
            <asp:Parameter Name="DateStart" Type="DateTime" />
            <asp:Parameter Name="DateEnd" Type="DateTime" />
            <asp:Parameter Name="Year" Type="Int32" />
            <asp:Parameter Name="SemesterID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
