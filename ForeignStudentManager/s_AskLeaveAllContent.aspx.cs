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
    public partial class s_AskLeaveAllContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             string strLeaveID="";
             int LeaveID=0;
             DateTime dt;
             if (Request["LeaveID"] != null && Session["UserName"]!=null)
             {
                 strLeaveID = Request["LeaveID"].ToString();
                 LeaveID = int.Parse(strLeaveID);
                 lblAskLeaveID.Text = strLeaveID;
                 string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                 string strSQL = string.Format("select PassportName,ChineseName from StudentBaseInfo where StudentID='{0}';", Session["UserName"].ToString());
                 SqlConnection conn = new SqlConnection(strConn);
                 SqlCommand com = new SqlCommand(strSQL, conn);
                 conn.Open();
                 SqlDataReader dr = com.ExecuteReader();
                 if (dr.HasRows)
                 {
                     dr.Read();
                     lblStudentName.Text = string.Format("英文名：{0}，中文名：{1}",dr.GetValue(0).ToString(),dr.GetValue(1).ToString());
                 }
                 
                 strSQL = string.Format("select ReasonLeaveType,ReasonLeaveContent,Destination,DateStart,DateEnd,DaysLeave from StudentLeaveInfo where StuLeaveID={0};", LeaveID);
                 com.CommandText = strSQL;
                 dr.Close();
                 dr = com.ExecuteReader();
                 if (dr.HasRows)
                 {
                     dr.Read();
                     lblAskLeaveType.Text = dr.GetValue(0).ToString();
                     lblContent.Text = dr.GetValue(1).ToString();
                     lblDestination.Text = dr.GetValue(2).ToString();
                     lblTime.Text = string.Format("从{0}到{1}共计{2}天。", dr.GetValue(3).ToString(), dr.GetValue(4).ToString(), dr.GetValue(5).ToString());
                 }
                 strSQL = string.Format("select TeacherName,IsPass,CheckDate from StudentLeaveCheckProcess,TeacherManager where CheckID=TeacherID and StuLeaveID={0} and IsPass is not null order by CheckDate asc;", LeaveID);
                 com.CommandText = strSQL;
                 dr.Close();
                 dr = com.ExecuteReader();
                 if (dr.HasRows)
                 {

                    if( dr.Read())
                     {
                         dt = (DateTime)dr.GetValue(2);
                         lblTutor.Text = string.Format("{0} <br/> {1}     {2}年{3}月{4}日{5}点", dr.GetValue(1).ToString(), dr.GetValue(0).ToString(), dt.Year, dt.Month, dt.Day,dt.Hour);   
                     }
                    if (dr.Read())
                    {
                        dt = (DateTime)dr.GetValue(2);
                        lblTeaching.Text = string.Format("{0} <br/> {1}     {2}年{3}月{4}日{5}点", dr.GetValue(1).ToString(), dr.GetValue(0).ToString(), dt.Year, dt.Month, dt.Day, dt.Hour);
                    }
                    if (dr.Read())
                    {
                        dt = (DateTime)dr.GetValue(2);
                        lblService.Text = string.Format("{0} <br/> {1}     {2}年{3}月{4}日{5}点", dr.GetValue(1).ToString(), dr.GetValue(0).ToString(), dt.Year, dt.Month, dt.Day, dt.Hour);
                    }
                    if (dr.Read())
                    {
                        dt = (DateTime)dr.GetValue(2);
                        lblManager.Text = string.Format("{0} <br/> {1}     {2}年{3}月{4}日{5}点", dr.GetValue(1).ToString(), dr.GetValue(0).ToString(), dt.Year, dt.Month, dt.Day, dt.Hour);
                    }
                 
                 }


                 com.Dispose();
                 conn.Close();

              //   lblAskLeaveType.Text =




           
             }
             else
             {
                 AddAskLeave.Visible = false;
             }
           
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("s_CheckAskLeave.aspx");
        }
    }
}