using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ForeignStudentManager
{
    public partial class m_ReasonLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            int n;
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = "select max(ReasonID) from ReasonLeave;";
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            conn.Open();
            try
            {
                n = (int)com.ExecuteScalar();
                n++;
            }
            catch
            {
                //如果数据库中没有记录，则为n赋值不成功，此时n=1
                n = 1;
            }
            finally
            {
                conn.Dispose();
                conn.Close();
            }
            lblReasonLeaveID.Text = n.ToString();
            ApprovalStateInsert.Visible = true;
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            int n = int.Parse(lblReasonLeaveID.Text);
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("insert into ReasonLeave values({0},'{1}');", n, txtReasonLeave.Text);
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            conn.Open();
            try
            {
                n = com.ExecuteNonQuery();
                if (n == 1)
                {
                    Response.Write(DialogMessage.CreateMessage("添加成功!"));
                }
                else
                {
                    Response.Write(DialogMessage.CreateMessage("添加不成功!"));
                }
            }
            catch (Exception ex)
            {
                lblResult.Text = ex.Message;
            }
            finally
            {
                com.Dispose();
                conn.Close();
            }

            grdReasonLeave.DataBind();

            btnCancel_Click(null, null);
        }

        protected void btnDelMany_Click(object sender, EventArgs e)
        {
            CheckBox cb;
            int ustID, n = 0;
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = "";
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            conn.Open();
            for (int i = 0; i < grdReasonLeave.Rows.Count; i++)
            {
                cb = (CheckBox)grdReasonLeave.Rows[i].FindControl("chk_Select");
                if (cb.Checked)
                {
                    ustID = int.Parse(grdReasonLeave.Rows[i].Cells[1].Text);
                    if (n == 0)
                    {
                        strSQL = string.Format("delete from ReasonLeave where ReasonID = {0}", ustID);
                        n++;
                    }
                    else
                    {
                        strSQL += string.Format(" or ReasonID = {0}", ustID);
                        n++;
                    }

                }
            }
            strSQL += ";";
            com.CommandText = strSQL;
            n = com.ExecuteNonQuery();
            if (n != 0)
            {
                lblResult.Text = string.Format("成功删除了{0}条记录！", n);
            }
            com.Dispose();
            conn.Close();
            grdReasonLeave.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ApprovalStateInsert.Visible = false;
            txtReasonLeave.Text = "";
        }

        protected void chk_Select_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void chk_Allselect_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ck = (CheckBox)sender;

            for (int i = 0; i < grdReasonLeave.Rows.Count; i++)
            {

                ((CheckBox)grdReasonLeave.Rows[i].FindControl("chk_Select")).Checked = ck.Checked;
            }
        }

        protected void grdReasonLeave_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}