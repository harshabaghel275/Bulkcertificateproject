<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="emailsender.aspx.cs" Inherits="emailsender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    /* Main container styling */
    main.main {
        background-color: #f9f9f9;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
    }

    /* Form group styling */
    .form-group {
        margin-bottom: 15px;
    }

    /* Label styling */
    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #333;
    }

    /* TextBox styling */
    .form-control {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
        box-sizing: border-box;
    }

    /* Button styling */
    .btn {
        display: inline-block;
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        font-size: 14px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        text-align: center;
    }

    .btn:hover {
        background-color: #0056b3;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <main id="main" class="main">
    <div>
        <!-- Start Date Input -->
        <div class="form-group">
            <label for="StartDateTextBox">Start Date:</label>
            <asp:TextBox ID="StartDateTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- End Date Input -->
        <div class="form-group">
            <label for="EndDateTextBox">End Date:</label>
            <asp:TextBox ID="EndDateTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Send Certificates Button -->
        <div class="form-group">
            <asp:Button ID="SendCertificates" runat="server" Text="Send Certificates" OnClick="SendCertificates_Click" CssClass="btn" />
        </div>
    </div>
</main>
</asp:Content>

