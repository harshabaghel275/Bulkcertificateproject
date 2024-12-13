<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
        
    <!-- End Login Form -->

    <!-- Start Register Form 
    ============================================= -->
    
    <!-- End Register Form -->

    <!-- Start Breadcrumb 
    ============================================= -->
    <div class="breadcrumb-area shadow dark text-center bg-fixed text-light" style="background-image: url(assets/img/banner/8.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Contact Us</h1>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->

    <!-- Start Contact Info
    ============================================= -->
    <div class="contact-info-area default-padding">
        <div class="container">
            <div class="contact-info">
                <!-- Start Contact Info -->
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                        <div class="item">
                            <div class="icon">
                                <i class="fas fa-mobile-alt"></i>
                            </div>
                            <div class="info">
                                <h4>Call Us</h4>
                                <span>+324 119 2343</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <div class="item">
                            <div class="icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="info">
                                <h4>Address</h4>
                                <span>+324 119 2343</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <div class="item">
                            <div class="icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="info">
                                <h4>Email Us</h4>
                                <span>info@yourdomain.com</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Contact Info -->

                <div class="seperator col-lg-12">
                    <span class="border"></span>
                </div>

                <!-- Start Maps & Contact Form -->
                <div class="maps-form">
                    <div class="row">
                        <div class="col-lg-6 maps">
                            <h3>Our Location</h3>
                            <div class="google-maps">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d14767.262289338461!2d70.79414485000001!3d22.284975!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1424308883981"></iframe>
                            </div>
                        </div>
                        <div class="col-lg-6 form">
                            <div class="heading">
                                <h3>Contact Us</h3>
                                <p>
                                    Occasional terminated insensible and inhabiting gay. So know do fond to half on. Now who promise was justice new winding
                                </p>
                            </div>
                            <div action="assets/mail/contact.php" method="POST" class="contact-form">
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtname" runat="server"  placeholder="Name" class="form-control"></asp:TextBox>
                                            <span class="alert-error"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="form-group">
                                           <asp:TextBox ID="txtemail" runat="server" placeholder="Email" class="form-control"></asp:TextBox>
                                            <span class="alert-error"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="form-group">
                                          <asp:TextBox ID="txtphone" runat="server" placeholder="phone" class="form-control"></asp:TextBox>
                                            <span class="alert-error"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="form-group comments">
                                              <asp:TextBox ID="txttell" runat="server"  class="form-control"></asp:TextBox>
                                       
                                          
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                     <asp:Button 
                ID="Button1" 
                runat="server" 
                Text="Submit" 
                OnClick="Button1_Click" 
                CssClass="btn  btn-dark" />
            <i class="fa fa-paper-plane"></i>
                                          
                                   
                                </div>
                                <!-- Alert Message -->
                                <div class="col-lg-12 alert-notification">
                                    <div id="message" class="alert-msg"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Maps & Contact Form -->

            </div>
        </div>
    </div>
</asp:Content>

