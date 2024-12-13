using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class examlist : System.Web.UI.Page
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
        DataTable dt = Cnn.FillTable("select * from [exam] where status=1", "Detail");
        categoryListView.DataSource = dt;
        categoryListView.DataBind();
    }
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    protected void categoryListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            Label lbl_Id = (Label)e.Item.FindControl("lblid");
            Cnn.Open();
            Cnn.ExecuteNonQuery("delete from [exam] where id= '" + lbl_Id.Text + "'");
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