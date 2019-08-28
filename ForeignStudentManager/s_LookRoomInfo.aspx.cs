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
    public partial class s_LookRoomInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string strConn = ConfigurationManager.ConnectionStrings["Conn1"].ToString();
                string strSQL = string.Format("select Building,RoomNo,Floor,RoomType.RoomType,RoomPrice,StudentNumber,RoomSate.RoomState  from StudentInCampusInfo,Rooms,RoomSate,RoomType where StudentInCampusInfo.RoomID=Rooms.RoomID and Rooms.State=RoomSate.RoomStateID and Rooms.RoomType = RoomType.RoomTypeID and StudentID='{0}';", Session["UserName"].ToString());
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand com = new SqlCommand(strSQL, conn);
                conn.Open();
                SqlDataReader dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    if(dr.GetValue(0)!=null && dr.GetValue(1)!=null)
                    lblBuilding.Text = dr.GetValue(0).ToString() + dr.GetValue(1).ToString();
                    if(dr.GetValue(2)!=null)
                    lblFloor.Text = dr.GetValue(2).ToString();
                    if(dr.GetValue(3)!=null)
                    lblRoomType.Text = dr.GetValue(3).ToString();
                    if(dr.GetValue(4)!=null)
                    lblPrice.Text = dr.GetValue(4).ToString() ;
                    if(dr.GetValue(5)!=null)
                    lblStudentNumber.Text = dr.GetValue(5).ToString();
                    if(dr.GetValue(6)!=null)
                    lblRoomState.Text = dr.GetValue(6).ToString();
                    InCampus.Visible = true;
                }
                else
                {
                    InCampus.Visible = false;
                    dr.Close();
                    strSQL = string.Format("select RentingHouseAddress,LandlordName,LandlordPhone,RentingContract,RentDateStart,RentDateEnd from StudentOutCampusInfo where StudentID='{0}' order by RentDateStart;",Session["UserName"].ToString());
                    com.CommandText = strSQL;
                    dr = com.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        if (dr.GetValue(0) != null)
                        lblAddress.Text = dr.GetValue(0).ToString();
                        if (dr.GetValue(1) != null)
                        lblName.Text = dr.GetValue(1).ToString();
                        if (dr.GetValue(2) != null)
                        lblPhone.Text = dr.GetValue(2).ToString();
                        if (dr.GetValue(3) != null)
                        linkContract.NavigateUrl = "File/RentContract/" + dr.GetValue(3).ToString();
                        if (dr.GetValue(4) != null)
                        lblDateStart.Text = dr.GetValue(4).ToString();
                        if (dr.GetValue(5) != null)
                        lblDateEnd.Text = dr.GetValue(5).ToString();
                        OutCampus.Visible = true;
                        dr.Close();
                        com.Dispose();
                        conn.Close();

                    }
                    else
                    {
                        OutCampus.Visible = false;
                        Response.Write(DialogMessage.CreateMessage("没有您的住宿信息和租房信息！"));
                    }
                   
                }

            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("s_OutCampusStudentUpdateRoomInfo.aspx");
        }
    }
}