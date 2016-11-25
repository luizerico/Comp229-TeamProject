<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Comp229_TeamProject.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Do you really want to logout?
    <asp:Button ID="Button1" runat="server" Text="Yes" onClick="Logout_Click"/>
</asp:Content>
