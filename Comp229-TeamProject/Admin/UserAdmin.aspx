<%--
    File: Login.aspx
    Author: Luiz Érico and Rister   
    Date: 11-21-2016
--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="UserAdmin.aspx.cs" Inherits="Comp229_TeamProject.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="userListDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="UserEditDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Users] WHERE [Id] = @Id" DeleteCommand="DELETE FROM [Users] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Users] ([Username], [Password], [userRole], [Email], [Birthdate], [Picture], [Registered_date]) VALUES (@Username, @Password, @userRole, @Email, @Birthdate, @Picture, @Registered_date)" UpdateCommand="UPDATE [Users] SET [Username] = @Username, [Password] = @Password, [userRole] = @userRole, [Email] = @Email, [Birthdate] = @Birthdate, [Picture] = @Picture, [Registered_date] = @Registered_date WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="userRole" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Birthdate"></asp:Parameter>
            <asp:Parameter Name="Picture" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Registered_date"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Username" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="userRole" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Birthdate"></asp:Parameter>
            <asp:Parameter Name="Picture" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Registered_date"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
         <SelectParameters>
            <asp:Parameter Name="Id" Type="Int32" DefaultValue="-1" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Panel ID="gridViewPanel" runat="server">
        <div class="row">
            <asp:LinkButton runat="server" Text="Insert New User" ID="NewItem" OnCommand="NewItem_Command" CssClass="btn btn-primary" />
        </div>
        <div class="row">
            <asp:GridView ID="UserGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="userListDataSource" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-hover table-responsive">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Link" ControlStyle-CssClass="btn btn-primary"></asp:CommandField>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                    <asp:ImageField DataImageUrlField="Picture" DataImageUrlFormatString="~/Resources/Uploads/{0}" HeaderText="Cover">
                        <ControlStyle CssClass="usergridview_image"  ></ControlStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"></asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                    <asp:BoundField DataField="userRole" HeaderText="userRole" SortExpression="userRole"></asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                    <asp:BoundField DataField="Birthdate" HeaderText="Birthdate" SortExpression="Birthdate" DataFormatString="{0:d}"></asp:BoundField>
                    <asp:BoundField DataField="Registered_date" HeaderText="Registered_date" SortExpression="Registered_date" DataFormatString="{0:d}"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>


    <asp:FormView ID="UserFormView" runat="server" DataSourceID="UserEditDataSource" OnItemInserted="UserFormView_ItemInserted" OnItemDeleted="UserFormView_ItemDeleted" OnItemUpdated="UserFormView_ItemUpdated" RowStyle-CssClass="row" InsertRowStyle-CssClass="row" DataKeyNames="Id">
        <EditItemTemplate>
            <div class="row">
                <div class="form-group">
                    <asp:Label runat="server" ID="label4" Text="ID:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel1" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label1" Text="Name:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="nameTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please, inform the name."
                                            ControlToValidate="nameTextBox" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label3" Text="Password:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Password" Text='<%# Bind("Password") %>' runat="server" ID="userPassword" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please, inform the Password to the User."
                                            ControlToValidate="userPassword" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label2" Text="User Role:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("UserRole") %>' runat="server" ID="userRoleTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please, inform the Role to the User (admin/user)."
                                            ControlToValidate="userRoleTextBox" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label5" Text="E-mail:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Email" Text='<%# Bind("Email") %>' runat="server" ID="emailTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please, inform the Email to the User ."
                                            ControlToValidate="emailTextBox" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                        <asp:RegularExpressionValidator ID="regularExpEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"   ControlToValidate="emailTextBox" ErrorMessage="Invalid email " />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label9" Text="Birth Date:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Date" Text='<%# Bind("Birthdate", "{0:yyyy-MM-dd}") %>' runat="server" ID="release_dateTextBox" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label7" Text="Photo:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("Picture") %>' runat="server" ID="photoTextBox" ReadOnly="True" CssClass="form-control" />
                        <asp:FileUpload runat="server" ID="photoFile" ClientIDMode="Static" onChange="fncsave()" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label6" Text="Registered Date:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Date" Text='<%# Bind("Registered_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="TextBox3" CssClass="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="LinkButton1" CausesValidation="True" CssClass="btn btn-default" />&nbsp;
                    <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="LinkButton2" OnClick="UpdateCancelButton_Click" CausesValidation="False" CssClass="btn btn-warning" />
                </div>
            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row">
                <div class="form-group">
                    <asp:Label runat="server" ID="label1" Text="Name:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="nameTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please, inform the name."
                                            ControlToValidate="nameTextBox" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label3" Text="Password:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Password" Text='<%# Bind("Password") %>' runat="server" ID="userPassword" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please, inform the Password to the User."
                                            ControlToValidate="userPassword" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label2" Text="User Role:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("UserRole") %>' runat="server" ID="userRoleTextBox" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please, inform the Role to the User (admin/user)."
                                            ControlToValidate="userRoleTextBox" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label5" Text="E-mail:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Email" Text='<%# Bind("Email") %>' runat="server" ID="emailTextBox" CssClass="form-control" />                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please, inform the Email to the User ."
                                            ControlToValidate="emailTextBox" SetFocusOnError="True" Display="Dynamic" CssClass="validation_error" />
                        <asp:RegularExpressionValidator ID="regularExpEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"   ControlToValidate="emailTextBox" ErrorMessage="Invalid email " />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label9" Text="Birth Date:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Date" Text='<%# Bind("Birthdate", "{0:yyyy-MM-dd}") %>' runat="server" ID="release_dateTextBox" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label7" Text="Photo:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("Picture") %>' runat="server" ID="photoTextBox" ReadOnly="True" CssClass="form-control" />
                        <asp:FileUpload runat="server" ID="photoFile" ClientIDMode="Static" onChange="fncsave()" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label6" Text="Registered Date:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Date" Text='<%# Bind("Registered_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="TextBox3" CssClass="form-control" />
                    </div>
                </div>

            <div class="form-group">
                    <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="LinkButton3" CausesValidation="True" CssClass="btn btn-default" />
                    &nbsp;
                    <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="LinkButton4" OnClick="UpdateCancelButton_Click" CausesValidation="False" CssClass="btn btn-warning" />
                </div>
                </div>
        </InsertItemTemplate>

        <ItemTemplate>
            <div class="row">
                <div class="form-group">
                    <asp:Label runat="server" ID="label4" Text="ID:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel1"  />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label1" Text="Name:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="nameLabel"  />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label2" Text="User Role:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Label Text='<%# Eval("UserRole") %>' runat="server" ID="Label8"  />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label5" Text="E-mail:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="Label11"  />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label9" Text="Birth Date:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Label TextMode="Date" Text='<%# Eval("Birthdate", "{0:yyyy-MM-dd}") %>' runat="server" ID="release_dateLabel"  />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label7" Text="Photo:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                       <asp:Image runat="server" ImageUrl='<%# "/Resources/Uploads/" + Eval("Picture") %>'  CssClass="listview_image"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label6" Text="Registered Date:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Label TextMode="Date" Text='<%# Eval("Registered_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="Label12"  />
                    </div>
                </div>

                <div class="form-group">
                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn btn-primary" />&nbsp;
                    <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" OnClientClick="return confirm('You really want to delete this Item?');" CssClass="btn btn-danger" />&nbsp;
                    <asp:LinkButton runat="server" Text="Return to List View" CommandName="Cancel" ID="UpdateCancelButton" OnClick="UpdateCancelButton_Click" CausesValidation="False" CssClass="btn btn-primary" />
                </div>
            </div>
        </ItemTemplate>

    </asp:FormView>
    
<%--
    Small code to simulate a click on the button 
    Thanks to highwingers http://stackoverflow.com/questions/22471677/how-can-i-call-a-server-side-button-click-function-from-client-side
--%>
<asp:Button ID="simulateUploadButton" runat="server" Text="Save File to Server" OnClick="uploadFile" CssClass="invisible_button" />
<script type="text/javascript">
     function fncsave()
     {
        document.getElementById('<%= simulateUploadButton.ClientID %>').click();
     }
</script>
</asp:Content>
