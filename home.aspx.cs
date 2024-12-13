using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["examsurevy"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["userid"] == null)
        //{
        //    Response.Redirect("register.aspx");
        //}

        BindListView1();
    }
    private void BindListView1()
    {
       Cnn.Open();
        DataTable dt = Cnn.FillTable("select  *  from [examsubject] where status=1", "Detail");
        Cnn.Close();
        ListView1.DataSource = dt;
        ListView1.DataBind();
        }
    }

  
