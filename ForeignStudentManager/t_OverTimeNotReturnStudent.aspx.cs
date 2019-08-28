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
    public partial class t_OverTimeNotReturnStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();

            string strSQL = string.Format("select distinct StudentLeaveInfo.StuLeaveID as 请假条编号,PassportName as 护照姓名, ChineseName as 中文名 , ReasonLeaveType as 请假类型,Destination as 目的地,DateStart as 开始时间,DateEnd as 结束时间,DaysLeave as 请假天数,DATEDIFF(dd, DateEnd, GETDATE() ) AS 超期天数  from StudentLeaveInfo,StudentBaseInfo where StudentBaseInfo.StudentID=StudentLeaveInfo.StudentID and StudentLeaveInfo.IsPass=1 and IsFinish=0 and DateEnd < '{0}'  order by DateStart desc;", DateTime.Now);
            // string strSQL = string.Format("select * from StudentLeaveCheckProcess where CheckID='{0}';", Session["UserName"].ToString());
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds, "AskLeave");
            grdAskLeave.DataSource = ds.Tables[0];
            grdAskLeave.DataBind();
        }
    }
}
// DATEDIFF(dd, GETDATE(), DateEnd) AS 超期天数
