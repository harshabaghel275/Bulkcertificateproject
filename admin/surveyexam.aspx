<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="surveyexam.aspx.cs" Inherits="surveyexam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <main id="main" class="main">

    <div class="pagetitle">
      <h1>Exam Subject</h1>
      <nav>
        <%--<ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Forms</li>
          <li class="breadcrumb-item active">Elements</li>
        </ol>--%>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title"></h5>

              <!-- General Form Elements -->
              <div>
                <div class="row mb-3">
                    <asp:Label ID="Label1" runat="server" Text="EXAM SUBJECT"></asp:Label>
                      <div class="col-sm-10">
                           <asp:HiddenField ID="hdnvalue" runat="server" />
                          <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                  
                  </div>
                </div>
                

                <div class="row mb-3">
                    <asp:Label ID="Label2" runat="server" Text="Submit Button"></asp:Label>
                  <div class="col-sm-10">
                      <asp:Button ID="Button1" runat="server" Text="Submit Form" class="btn btn-primary" OnClick="Button1_Click" Visible="true"></asp:Button>
                      <asp:Button ID="Button2" runat="server" Text="update Form" class="btn btn-primary" OnClick="Button2_Click" Visible="false"></asp:Button>
                  
                  </div>
                </div>

              </div><!-- End General Form Elements -->

            </div>
          </div>

        </div>

        
      </div>
    </section>

  </main>
</asp:Content>

