﻿using System;
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
    public partial class m_Majors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            MajorsInsert.Visible = true;
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            int n = 0;
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("insert into Majors values('{0}','{1}','{2}','{3}','{4}','{5}');", txtMajorID.Text, txtMajor.Text,ddlDepartment.SelectedValue,ddlDepartment.SelectedValue,ddlDepartment.SelectedValue,txtSubjectType.Text);
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

            grdMajors.DataBind();

            btnCancel_Click(null, null);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtMajorID.Text = "";
            txtMajor.Text = "";
            MajorsInsert.Visible = false;
        }

        protected void chk_AllSelect_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ck = (CheckBox)sender;
            CheckBox ckt;

            for (int i = 0; i < grdMajors.Rows.Count; i++)
            {
                ckt = (CheckBox)(grdMajors.Rows[i].FindControl("chk_Select"));
                ckt.Checked = ck.Checked;
            }
        }

        protected void btnDelMany_Click(object sender, EventArgs e)
        {
            CheckBox cb;
            string stID;
            int n = 0;
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = "";
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand();
            com.Connection = conn;
            conn.Open();
            for (int i = 0; i < grdMajors.Rows.Count; i++)
            {
                cb = (CheckBox)grdMajors.Rows[i].FindControl("chk_Select");
                if (cb.Checked)
                {
                    stID = grdMajors.Rows[i].Cells[1].Text;
                    if (n == 0)
                    {
                        strSQL = string.Format("delete from Majors where MajorID = '{0}'", stID);
                        n++;
                    }
                    else
                    {
                        strSQL += string.Format(" or MajorID = '{0}'", stID);
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
            else
            {
                lblResult.Text = strSQL;
            }
            com.Dispose();
            conn.Close();
            grdMajors.DataBind();
        }

        protected void chk_Select_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}