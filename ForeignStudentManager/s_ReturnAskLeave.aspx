<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="s_ReturnAskLeave.aspx.cs" Inherits="ForeignStudentManager.s_ReturnAskLeave" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title> 
    <link rel="Stylesheet" href="css\base.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblName" runat="server"></asp:Label>
        <br />
        销假时间：<asp:Label ID="lblReturnBack" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnBack" runat="server" CssClass="buttoncontrol" Text="销假" 
            onclick="btnBack_Click" />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="grdAskLeave" runat="server" CellPadding="4" 
            ForeColor="#333333" Height="40px" 
            style="text-align:center;" Width="1375px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
               
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
        <br />
    
    </div>
    </form>
</body>
</html>
