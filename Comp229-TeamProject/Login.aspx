<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Comp229_TeamProject.WebForm1"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
    <asp:Button ID="Button1" runat="server" Text="Button" onClick="cmdLogin_ServerClick"/><p></p>
    <asp:Label ID="Message" ForeColor="red" runat="server"  />
</asp:Content>
