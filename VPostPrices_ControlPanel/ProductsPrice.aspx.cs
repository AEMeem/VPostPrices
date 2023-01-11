using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace VPostPrices_ControlPanel
{
    public partial class ProductsPrice : System.Web.UI.Page
    {
        public String ConnectionString = ConfigurationManager.ConnectionStrings["PricingConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
                PageView.Visible = true;
                PermissonLabel.Text = " ";
                if (!IsPostBack)
                {
                    InsertlogEvent("User: " + Session["UserArName"] + " Was Access to ProductsPrice Page");
                    FillDDLs();
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

        public void FillDDLs()
        {

            try
            {
                    SqlConnection Scon1 = new SqlConnection(ConnectionString);
                    SqlConnection Scon2 = new SqlConnection(ConnectionString);
                    SqlConnection Scon3 = new SqlConnection(ConnectionString);
                    SqlConnection Scon4 = new SqlConnection(ConnectionString);
                    SqlCommand ProductCommnad = new SqlCommand("SELECT Id,NameAr FROM dbo.Products WHERE IsDelete=0", Scon1);
                    SqlCommand CountrCommand = new SqlCommand("SELECT CountryID,CountryNameAR FROM dbo.Countries WHERE IsDelete=0", Scon2);
                    SqlCommand VendorCommand = new SqlCommand("SELECT Id,NameAR FROM dbo.Vendors WHERE IsDelete=0", Scon3);
                    SqlCommand CalctypeCommnad = new SqlCommand("SELECT Id,NameAr FROM dbo.CalcTypes WHERE IsDelete=0", Scon4);
                    SqlDataAdapter DA1 = new SqlDataAdapter(ProductCommnad);
                    SqlDataAdapter DA2 = new SqlDataAdapter(CountrCommand);
                    SqlDataAdapter DA3 = new SqlDataAdapter(VendorCommand);
                    SqlDataAdapter DA4 = new SqlDataAdapter(CalctypeCommnad);
                    DataSet DS1 = new DataSet();
                    DataSet DS2 = new DataSet();
                    DataSet DS3 = new DataSet();
                    DataSet DS4 = new DataSet();
                    DA1.Fill(DS1);
                    DA2.Fill(DS2);
                    DA3.Fill(DS3);
                    DA4.Fill(DS4);
                    AddProductDDL.DataSource = DS1;
                    AddProductDDL.DataTextField = "NameAr";
                    AddProductDDL.DataValueField = "Id";
                    AddProductDDL.DataBind();
                    addCountrDDL.DataSource = DS2;
                    addCountrDDL.DataTextField = "CountryNameAR";
                    addCountrDDL.DataValueField = "CountryID";
                    addCountrDDL.DataBind();
                    //addCountrDDL.Items.Insert(0, new ListItem("دولة غير محددة", "-1"));
                    addVendorDDl.DataSource = DS3;
                    addVendorDDl.DataTextField = "NameAR";
                    addVendorDDl.DataValueField = "Id";
                    addVendorDDl.DataBind();
                    //addVendorDDl.Items.Insert(0, new ListItem("مقدم خدمة غير محدد", "-1"));
                    AddCalcTypeDDl.DataSource = DS4;
                    AddCalcTypeDDl.DataTextField = "NameAr";
                    AddCalcTypeDDl.DataValueField = "Id";
                    AddCalcTypeDDl.DataBind();
                    Scon1.Close();
                    Scon2.Close();
                    Scon3.Close();
                    Scon4.Close();


            }
            catch (Exception)
            {

            }
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

            InsertlogEvent("User: " + Session["UserArName"] + " Was Update ProductPrice ID: " + Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text.ToString()));
            String UpdateDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            DropDownList CountryDDL = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ContryDDL"));
            DropDownList VendorDDL = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("VendorDDL"));
            DropDownList CalcTypeDDL = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("CalcTypesDDl"));
            DropDownList ProductDDL = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ProductsDDL"));
            String ContrySelect = CountryDDL.SelectedValue;
            String VendorSelect = VendorDDL.SelectedValue;
            String CalcTypeSelect = CalcTypeDDL.SelectedValue;
            String ProductSelect = ProductDDL.SelectedValue.ToString();

            SqlDataSource1.UpdateParameters["ProductID"].DefaultValue = ProductSelect;
            SqlDataSource1.UpdateParameters["CountryID"].DefaultValue = ContrySelect;
            SqlDataSource1.UpdateParameters["VendorID"].DefaultValue = VendorSelect;
            SqlDataSource1.UpdateParameters["CalcTypeId"].DefaultValue = CalcTypeSelect;

            SqlDataSource1.UpdateParameters["UpdateBy"].DefaultValue= "ayman";
            SqlDataSource1.UpdateParameters["UpdateDate"].DefaultValue = UpdateDate;
            SqlConnection SCon = null;
            SqlCommand SCom = null;
            try
            {
                using(SCon=new SqlConnection(ConnectionString))
                {
                    using(SCom=new SqlCommand("UpdateVPostProductPrice", SCon))
                    {
                        SCom.CommandType = CommandType.StoredProcedure;
                        SCom.Parameters.AddWithValue("@Id",Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text));
                        SCom.Parameters.AddWithValue("@ProductID", ProductSelect);
                        SCom.Parameters.AddWithValue("@CountryID", Convert.ToInt32(ContrySelect));
                        SCom.Parameters.AddWithValue("@VendorID", Convert.ToInt32(VendorSelect));
                        SCom.Parameters.AddWithValue("@CalcTypeId", Convert.ToInt32(CalcTypeSelect));
                        SCom.Parameters.AddWithValue("@IncreamentValue", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text));
                        SCom.Parameters.AddWithValue("@MinApplyValue", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text));
                        SCom.Parameters.AddWithValue("@MaxApplyValue", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3")).Text));
                        SCom.Parameters.AddWithValue("@MaxLimitValue", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4")).Text));
                        SCom.Parameters.AddWithValue("@MinAmount", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox7")).Text));
                        SCom.Parameters.AddWithValue("@MaxAmount", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox8")).Text));
                        SCom.Parameters.AddWithValue("@IsPercntage", Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0]).Checked));
                        SCom.Parameters.AddWithValue("@Amount", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5")).Text));
                        SCom.Parameters.AddWithValue("@ApplyOrder", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox6")).Text));
                        SCom.Parameters.AddWithValue("@IsActive", Convert.ToString(((CheckBox)GridView1.Rows[e.RowIndex].Cells[12].Controls[0]).Checked));
                        SCom.Parameters.AddWithValue("@UpdateBy", "ayman");
                        SCom.Parameters.AddWithValue("@UpdateDate",UpdateDate);
                        SCon.Open();
                        SCom.ExecuteNonQuery();
                        GridView1.DataBind();
                        SCon.Close();
                    }
                }
            }
            catch (Exception)
            {

            }


        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DropDownList ContryDDL = (DropDownList)e.Row.FindControl("ContryDDL");
            DropDownList VendorDDL = (DropDownList)e.Row.FindControl("VendorDDL");
            DropDownList CalcTypeDDL = (DropDownList)e.Row.FindControl("CalcTypesDDl");
            DropDownList ProductsDDL = (DropDownList)e.Row.FindControl("ProductsDDL");
            SqlConnection Scon1 = null;
            SqlConnection Scon2 = null;
            SqlConnection Scon3 = null;
            SqlConnection Scon4 = null;
            SqlCommand ContryDDLCommand = null;
            SqlCommand VendorDDLCommand = null;
            SqlCommand CalcTypeDDLCommand = null;
            SqlCommand ProductDDLCommnad = null;
            DataSet DS1 = new DataSet();
            DataSet DS2 = new DataSet();
            DataSet DS3 = new DataSet();
            DataSet DS4 = new DataSet();


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    try
                    {

                            Scon1 = new SqlConnection(ConnectionString);
                            Scon2 = new SqlConnection(ConnectionString);
                            Scon3 = new SqlConnection(ConnectionString);
                            Scon4 = new SqlConnection(ConnectionString);
                            ContryDDLCommand = new SqlCommand("SELECT CountryID,CountryNameAR FROM dbo.Countries",Scon1);
                            VendorDDLCommand = new SqlCommand("SELECT Id,NameAR FROM dbo.Vendors",Scon2);
                            CalcTypeDDLCommand = new SqlCommand("SELECT Id,NameAr FROM dbo.CalcTypes", Scon3);
                            ProductDDLCommnad = new SqlCommand("SELECT Id,NameAr FROM dbo.Products WHERE IsDelete=0", Scon4);
                            SqlDataAdapter DA1 = new SqlDataAdapter(ContryDDLCommand);
                            SqlDataAdapter DA2 = new SqlDataAdapter(VendorDDLCommand);
                            SqlDataAdapter DA3 = new SqlDataAdapter(CalcTypeDDLCommand);
                            SqlDataAdapter DA4 = new SqlDataAdapter(ProductDDLCommnad);
                            DA1.Fill(DS1);
                            DA2.Fill(DS2);
                            DA3.Fill(DS3);
                            DA4.Fill(DS4);
                            ContryDDL.DataSource = DS1;
                            VendorDDL.DataSource = DS2;
                            CalcTypeDDL.DataSource = DS3;
                            ProductsDDL.DataSource = DS4;
                            ContryDDL.DataTextField = "CountryNameAR";
                            ContryDDL.DataValueField = "CountryID";      
                            VendorDDL.DataTextField = "NameAR";
                            VendorDDL.DataValueField = "Id";
                            CalcTypeDDL.DataTextField = "NameAr";
                            CalcTypeDDL.DataValueField = "Id";                       
                            ProductsDDL.DataTextField = "NameAr";
                            ProductsDDL.DataValueField = "Id";                       
                            ContryDDL.DataBind();
                            VendorDDL.DataBind();
                            CalcTypeDDL.DataBind();
                            ProductsDDL.DataBind();
                            String CountrySelect = DataBinder.Eval(e.Row.DataItem, "CountryNameAR").ToString();
                            ContryDDL.Items.FindByText(CountrySelect).Selected = true;
                            String VendorSelect = DataBinder.Eval(e.Row.DataItem, "vendorNameAR").ToString();
                            VendorDDL.Items.FindByText(VendorSelect).Selected = true;
                            String CalcSelect = DataBinder.Eval(e.Row.DataItem, "calctypeAR").ToString();
                            CalcTypeDDL.Items.FindByText(CalcSelect).Selected = true;
                            String ProductSelect = DataBinder.Eval(e.Row.DataItem, "ProductNameAR").ToString();
                            ProductsDDL.Items.FindByText(ProductSelect).Selected = true;
                            Scon1.Close();
                            Scon2.Close();
                            Scon3.Close();
                            Scon4.Close();
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            InsertlogEvent("User: " + Session["UserArName"] + " Was Delete ProductPrice ID: " + Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text));
            String DeleteDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlDataSource1.DeleteParameters["IsDelete"].DefaultValue = Convert.ToString(1);
            SqlDataSource1.DeleteParameters["DeleteBy"].DefaultValue = "ayman";
            SqlDataSource1.DeleteParameters["DeletedDate"].DefaultValue = DeleteDate;
            SqlConnection Scon = null;
            SqlCommand Scomm = null;
            try
            {
                using (Scon = new SqlConnection(ConnectionString))
                {
                    using (Scomm = new SqlCommand("DeletevpostproductPrice", Scon))
                    {
                        Scomm.CommandType = CommandType.StoredProcedure;
                        Scomm.Parameters.AddWithValue("@Id", Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text));
                        Scomm.Parameters.AddWithValue("@IsDelete",Convert.ToString(1));
                        Scomm.Parameters.AddWithValue("@DeleteBy", "ayman");
                        Scomm.Parameters.AddWithValue("@DeletedDate", DeleteDate);
                        Scon.Open();
                        Scomm.ExecuteNonQuery();
                        GridView1.DataBind();
                        Scon.Close();
                    }
                }
            }

            catch (Exception)
            {

            }
        }

        protected void AddPoductPrice_Click(object sender, EventArgs e)
        {
            String CreationDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlConnection Scon = null;
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
                {
                    using(SqlCommand Scom=new SqlCommand("InsertVPostProductsPrice", Scon))
                    {
                        Scom.CommandType = CommandType.StoredProcedure;
                        Scom.Parameters.AddWithValue("@ProductID",AddProductDDL.SelectedValue);
                        Scom.Parameters.AddWithValue("@CountryID",addCountrDDL.SelectedValue);
                        Scom.Parameters.AddWithValue("@VendorID",addVendorDDl.SelectedValue);
                        Scom.Parameters.AddWithValue("@CalcTypeId",AddCalcTypeDDl.SelectedValue);
                        Scom.Parameters.AddWithValue("@IncreamentValue",IncremantValue.Text);
                        Scom.Parameters.AddWithValue("@MinApplyValue", MinApplyValueTextBox.Text);
                        Scom.Parameters.AddWithValue("@MaxApplyValue",MaxApplyValueTextBox.Text);
                        Scom.Parameters.AddWithValue("@MaxLimitValue",MaxLimitValueTextBox.Text);

                        Scom.Parameters.AddWithValue("@MinAmount", Textbox9.Text);
                        Scom.Parameters.AddWithValue("@MaxAmount", Textbox10.Text);

                        Scom.Parameters.AddWithValue("@IsPercntage",IsPercntageCheckBox.Checked);
                        Scom.Parameters.AddWithValue("@Amount",AmountTextBox.Text);
                        Scom.Parameters.AddWithValue("@ApplyOrder",ApplyOrderTextBox.Text);
                        Scom.Parameters.AddWithValue("@IsActive",IsActiveCheckBox.Checked);
                        Scom.Parameters.AddWithValue("@CreateBy", "ayman");
                        Scom.Parameters.AddWithValue("@CreationDate", CreationDate);

                        Scon.Open();
                        Scom.ExecuteNonQuery();
                        Scon.Close();
                        GridView1.DataBind();

                    }
                }
                ClearAdd();
            }
            catch (Exception)
            {

            }
                
        }
        public void ClearAdd()
        {
            AddProductDDL.SelectedIndex = 0;
            addCountrDDL.SelectedIndex = 0;
            addVendorDDl.SelectedIndex = 0;
            AddCalcTypeDDl.SelectedIndex = 0;
            IncremantValue.Text = null;
            MinApplyValueTextBox.Text = null;
            MaxApplyValueTextBox.Text = null;
            MaxLimitValueTextBox.Text = null;
            IsPercntageCheckBox.Checked = false;
            AmountTextBox.Text = null;
            ApplyOrderTextBox.Text = null;
            Textbox9.Text = null;
            Textbox10.Text = null;
            IsActiveCheckBox.Checked = false;
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