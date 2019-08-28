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
    public partial class m_Schloarship : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            ScholarshipInsert.Visible = true;
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            int n = 0;
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("insert into Schloarship values('{0}','{1}','{2}','{3}',{4},{5},{6});", txtScholarID.Text, txtScholarType.Text, txtStudentType.Text, txtSubjectType.Text, int.Parse(txtLivingExpense.Text), int.Parse(txtAccomExpense.Text), int.Parse(txtTuitionExpense.Text));
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            conn.Open();
            try
            {
                n = com.ExecuteNonQuery();
                if (n == 1)
                {
                    Response.Write(DialogMessage.CreateMessage("插入成功!"));
                }
                else
                {
                    Response.Write(DialogMessage.CreateMessage("插入不成功!"));
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

            grdScholarship.DataBind();

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
            for (int i = 0; i < grdScholarship.Rows.Count; i++)
            {
                cb = (CheckBox)grdScholarship.Rows[i].FindControl("chk_Select");
                if (cb.Checked)
                {
                    ustID = int.Parse(grdScholarship.Rows[i].Cells[1].Text);
                    if (n == 0)
                    {
                        strSQL = string.Format("delete from Schloarship where ScholarID = {0}", ustID);
                        n++;
                    }
                    else
                    {
                        strSQL += string.Format(" or ScholarID = {0}", ustID);
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
            grdScholarship.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ScholarshipInsert.Visible = false;
            txtScholarID.Text = "";
            txtScholarType.Text = "";
            txtStudentType.Text = "";
            txtSubjectType.Text = "";
            txtLivingExpense.Text = "";
            txtAccomExpense.Text = "";
            txtTuitionExpense.Text = "";
        }

        protected void chk_Select_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void chk_Allselect_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ck = (CheckBox)sender;

            for (int i = 0; i < grdScholarship.Rows.Count; i++)
            {

                ((CheckBox)grdScholarship.Rows[i].FindControl("chk_Select")).Checked = ck.Checked;
            }
        }

        protected void grdScholarship_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}