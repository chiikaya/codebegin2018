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
    public partial class s_OutCampusStudentUpdateRoomInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int n = 0;
                string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                string strSQL = string.Format("select max(StuOutCampusID) from StudentOutCampusInfo;");
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand com = new SqlCommand(strSQL, conn);
                conn.Open();
                try
                {
                    n = (int)com.ExecuteScalar();
                }
                catch
                {
                    n = 0;
                }
                n++;
                lblRendID.Text = n.ToString();
                com.Dispose();
                conn.Close();
            }

            
               
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if(filePath.FileName=="")
            {
                  int n=0,StuOutCampusID = int.Parse(lblRendID.Text);
                  string RentingContract=System.IO.Path.GetFileName(filePath.PostedFile.FileName);
                  string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                  string strSQL = string.Format("insert into StudentOutCampusInfo values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}');",StuOutCampusID,Session["UserName"].ToString(),txtAddress.Text,txtName.Text,txtPhone.Text,"null",DateStart.Text,DateEnd.Text);
                  SqlConnection conn = new SqlConnection(strConn);
                   SqlCommand com = new SqlCommand(strSQL, conn);
                   conn.Open();
                   n = com.ExecuteNonQuery();
                   if (n > 0)
                     { 
                       Response.Write(DialogMessage.CreateMessage("租房信息更新成功！"));
                     }
            }else
            {
               Response.Write(DialogMessage.CreateMessage("你还没有选择租房合同复印件！"));
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}