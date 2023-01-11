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
    public partial class DiscountPolicy : System.Web.UI.Page
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
                    FillAddDDL();
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
            SqlDataSource1.UpdateParameters["DiscountId"].DefaultValue = Convert.ToString(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DiscountNameDDL")).SelectedValue);
            SqlDataSource1.UpdateParameters["DiscounttypeId"].DefaultValue = Convert.ToString(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DiscountypeDDL")).SelectedValue);
            SqlDataSource1.UpdateParameters["CountryID"].DefaultValue = Convert.ToString(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ContryNameDDL")).SelectedValue);
            SqlDataSource1.UpdateParameters["VendorID"].DefaultValue = Convert.ToString(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("VendorNameDDL")).SelectedValue);
            SqlDataSource1.UpdateParameters["ServiceId"].DefaultValue = Convert.ToString(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("BillSystemTypeDDL")).SelectedValue);
            SqlDataSource1.UpdateParameters["UpdateBy"].DefaultValue = "ayman";
            SqlDataSource1.UpdateParameters["UpdateDate"].DefaultValue = UpdateDate;
            SqlConnection Scon = null;
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
                {
                    using(SqlCommand Scom=new SqlCommand("Updatediscountpolicy", Scon))
                    {
                        Scom.CommandType = CommandType.StoredProcedure;
                        Scom.Parameters.AddWithValue("@Id", Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text));
                        Scom.Parameters.AddWithValue("@DiscountId",Convert.ToString(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DiscountNameDDL")).SelectedValue));
                        Scom.Parameters.AddWithValue("@DiscounttypeId", Convert.ToString(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DiscountypeDDL")).SelectedValue));
                        Scom.Parameters.AddWithValue("@CountryID", Convert.ToString(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ContryNameDDL")).SelectedValue));
                        Scom.Parameters.AddWithValue("@VendorID", Convert.ToString(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("VendorNameDDL")).SelectedValue));
                        Scom.Parameters.AddWithValue("@ServiceId", Convert.ToString(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("BillSystemTypeDDL")).SelectedValue));
                        Scom.Parameters.AddWithValue("@IsPrcntg",Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Checked));
                        Scom.Parameters.AddWithValue("@DiscountValue", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text));
                        Scom.Parameters.AddWithValue("@IsProductValueDiscount", Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Checked));
                        Scom.Parameters.AddWithValue("@AllProduct", Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0]).Checked));
                        Scom.Parameters.AddWithValue("@HaveRestricted", Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[10].Controls[0]).Checked));
                        Scom.Parameters.AddWithValue("@ProductMinValue", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text));
                        Scom.Parameters.AddWithValue("@ProductMaxValue", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3")).Text));
                        Scom.Parameters.AddWithValue("@StartDate", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].Cells[13].Controls[0]).Text));
                        Scom.Parameters.AddWithValue("@EndDate", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].Cells[14].Controls[0]).Text));
                        Scom.Parameters.AddWithValue("@MinDiscountAmount", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4")).Text));
                        Scom.Parameters.AddWithValue("@MaxDiscountAmount", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5")).Text));
                        Scom.Parameters.AddWithValue("@AutoForceApply", Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[17].Controls[0]).Checked));
                        Scom.Parameters.AddWithValue("@IsActive", Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[18].Controls[0]).Checked));
                        Scom.Parameters.AddWithValue("@UpdateBy", "ayman");
                        Scom.Parameters.AddWithValue("@UpdateDate", UpdateDate);
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String DeleteDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlDataSource1.DeleteParameters["IsDelete"].DefaultValue = Convert.ToString(1);
            SqlDataSource1.DeleteParameters["DeleteBy"].DefaultValue = "ayman";
            SqlDataSource1.DeleteParameters["DeletedDate"].DefaultValue = DeleteDate;
            SqlConnection Scon = null;
            try
            {
                using (Scon = new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("Deletediscountpolicy", Scon);
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DropDownList DiscountNameDDL = (DropDownList)e.Row.FindControl("DiscountNameDDL");
            DropDownList DiscountypeDDL = (DropDownList)e.Row.FindControl("DiscountypeDDL");
            DropDownList ContryNameDDL = (DropDownList)e.Row.FindControl("ContryNameDDL");
            DropDownList VendorNameDDL = (DropDownList)e.Row.FindControl("VendorNameDDL");
            DropDownList BillSystemTypeDDL = (DropDownList)e.Row.FindControl("BillSystemTypeDDL");
            SqlConnection Scon = null;
            SqlConnection billCon = null;
            DataSet DS1 = new DataSet();
            DataSet DS2 = new DataSet();
            DataSet DS3 = new DataSet();
            DataSet DS4 = new DataSet();
            DataSet DS5 = new DataSet();

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    try
                    {
                        using (Scon = new SqlConnection(ConnectionString))
                        {
                            billCon = new SqlConnection(ConnectionString);

                            SqlCommand Scom1 = new SqlCommand("SELECT Id,NameAr FROM dbo.Discount WHERE IsDelete=0", Scon);
                            SqlCommand Scom2 = new SqlCommand("SELECT Id,NameAr FROM dbo.DiscountTypes WHERE IsDelete=0", Scon);
                            SqlCommand Scom3 = new SqlCommand("SELECT CountryID,CountryNameAR FROM dbo.Countries WHERE IsDelete=0", Scon);
                            SqlCommand Scom4 = new SqlCommand("SELECT Id,NameAR FROM dbo.Vendors WHERE IsDelete=0", Scon);
                            SqlCommand Scom5 = new SqlCommand("SELECT System_Type,System_Name FROM Billing.dbo.Systems", billCon);
                            SqlDataAdapter DA1 = new SqlDataAdapter(Scom1);
                            SqlDataAdapter DA2 = new SqlDataAdapter(Scom2);
                            SqlDataAdapter DA3 = new SqlDataAdapter(Scom3);
                            SqlDataAdapter DA4 = new SqlDataAdapter(Scom4);
                            SqlDataAdapter DA5 = new SqlDataAdapter(Scom5);
                            DA1.Fill(DS1);
                            DA2.Fill(DS2);
                            DA3.Fill(DS3);
                            DA4.Fill(DS4);
                            DA5.Fill(DS5);

                            DiscountNameDDL.DataSource = DS1;
                            DiscountNameDDL.DataTextField = "NameAr";
                            DiscountNameDDL.DataValueField = "Id";
                            DiscountNameDDL.DataBind();
                            String DiscountNameDDLSelected = DataBinder.Eval(e.Row.DataItem, "DiscountName").ToString();
                            DiscountNameDDL.Items.FindByText(DiscountNameDDLSelected).Selected = true;

                            DiscountypeDDL.DataSource = DS2;
                            DiscountypeDDL.DataTextField = "NameAr";
                            DiscountypeDDL.DataValueField = "Id";
                            DiscountypeDDL.DataBind();
                            String DiscountypeDDLSelectedValue = DataBinder.Eval(e.Row.DataItem, "Discountype").ToString();
                            DiscountypeDDL.Items.FindByText(DiscountypeDDLSelectedValue).Selected = true;

                            ContryNameDDL.DataSource = DS3;
                            ContryNameDDL.DataTextField = "CountryNameAR";
                            ContryNameDDL.DataValueField = "CountryID";
                            ContryNameDDL.DataBind();
                            String ContryNameDDLSelectedValue = DataBinder.Eval(e.Row.DataItem, "ContryName").ToString();
                            ContryNameDDL.Items.FindByText(ContryNameDDLSelectedValue).Selected = true;

                            VendorNameDDL.DataSource = DS4;
                            VendorNameDDL.DataTextField = "NameAR";
                            VendorNameDDL.DataValueField = "Id";
                            VendorNameDDL.DataBind();
                            String VendorNameDDLSelect = DataBinder.Eval(e.Row.DataItem, "VendorName").ToString();
                            VendorNameDDL.Items.FindByText(VendorNameDDLSelect).Selected = true;

                            BillSystemTypeDDL.DataSource = DS5;
                            BillSystemTypeDDL.DataTextField = "System_Name";
                            BillSystemTypeDDL.DataValueField = "System_Type";
                            BillSystemTypeDDL.DataBind();
                            String BillSystemTypeDDLSelect = DataBinder.Eval(e.Row.DataItem, "BillSystemType").ToString();
                            BillSystemTypeDDL.Items.FindByText(BillSystemTypeDDLSelect).Selected = true;

                            Scon.Close();
                            billCon.Close();

                        }
                    }
                    catch (Exception)
                    {

                    }
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void AddDiscountPolicy_Click(object sender, EventArgs e)
        {
            SqlConnection Scon = null;
            String CreationDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            int timeCompare = DateTime.Compare(StartDateAdd.SelectedDate, EndDateAdd.SelectedDate);
            if (compareDate() >=0) {
                try
                {
                    using (Scon = new SqlConnection(ConnectionString))
                    {
                        SqlCommand Scom = new SqlCommand("Insertdiscountpolicy", Scon);
                        Scom.CommandType = CommandType.StoredProcedure;
                        Scom.Parameters.AddWithValue("@DiscountId", DiscountNameAddDDL.SelectedValue);
                        Scom.Parameters.AddWithValue("@DiscounttypeId", DiscountTypeAddDDL.SelectedValue);
                        Scom.Parameters.AddWithValue("@CountryID", CounrtyAddDDL.SelectedValue);
                        Scom.Parameters.AddWithValue("@VendorID", VendorAddDDL.SelectedValue);
                        Scom.Parameters.AddWithValue("@ServiceId", BillSystemtypeAddDDL.SelectedValue);
                        Scom.Parameters.AddWithValue("@IsPrcntg", IsPercntegeADD.Checked);
                        Scom.Parameters.AddWithValue("@DiscountValue", DiscountValueAdd.Text);
                        Scom.Parameters.AddWithValue("@IsProductValueDiscount", IsProductValueDiscountAdd.Checked);
                        Scom.Parameters.AddWithValue("@AllProduct", AllProduct.Checked);
                        Scom.Parameters.AddWithValue("@HaveRestricted", HaveRestrictedAdd.Checked);
                        Scom.Parameters.AddWithValue("@ProductMinValue", ProductMinValueAdd.Text);
                        Scom.Parameters.AddWithValue("@ProductMaxValue", ProductMaxValueAdd.Text);
                        if (StartDateAdd.SelectedDate.Date == DateTime.MinValue.Date && EndDateAdd.SelectedDate.Date == DateTime.MinValue.Date)
                        {
                            Scom.Parameters.AddWithValue("@StartDate", DBNull.Value);
                            Scom.Parameters.AddWithValue("@EndDate", DBNull.Value);
                        }
                        else
                        {
                            Scom.Parameters.AddWithValue("@StartDate", StartDateAdd.SelectedDate);
                            Scom.Parameters.AddWithValue("@EndDate", EndDateAdd.SelectedDate);
                        }
                        Scom.Parameters.AddWithValue("@MinDiscountAmount", MinDiscountAmountAdd.Text);
                        Scom.Parameters.AddWithValue("@MaxDiscountAmount", MaxDiscountAmountAdd.Text);
                        Scom.Parameters.AddWithValue("@AutoForceApply", AutoForceApplyAdd.Checked);
                        Scom.Parameters.AddWithValue("@IsActive", IsActiveAdd.Checked);
                        Scom.Parameters.AddWithValue("@CreateBy", "ayman");
                        Scom.Parameters.AddWithValue("@CreationDate", CreationDate);
                        Scon.Open();
                        Scom.ExecuteNonQuery();
                        GridView1.DataBind();
                        Scon.Close();
                        clearInsert();
                    }
                }


                


            catch (Exception)
            {

            } }
             else
            {
                DayError.Text = "تاريخ البداية يجب أن لايكون أقل من تاريخ النهاية";
            }

        }


        public void clearInsert()
        {
            DiscountNameAddDDL.SelectedIndex = 0;
            DiscountTypeAddDDL.SelectedIndex = 0;
            CounrtyAddDDL.SelectedIndex = 0;
            VendorAddDDL.SelectedIndex = 0;
            BillSystemtypeAddDDL.SelectedIndex = 0;
            IsPercntegeADD.Checked = false;
            DiscountValueAdd.Text = null;
            IsProductValueDiscountAdd.Checked = false;
            AllProduct.Checked = false;
            HaveRestrictedAdd.Checked = false;
            ProductMinValueAdd.Text = null;
            ProductMaxValueAdd.Text = null;
            StartDateAdd.SelectedDate = DateTime.MinValue.Date;
            EndDateAdd.SelectedDate = DateTime.MinValue.Date;
            MinDiscountAmountAdd.Text = null;
            MaxDiscountAmountAdd.Text = null;
            AutoForceApplyAdd.Checked = false;
            IsActiveAdd.Checked = false;
            DayError.Text = null;
    }
        public void FillAddDDL()
        {
            SqlConnection Scon = null;
            DataSet DS1 = new DataSet();
            DataSet DS2 = new DataSet();
            DataSet DS3 = new DataSet();
            DataSet DS4 = new DataSet();
            DataSet DS5 = new DataSet();
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
                {
                    SqlConnection SconBill = new SqlConnection(ConnectionString);
                    SqlCommand Scom1 = new SqlCommand("SELECT Id,NameAr FROM dbo.Discount WHERE IsDelete=0", Scon);
                    SqlCommand Scom2 = new SqlCommand("SELECT Id,NameAr FROM dbo.DiscountTypes WHERE IsDelete=0", Scon);
                    SqlCommand Scom3 = new SqlCommand("SELECT CountryID,CountryNameAR FROM dbo.Countries WHERE IsDelete=0", Scon);
                    SqlCommand Scom4 = new SqlCommand("SELECT Id,NameAR FROM dbo.Vendors WHERE IsDelete=0", Scon);
                    SqlCommand Scom5 = new SqlCommand("SELECT System_Type,System_Name FROM Billing.dbo.Systems", SconBill);
                    SqlDataAdapter DA1 = new SqlDataAdapter(Scom1);
                    SqlDataAdapter DA2 = new SqlDataAdapter(Scom2);
                    SqlDataAdapter DA3 = new SqlDataAdapter(Scom3);
                    SqlDataAdapter DA4 = new SqlDataAdapter(Scom4);
                    SqlDataAdapter DA5 = new SqlDataAdapter(Scom5);
                    DA1.Fill(DS1);
                    DA2.Fill(DS2);
                    DA3.Fill(DS3);
                    DA4.Fill(DS4);
                    DA5.Fill(DS5);


                    DiscountNameAddDDL.DataSource = DS1;
                    DiscountNameAddDDL.DataTextField = "NameAr";
                    DiscountNameAddDDL.DataValueField = "Id";
                    DiscountNameAddDDL.DataBind();

                    DiscountTypeAddDDL.DataSource = DS2;
                    DiscountTypeAddDDL.DataTextField = "NameAr";
                    DiscountTypeAddDDL.DataValueField = "Id";
                    DiscountTypeAddDDL.DataBind();

                    CounrtyAddDDL.DataSource = DS3;
                    CounrtyAddDDL.DataTextField = "CountryNameAR";
                    CounrtyAddDDL.DataValueField = "CountryID";
                    CounrtyAddDDL.DataBind();

                    VendorAddDDL.DataSource = DS4;
                    VendorAddDDL.DataTextField = "NameAR";
                    VendorAddDDL.DataValueField = "Id";
                    VendorAddDDL.DataBind();

                    BillSystemtypeAddDDL.DataSource = DS5;
                    BillSystemtypeAddDDL.DataTextField = "System_Name";
                    BillSystemtypeAddDDL.DataValueField = "System_Type";
                    BillSystemtypeAddDDL.DataBind();

                    Scon.Close();
                    SconBill.Close();
                }
            }
            catch (Exception)
            {

            }
        }

        public int compareDate()
        {
            DateTime from = StartDateAdd.SelectedDate.Date;
            DateTime to = EndDateAdd.SelectedDate.Date;
            return DateTime.Compare(to, from);
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

