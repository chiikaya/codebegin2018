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
    public partial class m_Studentstate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            int n;
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = "select max(StudentStateID) from StudentState;";
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
            lblStudentStateID.Text = n.ToString();
            StudentStateInsert.Visible = true;
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            int n = int.Parse(lblStudentStateID.Text);
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("insert into StudentState values({0},'{1}');", n, txtStudentState.Text);
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

            grdStudentState.DataBind();

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
            for (int i = 0; i < grdStudentState.Rows.Count; i++)
            {
                cb = (CheckBox)grdStudentState.Rows[i].FindControl("chk_Select");
                if (cb.Checked)
                {
                    ustID = int.Parse(grdStudentState.Rows[i].Cells[1].Text);
                    if (n == 0)
                    {
                        strSQL = string.Format("delete from StudentState where StudentStateID = {0}", ustID);
                        n++;
                    }
                    else
                    {
                        strSQL += string.Format(" or StudentStateID = {0}", ustID);
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
            grdStudentState.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            StudentStateInsert.Visible = false;
            txtStudentState.Text = "";
        }

        protected void chk_select_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void chk_Allselect_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ck = (CheckBox)sender;

            for (int i = 0; i < grdStudentState.Rows.Count; i++)
            {

                ((CheckBox)grdStudentState.Rows[i].FindControl("chk_Select")).Checked = ck.Checked;
            }
        }
    }
}