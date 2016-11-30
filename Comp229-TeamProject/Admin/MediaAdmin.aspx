<%--
    File: Login.aspx
    Author: Luiz Érico and Rister   
    Date: 11-21-2016
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="MediaAdmin.aspx.cs" Inherits="Comp229_TeamProject.Admin.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="MediaList" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Item]" DeleteCommand="DELETE FROM [Item] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Item] ([name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (@name, @type, @description, @status, @completed, @cover_image, @publisher, @release_date, @info_url, @quantity, @registered_date, @registered_by, @updated_date, @updated_by)" UpdateCommand="UPDATE [Item] SET [name] = @name, [type] = @type, [description] = @description, [status] = @status, [completed] = @completed, [cover_image] = @cover_image, [publisher] = @publisher, [release_date] = @release_date, [info_url] = @info_url, [quantity] = @quantity, [registered_date] = @registered_date, [registered_by] = @registered_by, [updated_date] = @updated_date, [updated_by] = @updated_by WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String"></asp:Parameter>
            <asp:Parameter Name="type" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="description" Type="String"></asp:Parameter>
            <asp:Parameter Name="status" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="completed" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="cover_image" Type="String"></asp:Parameter>
            <asp:Parameter Name="publisher" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="release_date"></asp:Parameter>
            <asp:Parameter Name="info_url" Type="String"></asp:Parameter>
            <asp:Parameter Name="quantity" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="registered_date"></asp:Parameter>
            <asp:Parameter Name="registered_by" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="updated_date"></asp:Parameter>
            <asp:Parameter Name="updated_by" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String"></asp:Parameter>
            <asp:Parameter Name="type" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="description" Type="String"></asp:Parameter>
            <asp:Parameter Name="status" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="completed" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="cover_image" Type="String"></asp:Parameter>
            <asp:Parameter Name="publisher" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="release_date"></asp:Parameter>
            <asp:Parameter Name="info_url" Type="String"></asp:Parameter>
            <asp:Parameter Name="quantity" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="registered_date"></asp:Parameter>
            <asp:Parameter Name="registered_by" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="updated_date"></asp:Parameter>
            <asp:Parameter Name="updated_by" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="MediaList" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>

            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type"></asp:BoundField>
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description"></asp:BoundField>
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status"></asp:BoundField>
            <asp:BoundField DataField="completed" HeaderText="completed" SortExpression="completed"></asp:BoundField>
            <asp:BoundField DataField="cover_image" HeaderText="cover_image" SortExpression="cover_image"></asp:BoundField>
            <asp:BoundField DataField="publisher" HeaderText="publisher" SortExpression="publisher"></asp:BoundField>
            <asp:BoundField DataField="release_date" HeaderText="release_date" SortExpression="release_date"></asp:BoundField>
            <asp:BoundField DataField="info_url" HeaderText="info_url" SortExpression="info_url"></asp:BoundField>
            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity"></asp:BoundField>
            <asp:BoundField DataField="registered_date" HeaderText="registered_date" SortExpression="registered_date"></asp:BoundField>
            <asp:BoundField DataField="registered_by" HeaderText="registered_by" SortExpression="registered_by"></asp:BoundField>
            <asp:BoundField DataField="updated_date" HeaderText="updated_date" SortExpression="updated_date"></asp:BoundField>
            <asp:BoundField DataField="updated_by" HeaderText="updated_by" SortExpression="updated_by"></asp:BoundField>
        </Columns>
    </asp:GridView>



    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="MediaList">
        <EditItemTemplate><%-- Modal Code --%>
            <div id="editMedia" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Student Informations</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="label4" Text="Student ID:" CssClass="col-md-4 control-label required" />
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="text_studentid" placeholder="Your first name" CssClass="form-control" Text="" ReadOnly="True" />
                                    </div>
                                </div>
                            </div>
            Id:
            <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel1" /><br />
            name:
            <asp:TextBox Text='<%# Bind("name") %>' runat="server" ID="nameTextBox" /><br />
            type:
            <asp:TextBox Text='<%# Bind("type") %>' runat="server" ID="typeTextBox" /><br />
            description:
            <asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" /><br />
            status:
            <asp:TextBox Text='<%# Bind("status") %>' runat="server" ID="statusTextBox" /><br />
            completed:
            <asp:TextBox Text='<%# Bind("completed") %>' runat="server" ID="completedTextBox" /><br />
            cover_image:
            <asp:TextBox Text='<%# Bind("cover_image") %>' runat="server" ID="cover_imageTextBox" /><br />
            publisher:
            <asp:TextBox Text='<%# Bind("publisher") %>' runat="server" ID="publisherTextBox" /><br />
            release_date:
            <asp:TextBox Text='<%# Bind("release_date") %>' runat="server" ID="release_dateTextBox" /><br />
            info_url:
            <asp:TextBox Text='<%# Bind("info_url") %>' runat="server" ID="info_urlTextBox" /><br />
            quantity:
            <asp:TextBox Text='<%# Bind("quantity") %>' runat="server" ID="quantityTextBox" /><br />
            registered_date:
            <asp:TextBox Text='<%# Bind("registered_date") %>' runat="server" ID="registered_dateTextBox" /><br />
            registered_by:
            <asp:TextBox Text='<%# Bind("registered_by") %>' runat="server" ID="registered_byTextBox" /><br />
            updated_date:
            <asp:TextBox Text='<%# Bind("updated_date") %>' runat="server" ID="updated_dateTextBox" /><br />
            updated_by:
            <asp:TextBox Text='<%# Bind("updated_by") %>' runat="server" ID="updated_byTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                            </div>
                        <div class="modal-footer">
                            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Modal Code --%>
        </EditItemTemplate>

        <InsertItemTemplate>
            <%-- Modal Code --%>
            <div id="insertMedia" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Student Informations</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="label4" Text="Student ID:" CssClass="col-md-4 control-label required" />
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="text_studentid" placeholder="Your first name" CssClass="form-control" Text="" ReadOnly="True" />
                                    </div>
                                </div>
                            </div>
                            name:
            <asp:TextBox Text='<%# Bind("name") %>' runat="server" ID="nameTextBox" /><br />
                            type:
            <asp:TextBox Text='<%# Bind("type") %>' runat="server" ID="typeTextBox" /><br />
                            description:
            <asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" /><br />
                            status:
            <asp:TextBox Text='<%# Bind("status") %>' runat="server" ID="statusTextBox" /><br />
                            completed:
            <asp:TextBox Text='<%# Bind("completed") %>' runat="server" ID="completedTextBox" /><br />
                            cover_image:
            <asp:TextBox Text='<%# Bind("cover_image") %>' runat="server" ID="cover_imageTextBox" /><br />
                            publisher:
            <asp:TextBox Text='<%# Bind("publisher") %>' runat="server" ID="publisherTextBox" /><br />
                            release_date:
            <asp:TextBox Text='<%# Bind("release_date") %>' runat="server" ID="release_dateTextBox" /><br />
                            info_url:
            <asp:TextBox Text='<%# Bind("info_url") %>' runat="server" ID="info_urlTextBox" /><br />
                            quantity:
            <asp:TextBox Text='<%# Bind("quantity") %>' runat="server" ID="quantityTextBox" /><br />
                            registered_date:
            <asp:TextBox Text='<%# Bind("registered_date") %>' runat="server" ID="registered_dateTextBox" /><br />
                            registered_by:
            <asp:TextBox Text='<%# Bind("registered_by") %>' runat="server" ID="registered_byTextBox" /><br />
                            updated_date:
            <asp:TextBox Text='<%# Bind("updated_date") %>' runat="server" ID="updated_dateTextBox" /><br />
                            updated_by:
            <asp:TextBox Text='<%# Bind("updated_by") %>' runat="server" ID="updated_byTextBox" /><br />

                        </div>
                        <div class="modal-footer">
                            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Modal Code --%>
        </InsertItemTemplate>
        <ItemTemplate>
            Id:
            <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" /><br />
            name:
            <asp:Label Text='<%# Bind("name") %>' runat="server" ID="nameLabel" /><br />
            type:
            <asp:Label Text='<%# Bind("type") %>' runat="server" ID="typeLabel" /><br />
            description:
            <asp:Label Text='<%# Bind("description") %>' runat="server" ID="descriptionLabel" /><br />
            status:
            <asp:Label Text='<%# Bind("status") %>' runat="server" ID="statusLabel" /><br />
            completed:
            <asp:Label Text='<%# Bind("completed") %>' runat="server" ID="completedLabel" /><br />
            cover_image:
            <asp:Label Text='<%# Bind("cover_image") %>' runat="server" ID="cover_imageLabel" /><br />
            publisher:
            <asp:Label Text='<%# Bind("publisher") %>' runat="server" ID="publisherLabel" /><br />
            release_date:
            <asp:Label Text='<%# Bind("release_date") %>' runat="server" ID="release_dateLabel" /><br />
            info_url:
            <asp:Label Text='<%# Bind("info_url") %>' runat="server" ID="info_urlLabel" /><br />
            quantity:
            <asp:Label Text='<%# Bind("quantity") %>' runat="server" ID="quantityLabel" /><br />
            registered_date:
            <asp:Label Text='<%# Bind("registered_date") %>' runat="server" ID="registered_dateLabel" /><br />
            registered_by:
            <asp:Label Text='<%# Bind("registered_by") %>' runat="server" ID="registered_byLabel" /><br />
            updated_date:
            <asp:Label Text='<%# Bind("updated_date") %>' runat="server" ID="updated_dateLabel" /><br />
            updated_by:
            <asp:Label Text='<%# Bind("updated_by") %>' runat="server" ID="updated_byLabel" /><br />

            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" 
                data-toggle="modal" data-target="#edittMedia" />
            <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />
            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" 
                data-toggle="modal" data-target="#insertMedia"/>
            
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editMedia">Edit Media</button>
        </ItemTemplate>
    </asp:FormView>

    <%-- Modal Code --%>
    <div id="insertMedia" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Student Informations</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                            <asp:Label runat="server" ID="label4" Text="Student ID:" CssClass="col-md-4 control-label required" />
                            <div class="col-md-8">
                                <asp:TextBox runat="server" ID="text_studentid" placeholder="Your first name" CssClass="form-control" Text="" ReadOnly="True" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>




</asp:Content>
