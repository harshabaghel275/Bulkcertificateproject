using System;
using System.Data;
using System.Data.SqlClient; // Ensure this namespace is included for database connectivity
using System.Web.UI;

public partial class admin_LOGIN : Page
{
    // Assuming ClsConnection is your custom database connection helper class
    ClsConnection Cnn = new ClsConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblmsg.Text = ""; // Clear error message on initial page load
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        if (Txtusername.Text == "")
        {
            lblmsg.Text = "Please enter User Name";
            return;
        }
        if (Txtpassword.Text == "")
        {
            lblmsg.Text = "Please enter Password";
            return;
        }
        DataSet ds = new DataSet();
        Cnn.Open();
        Cnn.FillDataSet(ds, "select * from [AdminLogin] where UserName = '" + Txtusername.Text.Replace("'", "''") + "'COLLATE SQL_Latin1_General_CP1_CS_AS and Password = '" + Txtpassword.Text.Replace("'", "''") + "'", "Admin_Login");
        Cnn.Close();
        if (ds.Tables[0].Rows.Count == 0)
        {
            lblmsg.Text = "Please Enter Correct Username & Password";
        }
        else
        {
            Response.Redirect("~/admin/adminexam.aspx");
        }
    }
}
