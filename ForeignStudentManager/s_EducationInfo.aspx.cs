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
    public partial class s_EducationInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();//访问连接字符串
                string strSQL = string.Format("select StuLeaveID as 请假条编号,ReasonLeaveType as 请假类型,Destination as 目的地,DateStart as 开始时间,DateEnd as 结束时间,DaysLeave as 请假天数,ApprovalStateContent as 请假条状态 from StudentLeaveInfo,AskLeaveApprovalState where StudentLeaveInfo.AskLeaveApprovalStateID=AskLeaveApprovalState.ApprovalStateID and StudentLeaveInfo.AskLeaveApprovalStateID=1 and StudentID={0} order by DateStart desc;", Session["UserName"].ToString());
                SqlConnection conn = new SqlConnection(strConn);//创建一个连接对象，包含了连接字符串
                SqlCommand com = new SqlCommand(strSQL, conn);//创建了一个存储对象，包含了SQL语句和连接对象
                SqlDataAdapter da = new SqlDataAdapter();//创建了一个适配器对象
                da.SelectCommand = com;
                DataSet ds = new DataSet();//创建一个数据集
                da.Fill(ds, "AskLeave");//填充数据集
                //grdAskLeave.DataSource = ds.Tables[0];//选择数据集中的第一个数据表
                //grdAskLeave.DataBind();
            }
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxtEducationType_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxtDepartment_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxtMajoy_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxtTutorName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxttutorPhone_TextChanged(object sender, EventArgs e)
        {

        }
    }
}