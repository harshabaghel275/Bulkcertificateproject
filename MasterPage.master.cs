using System;
using System.Web;

public partial class MasterPage : System.Web.UI.MasterPage
{ClsConnection Cnn = new ClsConnection();
    public static string uname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

           
           
           
            HttpCookie myCookie1 = Request.Cookies["userinfo"];

            // Check if the cookie exists
            if (myCookie1 != null)
            {

                Session["userid"] = myCookie1.Value;
                Cnn.Open();
                uname = Cnn.ExecuteScalar("select name from register where id=" + Session["userid"] + "").ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;<a href='logout.aspx'>Logout</a>";
                Cnn.Close();

                
            }
            else
            {
                uname = "Guest";
            }


         


        }

    }
           
           
        }
       
    

