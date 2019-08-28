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
    public partial class t_StudentBaseInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem ls = new ListItem("学号", "StudentID");
                ddlField.Items.Add(ls);
                ls = new ListItem("护照号", "PassportNO");
                ddlField.Items.Add(ls);
                ls = new ListItem("英文名", "PassportName");
                ddlField.Items.Add(ls);
                ls = new ListItem("中文名", "ChineseName");
                ddlField.Items.Add(ls);
                ls = new ListItem("国籍", "Nationality");
                ddlField.Items.Add(ls);
                ls = new ListItem("学生类型", "StudentType");
                ddlField.Items.Add(ls);

                ls = new ListItem("模糊查询", "like");
                ddlMethod.Items.Add(ls);

                ls = new ListItem("相等", "=");
                ddlMethod.Items.Add(ls);
            
            }
            lblResult.Text = string.Format("人数为{0}人。", grdStudent.Rows.Count);
        }

        protected void btnselect_Click(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
            string strSQL = "select StudentID as 学号,PassportNO as 护照号,PassportName as  英文名,ChineseName as 中文名,Nationality as 国籍,Gender as 性别,BirthDay as 出生日期,StudentType as 学生类型,PhoneNumber as 联系电话 from StudentBaseInfo where ";
            //StudentID like '%{1}%' or  order by StudentID desc;");
            if (txtID.Text != null)
            {
                switch (ddlMethod.SelectedItem.Value)
                {
                    case "like":
                        strSQL += string.Format("{0} like '%{1}%';", ddlField.SelectedItem.Value, txtID.Text);
                        break;
                    case "=":
                        strSQL += string.Format("{0} = '{1}';", ddlField.SelectedItem.Value, txtID.Text);
                        break;
                }
            }
            else
            {
                strSQL = "select StudentID as 学号,PassportNO as 护照号,PassportName as  英文名,ChineseName as 中文名,Nationality as 国籍,Gender as 性别,BirthDay as 出生日期,StudentType as 学生类型,PhoneNumber as 联系电话 from StudentBaseInfo order by StudentID desc;";
            }
           
            SqlDataSource1.SelectCommand = strSQL;
            grdStudent.DataBind();
            lblResult.Text = string.Format("人数为{0}人。", grdStudent.Rows.Count);
            //strSQL += ddlField.SelectedValue
            
            
            
           
                
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

       
    }
}