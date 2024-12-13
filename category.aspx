<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="top-categories" class="top-cat-area default-padding bottom-less">
        <div class="container">
            
            <div class="top-cat-items">
                <div class="row">
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>
                    <div class="col-xl-3 col-lg-4 col-md-6 equal-height">
                        <div class="item" style="background-image: url(assets/img/category/1.jpg);">
                            <a href="exam.aspx?couresdeatailsid=<%#Eval("id") %>">
                                <i class="flaticon-feature"></i>
                                <div class="info"  style="height:100PX;">
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
</asp:Content>

