using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";

        // Validate input fields
        if (string.IsNullOrEmpty(txtname.Text))
        {
            lblmsg.Text = "Please enter Name";
            return;
        }
        if (string.IsNullOrEmpty(txtemail.Text))
        {
            lblmsg.Text = "Please enter Email Id";
            return;
        }
        if (string.IsNullOrEmpty(txtmobile.Text))
        {
            lblmsg.Text = "Please enter Mobile";
            return;
        }
        if (string.IsNullOrEmpty(txtpasswors.Text))
        {
            lblmsg.Text = "Please enter Password";
            return;
        }

        // Open database connection
        Cnn.Open();

        // Get new user ID
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("SELECT ISNULL(MAX(id) + 1, 1) FROM [register]"));

        // Insert the user into the 'register' table
        Cnn.ExecuteNonQuery("INSERT INTO [register] (ID,name,mobile,email,password,rts,status) values ('" + ID + "',N'" + txtname.Text.Trim().Replace("'", "''") + "','" + txtmobile.Text + "','" + txtemail.Text + "','" + txtpasswors.Text + "',getdate(),1)");


        // Save user information in session and cookies

        lblmsg.Text = "";
        Random random = new Random();
        int RandomNumber = random.Next(1, 10000);
        Session["userid"] = ID;
        Session["username"] = txtname.Text;
        HttpCookie myCookie = new HttpCookie("userinfo");

        // Set the cookie value
        myCookie.Value = ID.ToString();

        // Set the expiration time (e.g., one day from now)
        myCookie.Expires = DateTime.Now.AddDays(365);
        // Add the cookie to the response
        Response.Cookies.Add(myCookie);

        Response.Redirect("login.aspx");
    }
}
