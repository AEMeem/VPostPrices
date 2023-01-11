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

    public partial class Countries : System.Web.UI.Page
    {
        public String ConnectionString = ConfigurationManager.ConnectionStrings["PricingConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (checkUserPermisson() == false)
            {
                PageView.Visible = false;
                PermissonLabel.Text = "عفواً لاتوجد لديك صلاحية لعرض الصفحة";
            }
            else {
                PageView.Visible = true;
                PermissonLabel.Text = " ";
                if (!IsPostBack)
                {
                InsertlogEvent("User: " + Session["UserArName"] + " Was Access to Counries Page");
                }
            }
        }
        
        public Boolean checkUserPermisson()
        {
            Boolean Result = false;
            SqlConnection Scon = null;
            DataSet DS1 = new DataSet();
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
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
            InsertlogEvent("User: " + Session["UserArName"] + " Was Update Country ID: " + Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("CountryID")).Text.ToString()));
            String UpdateDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlDataSource1.UpdateParameters["UpdateBy"].DefaultValue = "ayman";
            SqlDataSource1.UpdateParameters["UpdateDate"].DefaultValue = UpdateDate;
            SqlConnection Scon = null;
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("UpdateCountries", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@CountryID",Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("CountryID"))));
                    Scom.Parameters.AddWithValue("@CountryNameAR",Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text));
                    Scom.Parameters.AddWithValue("@CountryNameEN", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text));
                    Scom.Parameters.AddWithValue("@NotificationDays", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox22")).Text));
                    Scom.Parameters.AddWithValue("@IsActive", Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Checked));
                    Scom.Parameters.AddWithValue("@UpdateBy", "ayman");
                    Scom.Parameters.AddWithValue("@UpdateDate", UpdateDate);
                    Scon.Open();
                    Scom.ExecuteNonQuery();
                    GridView1.DataBind();
                    Scon.Close();
                }
            }catch(Exception)
            {

            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            InsertlogEvent("User: " + Session["UserArName"] + " Was Delete Country ID: " + Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("CountryID")).Text.ToString()));
            String DeleteeDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlDataSource1.DeleteParameters["IsDelete"].DefaultValue = Convert.ToString(1);
            SqlDataSource1.DeleteParameters["DeleteBy"].DefaultValue = "ayman";
            SqlDataSource1.DeleteParameters["DeletedDate"].DefaultValue = DeleteeDate;
            SqlConnection Scon = null;
            try
            {
                using (Scon = new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("DeleteCountries", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@CountryID", Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("CountryID"))));
                    Scom.Parameters.AddWithValue("@IsDelete", Convert.ToString(1));
                    Scom.Parameters.AddWithValue("@DeleteBy", "ayman");
                    Scom.Parameters.AddWithValue("@DeletedDate", DeleteeDate);
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

        protected void AddCountry_Click(object sender, EventArgs e)
        {
            String AddDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlConnection Scon = null;
            if (CheckCountryCode(CountryCode.Text) == true)
            {
                try
                {
                    using (Scon = new SqlConnection(ConnectionString))
                    {
                        SqlCommand Scom = new SqlCommand("InsertCountries", Scon);
                        Scom.CommandType = CommandType.StoredProcedure;
                        Scom.Parameters.AddWithValue("@CountryNameAR", CountryNameAr.Text);
                        Scom.Parameters.AddWithValue("@CountryNameEN", CountryNameEn.Text);
                        Scom.Parameters.AddWithValue("@CountryCode", CountryCode.Text);
                        Scom.Parameters.AddWithValue("@NotificationDays", TextBox3044.Text);
                        Scom.Parameters.AddWithValue("@IsActive", IsActive.Checked);
                        Scom.Parameters.AddWithValue("@CreateBy", "ayman");
                        Scom.Parameters.AddWithValue("@CreationDate", AddDate);
                        Scon.Open();
                        Scom.ExecuteNonQuery();
                        GridView1.DataBind();
                        Scon.Close();
                        clearInsert();
                    }
                }
                catch (Exception)
                {

                }
            }
            else
            {
                CountryLabelError.Text = "كود الدولة مستخدم , نرجوا تغييره";
            }
            
        }
        public void clearInsert()
        {
            CountryNameAr.Text = null;
            CountryNameEn.Text = null;
            CountryCode.Text = null;
            IsActive.Checked = false;
            CountryCode.Text = null;
            TextBox3044.Text = null;

        }
        public Boolean CheckCountryCode(String ContryCode)
        {
            SqlConnection Scon = null;
            Boolean result = false;
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("CheckCountryCode", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@CountryCode", ContryCode);
                    SqlDataAdapter DA1 = new SqlDataAdapter(Scom);
                    DataSet DS1 = new DataSet();
                    DA1.Fill(DS1, "Result");
                    if (DS1.Tables["Result"].Rows.Count == 0)
                    {
                        result = true;
                    }

                }
            }
            catch (Exception)
            {

            }
            return result;
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 1000;
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