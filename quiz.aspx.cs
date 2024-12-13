using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using System.Net.Mail;
using System.Web.UI;
using System.Net;
using System.IO;

public partial class quiz : System.Web.UI.Page
{
    // Variables for holding quiz details
    public static string examname = string.Empty;
    public static string category = string.Empty;
    public static string Totalquestion = string.Empty;
    public static string totalquestionattampt = string.Empty;

    // Database connection string
    private readonly string connectionString = ConfigurationManager.ConnectionStrings["examsurevy"].ConnectionString;
    ClsConnection cnn = new ClsConnection();
    ClsConnection Cnn = new ClsConnection();
    private object name;

    protected void Page_Load(object sender, EventArgs e)
    {

        HttpCookie myCookie1 = Request.Cookies["userinfo"];

        // Check if the cookie exists
        if (myCookie1 != null)
        {

            Session["userid"] = myCookie1.Value;
        } if (Session["userid"] == null) { Response.Redirect("login.aspx"); }
        if (!IsPostBack)
        {

            // Open the connection
            cnn.Open();

            // Get total questions answered by the user
            Totalquestion = cnn.ExecuteScalar("select count(*) from result where examid=" + Request.QueryString["couresdeatailsid"] + " and userid='" + Session["userid"] + "'").ToString();
            totalquestionattampt = cnn.ExecuteScalar("select count(*) from result where totalquestion=1 and examid=" + Request.QueryString["couresdeatailsid"] + " and userid='" + Session["userid"] + "'").ToString();
            lblusername.Text = cnn.ExecuteScalar("select name from [register] where id=" + Session["userid"] + "").ToString();
            category = cnn.ExecuteScalar("select subjectname from examsubject where id=" + Request.QueryString["couresdeatailsid"] + "").ToString();
            lblcategory.Text = category;
            // Get the category of the exam


            // Fetch the attempted questions data


            // Bind the data to ListView

            // Close the connection
            cnn.Close();
        }
    }




    
    protected void Button1_Click(object sender, EventArgs e)
    {
        // Path to your certificate template
        string imagePath = Server.MapPath("~/img/Certificate1.jpg"); // Update with actual path
        using (System.Drawing.Image bitmap = System.Drawing.Image.FromFile(imagePath))
        {
            // Create graphics object to edit the image
            using (Graphics graphicsImage = Graphics.FromImage(bitmap))
            {
                // Fonts and colors
                Font titleFont = new Font("Times New Roman", 28, FontStyle.Bold);
                Font subtitleFont = new Font("Arial", 16, FontStyle.Regular);
                Font nameFont = new Font("Arial", 20, FontStyle.Bold);
                SolidBrush brush = new SolidBrush(Color.Black);

                // Text alignment
                StringFormat stringFormat = new StringFormat
                {
                    Alignment = StringAlignment.Center,
                    LineAlignment = StringAlignment.Center
                };

                // Dynamic content
                string recipientName = lblusername.Text;
                string subjectName = lblcategory.Text;
                string awardedDate = DateTime.Now.ToString("dd/MM/yyyy");

                // Position for recipient name
                float recipientNameYPosition = 700 + 40;

                // Add recipient name
                graphicsImage.DrawString(recipientName, nameFont, brush, new PointF(bitmap.Width / 2, recipientNameYPosition), stringFormat);

                // Add subject and date fields
                graphicsImage.DrawString(subjectName, subtitleFont, brush, new PointF(600, 1000), stringFormat); // Adjust x,y position
                graphicsImage.DrawString(awardedDate, subtitleFont, brush, new PointF(1300, 1000), stringFormat); // Adjust x,y position

                // Save the image to a memory stream for both download and email
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    bitmap.Save(memoryStream, ImageFormat.Jpeg);
                    byte[] imageBytes = memoryStream.ToArray();

                    // Send email with the certificate as attachment
                    SendEmailWithCertificate(imageBytes);

                    // Trigger the certificate download
                    TriggerDownload(imageBytes);
                }
            }
        }
    }

    private void TriggerDownload(byte[] certificateImage)
    {
        // Set the HTTP headers to force download
        Response.Clear();
        Response.ContentType = "image/jpeg";
        Response.AddHeader("Content-Disposition", "attachment; filename=Certificate.jpg");
        Response.BinaryWrite(certificateImage);
        Response.End(); // End the response to trigger the download
    }

    private string GetUserEmail(string username)
    {
        string userEmail = string.Empty;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT email FROM register WHERE name = @username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", username);

            try
            {
                conn.Open();
                userEmail = cmd.ExecuteScalar() as string; // Retrieve the email address
            }
            catch (Exception ex)
            {
                Response.Write("Database Error: " + ex.Message);
            }
        }

        return userEmail;
    }

    private void SendEmailWithCertificate(byte[] certificateImage)
    {
        try
        {
            string userEmail = GetUserEmail(lblusername.Text);

            if (!string.IsNullOrEmpty(userEmail))
            {
                MailMessage mail = new MailMessage
                {
                    From = new MailAddress("harshabaghel97@gmail.com"),
                    Subject = "Your Certificate",
                    Body = "Dear " + lblusername.Text + ",\n\nPlease find your certificate attached.\n\nBest regards,\nYour Organization"
                };
                mail.To.Add(userEmail);

                // Create email attachment
                Attachment attachment = new Attachment(new MemoryStream(certificateImage), "Certificate.jpg", "image/jpeg");
                mail.Attachments.Add(attachment);

                // Send email via SMTP
                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com"))
                {
                    smtp.Credentials = new NetworkCredential("harshabaghel97@gmail.com", "ioufmmbrrdwveugr");
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }
            else
            {
                Response.Write("Error: User email not found.");
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.Message);
        }
    }

}





