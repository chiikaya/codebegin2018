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
    public partial class t_SelectStudentMajorInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                string strSQL = string.Format("select distinct StudentType from StudentBaseInfo;");
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand com = new SqlCommand(strSQL, conn);
               
                conn.Open();
                SqlDataReader dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    ddlStudentType.Items.Add("不限");
                    while (dr.Read())
                    {
                        ddlStudentType.Items.Add(dr.GetValue(0).ToString());
                    }
                }
                dr.Close();
                strSQL = string.Format("select distinct Department from StudentEducationInfo;");
                com.CommandText = strSQL;
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    ddlDepartment.Items.Add("不限");
                    while (dr.Read())
                    {
                        ddlDepartment.Items.Add(dr.GetValue(0).ToString());
                    }
                }
                dr.Close();
                strSQL = string.Format("SELECT DISTINCT Major FROM StudentEducationInfo;");
                com.CommandText = strSQL;
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    ddlMajor.Items.Add("不限");
                    while (dr.Read())
                    {
                        ddlMajor.Items.Add(dr.GetValue(0).ToString());
                    }
                }

                dr.Close();
                strSQL = string.Format("SELECT distinct TutorName FROM StudentEducationInfo;");
                com.CommandText = strSQL;
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    ddlTutors.Items.Add("不限");
                   while (dr.Read())
                    {
                        ddlTutors.Items.Add(dr.GetValue(0).ToString());
                      
                    }
                }


                dr.Close();
                conn.Close();
                conn.Dispose();
            }
            lblResult.Text = string.Format("总人数为：{0}人。", grdStudent.Rows.Count);
        }
        protected void btnSelect_Click(object sender, EventArgs e)
        {

           
            string strCondition = "";
            if (ddlStudentType.SelectedValue != "不限")
            {
                strCondition += string.Format("and StudentType = '{0}' ", ddlStudentType.SelectedValue);
            }
            if (ddlDepartment.SelectedValue != "不限")
            {              
                    strCondition += string.Format("and Department = '{0}' ", ddlDepartment.SelectedValue);
            }
            if (ddlMajor.SelectedValue != "不限")
            {
                    strCondition += string.Format("and Major = '{0}' ", ddlMajor.SelectedValue);
             }
            if (ddlTutors.SelectedValue != "不限")
            {  
                    strCondition += string.Format("and TutorName = '{0}' ", ddlTutors.SelectedValue);
            }
            string strSQL="";
            if(strCondition !="")
            strSQL = string.Format("select StudentBaseInfo.StudentID as 学号,PassportName as  英文名,ChineseName as 中文名,StudentType as 学生类型, Department as 所在学院, Major as 专业,TutorName as  导师姓名, TutorPhone as  导师联系方式 from StudentBaseInfo,StudentEducationInfo where StudentBaseInfo.StudentID=StudentEducationInfo.StudentID {0} order by StudentBaseInfo.StudentID desc;", strCondition);
            else
            strSQL = string.Format("select StudentBaseInfo.StudentID as 学号,PassportName as  英文名,ChineseName as 中文名,StudentType as 学生类型, Department as 所在学院, Major as 专业,TutorName as  导师姓名, TutorPhone as  导师联系方式 from StudentBaseInfo,StudentEducationInfo where StudentBaseInfo.StudentID=StudentEducationInfo.StudentID order by StudentBaseInfo.StudentID desc;");
           
            SqlDataSource1.SelectCommand = strSQL;
            grdStudent.DataBind();
            lblResult.Text = string.Format("满足条件的学生有{0}人。", grdStudent.Rows.Count);
            // Response.Write(DialogMessage.CreateMessage(strSQL));
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("SELECT DISTINCT Major FROM StudentEducationInfo where Department='{0}';", ddlDepartment.SelectedValue);
                       SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);
            
            conn.Open();
            SqlDataReader dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                ddlMajor.Items.Clear();
                ddlMajor.Items.Add("不限");
                while (dr.Read())
                {
                    ddlMajor.Items.Add(dr.GetValue(0).ToString());
                }
            }
            dr.Close();
            conn.Close();
            conn.Dispose();
        }

        protected void ddlTutors_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlMajor_SelectedIndexChanged(object sender, EventArgs e)
        {
           /* string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = string.Format("SELECT DISTINCT Department FROM StudentEducationInfo where Major='{0}';", ddlMajor.SelectedValue);
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSQL, conn);

            conn.Open();
            SqlDataReader dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                ddlDepartment.Items.FindByText(dr.GetValue(0).ToString()).Selected = true;
               
            }
            dr.Close();
            conn.Close();
            conn.Dispose();*/
        }
    }
}