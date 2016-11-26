<%--
    File: Login.aspx
    Author: Luiz Érico and Rister   
    Date: 11-21-2016
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Comp229_TeamProject.WebForm1"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align:center;  ">
        <h3>Logon Page</h3>
    <table>
        <tr>
            <td>Username:</td>
            <td>
                <input id="UserName" type="text" runat="server" /></td>
            <td>
                <asp:RequiredFieldValidator ControlToValidate="UserName"
                    Display="Static" ErrorMessage="*" runat="server"
                    ID="ValidateUserName" /></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td>
                <input id="UserPass" type="password" runat="server" /></td>
            <td>
                <asp:RequiredFieldValidator ControlToValidate="UserPass"
                    Display="Static" ErrorMessage="*" runat="server"
                    ID="ValidateUserPass" />
            </td>
        </tr>
        <tr>
            <td>Remember:</td>
            <td>
                <asp:CheckBox ID="RememberCookie" runat="server" AutoPostBack="false" /></td>
            <td></td>
        </tr>
    </table>
    <asp:Button ID="Button1" runat="server" Text=" Login " onClick="cmdLogin_ServerClick" CssClass="btn btn-primary"/><p></p>
    <asp:Label ID="Message" ForeColor="red" runat="server"  />
        </div>
</asp:Content>
