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
    public partial class t_CheckStudentAskLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();

                    string strSQL = string.Format("select StudentLeaveInfo.StuLeaveID as 请假条编号,PassportName as 护照姓名, ChineseName as 中文名 , CheckTurn as 审批顺序,ReasonLeaveType as 请假类型,Destination as 目的地,DateStart as 开始时间,DateEnd as 结束时间,DaysLeave as 请假天数 from StudentLeaveInfo,StudentLeaveCheckProcess,StudentBaseInfo where StudentLeaveCheckProcess.IsPass is null and StudentBaseInfo.StudentID=StudentLeaveInfo.StudentID and StudentLeaveCheckProcess.StuLeaveID=StudentLeaveInfo.StuLeaveID and CheckID='{0}' order by DateStart desc;", Session["UserName"].ToString());
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

        protected void UpdateGridView()
        { 
                    string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();

                    string strSQL = string.Format("select StudentLeaveInfo.StuLeaveID as 请假条编号,PassportName as 护照姓名, ChineseName as 中文名 , CheckTurn as 审批顺序,ReasonLeaveType as 请假类型,Destination as 目的地,DateStart as 开始时间,DateEnd as 结束时间,DaysLeave as 请假天数 from StudentLeaveInfo,StudentLeaveCheckProcess,StudentBaseInfo where StudentLeaveCheckProcess.IsPass is null and StudentBaseInfo.StudentID=StudentLeaveInfo.StudentID and StudentLeaveCheckProcess.StuLeaveID=StudentLeaveInfo.StuLeaveID and CheckID='{0}' order by DateStart desc;", Session["UserName"].ToString());
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

        protected void chk_AllSelect_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ck = (CheckBox)sender;
            CheckBox ckt;

            for (int i = 0; i < grdAskLeave.Rows.Count; i++)
            {
                ckt = (CheckBox)(grdAskLeave.Rows[i].FindControl("chk_Select"));
                ckt.Checked = ck.Checked;
            }
        }

        protected void grdAskLeave_SelectedIndexChanged(object sender, EventArgs e)
        {
            string AskID = grdAskLeave.SelectedRow.Cells[1].Text;
            Response.Redirect("s_AskLeaveAllContent.aspx?LeaveID=" + AskID);
        }

        protected void radNoPass_CheckedChanged(object sender, EventArgs e)
        {
            int i;
            RadioButton rd;
            TextBox txt;
            Button btn;
            for (i = 0; i < grdAskLeave.Rows.Count; i++)
            {
                rd = (RadioButton)grdAskLeave.Rows[i].FindControl("radNoPass");
                txt = (TextBox)grdAskLeave.Rows[i].FindControl("txtRejectReason");
                btn = (Button)grdAskLeave.Rows[i].FindControl("btnOK");
                if (rd.Checked)
                {
                    
                    txt.Visible = true;
                    btn.Visible = true;
                }
                else
                {
                    txt.Visible = false;
                    btn.Visible = false;
                }
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            int LeaveID,n=0,turn,stateID=0;
            Button btn = (Button)sender;
            LeaveID = int.Parse(btn.CommandArgument);
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                                         //update StudentLeaveCheckProcess set IsPass='同意' where StuLeaveId=7;
         
            
            string strSQL;
            strSQL = string.Format("select CheckTurn from AskLeaveCheckTurn where CheckTeacherID = '{0}';", Session["UserName"].ToString());
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            SqlDataReader dr;
            conn.Open();
            turn = (int)com.ExecuteScalar();
            strSQL = string.Format("select count(*) from StudentLeaveCheckProcess where StuLeaveID={0} and CheckTurn={1} and IsPass is not null;", LeaveID,turn);
            com.CommandText = strSQL;
            n=(int)com.ExecuteScalar();
            
            strSQL = string.Format("update StudentLeaveCheckProcess set IsPass='{0}',Checkdate='{1}' where StuLeaveId={2} and CheckID='{3}';", "同意", DateTime.Now, LeaveID, Session["UserName"].ToString());
            strSQL += string.Format("delete StudentLeaveCheckProcess where StuLeaveId={0} and CheckID!='{1}' and IsPass is null;", LeaveID, Session["UserName"].ToString());
            com.CommandText = strSQL;
            // Response.Write(DialogMessage.CreateMessage(strSQL));
              n = com.ExecuteNonQuery();
                if (n > 0)
                {

                    //  Response.Write(DialogMessage.CreateMessage(turn.ToString()));
                    switch (turn)
                    {
                        case 1:
                            stateID = 3;
                            break;
                        case 2:
                            stateID = 5;
                            break;
                        case 3:
                            stateID = 7;
                            break;
                        case 4:
                            stateID = 9;
                            break;
                    }
                    if (turn == 4)
                    {
                        strSQL = string.Format("update StudentLeaveInfo set AskLeaveApprovalStateID={0},IsPass={1} where StuLeaveID={2};", stateID, 1, LeaveID);
                        //请假条审批完成
                        com.CommandText = strSQL;
                        com.ExecuteNonQuery();
                        Response.Write(DialogMessage.CreateMessage("审批成功！"));
                    }
                    else
                    {
                        turn++;
                     //   Response.Write(DialogMessage.CreateMessage(turn.ToString()));
                        strSQL = string.Format("select CheckTeacherID from AskLeaveCheckTurn where CheckTurn = {0};", turn);
                        com.CommandText = strSQL;
                        dr = com.ExecuteReader();
                        strSQL = "";
                        string chkID;
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                chkID = dr.GetValue(0).ToString();
                                strSQL += string.Format("insert into StudentLeaveCheckProcess(StuLeaveID,CheckTurn,CheckID) values({0},{1},'{2}');", LeaveID, turn, chkID);
                            }
                        }
                        else
                        {
                           // Response.Write(DialogMessage.CreateMessage(turn.ToString()));
                        }
                        dr.Close();
                        com.CommandText = strSQL;
                        n = com.ExecuteNonQuery();
                      //  Response.Write(DialogMessage.CreateMessage("n=" + n.ToString()));
                        if (n > 0)
                        {
                            strSQL = string.Format("update StudentLeaveInfo set AskLeaveApprovalStateID={0} where StuLeaveID={1};", stateID, LeaveID);
                            com.CommandText = strSQL;
                            com.ExecuteNonQuery();
                            Response.Write(DialogMessage.CreateMessage("审批完成！"));

                        }

                    }

                }
                else
                {
                    Response.Write(DialogMessage.CreateMessage("没有成功！"));
                }
                UpdateGridView();
            
          
            com.Dispose();
            conn.Close();

        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int LeaveID;
            Button btn = (Button)sender;
            LeaveID = int.Parse(btn.CommandArgument);
            ReasonReject.Visible = true;
            lblLeaveID.Text = btn.CommandArgument;
            
                 
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int n = 0, turn, stateID = 0;
            int LeaveID=int.Parse(lblLeaveID.Text);
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                                          //update StudentLeaveCheckProcess set IsPass='同意' where StuLeaveId=7;

            string strSQL = string.Format("update StudentLeaveCheckProcess set IsPass='{0}',ReasonForNoPass='{1}',CheckDate='{2}' where StuLeaveID={3} and CheckID='{4}';", "不同意", txtReason.Text, DateTime.Now, LeaveID,Session["UserName"].ToString());
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();
            SqlCommand com = new SqlCommand(strSQL, conn);
            n = com.ExecuteNonQuery();
            if (n > 0)
            {
                strSQL = string.Format("select CheckTurn from AskLeaveCheckTurn where CheckTeacherID = '{0}';", Session["UserName"].ToString());
                com.CommandText = strSQL;
                turn = (int)com.ExecuteScalar();
                switch (turn)
                {
                    case 1:
                        stateID = 4;
                        break;
                    case 2:
                        stateID = 6;
                        break;
                    case 3:
                        stateID = 8;
                        break;
                    case 4:
                        stateID = 10;
                        break;
                }
                strSQL = string.Format("Update StudentLeaveInfo set IsPass={0},AskLeaveApprovalStateID={1} where StuLeaveID={2};",-1,stateID, LeaveID);
                com.CommandText = strSQL;
                com.ExecuteNonQuery();
                Response.Write(DialogMessage.CreateMessage("审核处理完成！"));
                UpdateGridView();
            }

            com.Dispose();
            conn.Close();
            ReasonReject.Visible = false;
            txtReason.Text = "";
        }

       
    }
}