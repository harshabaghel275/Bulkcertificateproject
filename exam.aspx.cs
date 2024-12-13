using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web;

public partial class exam : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["examsurevy"].ConnectionString);
    DataTable dtQuestions;
    int currentQuestionIndex;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Check for user session via cookie
        HttpCookie myCookie1 = Request.Cookies["userinfo"];
        if (myCookie1 != null)
        {
            Session["userid"] = myCookie1.Value;
        }
        else
        {
            Response.Redirect("login.aspx");
        }

        if (!IsPostBack)
        {
            // Initialize questions on the first load
            LoadQuestions();
            if (ViewState["Questions"] != null)
            {
                ViewState["CurrentQuestionIndex"] = 0; // Start with the first question
                ShowQuestion();
            }
        }
    }

    private void LoadQuestions()
    {
        // Check if the query string parameter "couresdeatailsid" exists
        string courseDetailsId = Request.QueryString["couresdeatailsid"];
        if (string.IsNullOrEmpty(courseDetailsId))
        {
            // Handle the error or redirect
            FeedbackLabel.Text = "Course details ID is missing.";
            return;
        }

        // Proceed to load questions
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM exam WHERE subjectname=@subjectname", con))
        {
            cmd.Parameters.AddWithValue("@subjectname", courseDetailsId);

            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                dtQuestions = new DataTable();
                sda.Fill(dtQuestions);

                // Save the questions to ViewState for persistence
                ViewState["Questions"] = dtQuestions;
            }
        }
    }

    private void ShowQuestion()
    {
        dtQuestions = ViewState["Questions"] as DataTable;
        currentQuestionIndex = (int)ViewState["CurrentQuestionIndex"];

        if (dtQuestions != null && currentQuestionIndex < dtQuestions.Rows.Count)
        {
            DataRow question = dtQuestions.Rows[currentQuestionIndex];

            // Display question text
            QuestionLabel.Text = question["question"].ToString();

            // Populate options
            OptionsRadioButtonList.Items.Clear();
            OptionsRadioButtonList.Items.Add(new ListItem(question["option1"].ToString(), "1"));
            OptionsRadioButtonList.Items.Add(new ListItem(question["option2"].ToString(), "2"));
            OptionsRadioButtonList.Items.Add(new ListItem(question["option3"].ToString(), "3"));
            OptionsRadioButtonList.Items.Add(new ListItem(question["option4"].ToString(), "4"));

            // Store the correct answer in ViewState
            ViewState["rightanswer"] = question["correct_option"].ToString();
        }
        else
        {
            // No more questions, end the quiz
            Response.Redirect("quiz.aspx?couresdeatailsid=" + Request.QueryString["couresdeatailsid"] + "");
        }
    }

    protected void NextButton_Click(object sender, EventArgs e)
    {
        // Validate if an option is selected
        if (OptionsRadioButtonList.SelectedItem == null)
        {
            FeedbackLabel.Text = "Please select an answer before proceeding.";
            return;
        }

        // Get the user's selected option
        int selectedAnswer = int.Parse(OptionsRadioButtonList.SelectedValue);

        // Get the correct answer stored in ViewState
        int correctAnswer = int.Parse(ViewState["rightanswer"].ToString());

        // Get the current question ID
        dtQuestions = ViewState["Questions"] as DataTable;
        currentQuestionIndex = (int)ViewState["CurrentQuestionIndex"];
        DataRow currentQuestion = dtQuestions.Rows[currentQuestionIndex];
        int questionId = int.Parse(currentQuestion["id"].ToString()); // Assuming the primary key column is "id"

        // Determine if the answer is correct or not
        int resultValue = (selectedAnswer == correctAnswer) ? 1 : 0;

        // Insert the result into the database (1 for correct, 0 for incorrect)
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand
            {
                Connection = con,
                CommandText = "INSERT INTO result (examid,userid,totalquestion,selectoption,totslanswet) VALUES (@examid,@userid,@questionId,@selectedOption,@resultValue)"
            };

            // Retrieve the userId from session
            HttpCookie myCookie1 = Request.Cookies["userinfo"];
            if (myCookie1 != null)
            {
                string userId = myCookie1.Value;
                cmd.Parameters.AddWithValue("@userid", userId);
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            cmd.Parameters.AddWithValue("@examid", currentQuestion["subjectname"].ToString()); // assuming the "examid" is the subject name
            cmd.Parameters.AddWithValue("@questionId", questionId);
            cmd.Parameters.AddWithValue("@selectedOption", selectedAnswer);
            cmd.Parameters.AddWithValue("@resultValue", resultValue);

            // Execute the insert query
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            FeedbackLabel.Text = "An error occurred while saving your selection. Please try again.";
            return;
        }
        finally
        {
            con.Close();
        }

        // Provide feedback on the answer
        if (resultValue == 1)
        {
            FeedbackLabel.Text = "Correct! The right answer is option {correctAnswer}.";
        }
        else
        {
            FeedbackLabel.Text = "Incorrect. The correct answer is option {correctAnswer}.";
        }

        // Increment question index
        currentQuestionIndex++;
        ViewState["CurrentQuestionIndex"] = currentQuestionIndex;

        // Show the next question or end quiz
        ShowQuestion();
    }
}
