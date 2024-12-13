using System;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

public partial class registerlist : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            list();
        }

    }
    public void list()
    {
        DataTable dt = Cnn.FillTable("select * from [register] where status=1", "Detail");
        categoryListView.DataSource = dt;
        categoryListView.DataBind();
    }
   

    protected void categoryListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            Label lbl_Id = (Label)e.Item.FindControl("lblid");
            Cnn.Open();
            Cnn.ExecuteNonQuery("delete from [register] where id= '" + lbl_Id.Text + "'");
            Cnn.Close();
            list();

        }

    }
    protected void categoryListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }

    protected void categoryListView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {

        list();
    }


    protected void categoryListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }

}
