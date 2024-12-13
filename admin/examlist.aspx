<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="examlist.aspx.cs" Inherits="examlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <main id="main" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
            

              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                    
                  <tr>
                    <th>
                      <b>No</b>
                    </th>
                    <th>Subject</th>
                      <th>Question</th>
                      <th>option1</th>
                      <th>option2</th>
                      <th>option3</th>
                      <th>option4</th>
                      <th>Rigthanswer</th>
                      <th>option</th>
                      <th>Button</th>
                    
                  </tr>
                </thead>
                <tbody>
                    <asp:HiddenField ID="LblId" runat="server" />
                               <asp:ListView ID="categoryListView" runat="server" OnItemCommand="categoryListView_ItemCommand" OnItemDeleting="categoryListView_ItemDeleting" OnItemEditing="categoryListView_ItemEditing" OnPagePropertiesChanging="categoryListView_PagePropertiesChanging" GroupPlaceholderID="groupPlaceHolder1">
                                   <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                  <tr>
                    <td><%# Eval("ID") %></td>
                    <td><%# Eval("subjectname") %></td>
                      <td><%# Eval("question") %></td>
                      <td><%# Eval("option1") %></td>
                      <td><%# Eval("option2") %></td>
                      <td><%# Eval("option3") %></td>
                       <td><%# Eval("option4") %></td>
                       <td><%# Eval("rigthanswer") %></td>
                       <td><%# Eval("correct_option") %></td>
                       <td><a href="adminexam.aspx?asdid=<%# Eval("id") %>" class="btn btn-primary table-btn" title="Edit"><i class=" mdi mdi-grease-pencil""></i>

                                  <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-danger table-btn" CommandName="Delete"><i class=" mdi mdi-delete"></i></asp:LinkButton></a></td>
                 
                  </tr>
                                       </ItemTemplate>
                                      
                        </asp:ListView>
                </tbody>
              </table>
              <!-- End Table with stripped rows -->

            </div>
          </div>

        </div>
      </div>
    </section>
       </main>
</asp:Content>

