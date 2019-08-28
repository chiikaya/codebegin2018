using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ForeignStudentManager
{
    public partial class m_top : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                lblHello.Text = "登录不成功！";
            }
            else
            {
                string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                string UserType = Session["UserType"].ToString();
                string name;
                string strSQL = "";
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand com = new SqlCommand();
                com.Connection = conn;
                switch (UserType)
                { 
                    case "学生":
                        strSQL = string.Format("select PassportName from {0} where StudentID='{1}';", "StudentBaseInfo", Session["UserName"].ToString());
                        break;
                    case "管理员":
                     
                    case "管理人员":
                        strSQL = string.Format("select TeacherName from {0} where TeacherID='{1}';", "TeacherManager", Session["UserName"].ToString());
                        break;
                }
                com.CommandText = strSQL;
                conn.Open();
                name = com.ExecuteScalar().ToString();
                com.Dispose();
                conn.Close();
                lblHello.Text = string.Format("用户{0},欢迎您！", name);
              
                
               
            }
        }

        protected void linkLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("UserName");
            Session.Remove("UserType");
            form1.Target = "_top";
            Response.Redirect("Login.aspx",true);

        }
    }
}