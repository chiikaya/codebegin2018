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
    public partial class t_QUeryStudentBaseInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                string strSQL = string.Format("select distinct StudentType from StudentBaseInfo;");
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand com = new SqlCommand(strSQL, conn);
                ListItem ls;
                conn.Open();
                SqlDataReader dr=com.ExecuteReader();
                if (dr.HasRows)
                {
                    ddlStudentType.Items.Add("不限");
                    while (dr.Read())
                    {
                        ddlStudentType.Items.Add(dr.GetValue(0).ToString());
                    }
                }
                dr.Close();
                strSQL = string.Format("select distinct Nationality from StudentBaseInfo;");
                com.CommandText = strSQL;
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    ddlCountry.Items.Add("不限");
                    while (dr.Read())
                    {
                        ddlCountry.Items.Add(dr.GetValue(0).ToString());
                    }
                }
                dr.Close();
                strSQL = string.Format("SELECT DISTINCT LEFT(StudentID, 4) AS grade FROM StudentBaseInfo ORDER BY grade DESC;");
                com.CommandText = strSQL;
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    ddlYears.Items.Add("不限");
                    while (dr.Read())
                    {
                        ddlYears.Items.Add(dr.GetValue(0).ToString());
                    }
                }

                dr.Close();
                strSQL = string.Format("SELECT StudentStateID,StudentState FROM StudentState ORDER BY StudentStateID;");
                com.CommandText = strSQL;
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    ls = new ListItem("不限", "不限");
                    ddlStudentState.Items.Add(ls);
                    
                    while (dr.Read())
                    {
                        ls = new ListItem(dr.GetValue(1).ToString(),dr.GetValue(0).ToString());
                        ddlStudentState.Items.Add(ls);
                    }
                }
               

                dr.Close();
                conn.Close();
                conn.Dispose();
            }
            lblResult.Text = string.Format("总人数为：{0}人。", grdStudent.Rows.Count);
        }

        protected void ddlStudentType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlYears_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            
            int n=0;
            string strCondition="";
            if (ddlStudentType.SelectedValue != "不限")
            {
                
                strCondition += string.Format(" StudentType = '{0}' ", ddlStudentType.SelectedValue);
                n++;
            }
            if (ddlCountry.SelectedValue != "不限")
            {
                if (n != 0)
                {
                    strCondition += string.Format("and Nationality = '{0}' ", ddlCountry.SelectedValue);
                }
                else
                {
                    strCondition += string.Format(" Nationality = '{0}' ", ddlCountry.SelectedValue);
                }
                n++;
            }
            if (ddlYears.SelectedValue != "不限")
            {
                if (n != 0)
                {
                    strCondition += string.Format("and left(StudentID,4) = '{0}' ", ddlYears.SelectedValue);
                }
                else
                {
                    strCondition += string.Format(" left(StudentID,4) = '{0}' ", ddlYears.SelectedValue);
                }
                n++;
            }
            if (ddlStudentState.SelectedValue != "不限")
            {
                if (n != 0)
                {
                    strCondition += string.Format("and StudentState = {0} ", ddlStudentState.SelectedItem.Value);
                }
                else
                {
                    strCondition += string.Format(" StudentState = '{0}' ", ddlStudentState.SelectedItem.Value);
                }
                n++;
            }
            string strSQL=string.Format("select StudentID as 学号,PassportNO as 护照号,PassportName as  英文名,ChineseName as 中文名,Nationality as 国籍,Gender as 性别,BirthDay as 出生日期,StudentType as 学生类型,PhoneNumber as 联系电话 from StudentBaseInfo ");
            if(strCondition !="")
            strSQL += string.Format("where {0} order by StudentID desc;", strCondition);
            SqlDataSource1.SelectCommand = strSQL;
            grdStudent.DataBind();
            lblResult.Text = string.Format("满足条件的学生有{0}人。", grdStudent.Rows.Count);
           // Response.Write(DialogMessage.CreateMessage(strSQL));
        }
    }
}