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
    public partial class s_ReturnAskLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                    string UserType = Session["UserType"].ToString();
                   
                    SqlConnection conn = new SqlConnection(strConn);
                    string strSQL = string.Format("select PassportName from {0} where StudentID='{1}';", "StudentBaseInfo", Session["UserName"].ToString());
                    SqlCommand com = new SqlCommand(strSQL,conn);
                    conn.Open();
                   
                    lblName.Text = com.ExecuteScalar().ToString();


                    strSQL = string.Format("select StuLeaveID as 请假条编号,ReasonLeaveType as 请假类型,Destination as 目的地,DateStart as 开始时间,DateEnd as 结束时间,DaysLeave as 请假天数,ApprovalStateContent as 请假条状态 from StudentLeaveInfo,AskLeaveApprovalState where StudentLeaveInfo.AskLeaveApprovalStateID=AskLeaveApprovalState.ApprovalStateID and StudentLeaveInfo.IsFinish=0 and StudentLeaveInfo.IsPass=1 and StudentID={0} order by DateStart desc;", Session["UserName"].ToString());
                    com.CommandText = strSQL;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = com;
                    DataSet ds = new DataSet();
                    da.Fill(ds, "AskLeave");
                    grdAskLeave.DataSource = ds.Tables[0];
                    grdAskLeave.DataBind();



                    com.Dispose();
                    conn.Close();
                       
                }
            }
            lblReturnBack.Text = DateTime.Now.ToLongDateString();

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string UserType = Session["UserType"].ToString();
            int LeaveID=0,n;
            DateTime dt;
            int OvercasDays=0;
            SqlConnection conn = new SqlConnection(strConn);
            //select StuLeaveID,DateEnd from StudentLeaveInfo where StudentID='2018421062' and IsFinish=0 and IsPass=1 and  DateStart < 2018/1/28 19:49:27 ;
            string strSQL = string.Format("select StuLeaveID,DateEnd from StudentLeaveInfo where StudentID='{0}' and IsFinish=0 and IsPass=1 and  DateStart < '{1}';", Session["UserName"].ToString(), DateTime.Now);
            SqlCommand com = new SqlCommand(strSQL, conn);
            conn.Open();
            SqlDataReader dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    
                    LeaveID = (int)dr.GetValue(0);
                    dt=(DateTime)dr.GetValue(1);
                    OvercasDays=(dt-DateTime.Now).Days;
                    if(OvercasDays <=-1)//超期
                    {
                        strSQL = string.Format("update StudentLeaveInfo set DateReturn ='{0}',IsFinish=1,IsExceed=1,ExceedDays={1} where StuLeaveID={2};", DateTime.Now,-OvercasDays , LeaveID);
                    }
                    else
                    {
                        strSQL = string.Format("update StudentLeaveInfo set DateReturn ='{0}',IsFinish=1,IsExceed=0 where StuLeaveID={1};", DateTime.Now, LeaveID);
                  
                    }
                   
                }
                dr.Close();
                com.CommandText = strSQL;
                n=com.ExecuteNonQuery();
                if (n != 0)
                {
                    if (OvercasDays < 0)
                        lblResult.Text = string.Format("销假完成！你假期超期了{0}天。", OvercasDays);
                    else
                        lblResult.Text = string.Format("欢迎您按时销假！");
                }
                    
            }
            else
            {
                lblResult.Text = "没有合适的请假条！";
            }

            Response.Redirect(Request.Url.ToString());


           
        }
    }
}