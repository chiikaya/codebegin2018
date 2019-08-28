using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace ForeignStudentManager
{
    public partial class r_roomanager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                string sqlstr = string.Format("select distinct Building from Rooms;");
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand com = new SqlCommand(sqlstr, conn);
                ListItem ls;
                conn.Open();
                SqlDataReader dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    DropDownList1.Items.Add("不限");
                    while (dr.Read())
                    {
                        DropDownList1.Items.Add(dr.GetValue(0).ToString());
                    }
                }
                dr.Close();
                sqlstr = string.Format("select distinct RoomType from RoomType;");
                com.CommandText = sqlstr;
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    DropDownList2.Items.Add("不限");
                    while (dr.Read())
                    {
                        DropDownList2.Items.Add(dr.GetValue(0).ToString());
                    }
                }
                dr.Close();
                sqlstr = string.Format("select distinct RoomState from RoomSate;");
                com.CommandText = sqlstr;
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    DropDownList3.Items.Add("不限");
                    while (dr.Read())
                    {
                        DropDownList3.Items.Add(dr.GetValue(0).ToString());
                    }
                }
                dr.Close();
                conn.Close();
                conn.Dispose();
            }
            QRresult.Text = string.Format("总人数为：{0}人。", GridView1.Rows.Count);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int n = 0;
            string strCondition = "";
            if (DropDownList1.SelectedValue != "不限")
            {

                strCondition += string.Format(" Rooms.Building = '{0}' ", DropDownList1.SelectedValue);
                n++;
            }
            if (DropDownList2.SelectedValue != "不限")
            {
                if (n != 0)
                {
                    strCondition += string.Format(" and RoomType.RoomType = '{0}' ", DropDownList2.SelectedValue);
                }
                else
                {
                    strCondition += string.Format(" RoomType.RoomType = '{0}' ", DropDownList2.SelectedValue);
                }
                n++;
            }
            if (DropDownList3.SelectedValue != "不限")
            {
                if (n != 0)
                {
                    strCondition += string.Format(" and RoomSate.RoomState = '{0}' ", DropDownList3.SelectedValue);
                }
                else
                {
                    strCondition += string.Format(" RoomSate.RoomState = '{0}' ", DropDownList3.SelectedValue);
                }
                n++;
            }
            string strSQL = string.Format("SELECT Rooms.RoomID, Rooms.Building AS 楼号, Rooms.RoomNo AS 房间号, Rooms.Floor AS 楼层, RoomType.RoomType AS 房间类型, Rooms.RoomPrice AS 每学年住宿费用, Rooms.StudentNumber AS 已入住人数, RoomSate.RoomState AS 房间状态 FROM Rooms INNER JOIN RoomType ON Rooms.RoomType = RoomType.RoomTypeID INNER JOIN RoomSate ON Rooms.State = RoomSate.RoomStateID ");
            if (strCondition != "")
                strSQL += string.Format("where {0} order by Rooms.RoomID desc;", strCondition);
            SqlDataSource1.SelectCommand = strSQL;
            GridView1.DataBind();
            QRresult.Text = string.Format("满足条件的学生有{0}人。", GridView1.Rows.Count);
        }
    }
}