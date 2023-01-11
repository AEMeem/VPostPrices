using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

namespace VPostPrices_ControlPanel
{
    public partial class Discounts : System.Web.UI.Page
    {
        public String ConnectionString = ConfigurationManager.ConnectionStrings["PricingConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (checkUserPermisson() == false)
            {
                PageView.Visible = false;
                PermissonLabel.Text = "عفواً لاتوجد لديك صلاحية لعرض الصفحة";
            }
            else
            {
                PageView.Visible = true;
                PermissonLabel.Text = " ";
            }
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

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String UpdateDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlDataSource1.UpdateParameters["UpdateBy"].DefaultValue = "ayman";
            SqlDataSource1.UpdateParameters["UpdateDate"].DefaultValue = UpdateDate;
            SqlConnection SCon = null;
            try
            {
                using(SCon=new SqlConnection(ConnectionString))
                {
                    using(SqlCommand Scom=new SqlCommand("Updatediscounts", SCon))
                    {
                        Scom.CommandType = CommandType.StoredProcedure;
                        Scom.Parameters.AddWithValue("@Id",Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text));
                        Scom.Parameters.AddWithValue("@NameAr",Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text));
                        Scom.Parameters.AddWithValue("@NameEn", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text));
                        Scom.Parameters.AddWithValue("@IsActive", Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Checked));
                        Scom.Parameters.AddWithValue("@UpdateBy", "ayman");
                        Scom.Parameters.AddWithValue("@UpdateDate", UpdateDate);
                        SCon.Open();
                        Scom.ExecuteNonQuery();
                        GridView1.DataBind();
                        SCon.Close();
                    }

                }

            }
            catch (Exception)
            {

            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String DeleteDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlDataSource1.DeleteParameters["IsDelete"].DefaultValue = Convert.ToString(1);
            SqlDataSource1.DeleteParameters["DeleteBy"].DefaultValue = "ayman";
            SqlDataSource1.DeleteParameters["DeletedDate"].DefaultValue = DeleteDate;
            SqlConnection Scon = null;
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
                {
                    using(SqlCommand Scom=new SqlCommand("", Scon))
                    {
                        Scom.CommandType = CommandType.StoredProcedure;
                        Scom.Parameters.AddWithValue("@Id", Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text));
                        Scom.Parameters.AddWithValue("@IsDelete", Convert.ToString(1));
                        Scom.Parameters.AddWithValue("@DeleteBy", "ayman");
                        Scom.Parameters.AddWithValue("@DeletedDate", DeleteDate);
                        Scon.Open();
                        Scom.ExecuteNonQuery();
                        GridView1.DataBind();
                        Scon.Close();

                    }
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

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void AddDiscount_Click(object sender, EventArgs e)
        {
            String DiscCode = Code.Text.ToString();
            String CreateDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlConnection Scon = null;
            if (CheckDiscountCode(DiscCode) == true || Code.Text == "") {

             try{
                    using (Scon = new SqlConnection(ConnectionString))
                    {
                        using (SqlCommand Scom = new SqlCommand("InsertDiscounts", Scon))
                        {
                            Scom.CommandType = CommandType.StoredProcedure;
                            Scom.Parameters.AddWithValue("@NameAr", NameAr.Text);
                            Scom.Parameters.AddWithValue("@NameEn", NameEn.Text);
                            Scom.Parameters.AddWithValue("@Code", Code.Text);                     
                            Scom.Parameters.AddWithValue("@IsActive", IsActive.Checked);
                            Scom.Parameters.AddWithValue("@CreateBy", "ayman");
                            Scom.Parameters.AddWithValue("@CreationDate", CreateDate);
                            Scon.Open();
                            Scom.ExecuteNonQuery();
                            GridView1.DataBind();
                            Scon.Close();
                            clearInsert();

                        }
                        
                    }
                }

            catch (Exception)
                {

                }
            }
            else
            {
                ErrorLabel.Text = "كود الخصم مستخدم مسبقاً نرجوا تغييره";
            }
           

        }
        public void clearInsert()
        {
            NameAr.Text = null;
            NameEn.Text = null;
            Code.Text = null;
            IsActive.Checked = false;
            ErrorLabel.Text = null;
        }
        public Boolean CheckDiscountCode(String Dcode)
        {
            Boolean result = false;
            SqlConnection Scon = null;
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("CheckDiscountCode", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@DicountCode", Dcode);
                    Scon.Open();
                    SqlDataAdapter DA1 = new SqlDataAdapter(Scom);
                    DataSet DS1 = new DataSet();
                    DA1.Fill(DS1, "Result");
                    if (DS1.Tables["Result"].Rows.Count == 0)
                    {
                        result = true;
                    }
                    else
                    {
                        result = false;
                    }
                   
                }
            }
            catch (Exception)
            {

            }
            return result;
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