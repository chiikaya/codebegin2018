﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_Scholarship.aspx.cs" Inherits="ForeignStudentManager.m_Schloarship" %>

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
        <div id="ScholarshipInsert" runat="server" style="margin-top:20px;" 
            visible="false">
        <table border="1" cellspacing="4"  cellpadding="0"  rules="all" style="width: 488px; height: 296px;color:#333333;border-collapse:collapse;" >
            <tr>
               <td style="text-align:right;" class="style1">
                   奖学金类型编号：
               </td>
               <td width="55%" style="text-align:left;">
                   <asp:TextBox ID="txtScholarID" style="margin-left:10px;" runat="server" Width="200px"></asp:TextBox>
               </td>
            </tr>
            <tr>
               <td style="text-align:right;" class="style1">
                   奖学金类型说明：
               </td>
               <td width="55%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtScholarType" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
             <tr>
               <td style="text-align:right;" class="style1">
                   学生类型：
               </td>
               <td width="55%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtStudentType" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
             <tr>
               <td style="text-align:right;" class="style1">
                   类型：
               </td>
               <td width="55%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtSubjectType" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
             <tr>
               <td style="text-align:right;" class="style1">
                   生活费补贴标准：
               </td>
               <td width="55%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtLivingExpense" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
             <tr>
               <td style="text-align:right;" class="style1">
                   住宿费补贴标准：
               </td>
               <td width="55%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtAccomExpense" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
             <tr>
               <td style="text-align:right;" class="style1">
                   学费补贴标准：
               </td>
               <td width="55%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtTuitionExpense" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
            <tr>
                <td width="35%" style="text-align:right;">
                   <asp:Button ID="btnOK" runat="server" Text="确定" style="margin-right:10px;" CssClass="buttoncontrol" onclick="btnOK_Click" />
               </td>
               <td width="55%" style="text-align:left;">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="buttoncontrol" onclick="btnCancel_Click" />
               </td>
            </tr>
        </table>
            </div>
            </div>
    
    
    <br />
        <br />
        <asp:GridView ID="grdScholarship" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ScholarID" DataSourceID="SqlDataSource2" 
            EmptyDataText="没有可显示的数据记录。" AllowPaging="True" AllowSorting="True" 
            CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align: center" 
            Width="1150px">
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
                <asp:BoundField DataField="ScholarID" HeaderText="编号" ReadOnly="True" 
                    SortExpression="ScholarID" />
                <asp:BoundField DataField="ScholarType" HeaderText="奖学金类型" 
                    SortExpression="ScholarType" />
                <asp:BoundField DataField="StudentType" HeaderText="学生类型" 
                    SortExpression="StudentType" />
                <asp:BoundField DataField="SubjectType" HeaderText="类型" 
                    SortExpression="SubjectType" />
                <asp:BoundField DataField="LivingExpense" HeaderText="生活费补贴标准，元/月" 
                    SortExpression="LivingExpense" />
                <asp:BoundField DataField="AccomExpense" HeaderText="住宿费补贴标准，元/月" 
                    SortExpression="AccomExpense" />
                <asp:BoundField DataField="TuitionExpense" HeaderText="学费补贴标准，元/月" 
                    SortExpression="TuitionExpense" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
            DeleteCommand="DELETE FROM [Schloarship] WHERE [ScholarID] = @ScholarID" 
            InsertCommand="INSERT INTO [Schloarship] ([ScholarID], [ScholarType], [StudentType], [SubjectType], [LivingExpense], [AccomExpense], [TuitionExpense]) VALUES (@ScholarID, @ScholarType, @StudentType, @SubjectType, @LivingExpense, @AccomExpense, @TuitionExpense)" 
            SelectCommand="SELECT [ScholarID], [ScholarType], [StudentType], [SubjectType], [LivingExpense], [AccomExpense], [TuitionExpense] FROM [Schloarship]" 
            
            UpdateCommand="UPDATE [Schloarship] SET [ScholarType] = @ScholarType, [StudentType] = @StudentType, [SubjectType] = @SubjectType, [LivingExpense] = @LivingExpense, [AccomExpense] = @AccomExpense, [TuitionExpense] = @TuitionExpense WHERE [ScholarID] = @ScholarID">
            <DeleteParameters>
                <asp:Parameter Name="ScholarID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ScholarID" Type="String" />
                <asp:Parameter Name="ScholarType" Type="String" />
                <asp:Parameter Name="StudentType" Type="String" />
                <asp:Parameter Name="SubjectType" Type="String" />
                <asp:Parameter Name="LivingExpense" Type="Int16" />
                <asp:Parameter Name="AccomExpense" Type="Int16" />
                <asp:Parameter Name="TuitionExpense" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ScholarType" Type="String" />
                <asp:Parameter Name="StudentType" Type="String" />
                <asp:Parameter Name="SubjectType" Type="String" />
                <asp:Parameter Name="LivingExpense" Type="Int16" />
                <asp:Parameter Name="AccomExpense" Type="Int16" />
                <asp:Parameter Name="TuitionExpense" Type="Int32" />
                <asp:Parameter Name="ScholarID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
