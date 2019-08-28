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
    public partial class t_GroupStaticStudentInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                ListItem ls = new ListItem("国籍", "Nationality");
                ddlField.Items.Add(ls);
                ls = new ListItem("性别", "Gender");
                ddlField.Items.Add(ls);
                ls = new ListItem("学生类型", "StudentType");
                ddlField.Items.Add(ls);
                ls = new ListItem("学生状态", "StudentState");
                ddlField.Items.Add(ls);
                ls = new ListItem("年级", "left(StudentID,4)");
                ddlField.Items.Add(ls);
                ls = new ListItem("住宿类型", "AccommodationType");
                ddlField.Items.Add(ls);
                ls = new ListItem("奖学金类型", "ScholarshipID");
                ddlField.Items.Add(ls);
                ls = new ListItem("教育类型", "EducationType");
                ddlField.Items.Add(ls);
                ls = new ListItem("学院", "Department");
                ddlField.Items.Add(ls);
                ls = new ListItem("专业", "Major");
                ddlField.Items.Add(ls);
                ls = new ListItem("导师", "TutorName");
                ddlField.Items.Add(ls);


              /*  ls = new ListItem("统计人数", "count");
                ddlMethod.Items.Add(ls);
                ls = new ListItem("总量", "count");
                ddlMethod.Items.Add(ls);
                ls = new ListItem("最大值", "max");
                ddlMethod.Items.Add(ls);
                ls = new ListItem("最小值", "min");
                ddlMethod.Items.Add(ls);
                ls = new ListItem("平均值", "avg");
                ddlMethod.Items.Add(ls);

                ls = new ListItem("学号", "StudentID");
                ddlMethod.Items.Add(ls);*/
            }

            string strSQL = string.Format("select {0} as 类型 ,count(*) as 人数 from StudentBaseAndEdu group by {0};", ddlField.SelectedItem.Value);
            SqlDataSource1.SelectCommand = strSQL;
            grdStudent.DataBind();
            lblResult.Text = string.Format("查询记录数:{0}。", grdStudent.Rows.Count);
            
        }

        protected void btnselect_Click(object sender, EventArgs e)
        {
            //string strSQL = string.Format("select {0} as 类型 ,count(*) as 人数 from StudentBaseAndEdu group by {0};", ddlField.SelectedItem.Value);
          //  SqlDataSource1.SelectCommand = strSQL;
           // grdStudent.DataBind();
           // lblResult.Text = string.Format("查询记录数:{0}。", grdStudent.Rows.Count);
        }
    }
}