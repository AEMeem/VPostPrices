using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace VPostPrices_ControlPanel
{
    public partial class ShowAndEditProducts : System.Web.UI.Page
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
                Result.Text = null;
                if (!IsPostBack)

                {

                    fillDDL();
                    GridView1.DataBind();
                    InsertlogEvent("User: " + Session["UserArName"] + " Was Access to AddProduct Page");
                }
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
                    Scom.Parameters.AddWithValue("@PageLink", "AddProduct");
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
        public void fillDDL()
        {
            SqlCommand SC = null;
            SqlCommand SC1 = null;
            using(SqlConnection Cn=new SqlConnection(ConnectionString))
            {
                Cn.Open();
                using(SC=new SqlCommand("SELECT Id,UnitNameAr FROM Pricing.dbo.Units", Cn))
                {
                    SqlDataAdapter DA = new SqlDataAdapter(SC);
                    DataSet DS = new DataSet();
                    DA.Fill(DS);
                    UnitIdAdd.DataSource = DS;
                    UnitIdAdd.DataValueField = "Id";
                    UnitIdAdd.DataTextField = "UnitNameAr";
                    UnitIdAdd.DataBind();
                   
                }
                using(SC1=new SqlCommand("SELECT id,NameAr FROM Pricing.dbo.Products WHERE IsDelete=0", Cn))
                {
                    SqlDataAdapter DA1 = new SqlDataAdapter(SC1);
                    DataSet DS1 = new DataSet();
                    DA1.Fill(DS1);
                    ProductCalcFromAddDDl.DataSource = DS1;
                    ProductCalcFromAddDDl.DataTextField = "NameAr";
                    ProductCalcFromAddDDl.DataValueField = "id";
                    ProductCalcFromAddDDl.DataBind();
                    ProductCalcFromAddDDl.Items.Insert(0, new ListItem("غير محدد", "غير محدد"));
                    Cn.Close();
                }
            }
        }
        public void connections()
        {
            //String Production = "server=RHSQLAPP03\\SPSQLAPPRO01;uid=IPOMSSQLUSER;pwd=$QLipoms567User;database=Pricing";
            //String Test = "server=RHVSQLTST01\\TST01;uid=apps;pwd=apps123;database=Pricing";
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            InsertlogEvent("User: " + Session["UserArName"] + " Was Update Product ID: "+ Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text.ToString()));
            DropDownList unitDDL = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("UnitIDEditDDL"));
            DropDownList ProductCalculateFromDDl = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("CalcFromDDL"));

            SqlCommand SCommand = null;
            String id =Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text.ToString());
            String UpdateDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);

            SqlDataSource1_Product.UpdateParameters["UpdateBy"].DefaultValue = "Ayman";
            SqlDataSource1_Product.UpdateParameters["UpdateDate"].DefaultValue = UpdateDate;
            if (ProductCalculateFromDDl.SelectedIndex==0)
            {
                SqlDataSource1_Product.UpdateParameters["ProductCalculateFrom"].DefaultValue =null;
            }

            else
            {
                SqlDataSource1_Product.UpdateParameters["ProductCalculateFrom"].DefaultValue = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("CalcFromDDL")).SelectedValue;

            }
            SqlDataSource1_Product.UpdateParameters["UnitId"].DefaultValue = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("UnitIDEditDDL")).SelectedValue;

           
            String selectValueFromDDL = unitDDL.SelectedValue;
            String SelectFromCalcFrom = ProductCalculateFromDDl.SelectedValue;
            String billProduct = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5")).Text;
            try
            {
                using (SqlConnection SC = new SqlConnection(ConnectionString))
                {
                    using (SCommand = new SqlCommand("dbo.UpdateVPostProduct", SC))
                    {
                        SCommand.CommandType = CommandType.StoredProcedure;
                        SCommand.Parameters.AddWithValue("@Id",id );
                        SCommand.Parameters.AddWithValue("@NameAr", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text));
                        SCommand.Parameters.AddWithValue("@NameEn", Convert.ToString(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text));
                        if (ProductCalculateFromDDl.SelectedIndex == 0)
                        {
                            SCommand.Parameters.AddWithValue("@ProductCalculateFrom", DBNull.Value);
                        }

                        else
                        {
                            SCommand.Parameters.AddWithValue("@ProductCalculateFrom", ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("CalcFromDDL")).SelectedValue);
                        }
                        SCommand.Parameters.AddWithValue("@CalculateFromAmount", Convert.ToInt32(((CheckBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Checked));
                        SCommand.Parameters.AddWithValue("@InternalyCaculated", Convert.ToInt32(((CheckBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Checked));

                        SCommand.Parameters.AddWithValue("@DoVATCalc", Convert.ToInt32(((CheckBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Checked));
                        SCommand.Parameters.AddWithValue("@IsVATProduct", Convert.ToInt32(((CheckBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Checked));
                        SCommand.Parameters.AddWithValue("@ShowZeroAmount", Convert.ToInt32(((CheckBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Checked));
                        SCommand.Parameters.AddWithValue("@DisplayOrder", Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4")).Text));
                        if (billProduct=="")
                        {
                            SCommand.Parameters.AddWithValue("@BillProductId", DBNull.Value);
                        }
                        else
                        {
                            SCommand.Parameters.AddWithValue("@BillProductId", Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5")).Text));
                        }
                        SCommand.Parameters.AddWithValue("@UnitId", ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("UnitIDEditDDL")).SelectedValue);
                        SCommand.Parameters.AddWithValue("@ForceValueAsRecieved", Convert.ToInt32(((CheckBox)GridView1.Rows[e.RowIndex].Cells[10].Controls[0]).Checked));    
                        SCommand.Parameters.AddWithValue("@IsActive", Convert.ToInt32(((CheckBox)GridView1.Rows[e.RowIndex].Cells[13].Controls[0]).Checked));
                        SCommand.Parameters.AddWithValue("@IsMultiplyQuantity", Convert.ToInt32(((CheckBox)GridView1.Rows[e.RowIndex].Cells[14].Controls[0]).Checked));
                        SCommand.Parameters.AddWithValue("@UpdateBy", "Ayman");
                        SCommand.Parameters.AddWithValue("@UpdateDate", UpdateDate);
                        SCommand.Parameters.Add("@ReturnMSG", SqlDbType.VarChar, 400).Direction = ParameterDirection.Output;
                        SCommand.Parameters.Add("@ReturnCode", SqlDbType.Int).Direction = ParameterDirection.Output;
                        SC.Open();
                        SCommand.ExecuteNonQuery();
                        GridView1.DataBind();
                        Result.Text = SCommand.Parameters["@ReturnMSG"].Value.ToString();
                        SC.Close();
                        

                    }
                }
                //SqlConnection SC = new SqlConnection("server=RHVSQLTST01\\TST01;uid=apps;pwd=apps123;database=Pricing");
                //SqlCommand SCommand = new SqlCommand("dbo.UpdateVPostProduct", SC);

            }
            catch (Exception ex)
            {
               
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }


        //protected void SqlDataSource1_Product_Updating(object sender, SqlDataSourceCommandEventArgs e)
        //{
        //    String UpdateDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
        //    SqlDataSource1_Product.UpdateParameters["UpdateBy"].DefaultValue = Application["UserName"].ToString();
        //    SqlDataSource1_Product.UpdateParameters["UpdateDate"].DefaultValue = UpdateDate;   
        //}

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            InsertlogEvent("User: " + Session["UserArName"] + " Was Delete Product ID: " + Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text));
            String DeleteDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            SqlDataSource1_Product.DeleteParameters["IsDelete"].DefaultValue = Convert.ToString(1);
            SqlDataSource1_Product.DeleteParameters["DeleteBy"].DefaultValue = "ayman";
            SqlDataSource1_Product.DeleteParameters["DeletedDate"].DefaultValue = DeleteDate;
         
            try
            {
                SqlConnection SC = new SqlConnection(ConnectionString);
                SqlCommand SCOM = new SqlCommand("Deletevpostproduct", SC);
                SCOM.CommandType = CommandType.StoredProcedure;
                SCOM.Parameters.AddWithValue("@Id", Convert.ToString(((Label)GridView1.Rows[e.RowIndex].FindControl("Id")).Text));
                SCOM.Parameters.AddWithValue("@IsDelete", Convert.ToString(1));
                SCOM.Parameters.AddWithValue("@DeleteBy", "ayman");
                SCOM.Parameters.AddWithValue("@DeletedDate", DeleteDate);
                SCOM.Parameters.Add("@ReturnMSG", SqlDbType.VarChar, 400).Direction = ParameterDirection.Output;
                SCOM.Parameters.Add("@ReturnCode", SqlDbType.Int).Direction = ParameterDirection.Output;

                SC.Open();
                SCOM.ExecuteNonQuery();
                GridView1.DataBind();
                SC.Close();
            }
            catch (Exception)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand Scom=null;
            String NameAR = NameAr.Text.ToString();
            String NameEN=NameEn.Text.ToString();
            String PCode = ProductCode.Text.ToString();
            String CreatedBy= "ayman";
            String CreateDate = Convert.ToUInt32(DateTime.Now.Year) + "-" + Convert.ToUInt32(DateTime.Now.Month.ToString()) + "-" + Convert.ToUInt32(DateTime.Now.Day) + " " + Convert.ToUInt32(DateTime.Now.Hour) + ":" + Convert.ToUInt32(DateTime.Now.Minute) + ":" + Convert.ToUInt32(DateTime.Now.Second) + "." + Convert.ToUInt32(DateTime.Now.Millisecond);
            if (CheckProductCode(PCode) == true || PCode=="")
            {
                try
                {
                    using (SqlConnection SC = new SqlConnection(ConnectionString))
                    {
                        using (Scom = new SqlCommand("InsertVPostProducts", SC))
                        {
                            Scom.CommandType = CommandType.StoredProcedure;
                            Scom.Parameters.AddWithValue("@NameAr", NameAr.Text);
                            Scom.Parameters.AddWithValue("@NameEn", NameEn.Text);
                            Scom.Parameters.AddWithValue("@ProductCode", ProductCode.Text);
                            if (ProductCalcFromAddDDl.SelectedIndex == 0)
                            {
                             Scom.Parameters.AddWithValue("@ProductCalculateFrom", DBNull.Value);
                            }
                            else
                            {
                             Scom.Parameters.AddWithValue("@ProductCalculateFrom", ProductCalcFromAddDDl.SelectedValue);
                            }
                            Scom.Parameters.AddWithValue("@DoVATCalc", DoVATCalc.Checked);
                            Scom.Parameters.AddWithValue("@CalculateFromAmount", CalcFromAmountCheck.Checked);
                            Scom.Parameters.AddWithValue("@InternalyCaculated", InernalCalCheck.Checked);
                            Scom.Parameters.AddWithValue("@IsVATProduct", IsVATProduct.Checked);
                            Scom.Parameters.AddWithValue("@ShowZeroAmount", ShowZeroAmount.Checked);
                            Scom.Parameters.AddWithValue("@DisplayOrder", DisplayOrder.Text);
                            if (BillProductId.Text == "")
                            {
                                Scom.Parameters.AddWithValue("@BillProductId", DBNull.Value);

                            }
                            else
                            {
                                Scom.Parameters.AddWithValue("@BillProductId", BillProductId.Text);
                            }
                            Scom.Parameters.AddWithValue("@UnitId", UnitIdAdd.SelectedValue);
                            Scom.Parameters.AddWithValue("@ForceValueAsRecieved", ForceValueAsRecieved.Checked);
                            Scom.Parameters.AddWithValue("@DescriptionAr", DescriptionAr.Text);
                            Scom.Parameters.AddWithValue("@DescriptionEn", DescriptionEn.Text);
                            Scom.Parameters.AddWithValue("@IsActive", IsActive.Checked);
                            Scom.Parameters.AddWithValue("@IsMultiplyQuantity", IsMultipleQuantity.Checked);
                            Scom.Parameters.AddWithValue("@CreateBy", "ayman");
                            Scom.Parameters.AddWithValue("@CreationDate", CreateDate);


                            SC.Open();
                            Scom.ExecuteNonQuery();
                            SC.Close();
                            GridView1.DataBind();
                            InsertlogEvent("User: " + Session["UserArName"] + " Was Add new Product");
                        }

                    }
                    clearInserValue();
                }
                catch (Exception)
                {

                }
            }
            else
            {
                ErrorL.Text = "الكود مستخدم بالفعل";
            }
        }

        public Boolean CheckProductCode(String PCode) { 

          Boolean Results = false;
          SqlConnection Scon = null;
           
            try
            {
                using(Scon=new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("CheckProductCode", Scon);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@ProductCode", PCode);
                    Scon.Open();
                    SqlDataAdapter DA1 = new SqlDataAdapter(Scom);
                    DataSet DS1 = new DataSet();
                    DA1.Fill(DS1,"Result");
                    if (DS1.Tables["Result"].Rows.Count == 0)
                    {
                        Results = true;
                    }
                    else
                    {
                        Results = false;
                    }
                }
            }
            catch (Exception)
            {

            }
            return Results;
        }

        public void clearInserValue()
        {
            NameAr.Text = null;
            NameEn.Text = null;
            ProductCode.Text = null;
            DoVATCalc.Checked = false;
            IsVATProduct.Checked = false;
            ShowZeroAmount.Checked = false;
            DisplayOrder.Text = null;
            BillProductId.Text = null;
            UnitIdAdd.SelectedIndex = 0;
            ProductCalcFromAddDDl.SelectedIndex = 0;
            ForceValueAsRecieved.Checked = false;
            DescriptionAr.Text = null;
            DescriptionEn.Text = null;
            IsActive.Checked = false;
            CalcFromAmountCheck.Checked=false;
            InernalCalCheck.Checked=false;
            ErrorL.Text = null;
            IsMultipleQuantity.Checked = false;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
          
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DataSet unitIdDS = new DataSet();
                    DataSet CalcDS = new DataSet();
                    SqlConnection Sc = new SqlConnection(ConnectionString);
                    SqlConnection Sc1 = new SqlConnection(ConnectionString);
                    SqlCommand Scom = new SqlCommand("SELECT Id,UnitNameAr FROM Pricing.dbo.Units", Sc);
                    SqlCommand Scom1 = new SqlCommand("SELECT id,NameAr FROM Pricing.dbo.Products WHERE IsDelete=0", Sc1);
                    SqlDataAdapter DA = new SqlDataAdapter(Scom);
                    SqlDataAdapter DA1 = new SqlDataAdapter(Scom1);
                    DA.Fill(unitIdDS);
                    DA1.Fill(CalcDS);

                    DropDownList unitId = (DropDownList)e.Row.FindControl("UnitIDEditDDL");
                    unitId.DataSource = unitIdDS;
                    unitId.DataTextField = "UnitNameAr";
                    unitId.DataValueField = "Id";
                    unitId.DataBind();

                    DropDownList CalcList = (DropDownList)e.Row.FindControl("CalcFromDDL");
                    CalcList.DataSource = CalcDS;
                    CalcList.DataTextField = "NameAr";
                    CalcList.DataValueField = "id";
                    CalcList.DataBind();
                    CalcList.Items.Insert(0, new ListItem("غير محدد", "غير محدد"));

                    String SelectedUnit = DataBinder.Eval(e.Row.DataItem, "UnitNameAr").ToString();
                    unitId.Items.FindByText(SelectedUnit).Selected = true;

                    String SelectCalc = DataBinder.Eval(e.Row.DataItem, "ProductCalculateFrom").ToString();
                    if (SelectCalc != "")
                    {
                        CalcList.Items.FindByText(SelectCalc).Selected = true;
                    }
                }
            }

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