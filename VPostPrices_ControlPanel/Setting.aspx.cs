using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VPostPrices_ControlPanel
{
    public partial class Setting : System.Web.UI.Page
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
                    Scom.Parameters.AddWithValue("@PageLink", "SettingPage");
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

        protected void AddUser_Click(object sender, EventArgs e)
        {
            SqlConnection cn = null;
            try
            {
                using(cn=new SqlConnection(ConnectionString))
                {
                    SqlCommand Scom = new SqlCommand("Insertuserpermissons", cn);
                    Scom.CommandType = CommandType.StoredProcedure;
                    Scom.Parameters.AddWithValue("@UserName", UserName.Text);
                    Scom.Parameters.AddWithValue("@ArName", UserNameAR.Text);
                    Scom.Parameters.AddWithValue("@WithSettings", SettingCheck.Checked);
                    Scom.Parameters.AddWithValue("@CreatedBy", Session["UserArName"]);
                    cn.Open();
                    Scom.ExecuteNonQuery();
                    CurrentPermisson.DataBind();
                    cn.Close();
                    clearInsert();
                }
            }
            catch (Exception)
            {

            }
        }
        public void clearInsert()
        {
            UserName.Text = null;
            UserNameAR.Text = null;
            SettingCheck.Checked = false;
        }

        protected void CurrentPermisson_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}