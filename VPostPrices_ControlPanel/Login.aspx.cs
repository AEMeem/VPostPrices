using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.DirectoryServices;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VPostPrices_ControlPanel
{
    public partial class NewLogin : System.Web.UI.Page
    {
        public String ConnectionString = ConfigurationManager.ConnectionStrings["PricingConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DirectoryEntry DR = new DirectoryEntry();
            DR.Username = UserName.Text;
            DR.Password = Paswword.Text;
            DirectorySearcher DS = new DirectorySearcher(DR);
            try
            {
                DS.FindOne();
                Session["UserArName"] = UserName.Text;
                Session["Password"] = Paswword.Text;
                if (checkUserPermisson(Session["UserArName"].ToString()) == true)
                {
                    InsertlogEvent("Login Success for user: " + Session["UserArName"].ToString());
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    InsertlogEvent("Login not Success for AD user: " + Session["UserArName"].ToString());
                    Label1.Text = "لاتوجد لديك صلاحية للدخول على النظام";
                }
            }
            catch (COMException ex)
            {
                if (ex.ErrorCode == -2147023570)
                {
                    Label1.Text = " خطأ في أسم المستخدم أو كلمة المرور";
                }

            }
        }

        public Boolean checkUserPermisson(String UserName)
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
                    Scom.Parameters.AddWithValue("@UserName", UserName);
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