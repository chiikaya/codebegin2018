using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ForeignStudentManager
{
    public partial class m_RoomStateManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdRoom_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblResult.Text = string.Format("您点击了{0}行",grdRoom.SelectedRow.Cells[1].Text);
           
        }

        protected void chkSelect_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        protected void chkHeader_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ck = (CheckBox)sender;
           
            for (int i = 0; i < grdRoom.Rows.Count; i++)
            {

                ((CheckBox)grdRoom.Rows[i].FindControl("chkSelect")).Checked = ck.Checked;
            }
          //  lblResult.Text = "你选择了全选！";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            lblResult.Text = ((Button)(sender)).CommandArgument.ToString();
        }

        protected void grdRoom_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            lblResult.Text = e.Values[1].ToString();
           // lblResult.Text = grdRoom.DataKeys[e.RowIndex].Value.ToString();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            int n;
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = "select max(RoomStateID) from RoomSate;";
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            conn.Open();
            try
            {
                n = (int)com.ExecuteScalar();

                n++;
            }
            catch
            {//如果数据库中没有记录，则为n赋值不成功，此时n=1
                n = 1;

            }
            finally
            {
                com.Dispose();
                conn.Close();
            }
            lblRoomStateID.Text = n.ToString();
            RoomStateAdd.Visible = true;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            RoomStateAdd.Visible = false;
            txtRoomState.Text = "";
            lblRoomStateID.Text = "";
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            int n=int.Parse(lblRoomStateID.Text);
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("insert into RoomSate values({0},'{1}');",n,txtRoomState.Text);
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            conn.Open();
            n = com.ExecuteNonQuery();
            if (n == 1)
            {
                lblResult.Text = "插入成功！";
            }
            else
            {
                lblResult.Text = "插入不成功！";
            }
            com.Dispose();
            conn.Close();
            grdRoom.DataBind();
            btnCancel_Click(null, null);

        }

        protected void btnDelMany_Click(object sender, EventArgs e)
        {
            CheckBox cb;
            int stID,n=0;
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL="";
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand();
            com.Connection=conn;
            conn.Open();
            for (int i = 0; i < grdRoom.Rows.Count; i++)
            { 
                cb = (CheckBox)grdRoom.Rows[i].FindControl("chkSelect");
                if (cb.Checked)
                {
                    stID = int.Parse(grdRoom.Rows[i].Cells[1].Text);
                   if(n==0)
                   {
                   strSQL =  string.Format("delete from RoomSate where RoomStateID = {0}",stID);
                       n++;
                   }  else
                   {
                     strSQL += string.Format(" or RoomStateID = {0}",stID);
                       n++;
                   }
                   
                }
            }
             strSQL += ";";
             com.CommandText=strSQL;
             n = com.ExecuteNonQuery();
             if (n != 0)
             {
                 lblResult.Text = string.Format("成功删除了{0}条记录！",n);
             }
             com.Dispose();
             conn.Close();
             grdRoom.DataBind();
        }
    }
}