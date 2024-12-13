<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Login</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login-area default-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div id="Form1" class="white-popup-block">
                        <div class="row">
                            <div class="col-lg-12 login-custom">
                                <h4>Login to your registered account!</h4>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" Text="CONTACT NO."></asp:Label>
                                        <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                        <asp:TextBox ID="txtpasswors" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <center>
                                    <div class="col-lg-12">
                                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="Button3_Click" CssClass="btn btn-primary" />
                                    </div>
                                  <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Visible="true"></asp:Label>
                                </center>
                                <p class="link-bottom">Not a member yet? <a href="register.aspx">Register now</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
