<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_singleStudentInfo.aspx.cs" Inherits="ForeignStudentManager.t_singleStudentInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <br />
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table border="1" width="80%" style="border-collapse:collapse;" >
            </HeaderTemplate>
            <AlternatingItemTemplate>
            
             <tr bgcolor="#C1E9F2">
                <td width="50px">
                学号：</td>
                <td>
                <asp:Label ID="Label16" Text='<%#Eval("StudentID") %>' runat="server" />
                </td>
                <td>
                护照号：
                </td>
                <td>
                 <asp:Label ID="Label1" Text='<%#Eval("PassportNO") %>' runat="server" />
                </td>
                 <td>
                护照姓名：</td>
                <td>
                <asp:Label ID="Label6" Text='<%#Eval("PassportName") %>' runat="server" />
                </td>
                <td>
                中文名：
                </td>
                <td>
                 <asp:Label ID="Label7" Text='<%#Eval("ChineseName") %>' runat="server" />
                </td>


                <td rowspan="4">
                <asp:Image ID="imgPhoto" ImageUrl='<%#Eval("Photo") %>' Height="350px" Width="250px" AlternateText="照片" runat="server" />
                </td>

            </tr>
            <tr bgcolor="#C1E9F2">
                 <td>
                国籍：</td>
                <td>
                <asp:Label ID="Label2" Text='<%#Eval("Nationality") %>' runat="server" />
                </td>
                <td>
                性别：
                </td>
                <td>
                 <asp:Label ID="Label3" Text='<%#Eval("Gender") %>' runat="server" />
                </td>
                <td>
                出生日期：</td>
                <td>
                <asp:Label ID="Label8" Text='<%#Eval("BirthDay") %>' runat="server" />
                </td>
                <td>
                学生类型：
                </td>
                <td>
                 <asp:Label ID="Label9" Text='<%#Eval("StudentType") %>' runat="server" />
                </td>
            </tr>
            <tr bgcolor="#C1E9F2">
                <td>
                学制：</td>
                <td>
                <asp:Label ID="Label4" Text='<%#Eval("LengthSchool") %>' runat="server" />
                </td>
                <td>
                宗教信仰：
                </td>
                <td>
                 <asp:Label ID="Label5" Text='<%#Eval("ReligiousBelif") %>' runat="server" />
                </td>
                  <td>
                学院：</td>
                <td>
                <asp:Label ID="Label10" Text='<%#Eval("Department") %>' runat="server" />
                </td>
                <td>
                专业：
                </td>
                <td>
                 <asp:Label ID="Label11" Text='<%#Eval("Major") %>' runat="server" />
                </td>
            </tr>
              <tr bgcolor="#C1E9F2">
                <td>
                导师姓名：</td>
                <td>
                <asp:Label ID="Label12" Text='<%#Eval("TutorName") %>' runat="server" />
                </td>
                <td>
                导师联系方式：
                </td>
                <td>
                 <asp:Label ID="Label13" Text='<%#Eval("TutorPhone") %>' runat="server" />
                </td>
                  <td>
                家庭住址：</td>
                <td>
                <asp:Label ID="Label14" Text='<%#Eval("HomeAddress") %>' runat="server" />
                </td>
                <td>
                紧急联系电话：
                </td>
                <td>
                 <asp:Label ID="Label15" Text='<%#Eval("EmergencyContactPhone") %>' runat="server" />
                </td>
            </tr>
            
            
            
            </AlternatingItemTemplate>
           
           
            <ItemTemplate>
            <tr bgcolor="#FFF">
                <td width="100px">
                学号：</td>
                <td>
                <asp:Label Text='<%#Eval("StudentID") %>' runat="server" />
                </td>
                <td  width="120px">
                护照号：
                </td>
                <td>
                 <asp:Label ID="Label1" Text='<%#Eval("PassportNO") %>' runat="server" />
                </td>
                 <td  width="100px">
                护照姓名：</td>
                <td>
                <asp:Label ID="Label6" Text='<%#Eval("PassportName") %>' runat="server" />
                </td>
                <td  width="120px">
                中文名：
                </td>
                <td>
                 <asp:Label ID="Label7" Text='<%#Eval("ChineseName") %>' runat="server" />
                </td>


                <td rowspan="4">
                <asp:Image ID="imgPhoto" ImageUrl='<%#Eval("Photo") %>' Height="350px" Width="250px" AlternateText="照片" runat="server" />
                </td>

            </tr>
            <tr>
                 <td>
                国籍：</td>
                <td>
                <asp:Label ID="Label2" Text='<%#Eval("Nationality") %>' runat="server" />
                </td>
                <td>
                性别：
                </td>
                <td>
                 <asp:Label ID="Label3" Text='<%#Eval("Gender") %>' runat="server" />
                </td>
                <td>
                出生日期：</td>
                <td>
                <asp:Label ID="Label8" Text='<%#Eval("BirthDay") %>' runat="server" />
                </td>
                <td>
                学生类型：
                </td>
                <td>
                 <asp:Label ID="Label9" Text='<%#Eval("StudentType") %>' runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                学制：</td>
                <td>
                <asp:Label ID="Label4" Text='<%#Eval("LengthSchool") %>' runat="server" />
                </td>
                <td>
                宗教信仰：
                </td>
                <td>
                 <asp:Label ID="Label5" Text='<%#Eval("ReligiousBelif") %>' runat="server" />
                </td>
                  <td>
                学院：</td>
                <td>
                <asp:Label ID="Label10" Text='<%#Eval("Department") %>' runat="server" />
                </td>
                <td>
                专业：
                </td>
                <td>
                 <asp:Label ID="Label11" Text='<%#Eval("Major") %>' runat="server" />
                </td>
            </tr>
              <tr>
                <td>
                导师姓名：</td>
                <td>
                <asp:Label ID="Label12" Text='<%#Eval("TutorName") %>' runat="server" />
                </td>
                <td>
                导师联系方式：
                </td>
                <td>
                 <asp:Label ID="Label13" Text='<%#Eval("TutorPhone") %>' runat="server" />
                </td>
                  <td>
                家庭住址：</td>
                <td>
                <asp:Label ID="Label14" Text='<%#Eval("HomeAddress") %>' runat="server" />
                </td>
                <td>
                紧急联系电话：
                </td>
                <td>
                 <asp:Label ID="Label15" Text='<%#Eval("EmergencyContactPhone") %>' runat="server" />
                </td>
            </tr>
            </ItemTemplate>

            <FooterTemplate>
            </table>
            </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Conn1 %>" 
            SelectCommand="SELECT * FROM [StudentBaseAndEdu]">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
