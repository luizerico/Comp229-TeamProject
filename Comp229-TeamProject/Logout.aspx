<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Comp229_TeamProject.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center;">

        <h3>
            <p>Do you really want to logout?</p>
            <p>
                <asp:Button ID="Button1" runat="server" Text=" Yes, logout. " OnClick="Logout_Click" CssClass="btn btn-danger" /></p>
            <p>
                <asp:Button ID="Button2" runat="server" Text=" Return to the Home. " OnClick="ReturnHome_Click" CssClass="btn btn-default" /></p>

        </h3>
    </div>
</asp:Content>
