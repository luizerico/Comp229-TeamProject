<%--
    File: Login.aspx
    Author: Luiz Érico and Rister   
    Date: 11-21-2016
--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="MediaAdmin.aspx.cs" Inherits="Comp229_TeamProject.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type"></asp:BoundField>
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

   
</asp:Content>
