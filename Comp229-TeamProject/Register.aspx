<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Comp229_TeamProject.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="UserDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' DeleteCommand="DELETE FROM [Users] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Users] ([Username], [Password], [userRole], [Email], [Birthdate], [Picture], [Registered_date]) VALUES (@Username, @Password, @userRole, @Email, @Birthdate, @Picture, @Registered_date)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [Username] = @Username, [Password] = @Password, [userRole] = @userRole, [Email] = @Email, [Birthdate] = @Birthdate, [Picture] = @Picture, [Registered_date] = @Registered_date WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="userRole" Type="String" DefaultValue="user"></asp:Parameter>
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
    </asp:SqlDataSource>

    <asp:FormView ID="UserFormEdit" runat="server" DataKeyNames="Id" DataSourceID="UserDataSource" DefaultMode="Insert">
        <EditItemTemplate>
            Username:
            <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="UsernameTextBox" /><br />
            Password:
            <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />           
            Email:
            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /><br />
            Birthdate:
            <asp:TextBox Text='<%# Bind("Birthdate") %>' runat="server" ID="BirthdateTextBox" /><br />
            Picture:
            <asp:TextBox Text='<%# Bind("Picture") %>' runat="server" ID="PictureTextBox" /><br />
            Registered_date:
            <asp:TextBox Text='<%# Bind("Registered_date") %>' runat="server" ID="Registered_dateTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Username:
            <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="UsernameTextBox" /><br />
            Password:
            <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />            
            Email:
            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /><br />
            Birthdate:
            <asp:TextBox Text='<%# Bind("Birthdate") %>' runat="server" ID="BirthdateTextBox" /><br />
            Picture:
            <asp:TextBox Text='<%# Bind("Picture") %>' runat="server" ID="PictureTextBox" /><br />
            Registered_date:
            <asp:TextBox Text='<%# Bind("Registered_date") %>' runat="server" ID="Registered_dateTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        
    </asp:FormView>
</asp:Content>
