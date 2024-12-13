<%@ Page Title="Quiz Result" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="quiz.aspx.cs" Inherits="quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <style>
        .result-container {
            background-color: #ffffff;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 90%;
            max-width: 600px;
        }

            .result-container h1 {
                font-size: 2.5em;
                color: #333;
                margin: 0 0 20px;
            }

            .result-container p {
                font-size: 1.2em;
                color: #666;
                margin: 10px 0;
            }

        .score {
            font-size: 3em;
            font-weight: bold;
            color: #0072ff;
            margin: 20px 0;
        }

        .summary {
            font-size: 1.5em;
            color: #333;
            margin: 20px 0;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1em;
            color: #ffffff;
            background-color: #0072ff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

            .btn:hover {
                background-color: #005bb5;
            }

        .info {
            font-size: 1em;
            color: #333;
            margin: 5px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <br />
    <asp:Label ID="lblcategory" runat="server"  Visible="false"></asp:Label>
    <asp:Label ID="lblusername" runat="server"  Visible="false"></asp:Label>
    
      <section class="brand-area pt-100 pb-70">
        <div class="container">
            <div class="row">
                <div class="col-3 col-md-3"></div>
                <div class="col-6 col-md-6">

                    <div class="result-container">
                        
                        <h1>Quiz Result</h1>
               
                      
                        <p class="score">Your Score: <%=totalquestionattampt %>/<%=Totalquestion %></p>
                        <p class="summary">You answered <%=totalquestionattampt %> out of <%=Totalquestion %> questions correctly.</p>
               
                       <!-- Try Again Link -->
                       <a href="exam.aspx?couresdeatailsid=<%= Request.QueryString["couresdeatailsid"] %>" class="btn">Try Again</a>

<!-- Get Certificate Button -->
                             <asp:Button ID="Button1" runat="server" Text="Get Certificate" class="btn" OnClick="Button1_Click" />
                      
                      
                      


                    </div>
                            
                </div>
                <div class="col-3 col-md-3"></div>
            </div>


            
        </div> </section>
    <br />
    <br />
    <br />

</asp:Content>


