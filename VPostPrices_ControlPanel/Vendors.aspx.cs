using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace VPostPrices_ControlPanel
{
    public partial class Vendors : System.Web.UI.Page
    {
        public String ConnectionString = ConfigurationManager.ConnectionStrings["PricingConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (checkUserPermisson() == false)
            //{
            //    PageView.Visible = false;
            //    PermissonLabel.Text = "عفواً لاتوجد لديك صلاحية لعرض الصفحة";
            //}
            //else
            //{
                PageView.Visible = true;
                PermissonLabel.Text = " ";
           // }
        }

        public Boolean checkUserPermisson()
        {
            Boolean Result = false;
            SqlConnection Scon = null;
            DataSet DS1 = new DataSet();
            try
            {
                using (Scon = new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("CheckUsersAndPagesPermissons", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@PageLink", "NormalPage");
                    Scom.Parameters.AddWithValue("@UserName", Session["UserArName"]);
                    Scon.Open();
                    SqlDataAdapter SDA = new SqlDataAdapter(Scom);
                    SDA.Fill(DS1, "Result");
                    if (DS1.Tables["Result"].Rows.Count > 0)
                    {
                        Result = true;
                    }
                    else
                    {
                        Result = false;
                    }
                }
            }
            catch (Exception)
            {

            }
            return Result;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String UpdateDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlDataSource1.UpdateParameters["UpdateBy"].DefaultValue = "ayman";
            SqlDataSource1.UpdateParameters["UpdateDate"].DefaultValue = UpdateDate;
            SqlConnection Scon = null;
            try
            {
                using (Scon = new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("UpdateVendors", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@Id", Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id"))));
                    Scom.Parameters.AddWithValue("@NameAR", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("NameAR"))));
                    Scom.Parameters.AddWithValue("@NameEn", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("NameEn"))));
                    Scom.Parameters.AddWithValue("@IsActive", Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Checked));
                    Scom.Parameters.AddWithValue("@UpdateBy", "ayman");
                    Scom.Parameters.AddWithValue("@UpdateDate", UpdateDate);
                    Scon.Open();
                    Scom.ExecuteNonQuery();
                    GridView1.DataBind();
                    Scon.Close();
                }
            }
            catch (Exception)
            {

            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String DeleteDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlDataSource1.DeleteParameters["IsDelete"].DefaultValue= Convert.ToString(1);
            SqlDataSource1.DeleteParameters["DeleteBy"].DefaultValue = "ayman";
            SqlDataSource1.DeleteParameters["DeletedDate"].DefaultValue = DeleteDate;
            SqlConnection Scon = null;
            try
            {
                using (Scon = new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("DeleteVendors", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@Id", Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id"))));           
                    Scom.Parameters.AddWithValue("@IsDelete", Convert.ToString(1));
                    Scom.Parameters.AddWithValue("@DeleteBy", "ayman");
                    Scom.Parameters.AddWithValue("@DeletedDate", DeleteDate);
                    Scon.Open();
                    Scom.ExecuteNonQuery();
                    GridView1.DataBind();
                    Scon.Close();
                }
            }
            catch (Exception)
            {

            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void AddVendor_Click(object sender, EventArgs e)
        {
            String CreateDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlConnection Scon = null;
            if (CheckVendorCode(VenderCode.Text) == true|| VenderCode.Text=="")
            {
                try
                {
                    using (Scon = new SqlConnection(ConnectionString))
                    {
                        SqlCommand Scom = new SqlCommand("InsertVendors", Scon);
                        Scom.CommandType = CommandType.StoredProcedure;
                        Scom.Parameters.AddWithValue("@NameAR", NameAR.Text);
                        Scom.Parameters.AddWithValue("@NameEn", NameEn.Text);
                        Scom.Parameters.AddWithValue("@VenderCode", VenderCode.Text);
                        Scom.Parameters.AddWithValue("@IsActive", isActive.Checked);
                        Scom.Parameters.AddWithValue("@CreateBy", "ayman");
                        Scom.Parameters.AddWithValue("@CreationDate", CreateDate);
                        Scon.Open();
                        Scom.ExecuteNonQuery();
                        GridView1.DataBind();
                        Scon.Close();
                        ClearInsert();
                    }
                }
                catch (Exception)
                {

                }
            }
            else
            {
                VendorError.Text = "كود مقدم الخدمة مستخدم بالفعل , نرجوا تغييره";
            }

        }
        public void ClearInsert()
        {
            NameAR.Text = null;
            NameEn.Text = null;
            VenderCode = null;
            isActive.Checked = false;
            VendorError.Text = null;
        }


        public Boolean CheckVendorCode(String VCode)
        {
            SqlConnection Scon = null;
            Boolean Result = false;
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("CheckVendorCode", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@VendorCode", VenderCode.Text);
                    SqlDataAdapter DA1 = new SqlDataAdapter(Scom);
                    DataSet DS1 = new DataSet();
                    DA1.Fill(DS1, "Result");
                    if (DS1.Tables["Result"].Rows.Count == 0)
                    {
                        Result = true;
                    }
                }
            }
            catch (Exception)
            {

            }
            return Result;
        }

        public void InsertlogEvent(String Body)
        {
            SqlConnection Scon = null;
            try
            {
                using (Scon = new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("InsertLogEvent", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@LogText", Body);
                    Scon.Open();
                    Scom.ExecuteNonQuery();
                    Scon.Close();

                }
            }
            catch (Exception)
            {

            }
        }


    }
}