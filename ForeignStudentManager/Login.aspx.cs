using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ForeignStudentManager
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("UserName");
            Session.Remove("UserType");
                  
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            if(txtUserName.Text!="" &&  txtPass.Text!="")
            {
                int n=0;
                string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                string strSQL = string.Format("select count(*) from Users,UserType where Users.UserType=UserType.UserTypeID and Users.UserName='{0}' and Password='{1}' and UserType.UserType='{2}';", txtUserName.Text,txtPass.Text,radUserType.SelectedValue);
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand com = new SqlCommand(strSQL, conn);
                conn.Open();
                n = (int)com.ExecuteScalar();
                if (n != 0)
                {
                    Session.Add("UserName", txtUserName.Text);
                    Session.Add("UserType", radUserType.SelectedValue);
                    switch (radUserType.SelectedValue)
                    {
                        case "学生":
                            Response.Redirect("Student.html");
                            break;
                        case "管理员":
                            Response.Redirect("admin_en.html");
                            break;
                        case "管理人员":
                            Response.Redirect("teacher_en.html");
                            break;
                    }
                }
                else
                {
                    lblResult.Text = "用户名或密码不正确，请检查后重新输入！";
                }
            }
            else
            {
                lblResult.Text = "用户名或密码不能为空，请重新输入！";
            }
            
          
        }
    }
}