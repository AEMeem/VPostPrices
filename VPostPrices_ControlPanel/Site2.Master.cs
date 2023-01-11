using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VPostPrices_ControlPanel
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        public String ConnectionString = ConfigurationManager.ConnectionStrings["PricingConnectionString"].ConnectionString;
        public Label userLabel;
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                //String UserName = Session["UserArName"].ToString();
                //String Password = Session["Password"].ToString();
                //if (UserName.Equals(null) && Password.Equals(null))
                //{
                //    Response.Redirect("Login.aspx");
                //}
                //else
                //{
                //    PrincipalContext Context = new PrincipalContext(ContextType.Domain);
                //    UserPrincipal UP = UserPrincipal.FindByIdentity(Context, IdentityType.SamAccountName, (String) Session["UserArName"]);
                //    userNameLabel.Text = "مرحبا" + "  " + UP.Description.ToString() + "\n";

                    //System.DirectoryServices.AccountManagement.UserPrincipal.Current.Description;
                   
                        LinkButton1.Visible = true;
                    
                
               
            
            }
            catch (Exception)
            {
                Response.Redirect("Login.aspx");
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

        protected void lnkExit_top_Click(object sender, EventArgs e)
        {
            Session["UserArName"] = null;
            Session["Password"] = null;
            userNameLabel.Text=null;       
            Response.Redirect("Login.aspx");
        }

    }
}