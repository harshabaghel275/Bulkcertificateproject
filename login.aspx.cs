using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        if (txtmobile.Text == "")
        {
            lblmsg.Text = "Please enter User Name";
            return;
        }
        if (txtpasswors.Text == "")
        {
            lblmsg.Text = "Please enter Password";
            return;
        }
        DataSet ds = new DataSet();
        Cnn.Open();
        Cnn.FillDataSet(ds, "select * from [register] where mobile = '" + txtmobile.Text.Replace("'", "''") + "'COLLATE SQL_Latin1_General_CP1_CS_AS and Password = '" + txtpasswors.Text.Replace("'", "''") + "'", "Admin_Login");
        Cnn.Close();
        if (ds.Tables[0].Rows.Count == 0)
        {
            lblmsg.Text = "Please Enter Correct Username & Password";
        }
        else
        {
            lblmsg.Text = "";
            Random random = new Random();
            int RandomNumber = random.Next(1, 10000);


            HttpCookie myCookie = new HttpCookie("userinfo");

            // Set the cookie value
            myCookie.Value = ds.Tables[0].Rows[0]["Id"].ToString();

            // Set the expiration time (e.g., one day from now)
            myCookie.Expires = DateTime.Now.AddDays(365);
            // Add the cookie to the response
            Response.Cookies.Add(myCookie);


            Response.Redirect("home.aspx");
        }
    }
}