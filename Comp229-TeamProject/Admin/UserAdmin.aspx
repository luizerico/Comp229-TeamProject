<%--
    File: Login.aspx
    Author: Luiz Érico and Rister   
    Date: 11-21-2016
--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="UserAdmin.aspx.cs" Inherits="Comp229_TeamProject.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"></asp:BoundField>
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
            <asp:BoundField DataField="userRole" HeaderText="userRole" SortExpression="userRole"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Birthdate" HeaderText="Birthdate" SortExpression="Birthdate"></asp:BoundField>
            <asp:BoundField DataField="Picture" HeaderText="Picture" SortExpression="Picture"></asp:BoundField>
            <asp:BoundField DataField="Registered_date" HeaderText="Registered_date" SortExpression="Registered_date"></asp:BoundField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject2 %>' SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"></asp:BoundField>
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
            <asp:BoundField DataField="userRole" HeaderText="userRole" SortExpression="userRole"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Birthdate" HeaderText="Birthdate" SortExpression="Birthdate"></asp:BoundField>
            <asp:BoundField DataField="Picture" HeaderText="Picture" SortExpression="Picture"></asp:BoundField>
            <asp:BoundField DataField="Registered_date" HeaderText="Registered_date" SortExpression="Registered_date"></asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>
