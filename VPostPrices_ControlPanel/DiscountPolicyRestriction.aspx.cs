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
    public partial class DiscountPolicyRestriction : System.Web.UI.Page
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
                if (!IsPostBack)
                {
                    FillDDLS();
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DropDownList DiscountIdDDL = (DropDownList)e.Row.FindControl("DiscountIdDDL");
            DropDownList NameArDDL = (DropDownList)e.Row.FindControl("NameArDDL");
            SqlConnection Scon = null;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    try
                    {
                        using (Scon = new SqlConnection(ConnectionString))
                        {
                            SqlCommand Scom1 = new SqlCommand("SELECT Id FROM dbo.DiscountPolicy WHERE IsDelete=0", Scon);
                            SqlCommand Scom2 = new SqlCommand("SELECT Id,NameAr FROM dbo.Products WHERE IsDelete=0", Scon);
                            SqlDataAdapter DA1 = new SqlDataAdapter(Scom1);
                            SqlDataAdapter DA2 = new SqlDataAdapter(Scom2);

                            DataSet DS1 = new DataSet();
                            DataSet DS2 = new DataSet();

                            DA1.Fill(DS1);
                            DA2.Fill(DS2);

                            DiscountIdDDL.DataSource = DS1;
                            DiscountIdDDL.DataTextField = "Id";
                            DiscountIdDDL.DataValueField = "Id";
                            DiscountIdDDL.DataBind();
                            String DiscountSelect = DataBinder.Eval(e.Row.DataItem, "DiscountId").ToString();
                            DiscountIdDDL.Items.FindByText(DiscountSelect).Selected = true;

                            NameArDDL.DataSource=DS2;
                            NameArDDL.DataTextField = "NameAr";
                            NameArDDL.DataValueField = "Id";
                            NameArDDL.DataBind();
                            String NameArDDLSelect = DataBinder.Eval(e.Row.DataItem, "NameAr").ToString();
                            NameArDDL.Items.FindByText(NameArDDLSelect).Selected = true;

                            Scon.Close();





                        }
                    }
                    catch (Exception)
                    {

                    }
                }
            }
        }
        public void FillDDLS()
        {
            SqlConnection Scon = null;
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom1 = new SqlCommand("SELECT Id FROM dbo.DiscountPolicy  WHERE IsDelete=0", Scon);
                    SqlCommand Scom2 = new SqlCommand("SELECT Id ,NameAr  FROM dbo.Products WHERE IsDelete=0", Scon);
                    SqlDataAdapter DA1 = new SqlDataAdapter(Scom1);
                    SqlDataAdapter DA2 = new SqlDataAdapter(Scom2);

                    DataSet DS1 = new DataSet();
                    DataSet DS2 = new DataSet();

                    DA1.Fill(DS1);
                    DA2.Fill(DS2);

                    AddDiscountIdDDL.DataSource = DS1;
                    AddDiscountIdDDL.DataTextField = "Id";
                    AddDiscountIdDDL.DataValueField = "Id";
                    AddDiscountIdDDL.DataBind();

                    AddNameArDDL.DataSource = DS2;
                    AddNameArDDL.DataTextField = "NameAr";
                    AddNameArDDL.DataValueField = "Id";
                    AddNameArDDL.DataBind();

                    Scon.Close();

                }
            }
            catch (Exception)
            {

            }
        }
        protected void AddDiscountToProduct_Click(object sender, EventArgs e)
        {
            SqlConnection Scon = null;
            
            try
            {
                using (Scon = new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("InsertDiscountPolicyRestriction", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@DiscountPolicyId",AddDiscountIdDDL.SelectedValue);
                    Scom.Parameters.AddWithValue("@ProductId", AddNameArDDL.SelectedValue);
                    Scom.Parameters.AddWithValue("@IsRestricted", IsRestricted.Checked);
                    Scon.Open();
                    Scom.ExecuteNonQuery();
                    GridView1.DataBind();
                    Scon.Close();

                }
            }
            catch (Exception)
            {

            }
            ClearInsert();
        }

        public void ClearInsert()
        {
            AddDiscountIdDDL.SelectedIndex = 0;
            AddNameArDDL.SelectedIndex = 0;
            IsRestricted.Checked = false;
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