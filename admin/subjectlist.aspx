<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="subjectlist.aspx.cs" Inherits="subjectlist" %>

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
                  <td><a href="surveyexam.aspx?asdid=<%# Eval("id") %>" class="btn btn-primary table-btn" title="Edit"><i class=" mdi mdi-grease-pencil""></i>

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

