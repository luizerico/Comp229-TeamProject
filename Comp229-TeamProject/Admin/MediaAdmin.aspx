<%--
    File: Login.aspx
    Author: Luiz Érico and Rister   
    Date: 11-21-2016
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="MediaAdmin.aspx.cs" Inherits="Comp229_TeamProject.Admin.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Literal ID="ErrorLabel" runat="server"></asp:Literal>

    <asp:SqlDataSource ID="ComboDataSourceStatus" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Status]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ComboDataSourceType" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Type]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ComboDataSourceUser" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="MediaListDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Item]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="MediaEditDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Item] WHERE [Id] = @Id" DeleteCommand="DELETE FROM [Item] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Item] ([name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (@name, @type, @description, @status, @completed, @cover_image, @publisher, @release_date, @info_url, @quantity, @registered_date, @registered_by, @updated_date, @updated_by)" UpdateCommand="UPDATE [Item] SET [name] = @name, [type] = @type, [description] = @description, [status] = @status, [completed] = @completed, [cover_image] = @cover_image, [publisher] = @publisher, [release_date] = @release_date, [info_url] = @info_url, [quantity] = @quantity, [registered_date] = @registered_date, [registered_by] = @registered_by, [updated_date] = @updated_date, [updated_by] = @updated_by WHERE [Id] = @Id">
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
    <asp:GridView ID="MediaGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="MediaListDataSource" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>

            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type"></asp:BoundField>
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description"></asp:BoundField>
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status"></asp:BoundField>
            <asp:BoundField DataField="completed" HeaderText="completed" SortExpression="completed"></asp:BoundField>
            <asp:BoundField DataField="cover_image" HeaderText="cover_image" SortExpression="cover_image"></asp:BoundField>
            <asp:BoundField DataField="publisher" HeaderText="publisher" SortExpression="publisher"></asp:BoundField>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            
        </Columns>
    </asp:GridView>

    
      
    <asp:FormView ID="MediaFormView" runat="server" DataSourceID="MediaEditDataSource" DataKeyNames="Id" OnItemInserted="MediaFormView_ItemInserted" OnItemDeleted="MediaFormView_ItemDeleted" OnItemUpdated="MediaFormView_ItemUpdated" RowStyle-CssClass="row" InsertRowStyle-CssClass="row" >
        <EditItemTemplate>
            Id:<asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel1" />
            <br />
            name:<asp:TextBox Text='<%# Bind("name") %>' runat="server" ID="nameTextBox" />
            <br />
            type:<asp:DropDownList ID="typeTextBox" runat="server" DataValueField='id' DataSourceID="ComboDataSourceType" 
                DataTextField="type" SelectedValue='<%# Bind("type") %>' />
            <%-- <asp:TextBox Text='<%# Bind("type") %>' runat="server" ID="typeTextBox" /> --%>
            <br />
            description:<asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" />
            <br />
            status:<asp:DropDownList ID="statusTextBox" runat="server" DataValueField='id' DataSourceID="ComboDataSourceStatus" 
                DataTextField="status" SelectedValue='<%# Bind("status") %>' />
            <asp:DropDownList ID="statusTextBox1" runat="server" OnPreRender="DropDownListStatus_Load" ></asp:DropDownList> 
            <%-- <asp:TextBox Text='<%# Bind("status") %>' runat="server" ID="statusTextBox" />--%>
            <br />
            completed:<asp:TextBox Text='<%# Bind("completed") %>' runat="server" ID="completedTextBox" />
            <br />
            cover_image:<asp:TextBox Text='<%# Bind("cover_image") %>' runat="server" ID="cover_imageTextBox" />
            <br />
            publisher:<asp:TextBox Text='<%# Bind("publisher") %>' runat="server" ID="publisherTextBox" />
            <br />
            release_date:<asp:TextBox Text='<%# Bind("release_date") %>' runat="server" ID="release_dateTextBox" />
            <br />
            info_url:<asp:TextBox Text='<%# Bind("info_url") %>' runat="server" ID="info_urlTextBox" />
            <br />
            quantity:<asp:TextBox Text='<%# Bind("quantity") %>' runat="server" ID="quantityTextBox" />
            <br />
            registered_date:<asp:TextBox Text='<%# Bind("registered_date") %>' runat="server" ID="registered_dateTextBox" />
            <br />
            registered_by:<asp:TextBox Text='<%# Bind("registered_by") %>' runat="server" ID="registered_byTextBox" />
            <br />
            updated_date:<asp:TextBox Text='<%# Bind("updated_date") %>' runat="server" ID="updated_dateTextBox" />
            <br />
            updated_by:<asp:TextBox Text='<%# Bind("updated_by") %>' runat="server" ID="updated_byTextBox" />
            <br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;
            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" OnClick="UpdateCancelButton_Click" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="row list">
                <asp:Label ID="Item_Name" runat="server" Text="Name:" CssClass="col-md-4 control-label" />
                <div class="col-md-8">
                    <asp:TextBox Text='<%# Bind("name") %>' runat="server" ID="nameTextBox" />
                </div>
            </div>

            type:<asp:TextBox Text='<%# Bind("type") %>' runat="server" ID="typeTextBox" />
            <br />
            description:<asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" />
            <br />status:
            <asp:DropDownList ID="statusTextBox" runat="server"
                DataValueField='id' DataSourceID="MediaEditDataSource" 
                DataTextField="Status" 
                SelectedValue='<%# Eval("status") %>' />
            <asp:DropDownList ID="statusTextBox1" runat="server" OnPreRender="DropDownListStatus_Load" ></asp:DropDownList>
            <%-- <asp:TextBox Text='<%# Bind("status") %>' runat="server" ID="statusTextBox" /> --%>
            <br />
            completed:<asp:TextBox Text='<%# Bind("completed") %>' runat="server" ID="completedTextBox" />
            <br />
            cover_image:<asp:TextBox Text='<%# Bind("cover_image") %>' runat="server" ID="cover_imageTextBox" />
            <br />
            publisher:<asp:TextBox Text='<%# Bind("publisher") %>' runat="server" ID="publisherTextBox" />
            <br />
            release_date:<asp:TextBox Text='<%# Bind("release_date") %>' runat="server" ID="release_dateTextBox" />
            <br />
            info_url:<asp:TextBox Text='<%# Bind("info_url") %>' runat="server" ID="info_urlTextBox" />
            <br />
            quantity:<asp:TextBox Text='<%# Bind("quantity") %>' runat="server" ID="quantityTextBox" />
            <br />
            registered_date:<asp:TextBox Text='<%# Bind("registered_date") %>' runat="server" ID="registered_dateTextBox" />
            <br />
            registered_by:<asp:TextBox Text='<%# Bind("registered_by") %>' runat="server" ID="registered_byTextBox" />
            <br />
            updated_date:<asp:TextBox Text='<%# Bind("updated_date") %>' runat="server" ID="updated_dateTextBox" />
            <br />
            updated_by:<asp:TextBox Text='<%# Bind("updated_by") %>' runat="server" ID="updated_byTextBox" />
            <br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;
            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" OnClick="UpdateCancelButton_Click" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            Id:<asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" />
            <br />
            name:<asp:Label Text='<%# Bind("name") %>' runat="server" ID="nameLabel" />
            <br />
            type:<asp:Label Text='<%# Bind("type") %>' runat="server" ID="typeLabel" />
            <br />
            description:<asp:Label Text='<%# Bind("description") %>' runat="server" ID="descriptionLabel" />
            <br />
            status:<asp:Label Text='<%# Bind("status") %>' runat="server" ID="statusLabel" />
            <br />
            completed:<asp:Label Text='<%# Bind("completed") %>' runat="server" ID="completedLabel" />
            <br />
            cover_image:<asp:Label Text='<%# Bind("cover_image") %>' runat="server" ID="cover_imageLabel" />
            <br />
            publisher:<asp:Label Text='<%# Bind("publisher") %>' runat="server" ID="publisherLabel" />
            <br />
            release_date:<asp:Label Text='<%# Bind("release_date") %>' runat="server" ID="release_dateLabel" />
            <br />
            info_url:<asp:Label Text='<%# Bind("info_url") %>' runat="server" ID="info_urlLabel" />
            <br />
            quantity:<asp:Label Text='<%# Bind("quantity") %>' runat="server" ID="quantityLabel" />
            <br />
            registered_date:<asp:Label Text='<%# Bind("registered_date") %>' runat="server" ID="registered_dateLabel" />
            <br />
            registered_by:<asp:Label Text='<%# Bind("registered_by") %>' runat="server" ID="registered_byLabel" />
            <br />
            updated_date:<asp:Label Text='<%# Bind("updated_date") %>' runat="server" ID="updated_dateLabel" />
            <br />
            updated_by:<asp:Label Text='<%# Bind("updated_by") %>' runat="server" ID="updated_byLabel" />
            <br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn btn-primary" />&nbsp;
            <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" OnClientClick="return confirm('You really want to delete this Item?');" CssClass="btn btn-danger" />&nbsp;
            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" OnClick="UpdateCancelButton_Click" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:LinkButton runat="server" Text="New"  ID="NewItem" OnCommand="NewItem_Command" />
                      
    
    

</asp:Content>
