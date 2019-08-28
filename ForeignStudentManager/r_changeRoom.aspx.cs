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
    public partial class r_changeRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                string sqlstr = string.Format("select distinct Building from Rooms;");
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand com = new SqlCommand(sqlstr, conn);
                //ListItem ls;
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
            ssresult.Text = string.Format("学生总人数为{0}人。", GridView2.Rows.Count);
            srresult.Text = string.Format("总房间数为{0}个。", GridView1.Rows.Count);
        }

        protected void sqroom_Click(object sender, EventArgs e)
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
            SqlDataSource2.SelectCommand = strSQL;
            GridView1.DataBind();
            srresult.Text = string.Format("满足条件的宿舍有{0}个。", GridView1.Rows.Count);
        }

        protected void sqstudent_Click(object sender, EventArgs e)
        {
            string sqlCondition = "";
            if (TextBox1.Text != null)
            {
                sqlCondition += string.Format(" StudentBaseInfo.StudentID = '{0}' ", TextBox1.Text);
            }
            string strsql = string.Format("SELECT Rooms.Building AS 楼号, Rooms.RoomNo AS 房间号, Rooms.Floor AS 楼层, StudentBaseInfo.StudentID as 学生学号, StudentBaseInfo.ChineseName AS 中文名字, StudentBaseInfo.Nationality AS 国籍, StudentBaseInfo.Gender AS 性别, StudentBaseInfo.StudentType AS 学生类型, StudentBaseInfo.PhoneNumber AS 联系方式, StudentBaseInfo.EmergencyContactPhone AS 紧急联系方式 FROM StudentBaseInfo INNER JOIN StudentInCampusInfo ON StudentBaseInfo.StudentID = StudentInCampusInfo.StudentID INNER JOIN Rooms ON StudentInCampusInfo.RoomID = Rooms.RoomID ");
            if (sqlCondition != "")
                strsql += string.Format("where {0} order by StudentBaseInfo.StudentID desc;", sqlCondition);
            SqlDataSource1.SelectCommand = strsql;
            GridView2.DataBind();
            if (GridView2.Rows.Count != 0)
                ssresult.Text = "找到目标学生";
            else
                ssresult.Text = "未找到目标学生";

        }

        protected bool change(string stuID, int RID)
        {
            string sqlcondition = "";
            //更改学生住宿表里面的房间ID
            sqlcondition += string.Format("update StudentInCampusInfo set RoomID ={0} where StudentID = {1} ;",RID, stuID);
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            using(SqlConnection conn = new SqlConnection(strConn))//一次
            {
                 SqlCommand com = new SqlCommand(sqlcondition,conn);
                 conn.Open();

                 if (com.ExecuteNonQuery() != 1)
                 //更改学生住宿信息成功，更改宿舍信息表
                 return false;
             }

            sqlcondition = string.Format("update Rooms set StudentNumber = StudentNumber + 1 where RoomID = {0} ;", RID);
            using(SqlConnection conn = new SqlConnection(strConn))//二次
            {
                SqlCommand com = new SqlCommand(sqlcondition, conn);
                conn.Open();

                if (com.ExecuteNonQuery() != 1)
                return false;
            }

                 //更改宿舍信息表成功，检查宿舍状态是否需要更改
            sqlcondition = string.Format("select StudentNumber,RoomType from Rooms where RoomID = {0} ;", RID);
            using(SqlConnection conn = new SqlConnection(strConn))//三次,这里roomtype的int类型和房子的最大容纳人数是对应的
            {    
                SqlCommand com = new SqlCommand(sqlcondition, conn);
                conn.Open();

                SqlDataReader dr = com.ExecuteReader();
                dr.Read();
                int nnum = Convert.ToInt32(dr[0]);
                int mnum = Convert.ToInt32(dr[1]);
                dr.Close();
                if (mnum == nnum)
                {
                    sqlcondition = string.Format("update Rooms set State = 3 where RoomID = {0} ;", RID);
                    if (com.ExecuteNonQuery() == 1)
                        return true;
                    else
                        return false;
                 }
             }
                return true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {           
            foreach(GridViewRow row in GridView1.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("RoomSelector");
                if (cb != null && cb.Checked)
                {                    
                    int roomid = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                    string stuname = TextBox1.Text.ToString();

                    bool sign = change(stuname,roomid);
                    if (sign)
                        Response.Write("<script language=javascript>alert('换寝成功');</"+"script>");
                    else
                        Response.Write("<script language=javascript>alert('换寝失败，请检查信息');</" + "script>");
                     
                }
            }
        }
    }
}