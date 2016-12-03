<%--
    File: Login.aspx
    Author: Luiz Érico and Rister   
    Date: 11-21-2016
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="MediaAdmin.aspx.cs" Inherits="Comp229_TeamProject.Admin.WebForm2"  ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Literal ID="ErrorLabel" runat="server"></asp:Literal>

    <asp:SqlDataSource ID="ComboDataSourceStatus" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Status]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ComboDataSourceType" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Type]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ComboDataSourceUser" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT [Id], [Username] FROM [Users]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="MediaListDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' 
        SelectCommand="SELECT [IT].[Id]
                              ,[IT].[name]
                              ,[TY].[type]
                              ,[IT].[description]
                              ,Left([IT].[description], 20) as truncdesc
                              ,[ST].[status]
                              ,[IT].[completed]
                              ,[IT].[cover_image]
                              ,[IT].[publisher]
                              ,[IT].[release_date]
                              ,[IT].[info_url]
                              ,[IT].[quantity]
                              ,[IT].[registered_date] 
                              ,[USR].[Username] as registered
                              ,[IT].[registered_by]
                              ,[IT].[updated_date]
                              ,[USU].[Username] as updated
                              ,[IT].[updated_by]
                        FROM [Item] AS IT
                        JOIN [Type] AS TY ON [TY].[Id] = [IT].[Type] 
                        JOIN [Status] AS ST ON [ST].[Id] = [IT].[Status]
                        JOIN [Users] AS USr ON [USR].[Id] = [IT].[registered_by]
                        JOIN [Users] AS USU ON [USU].[Id] = [IT].[updated_by];">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="MediaEditDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' 
        SelectCommand="SELECT [IT].[Id]
                              ,[IT].[name]
                              ,[IT].[type] 
                              ,[TY].[type] as type_name
                              ,[IT].[description]
                              ,Left([IT].[description], 20) as truncdesc
                              ,[IT].[status] 
                              ,[ST].[status] as status_name
                              ,[IT].[completed]
                              ,[IT].[cover_image]
                              ,[IT].[publisher]
                              ,[IT].[release_date]
                              ,[IT].[info_url]
                              ,[IT].[quantity]
                              ,[IT].[registered_date] 
                              ,[USR].[Username] as registered
                              ,[IT].[registered_by]
                              ,[IT].[updated_date]
                              ,[USU].[Username] as updated
                              ,[IT].[updated_by]
                        FROM [Item] AS IT
                        JOIN [Type] AS TY ON [TY].[Id] = [IT].[Type] 
                        JOIN [Status] AS ST ON [ST].[Id] = [IT].[Status]
                        JOIN [Users] AS USr ON [USR].[Id] = [IT].[registered_by]
                        JOIN [Users] AS USU ON [USU].[Id] = [IT].[updated_by]
                        WHERE [IT].[Id] = @Id" 
        
        DeleteCommand="DELETE FROM [Item] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Item] ([name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (@name, @type, @description, @status, @completed, @cover_image, @publisher, @release_date, @info_url, @quantity, @registered_date, @registered_by, @updated_date, @updated_by)" UpdateCommand="UPDATE [Item] SET [name] = @name, [type] = @type, [description] = @description, [status] = @status, [completed] = @completed, [cover_image] = @cover_image, [publisher] = @publisher, [release_date] = @release_date, [info_url] = @info_url, [quantity] = @quantity, [registered_date] = @registered_date, [registered_by] = @registered_by, [updated_date] = @updated_date, [updated_by] = @updated_by WHERE [Id] = @Id">
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
        <SelectParameters>
            <asp:Parameter Name="Id" Type="Int32" DefaultValue="0" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Panel ID="gridViewPanel" runat="server">
        <div class="row">
            <asp:LinkButton runat="server" Text="Insert New Media" ID="NewItem" OnCommand="NewItem_Command" CssClass="btn btn-primary" />
        </div>
        <div class="row">
            <asp:GridView ID="MediaGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="MediaListDataSource" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-hover table-responsive">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Link" ControlStyle-CssClass="btn btn-primary"></asp:CommandField>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name"></asp:BoundField>
                    <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type"></asp:BoundField>                   
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status"></asp:BoundField>
                    <asp:BoundField DataField="completed" HeaderText="Completed (%)" SortExpression="completed"></asp:BoundField>
                    <%--
                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" HtmlEncode="False" HtmlEncodeFormatString="False"></asp:BoundField>
                    --%>
                    <asp:ImageField DataImageUrlField="cover_image" DataImageUrlFormatString="~/Resources/Uploads/{0}" HeaderText="Cover">
                        <ControlStyle CssClass="gridview_image"  ></ControlStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="publisher" HeaderText="Publisher" SortExpression="publisher"></asp:BoundField>
                    <asp:BoundField DataField="updated" HeaderText="Updated" SortExpression="updated"></asp:BoundField>

                    <asp:BoundField DataField="updated_date" HeaderText="Updated Date" SortExpression="updated_date" DataFormatString="{0:d}"></asp:BoundField>
                </Columns>

            </asp:GridView>
        </div>
    </asp:Panel>

    
      
    <asp:FormView ID="MediaFormView" runat="server" DataSourceID="MediaEditDataSource" DataKeyNames="Id" OnItemInserted="MediaFormView_ItemInserted" OnItemDeleted="MediaFormView_ItemDeleted" OnItemUpdated="MediaFormView_ItemUpdated" RowStyle-CssClass="row" InsertRowStyle-CssClass="row" >
        <EditItemTemplate>
            <div class="row">
                <div class="form-group">
                    <asp:Label runat="server" ID="label4" Text="ID:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel1" CssClass="form-control" />                        
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label1" Text="Name:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("name") %>' runat="server" ID="nameTextBox" CssClass="form-control" />                        
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label2" Text="Type:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:DropDownList ID="typeTextBox" runat="server" DataValueField='id' DataSourceID="ComboDataSourceType" 
                            DataTextField="type" SelectedValue='<%# Bind("type") %>'  CssClass="form-control" />                        
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label3" Text="Description:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="MultiLine" Text='<%# Bind("description") %>' runat="server" ID="TextBox4" CssClass="tinymce" />                   
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label5" Text="Status:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:DropDownList ID="statusTextBox" runat="server" DataValueField='id' DataSourceID="ComboDataSourceStatus" 
                            DataTextField="status" SelectedValue='<%# Bind("status") %>' CssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label6" Text="Completed (%):" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Range" min="0" max="100" step="1" Text='<%# Bind("completed") %>' runat="server" ID="completedTextBox" ValidateRequestMode="Disabled" CssClass="form-control"/>
                        <asp:rangevalidator ID="Rangevalidator1" errormessage="Please enter value between 0-100." forecolor="Red" controltovalidate="completedTextBox" minimumvalue="0" maximumvalue="100" runat="server" Type="Integer">
                            </asp:rangevalidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label7" Text="Cover Image:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("cover_image") %>' runat="server" ID="cover_imageTextBox" ReadOnly="True" CssClass="form-control"/>
                        <asp:FileUpload runat="server" ID="coverImageFile" ClientIDMode="Static" onChange="fncsave()"  CssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label8" Text="Publisher:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                       <asp:TextBox Text='<%# Bind("publisher") %>' runat="server" ID="TextBox6" CssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label9" Text="Release Date:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                       <asp:TextBox TextMode="Date" Text='<%# Bind("release_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="release_dateTextBox" CssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label10" Text="Info URL:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                       <asp:TextBox TextMode="Url" Text='<%# Bind("info_url") %>' runat="server" ID="info_urlTextBox" CssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label11" Text="Quantity:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                       <asp:TextBox TextMode="Number" Text='<%# Bind("quantity") %>' runat="server" ID="quantityTextBox" CssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label12" Text="Registered Date:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                       <asp:TextBox TextMode="Date" Text='<%# Bind("registered_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="registered_dateTextBox" CssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label13" Text="Registered By:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                       <asp:DropDownList ID="DropDownListRegistered" runat="server" DataValueField='Id' DataSourceID="ComboDataSourceUser" 
                            DataTextField="Username" SelectedValue='<%# Bind("registered_by") %>'  CssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label14" Text="Updated Date:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                       <asp:TextBox TextMode="Date" Text='<%# Bind("updated_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="updated_dateTextBox" CssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label15" Text="Updated By:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                       <asp:DropDownList ID="DropDownListUpdated" runat="server" DataValueField='Id' DataSourceID="ComboDataSourceUser" 
                        DataTextField="Username" SelectedValue='<%# Bind("updated_by") %>' CssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn btn-default"/>&nbsp;
                    <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" OnClick="UpdateCancelButton_Click" CausesValidation="False" CssClass="btn btn-warning" />
                </div>

            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row">
                <div class="form-group">
                    <asp:Label runat="server" ID="label1" Text="Name:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("name") %>' runat="server" ID="nameTextBox" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label2" Text="Type:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:DropDownList ID="typeTextBox" runat="server" DataValueField='id' DataSourceID="ComboDataSourceType"
                            DataTextField="type" SelectedValue='<%# Bind("type") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label3" Text="Description:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="MultiLine" Text='<%# Bind("description") %>' runat="server" ID="TextBox4" CssClass="tinymce" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label5" Text="Status:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:DropDownList ID="statusTextBox" runat="server" DataValueField='id' DataSourceID="ComboDataSourceStatus"
                            DataTextField="status" SelectedValue='<%# Bind("status") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label6" Text="Completed (%):" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Range" min="0" max="100" step="1" Text='<%# Bind("completed") %>' runat="server" ID="completedTextBox" ValidateRequestMode="Disabled" CssClass="form-control" />
                        <asp:RangeValidator ID="Rangevalidator1" ErrorMessage="Please enter value between 0-100." ForeColor="Red" ControlToValidate="completedTextBox" MinimumValue="0" MaximumValue="100" runat="server" Type="Integer">
                        </asp:RangeValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label7" Text="Cover Image:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("cover_image") %>' runat="server" ID="cover_imageTextBox" ReadOnly="True" CssClass="form-control" />
                        <asp:FileUpload runat="server" ID="coverImageFile" ClientIDMode="Static" onChange="fncsave()" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label8" Text="Publisher:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox Text='<%# Bind("publisher") %>' runat="server" ID="TextBox6" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label9" Text="Release Date:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Date" Text='<%# Bind("release_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="release_dateTextBox" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label10" Text="Info URL:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Url" Text='<%# Bind("info_url") %>' runat="server" ID="info_urlTextBox" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label11" Text="Quantity:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Number" Text='<%# Bind("quantity") %>' runat="server" ID="quantityTextBox" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label12" Text="Registered Date:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Date" Text='<%# Bind("registered_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="registered_dateTextBox" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label13" Text="Registered By:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:DropDownList ID="DropDownListRegistered" runat="server" DataValueField='Id' DataSourceID="ComboDataSourceUser"
                            DataTextField="Username" SelectedValue='<%# Bind("registered_by") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label14" Text="Updated Date:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:TextBox TextMode="Date" Text='<%# Bind("updated_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="updated_dateTextBox" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" ID="label15" Text="Updated By:" CssClass="col-md-4 control-label " />
                    <div class="col-md-8">
                        <asp:DropDownList ID="DropDownListUpdated" runat="server" DataValueField='Id' DataSourceID="ComboDataSourceUser"
                            DataTextField="Username" SelectedValue='<%# Bind("updated_by") %>' CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-default" />
                    &nbsp;
                    <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" OnClick="UpdateCancelButton_Click" CausesValidation="False" CssClass="btn btn-warning" />
                </div>

            </div>
        </InsertItemTemplate>
        <ItemTemplate>

            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label16" Text="ID:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label22" Text="Cover:" />
                <div class="col-md-8">
                    <asp:Image runat="server" ImageUrl='<%# "/Resources/Uploads/" + Eval("cover_image") %>' CssClass="listview_image" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label17" Text="Name:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("name") %>' runat="server" ID="nameLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label18" Text="Type:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("type_name") %>' runat="server" ID="typeLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label19" Text="Description:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("description") %>' runat="server" ID="descriptionLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label20" Text="Status:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("status_name") %>' runat="server" ID="statusLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label21" Text="Completed:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("completed") %>' runat="server" ID="completedLabel" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label23" Text="Publisher:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("publisher") %>' runat="server" ID="publisherLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label24" Text="Release Date:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("release_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="release_dateLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label25" Text="Info URL:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("info_url") %>' runat="server" ID="info_urlLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label26" Text="Quantity:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("quantity") %>' runat="server" ID="quantityLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label27" Text="Registered Date:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("registered_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="registered_dateLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label28" Text="Registered By:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("registered_by") %>' runat="server" ID="registered_byLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label29" Text="Updated Date:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("updated_date", "{0:yyyy-MM-dd}") %>' runat="server" ID="updated_dateLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label CssClass="col-md-4" runat="server" ID="label30" Text="Updated By:" />
                <div class="col-md-8">
                    <asp:Label Text='<%# Bind("updated_by") %>' runat="server" ID="updated_byLabel" />
                </div>
            </div>
            <div class="form-group">
                <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn btn-primary" />&nbsp;
                <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" OnClientClick="return confirm('You really want to delete this Item?');" CssClass="btn btn-danger" />&nbsp;
                 <asp:LinkButton runat="server" Text="Return to List View" CommandName="Cancel" ID="UpdateCancelButton" OnClick="UpdateCancelButton_Click" CausesValidation="False" CssClass="btn btn-primary" />
            </div>

        </ItemTemplate>
    </asp:FormView>
                      
   

<script type="text/javascript">
    tinymce.init({
        selector: ".tinymce",
        theme: "modern",
        plugins: [
    'advlist autolink lists link image charmap print preview hr anchor pagebreak',
    'searchreplace wordcount visualblocks visualchars code fullscreen',
    'insertdatetime media nonbreaking save table contextmenu directionality',
    'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'
        ],
        toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
        toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
        image_advtab: true
    });
</script>

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
