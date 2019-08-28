<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_UserType_en.aspx.cs" Inherits="ForeignStudentManager.m_UserType_en" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="Stylesheet" href="css\base.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="left">
    
        <asp:Button ID="btnInsert" runat="server" CssClass="buttoncontrol" Text="Add" 
            onclick="btnInsert_Click" />
        &nbsp;&nbsp;
        <asp:Button ID="btnDelMany" runat="server" CssClass="widbuttoncontrol"  
            Text="Batch Delete" onclick="btnDelMany_Click" Width="150px" />
&nbsp;
        <asp:Label ID="lblResult" runat="server"></asp:Label>
        <br />
        <div id="UserTypeInsert" runat="server" style="margin-top:20px;" visible="false">
        <table border="1" cellspacing="4"  cellpadding="0"  rules="all" style="width: 488px; height: 111px;color:#333333;border-collapse:collapse;" >
            <tr>
               <td width="30%" style="text-align:right;">
                  User Type NO:
               </td>
               <td width="70%" style="text-align:left;">
                   <asp:Label ID="lblUserTypeID" runat="server" style="margin-left:10px;" 
                       runat="server" Width="200px" Text="Label"></asp:Label>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;">
                  User Type：
               </td>
               <td width="70%" style="text-align:left;margin-left:20px;">
               <asp:TextBox ID="txtUserType" style="margin-left:10px;" runat="server" 
                       Width="200px"></asp:TextBox>
               </td>
            </tr>
            <tr>
               <td width="30%" style="text-align:right;">
                   <asp:Button ID="btnOK" runat="server" Text="OK" style="margin-right:10px;" CssClass="buttoncontrol" onclick="btnOK_Click" />
               </td>
               <td width="70%" style="text-align:left;">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="buttoncontrol" onclick="btnCancel_Click" />
               </td>
            </tr>
        </table>
        </div>
        <br />
        <asp:GridView ID="grdUserType" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" 
            onselectedindexchanged="grdUserType_SelectedIndexChanged" 
            DataKeyNames="UserTypeID" Height="35px" Width="600px" 
            style="text-align: center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                <HeaderTemplate>
               <asp:CheckBox ID="chk_AllSelect" runat="server" ControlStyle-Width="100" Text="All" AutoPostBack="True" 
                   oncheckedchanged="chk_AllSelect_CheckedChanged" />
           </HeaderTemplate>
           <ItemTemplate>
               <asp:CheckBox ID="chk_Select" runat="server" 
                   oncheckedchanged="chk_Select_CheckedChanged" />
           </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UserTypeID" ControlStyle-Width="100" HeaderText="User Type NO" 
                    SortExpression="UserTypeID" />
                <asp:BoundField DataField="UserType" HeaderText="User Type"   ControlStyle-Width="150" 
                    SortExpression="UserType" />
                <asp:CommandField ButtonType="Button" EditText="Update" HeaderText="Update"  
                    ShowEditButton="True" UpdateText="OK" />
                <asp:CommandField ButtonType="Button" HeaderText="Delete" 
                    ShowDeleteButton="True" CancelText="Cancel" DeleteText="Delete" EditText="Edit" 
                    InsertText="Insert" NewText="New" SelectText="Select" UpdateText="Update" />
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
            InsertCommand="INSERT INTO [UserTypeEn] ([UserTypeID], [UserType]) VALUES (@UserTypeID, @UserType)" 
            SelectCommand="SELECT [UserTypeID], [UserType] FROM [UserTypeEn]" 
            DeleteCommand="DELETE FROM [UserTypeEn] WHERE [UserTypeID] = @UserTypeID" 
            UpdateCommand="UPDATE [UserTypeEn] SET [UserType] = @UserType WHERE [UserTypeID] = @UserTypeID">
            <DeleteParameters>
                <asp:Parameter Name="UserTypeID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserTypeID" Type="Int32" />
                <asp:Parameter Name="UserType" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserType" Type="String" />
                <asp:Parameter Name="UserTypeID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
