<%@ Page Title="Quiz Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="exam.aspx.cs" Inherits="exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        .quiz-container {
            max-width: 600px;
            width: 60%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
           
        }

        .warning {
            font-size: 0.9rem;
            color: #d9534f;
            text-align: center;
            margin-bottom: 10px;
             
        }

        .question h2 {
            font-size: 1.2rem;
            margin-bottom: 15px;
        }

        .options {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .options label {
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
            display: flex;
            
            align-items:center;
            cursor: pointer;
            background-color: #f8f9fa;
            width:200px;
            text-align:center;
            
        }

        .options input[type="radio"] {
            margin-right: 10px;
        }

        .next-button {
            margin-top: 20px;
            padding: 10px;
            width: 100%;
            background-color: #002147;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
        }

        .next-button:hover {
            background-color: #0056b3;
        }

        /* Media Query for smaller screens */
        @media (max-width: 768px) {
            .options {
                width: 400px;
                margin: 0 auto; /* Center the options container */
            }
        }
    </style>
    <center>
        <div class="quiz-container">
            <asp:Label ID="QuestionLabel" runat="server" CssClass="question"></asp:Label>
         
            <div class="options">
                <asp:RadioButtonList ID="OptionsRadioButtonList" runat="server" RepeatDirection="Vertical" CssClass="options"></asp:RadioButtonList>
            </div>
                
            <asp:Button ID="NextButton" runat="server" CssClass="next-button" Text="Next" OnClick="NextButton_Click" />
            <asp:Label ID="FeedbackLabel" runat="server" Text="checkanswer"></asp:Label>
           
        </div>
    </center>
</asp:Content>
