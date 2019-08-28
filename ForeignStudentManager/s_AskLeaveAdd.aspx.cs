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
    public partial class s_AskLeaveAdd : System.Web.UI.Page
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
                    UpdateData();
                }
            }
           
        }

        protected void UpdateData()
        {

            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("select StuLeaveID as 请假条编号,ReasonLeaveType as 请假类型,Destination as 目的地,DateStart as 开始时间,DateEnd as 结束时间,DaysLeave as 请假天数,ApprovalStateContent as 请假条状态 from StudentLeaveInfo,AskLeaveApprovalState where StudentLeaveInfo.AskLeaveApprovalStateID=AskLeaveApprovalState.ApprovalStateID and StudentLeaveInfo.AskLeaveApprovalStateID=1 and StudentID={0} order by DateStart desc;", Session["UserName"].ToString());
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = com;
            DataSet ds = new DataSet();
            da.Fill(ds, "AskLeave");
            grdAskLeave.DataSource = ds.Tables[0];
            grdAskLeave.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int n,m=0;
            int year, month, day;
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = "select max(StuLeaveID) from StudentLeaveInfo;";
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
            strSQL = "insert into StudentLeaveInfo(StuLeaveID,StudentID,ReasonLeaveType,ReasonLeaveContent,Destination,DateStart,DateEnd,DaysLeave,ProofFilePath,Year,Semester,AskLeaveApprovalStateID,IsPass) values(";
            strSQL += string.Format("{0}", n);
            strSQL += string.Format(",'{0}'", Session["UserName"].ToString());
            strSQL += string.Format(",'{0}'", ddlLeaveType.SelectedValue.ToString());
            strSQL += string.Format(",'{0}'", txtContent.Text);
            strSQL += string.Format(",'{0}'", txtDestination.Text);
            strSQL += string.Format(",'{0}'", txtStart.Text);
            strSQL += string.Format(",'{0}'", txtEnd.Text);
            year = int.Parse(txtStart.Text.Substring(0,4));
            month = int.Parse(txtStart.Text.Substring(5,2));
            day =int.Parse(txtStart.Text.Substring(8,2));
            DateTime dtstart = new DateTime(year,month,day);
            year = int.Parse(txtEnd.Text.Substring(0, 4));
            month = int.Parse(txtEnd.Text.Substring(5, 2));
            day = int.Parse(txtEnd.Text.Substring(8, 2));
            DateTime dtend = new DateTime(year, month, day);
            m = (dtend - dtstart).Days;
            strSQL += string.Format(",{0}", m);
            strSQL += string.Format(",{0}", "null");//proofFilePath
            strSQL += string.Format(",{0}", year); //year
            strSQL += string.Format(",{0}", "null"); //semester
            strSQL += string.Format(",{0}", 1);
            strSQL += string.Format(",{0}", 0);//0表示还没有审核意见，1表示同意，-1表示布同意。
            strSQL += ");";
            com.CommandText = strSQL;
            n = com.ExecuteNonQuery();
            if (n == 1)
            {
                Response.Write(DialogMessage.CreateMessage("请假条添加成功！"));
            }
            else
            {
                Response.Write(DialogMessage.CreateMessage("请假条添加失败！"));
            }
            com.Dispose();
            conn.Close();
            Response.Redirect(Request.Url.ToString());//防止二次提交保存
           // UpdateData();
        }

        protected void txtEnd_TextChanged(object sender, EventArgs e)
        {
            int year, month, day;
            int m = 0;
            if (txtStart.Text != "" && txtEnd.Text != "")
            {
                year = int.Parse(txtStart.Text.Substring(0, 4));
                month = int.Parse(txtStart.Text.Substring(5, 2));
                day = int.Parse(txtStart.Text.Substring(8, 2));
                DateTime dtstart = new DateTime(year, month, day);
                if (dtstart < DateTime.Now)
                {
                    Response.Write(DialogMessage.CreateMessage("请假时间不能早于今天！"));
                    txtStart.Text = "";
                    txtEnd.Text = "";
                    lblDaysLeave.Text = "";
                    return;
                }
                year = int.Parse(txtEnd.Text.Substring(0, 4));
                month = int.Parse(txtEnd.Text.Substring(5, 2));
                day = int.Parse(txtEnd.Text.Substring(8, 2));
                DateTime dtend = new DateTime(year, month, day);
                m = (dtend - dtstart).Days;
                if (m < 0)
                {
                    Response.Write(DialogMessage.CreateMessage("请假开始时间不能晚于请假结束时间！"));
                    txtStart.Text = "";
                    txtEnd.Text = "";
                    lblDaysLeave.Text = "";
                    return;
                }
                lblDaysLeave.Text = m.ToString();
            }
        }

        protected void txtStart_TextChanged(object sender, EventArgs e)
        {
            int year, month, day;
            int m = 0;
            if (txtStart.Text != "")
            {
                year = int.Parse(txtStart.Text.Substring(0, 4));
                month = int.Parse(txtStart.Text.Substring(5, 2));
                day = int.Parse(txtStart.Text.Substring(8, 2));
                DateTime dtstart = new DateTime(year, month, day);
                if (dtstart < DateTime.Now)
                {
                    Response.Write(DialogMessage.CreateMessage("请假时间不能早于今天！"));
                    txtStart.Text = "";
                    txtEnd.Text = "";
                    lblDaysLeave.Text = "";
                    return;
                }
                if (txtEnd.Text != "")
                {
                    year = int.Parse(txtEnd.Text.Substring(0, 4));
                    month = int.Parse(txtEnd.Text.Substring(5, 2));
                    day = int.Parse(txtEnd.Text.Substring(8, 2));
                    DateTime dtend = new DateTime(year, month, day);
                    m = (dtend - dtstart).Days;
                    if (m < 0)
                    {
                        Response.Write(DialogMessage.CreateMessage("请假开始时间不能晚于请假结束时间！"));
                        txtStart.Text = "";
                        txtEnd.Text = "";
                        lblDaysLeave.Text = "";
                        return;
                    }
                    lblDaysLeave.Text = m.ToString();
                }
            }
            

        }

        protected void grdAskLeave_SelectedIndexChanged(object sender, EventArgs e)
        {
            int AskID = int.Parse(grdAskLeave.SelectedRow.Cells[2].Text);
            int n=0;
            string CheckID;
            lblResult.Text = AskID.ToString();
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("update StudentLeaveInfo set AskLeaveApprovalStateID=2 where StuLeaveID={0};",AskID);
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            SqlDataReader dr;
            conn.Open();
            n = com.ExecuteNonQuery();
            if (n == 1)
            {
                strSQL = string.Format("select CheckTeacherID from AskLeaveCheckTurn where CheckTurn = 1;");
                com.CommandText = strSQL;
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    strSQL = "";
                    while (dr.Read())
                    {
                        CheckID = dr.GetValue(0).ToString();
                        strSQL += string.Format("insert into StudentLeaveCheckProcess(StuLeaveID,CheckTurn,CheckID) values({0},1,'{1}');", AskID, CheckID);
                    }
                    dr.Close();
                    com.CommandText = strSQL;
                    n = com.ExecuteNonQuery();
                    Response.Write(DialogMessage.CreateMessage("提交成功，请等待辅导员审核！"));
                }
                else
                {
                    strSQL = string.Format("update StudentLeaveInfo set AskLeaveApprovalStateID=1 where StuLeaveID={0};", AskID);
                    com.CommandText = strSQL;
                    com.ExecuteNonQuery();
                    Response.Write(DialogMessage.CreateMessage("提交不成功，请联系管理员！"));
                }
               
            }
            else
            {
                Response.Write(DialogMessage.CreateMessage("提交不成功，请联系系统管理员！"));
            }


            com.Dispose();
            conn.Close();
            UpdateData();
            
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int LeaveID, n = 0;
            Button btn = (Button)sender;
            LeaveID = int.Parse(btn.CommandArgument);
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("delete StudentLeaveInfo where StuLeaveID={0};", LeaveID);
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            conn.Open();
            n = com.ExecuteNonQuery();
            if (n != 0)
            {
                Response.Write(DialogMessage.CreateMessage("删除成功！"));
                
            }
            else
            { 
              Response.Write(DialogMessage.CreateMessage("删除不成功！"));
            }
            com.Dispose();
            conn.Close();
            UpdateData();
          
        }

      
    }
}