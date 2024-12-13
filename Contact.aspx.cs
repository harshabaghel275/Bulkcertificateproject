using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Cnn.Open();
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select IsNull(Max(id)+1,1) From [contact]"));

        Cnn.ExecuteNonQuery("INSERT INTO [contact] (id,Name,Email,Phone,tellabout,rts,status) values ('" + ID + "','" + txtname.Text + "','" + txtemail.Text + "','" + txtphone.Text + "','" + txttell.Text + "',getdate(),1)");
        Cnn.Close();
        clear();

        
    }
    private void clear()
    {
        txtname.Text = "";
        txtemail.Text = "";
        txtphone.Text = "";
        txttell.Text = "";
       





    }
}