<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="adminexam.aspx.cs" Inherits="adminexam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- You can add any additional header content here if needed -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>EXAM</h1>
            <nav>
                <%--<ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Forms</li>
                    <li class="breadcrumb-item active">Elements</li>
                </ol>--%>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"></h5>

                            <!-- General Form Elements -->
                            <div class="row">
                                <!-- Left Column -->
                                <div class="col-md-6">
                                    <div class="row mb-3">
                                         <asp:Label ID="lblError" runat="server" class="form-label"></asp:Label>
                <asp:HiddenField ID="hdnvalue" runat="server" />
                                        <asp:Label ID="Label1" runat="server" Text="Subject" CssClass="col-sm-4 col-form-label"></asp:Label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
                                                DataValueField="id" DataTextField="subjectname" AppendDataBoundItems="true" 
                                                AutoPostBack="true">
                                                <asp:ListItem Value="-1">PLEASE SELECT</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <asp:Label ID="Label3" runat="server" Text="Question" CssClass="col-sm-4 col-form-label"></asp:Label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="questiontxt" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <asp:Label ID="Label4" runat="server" Text="Option 1" CssClass="col-sm-4 col-form-label"></asp:Label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="option1txt" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <asp:Label ID="Label10" runat="server" Text="Correct Option" CssClass="col-sm-4 col-form-label"></asp:Label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" 
                                                AppendDataBoundItems="true">
                                                <asp:ListItem Value="-1">PLEASE SELECT Correct Option</asp:ListItem>
                                                <asp:ListItem Value="1">Option 1</asp:ListItem>
                                                <asp:ListItem Value="2">Option 2</asp:ListItem>
                                                <asp:ListItem Value="3">Option 3</asp:ListItem>
                                                <asp:ListItem Value="4">Option 4</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <!-- Right Column -->
                                <div class="col-md-6">
                                    <div class="row mb-3">
                                        <asp:Label ID="Label5" runat="server" Text="Option 2" CssClass="col-sm-4 col-form-label"></asp:Label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="option2txt" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <asp:Label ID="Label6" runat="server" Text="Option 3" CssClass="col-sm-4 col-form-label"></asp:Label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="option3txt" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <asp:Label ID="Label7" runat="server" Text="Option 4" CssClass="col-sm-4 col-form-label"></asp:Label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="option4txt" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <asp:Label ID="Label8" runat="server" Text="Answer" CssClass="col-sm-4 col-form-label"></asp:Label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="answertxt" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>

                            <div class="row mb-3">
                                <asp:Label ID="Label9" runat="server" Text="Submit" CssClass="col-sm-2 col-form-label"></asp:Label>
                                <div class="col-sm-8">
                                    <asp:Button ID="Button1" runat="server" Text="Submit Form" CssClass="btn btn-primary" OnClick="Button1_Click" Visible="true"></asp:Button>
                                     <asp:Button ID="Button2" runat="server" Text="update Form" CssClass="btn btn-primary" OnClick="Button2_Click" Visible="false"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
