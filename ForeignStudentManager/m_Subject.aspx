﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_Subject.aspx.cs" Inherits="ForeignStudentManager.m_Subject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="css\base.css" />
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
    <div id="SubjectInsert" runat="server" style="margin-top:20px;" visible="false">
        <table border="1" cellspacing="4"  cellpadding="0"  rules="all" style="width: 488px; height: 111px;color:#333333;border-collapse:collapse;" >
            <tr>
               <td width="30%" style="text-align:right;">
                   学科编号：
               </td>
               <td width="70%" style="text-align:left;">
               <asp:TextBox ID="txtSubjectID" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
                        <tr>
               <td width="30%" style="text-align:right;">
                   学科名称：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtSubject" style="margin-left:10px;" runat="server" Width="200px"></asp:TextBox>
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
    <asp:GridView ID="grdSubject" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="SubjectID" DataSourceID="SqlDataSource1" 
        EmptyDataText="没有可显示的数据记录。" ForeColor="#333333" GridLines="None" 
        style="text-align: center" width="600">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="chk_Allselect" runat="server" oncheckedchanged="chk_AllSelect_CheckedChanged" Text="全选" AutoPostBack="True" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chk_Select" runat="server" 
                        oncheckedchanged="chk_Select_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SubjectID" HeaderText="学科编号" ReadOnly="True" 
                SortExpression="SubjectID" />
            <asp:BoundField DataField="SubjectName" HeaderText="学科名称" 
                SortExpression="SubjectName" />
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
        DeleteCommand="DELETE FROM [Subject] WHERE [SubjectID] = @SubjectID" 
        InsertCommand="INSERT INTO [Subject] ([SubjectID], [SubjectName]) VALUES (@SubjectID, @SubjectName)" 
        SelectCommand="SELECT * FROM [Subject]" 
        UpdateCommand="UPDATE [Subject] SET [SubjectName] = @SubjectName WHERE [SubjectID] = @SubjectID">
        <DeleteParameters>
            <asp:Parameter Name="SubjectID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SubjectID" Type="String" />
            <asp:Parameter Name="SubjectName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SubjectName" Type="String" />
            <asp:Parameter Name="SubjectID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
