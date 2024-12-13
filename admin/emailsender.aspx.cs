using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class emailsender : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["examsurevy"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Optional: Initialize UI elements if needed
        }
    }

    protected void SendCertificates_Click(object sender, EventArgs e)
    {
        // Parse the start and end date from the textboxes
        DateTime startDate = DateTime.Parse(StartDateTextBox.Text);
        DateTime endDate = DateTime.Parse(EndDateTextBox.Text);
        
        // Call the method to fetch the data and send certificates
        FetchAndSendCertificates(startDate, endDate);
    }

    private void FetchAndSendCertificates(DateTime startDate, DateTime endDate)
    {
        // SQL query to fetch users based on the provided date range
        string query = @"
            SELECT a.name, a.email, 
                   (SELECT subjectname FROM examsubject WHERE id = 
                       (SELECT TOP 1 examid FROM result WHERE userid = a.id)) AS subjectname
            FROM register AS a
            WHERE a.rts BETWEEN @StartDate AND @EndDate"; // Corrected SQL query

        using (SqlConnection conn = new SqlConnection(connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@StartDate", startDate);
            cmd.Parameters.AddWithValue("@EndDate", endDate);

            try
            {
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string name = reader["name"].ToString();
                        string email = reader["email"].ToString();
                        string subjectname = reader["subjectname"].ToString();

                        // Generate the certificate for the student
                        byte[] certificateImage = GenerateCertificate(name, subjectname, DateTime.Now.ToString("yyyy/MM/dd"));

                        // Send the certificate via email
                        SendEmailWithCertificate(name, email, certificateImage);
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error (this can be saved to a log file or database)
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }
    }

    private byte[] GenerateCertificate(string studentName, string subjectname, string awardedDate)
    {
        // Path to the certificate template image
        string templatePath = Server.MapPath("~/img/Certificate1.jpg"); // Update with actual path

        // Open the template image and use Graphics to draw text on it
        using (Image bitmap = Image.FromFile(templatePath))
        using (Graphics graphics = Graphics.FromImage(bitmap))
        {
            Font nameFont = new Font("Arial", 32, FontStyle.Bold);
            Font dateFont = new Font("Arial", 20, FontStyle.Regular);
            SolidBrush brush = new SolidBrush(Color.Black);

            StringFormat format = new StringFormat
            {
                Alignment = StringAlignment.Center,
                LineAlignment = StringAlignment.Center
            };

            // Draw the student name, awarded date, and subject name on the certificate
            graphics.DrawString(studentName, nameFont, brush, new PointF(bitmap.Width / 2, 800), format);
            graphics.DrawString(awardedDate, dateFont, brush, new PointF(bitmap.Width / 1000, 1000), format);
            graphics.DrawString(subjectname, dateFont, brush, new PointF(bitmap.Width / 130, 1000), format);

            // Convert the image to a byte array and return it
            using (MemoryStream ms = new MemoryStream())
            {
                bitmap.Save(ms, ImageFormat.Jpeg);
                return ms.ToArray(); // Return the image as a byte array
            }
        }
    }

    private void SendEmailWithCertificate(string name, string email, byte[] certificateImage)
    {
        try
        {
            // Create the email message
            MailMessage mail = new MailMessage
            {
                From = new MailAddress("harshabaghel97@gmail.com"), // Replace with your email
                Subject = "Your Certificate",
                Body = "Dear ,\n\nCongratulations! Your certificate is attached.\n\nBest regards,\nYour Organization"
            };

            mail.To.Add(email);

            // Create the email attachment (certificate image)
            Attachment attachment = new Attachment(new MemoryStream(certificateImage), "Certificate.jpg", "image/jpeg");
            mail.Attachments.Add(attachment);

            // SMTP client configuration
            using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587)) // Update SMTP details if needed
            {
                smtp.Credentials = new NetworkCredential("harshabaghel97@gmail.com", "ioufmmbrrdwveugr"); // Replace with your email credentials
                smtp.EnableSsl = true;
                smtp.Send(mail); // Send the email
            }
        }
        catch (Exception ex)
        {
            // Log the error if the email fails
            System.Diagnostics.Debug.WriteLine("Error sending email to {email}: {ex.Message}");
        }
    }
}
