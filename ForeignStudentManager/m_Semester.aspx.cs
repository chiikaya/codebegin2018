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
    public partial class m_Semester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            int n;
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = "select max(SemesterID) from Semester;";
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
            lblSemesterID.Text = n.ToString();
            SemesterInsert.Visible = true;
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            int n = int.Parse(lblSemesterID.Text);
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("insert into Semester values({0},'{1}','{2}','{3}',{4});", n, txtSemesterName.Text,Convert.ToDateTime(txtDateStart.Text),Convert.ToDateTime(txtDateEnd.Text),int.Parse(txtYear.Text));
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

            grdSemester.DataBind();

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
            for (int i = 0; i < grdSemester.Rows.Count; i++)
            {
                cb = (CheckBox)grdSemester.Rows[i].FindControl("chk_Select");
                if (cb.Checked)
                {
                    ustID = int.Parse(grdSemester.Rows[i].Cells[1].Text);
                    if (n == 0)
                    {
                        strSQL = string.Format("delete from Semester where SemesterID = {0}", ustID);
                        n++;
                    }
                    else
                    {
                        strSQL += string.Format(" or SemesterID = {0}", ustID);
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
            grdSemester.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SemesterInsert.Visible = false;
            txtSemesterName.Text = "";
            txtDateStart.Text = "";
            txtDateEnd.Text = "";
            txtYear.Text = "";

        }

        protected void chk_select_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void chk_Allselect_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ck = (CheckBox)sender;

            for (int i = 0; i < grdSemester.Rows.Count; i++)
            {

                ((CheckBox)grdSemester.Rows[i].FindControl("chk_Select")).Checked = ck.Checked;
            }
        }
    }
}