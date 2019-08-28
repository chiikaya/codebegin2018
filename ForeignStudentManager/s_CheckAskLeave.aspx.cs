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
    public partial class s_CheckAskLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                string strSQL = string.Format("select StuLeaveID as 请假条编号,ReasonLeaveType as 请假类型,Destination as 目的地,DateStart as 开始时间,DateEnd as 结束时间,DaysLeave as 请假天数,ApprovalStateContent as 请假条状态 from StudentLeaveInfo,AskLeaveApprovalState where StudentLeaveInfo.AskLeaveApprovalStateID=AskLeaveApprovalState.ApprovalStateID and StudentLeaveInfo.AskLeaveApprovalStateID!=1 and StudentID={0} order by DateStart desc;", Session["UserName"].ToString());
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
        protected void grdAskLeave_SelectedIndexChanged(object sender, EventArgs e)
        {
            string AskID = grdAskLeave.SelectedRow.Cells[1].Text;
            Response.Redirect("s_AskLeaveAllContent.aspx?LeaveID=" + AskID);
        }

    }
}