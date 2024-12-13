using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminexam : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        couresBindlist();
          if (!IsPostBack)
        {
            list();
            string asdid = Request.QueryString["asdid"];
            if (!string.IsNullOrEmpty(asdid))
            {
                Cnn.Open();
                DataTable dt = Cnn.FillTable("SELECT * FROM [exam] WHERE id = '" + asdid + "'", "Detail");
                if (dt.Rows.Count > 0)
                {
                    questiontxt.Text = dt.Rows[0]["question"].ToString();
                    option1txt.Text = dt.Rows[0]["option1"].ToString();
                    option2txt.Text = dt.Rows[0]["option2"].ToString();
                    option3txt.Text = dt.Rows[0]["option3"].ToString();
                    option4txt.Text = dt.Rows[0]["option4"].ToString();
                    answertxt.Text = dt.Rows[0]["rigthanswer"].ToString();
                    DropDownList2.SelectedValue = dt.Rows[0]["correct_option"].ToString();

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
        DataTable dt = Cnn.FillTable("select * from [exam]", "Detail");
        //ListView1.DataSource = dt;
        //ListView1.DataBind();
        hdnvalue.Value = dt.Rows[0]["id"].ToString();
        questiontxt.Text = dt.Rows[0]["question"].ToString();
        option1txt.Text = dt.Rows[0]["option1"].ToString();
        option2txt.Text = dt.Rows[0]["option2"].ToString();
        option3txt.Text = dt.Rows[0]["option3"].ToString();
        option4txt.Text = dt.Rows[0]["option4"].ToString();
        answertxt.Text = dt.Rows[0]["rigthanswer"].ToString();
        DropDownList2.SelectedValue = dt.Rows[0]["correct_option"].ToString();



    }
    
    public void couresBindlist()
    {
        Cnn.Open();
        DataTable dt = Cnn.FillTable("select * from [examsubject ] where status=1", "Detail");
        DropDownList1.DataSource = dt;
        DropDownList1.DataBind();
        Cnn.Close();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        Cnn.Open();
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select IsNull(Max(id)+1,1) From [exam]"));

        Cnn.ExecuteNonQuery("INSERT INTO [exam] (id,subjectname,question,option1,option2,option3,option4,rigthanswer,rts,status,correct_option) values ('" + ID + "','" + DropDownList1.SelectedValue + "','" + questiontxt.Text + "','" + option1txt.Text + "','" + option2txt.Text + "','" + option3txt.Text + "','" + option4txt.Text + "','" + answertxt.Text + "',getdate(),1,'" + DropDownList2.SelectedValue + "')");
        Cnn.Close();
        clear();

        ShowMessage("Record submitted successfully", MessageType.Success);
    }
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    private void clear()
    {
        questiontxt.Text = "";
        option1txt.Text = "";
        option2txt.Text = "";
        option3txt.Text = "";
        option4txt.Text = "";
        answertxt.Text = "";





    }
    protected void Button2_Click(object sender, EventArgs e)
    {
     
        Cnn.Open();
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(id)+1,1) From [exam]"));
        Cnn.Open();

        Cnn.ExecuteNonQuery("update exam set question ='" + questiontxt.Text + "',subjectname='" + DropDownList1.SelectedValue + "', option1 ='" + option1txt.Text + "',option2 ='" + option2txt.Text + "',option3 ='" + option3txt.Text + "',option4 ='" + option4txt.Text + "',rigthanswer ='" + answertxt.Text + "',correct_option='" + DropDownList2.SelectedValue + "' where id ='" + Request.QueryString["asdid"] + "'");
        Cnn.Close();
        Button1.Visible = true;
        Button2.Visible = false;


    }
}