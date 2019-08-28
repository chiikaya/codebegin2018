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
    public partial class r_QueryStudents : System.Web.UI.Page
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
                sqlstr = string.Format("select distinct Nationality from StudentBaseInfo;");
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
                sqlstr = string.Format("select distinct StudentType from StudentBaseInfo;");
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
            QSresult.Text = string.Format("总人数为：{0}人。", GridView1.Rows.Count);

            }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void QSButton_Click(object sender, EventArgs e)
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
                    strCondition += string.Format(" and StudentBaseInfo.Nationality = '{0}' ", DropDownList2.SelectedValue);
                }
                else
                {
                    strCondition += string.Format(" StudentBaseInfo.Nationality = '{0}' ", DropDownList2.SelectedValue);
                }
                n++;
            }
            if (DropDownList3.SelectedValue != "不限")
            {
                if (n != 0)
                {
                    strCondition += string.Format(" and StudentBaseInfo.StudentType = '{0}' ", DropDownList3.SelectedValue);
                }
                else
                {
                    strCondition += string.Format(" StudentBaseInfo.StudentType = '{0}' ", DropDownList3.SelectedValue);
                }
                n++;
            }
            string strSQL = string.Format("SELECT Rooms.RoomID, Rooms.Building AS 楼号, Rooms.RoomNo AS 房间号, Rooms.Floor AS 楼层, StudentBaseInfo.StudentID, StudentBaseInfo.ChineseName AS 中文名字, StudentBaseInfo.Nationality AS 国籍, StudentBaseInfo.Gender AS 性别, StudentBaseInfo.StudentType AS 学生类型, StudentBaseInfo.PhoneNumber AS 联系方式, StudentBaseInfo.EmergencyContactPhone AS 紧急联系方式 FROM StudentBaseInfo INNER JOIN StudentInCampusInfo ON StudentBaseInfo.StudentID = StudentInCampusInfo.StudentID INNER JOIN Rooms ON StudentInCampusInfo.RoomID = Rooms.RoomID ");
            if (strCondition != "")
                strSQL += string.Format("where {0} order by StudentBaseInfo.StudentID desc;", strCondition);
            SqlDataSource1.SelectCommand = strSQL;
            GridView1.DataBind();
            QSresult.Text = string.Format("满足条件的学生有{0}人。", GridView1.Rows.Count);
        }

      


    

    }
}