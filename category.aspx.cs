using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class category : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
   

    protected void Page_Load(object sender, EventArgs e)
    {

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