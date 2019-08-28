<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_Majors.aspx.cs" Inherits="ForeignStudentManager.m_Majors" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link rel="Stylesheet" href="css\base.css" />
    <style type="text/css">
        .style1
        {
            height: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button ID="btnInsert" runat="server" Text="添加"  CssClass="buttoncontrol"
        onclick="btnInsert_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="btnDelMany" runat="server"
        onclick="btnDelMany_Click"  CssClass="widbuttoncontrol"  Text="批量删除" />
    &nbsp;&nbsp;
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    <br />
    <div id="MajorsInsert" runat="server" style="margin-top:20px;" visible="false">
        <table border="1" cellspacing="4"  cellpadding="0"  rules="all" 
            style="width: 698px; height: 222px;color:#333333;border-collapse:collapse;" >
            <tr>
               <td width="30%" style="text-align:right;">
                   专业编号：
               </td>
               <td width="70%" style="text-align:left;">
               <asp:TextBox ID="txtMajorID" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
                        <tr>
               <td width="30%" style="text-align:right;">
                   专业名称：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtMajor" style="margin-left:10px;" runat="server" Width="200px"></asp:TextBox>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;" class="style1">
                   所属学院名称：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;" class="style1">
                   &nbsp;<asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" 
                       DataSourceID="SqlDataSource2" DataTextField="Department" 
                       DataValueField="DepartmentID">
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
                       SelectCommand="SELECT [Department], [DepartmentID] FROM [Department]">
                   </asp:SqlDataSource>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;">
                   所属学科名称：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;">
                 &nbsp;<asp:DropDownList ID="ddlSubject" runat="server" 
                       DataSourceID="SqlDataSource4" DataTextField="SubjectName" 
                       DataValueField="SubjectID" AutoPostBack="True">
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
                       SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;">
                   所属学科类型：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtSubjectType" style="margin-left:10px;" runat="server" Width="200px"></asp:TextBox>
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
    </div>
    
    </div>
    <br />
  
    <asp:GridView ID="grdMajors" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="MajorID,DepartmentID" DataSourceID="SqlDataSource1" 
        EmptyDataText="没有可显示的数据记录。" ForeColor="#333333" style="text-align: center" 
        Width="1101px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="chk_Allselect" runat="server" Text="全选" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chk_Select" runat="server" 
                        oncheckedchanged="chk_Select_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MajorID" HeaderText="专业编号" ReadOnly="True" 
                SortExpression="MajorID" />
            <asp:BoundField DataField="MajorName" HeaderText="专业名称" 
                SortExpression="MajorName" />
            <asp:BoundField DataField="DepartmentID" HeaderText="学院编号" 
                ReadOnly="True" SortExpression="DepartmentID" />
            <asp:BoundField DataField="department" HeaderText="学院名称" 
                SortExpression="department" />
            <asp:BoundField DataField="SubjectID" HeaderText="学科编号" 
                SortExpression="SubjectID" />
            <asp:BoundField DataField="SubjectType" HeaderText="学科类型" 
                SortExpression="SubjectType" />
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
        DeleteCommand="DELETE FROM [Majors] WHERE [MajorID] = @MajorID AND [DepartmentID] = @DepartmentID" 
        InsertCommand="INSERT INTO [Majors] ([MajorID], [MajorName], [DepartmentID], [department], [SubjectID], [SubjectType]) VALUES (@MajorID, @MajorName, @DepartmentID, @department, @SubjectID, @SubjectType)" 
        SelectCommand="SELECT * FROM [Majors]" 
        UpdateCommand="UPDATE [Majors] SET [MajorName] = @MajorName, [department] = @department, [SubjectID] = @SubjectID, [SubjectType] = @SubjectType WHERE [MajorID] = @MajorID AND [DepartmentID] = @DepartmentID">
        <DeleteParameters>
            <asp:Parameter Name="MajorID" Type="String" />
            <asp:Parameter Name="DepartmentID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MajorID" Type="String" />
            <asp:Parameter Name="MajorName" Type="String" />
            <asp:Parameter Name="DepartmentID" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="SubjectID" Type="String" />
            <asp:Parameter Name="SubjectType" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MajorName" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="SubjectID" Type="String" />
            <asp:Parameter Name="SubjectType" Type="String" />
            <asp:Parameter Name="MajorID" Type="String" />
            <asp:Parameter Name="DepartmentID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
      </div>
    </form>
</body>
</html>
