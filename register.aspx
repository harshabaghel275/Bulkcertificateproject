<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <!-- End Login Form -->

    <!-- Start Register Form 
    ============================================= -->
    
    <!-- End Register Form -->

    <!-- Start Login 
    ============================================= -->
    <div class="login-area default-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div >
                        <div class="row">
                            
                            <div class="col-lg-10 login-custom">
                                <h4>Register a new account</h4>
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="form-group">
                                             <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Visible="true"></asp:Label>
                                            <asp:Label ID="Label1" runat="server" Text="USERNAME"></asp:Label>
                                            <asp:TextBox ID="txtname" runat="server" class="form-control"></asp:TextBox>
                                           
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="EMAIL"></asp:Label>
                                            <asp:TextBox ID="txtemail" runat="server" class="form-control"></asp:TextBox>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="form-group">
                                            <asp:Label ID="Label3" runat="server" Text="PASSWORD"></asp:Label>
                                            <asp:TextBox ID="txtpasswors" runat="server" class="form-control" placeholder="Password*"></asp:TextBox>
                                            <a href="register.aspx">register.aspx</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="form-group">
                                            <asp:Label ID="Label4" runat="server" Text="CONTACT"></asp:Label>
                                            <asp:TextBox ID="txtmobile" runat="server" class="form-control"></asp:TextBox>
                                            
                                        </div>
                                    </div>
                                </div>
                                <center>
                                <div class="col-lg-12">
                                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button3_Click" ></asp:Button>
                                    
                                  
                                <p class="link-bottom">Are you a member? <a href="login.aspx">Login now</a></p>
                                      </center>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Login Area -->
</asp:Content>

