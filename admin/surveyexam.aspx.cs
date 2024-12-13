using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class surveyexam : System.Web.UI.Page
{
    // Retrieve the connection string from the configuration file
    ClsConnection Cnn = new ClsConnection();
    private readonly string connectionString = ConfigurationManager.ConnectionStrings["examsurevy"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            list();
            string asdid = Request.QueryString["asdid"];
            if (!string.IsNullOrEmpty(asdid))
            {
                Cnn.Open();
                DataTable dt = Cnn.FillTable("SELECT * FROM [examsubject] WHERE id = '" + asdid + "'", "Detail");
                if (dt.Rows.Count > 0)
                {
                   
                     TextBox1.Text = dt.Rows[0]["subjectname"].ToString();

                }
                else
                {
                    // Handle case where no data is found for the specified ID
                    Response.Write("<script>alert('No data found for the specified ID.');</script>");
                }
                if (asdid != null)
                {
                    Button1.Visible = false;
                    Button2.Visible = true;
                }
                Cnn.Close();
            }
        }


    }
    public void list()
    {
        DataTable dt = Cnn.FillTable("select * from [examsubject]", "Detail");
        //ListView1.DataSource = dt;
        //ListView1.DataBind();
        hdnvalue.Value = dt.Rows[0]["id"].ToString();
        TextBox1.Text = dt.Rows[0]["subjectname"].ToString();
       


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // Validate the input
        if (string.IsNullOrWhiteSpace(TextBox1.Text))
        {
            // Display error if input is invalid
            Response.Write("<script>alert('Please enter a subject name.');</script>");
            return;
        }

        // Define the SQL query to get the max ID
        string getMaxIdQuery = "SELECT ISNULL(MAX(id), 0) + 1 FROM [examsubject]"; // Query to get the max ID and increment by 1

        // Define the SQL query to insert data
        string insertQuery = "INSERT INTO examsubject (id, subjectname, status, rts) VALUES (@Id, @SubjectName, @Status, @Rts)";

        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Get the maximum ID from the "Adda" table
                int newId = 0;
                using (SqlCommand cmdMaxId = new SqlCommand(getMaxIdQuery, con))
                {
                    con.Open();
                    newId = Convert.ToInt32(cmdMaxId.ExecuteScalar()); // Execute and retrieve the max ID, incremented by 1
                    con.Close();
                }

                // Now insert the new record with the new ID
                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    // Add parameters to prevent SQL injection
                    cmd.Parameters.AddWithValue("@Id", newId);
                    cmd.Parameters.AddWithValue("@SubjectName", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Status", 1); // Active status (default is 1)
                    cmd.Parameters.AddWithValue("@Rts", DateTime.Now); // Record timestamp

                    // Open the connection
                    con.Open();
                    // Execute the command
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        // Success message
                        Response.Write("<script>alert('Subject added successfully.');</script>");
                        TextBox1.Text = ""; // Clear the input field
                    }
                    else
                    {
                        // Failure message
                        Response.Write("<script>alert('Error adding subject. Please try again.');</script>");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Log the exception and show a user-friendly message
            Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Cnn.Open();
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(id)+1,1) From [examsubject]"));
        Cnn.Open();

        Cnn.ExecuteNonQuery("update examsubject set subjectname ='" + TextBox1.Text + "', where id ='" + Request.QueryString["asdid"] + "'");
        Cnn.Close();
        Button1.Visible = true;
        Button2.Visible = false;

    }
}
