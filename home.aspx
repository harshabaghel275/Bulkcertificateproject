<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!-- Start Banner 
    ============================================= -->
    <div class="banner-area standard text-default bg-gray-hard">

        <div class="item">
            <div class="box-table">
                <div class="box-cell">
                    <div class="container">
                        <div class="row item-flex center">
                            
                            <div class="col-lg-6">
                                <div class="content-box">
                                    <h1>Simply Powerful Online Exams</h1>
                                    <p>
                                        Easy to get started and intuitive to use. Exam.net equips you with all the power and function you need to create exams for your students, your way.
                                    </p>
                                    
                                </div>
                            </div>
                            <div class="col-lg-6 thumb">
                                <img src="assets/img/about/3.jpg" alt="Thumb">
                                <img src="assets/img/about/2.jpg" alt="Thumb">
                                <div class="join">
                                    <i class="fas fa-graduation-cap"></i>
                                    <div class="fun-fact">
                                        <h4 class="timer" data-to="1200" data-speed="5000"></h4>
                                        <span class="medium">Online Courses</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>     
    </div>
    <!-- End Banner -->

    <!-- Start What Learn
    ============================================= -->
    <div class="what-learn-area bg-dark default-padding">
        <div class="container">
            <div class="content-box">
                <div class="row">

                    <div class="col-lg-5 info text-light">
                        <h2>Why use our online examination tool?</h2>
                        <p>
                           Do you need some serious testing software for your students? Or do you need to hand out a lot of certificates? Do you want to easily set up your exam software and invite your participants, or do you need to connect your testing software with your internal software? Start using the Online Exam Builder and this is all within reach.
                        </p>
                    </div>
                    
                    <div class="col-lg-7 categories">
                        <div class="row">
                            <!-- Single Item -->
                            <div class="col-lg-4 col-md-4 single-item">
                                <div class="item">
                                    <a href="#">
                                       <i class="fa fa-heart" aria-hidden="true"></i>
                                        <div class="info"  style="height:100PX;">
                                            <h4>Easy to use</h4>
                                             <span></span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <!-- End Single Item -->
                            <!-- Single Item -->
                            <div class="col-lg-4 col-md-4 single-item">
                                <div class="item">
                                    <a href="#">
                                       <i class="fa fa-laptop" aria-hidden="true"></i>
                                        <div class="info"  style="height:100PX;">
                                            <h4>Looks on all devices</h4>
                                            <span></span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <!-- End Single Item -->
                            <!-- Single Item -->
                            <div class="col-lg-4 col-md-4 single-item">
                                <div class="item">
                                    <a href="#">
                                       <i class="fa fa-question-circle" aria-hidden="true"></i>
                                        <div class="info"  style="height:100PX;">
                                            <h4>Awesome support</h4>
                                           <span></span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <!-- End Single Item -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- End What Learn -->
     <!-- Start Top Categories 
    ============================================= -->
    <div id="top-categories" class="top-cat-area default-padding bottom-less">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-lg-8 offset-lg-2">
                        <h2>Top Categories</h2>
                        
                    </div>
                </div>
            </div>
            <div class="top-cat-items">
                <div class="row">
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>
                    <div class="col-xl-3 col-lg-4 col-md-6 " >
                        <div class="item" style="background-image: url(assets/img/category/1.jpg);">
                            <a href="exam.aspx?couresdeatailsid=<%#Eval("id") %>">
                                <i class="flaticon-feature"></i>
                                <div class="info" style="height:100PX;">
                                    <h4><%# Eval("subjectname") %></h4>
                                   
                                    <%--<span>(1,226) Topics</span>--%>
                                </div>
                            </a>
                        </div>
                    </div>
                            </ItemTemplate>
                        </asp:ListView>
                    
                    
                    
                </div>
            </div>
        </div>
    </div>
    <!-- End Top Categories -->
   
</asp:Content>

