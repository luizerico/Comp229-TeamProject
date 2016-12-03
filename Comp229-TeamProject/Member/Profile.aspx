<%--
    File: Login.aspx
    Author: Luiz Érico and Rister   
    Date: 11-21-2016
--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Comp229_TeamProject.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="UserEditDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Users] WHERE ([Username] = @Username2)">
        <SelectParameters>
            <asp:ControlParameter ControlID="usernameLabel" PropertyName="Text" Name="Username2" Type="String"></asp:ControlParameter>

        </SelectParameters>

        <SelectParameters>
            <asp:Parameter Name="Id" Type="Int32" DefaultValue="1" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:Label runat="server" Text="" ID="usernameLabel" CssClass="invisible_button"/>

    <asp:FormView ID="UserFormView" runat="server" DataSourceID="UserEditDataSource" RowStyle-CssClass="row" InsertRowStyle-CssClass="row" DataKeyNames="Id">
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
                    <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="LinkButton2"  CausesValidation="False" CssClass="btn btn-warning" />
                </div>
            </div>
        </EditItemTemplate>

        <ItemTemplate>
            <div class="row">
                <div class="form-group">
                    <asp:Label runat="server" ID="label7" Text="Photo:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                       <asp:Image runat="server" ImageUrl='<%# "/Resources/Uploads/" + Eval("Picture") %>'  CssClass="listview_image"/>
                    </div>
                </div>
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
                    <asp:Label runat="server" ID="label6" Text="Registered Date:" CssClass="col-md-4 control-label" />
                    <div class="col-md-8">
                        <asp:Label TextMode="Date" Text='<%# Eval("Registered_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="Label12"  />
                    </div>
                </div>

                <div class="form-group">
                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn btn-primary" />&nbsp;
                    
                </div>
            </div>
        </ItemTemplate>

    </asp:FormView>

<asp:Button ID="simulateUploadButton" runat="server" Text="Save File to Server" OnClick="uploadFile" CssClass="invisible_button" />
<script type="text/javascript">
     function fncsave()
     {
        document.getElementById('<%= simulateUploadButton.ClientID %>').click();
     }
</script>
</asp:Content>

