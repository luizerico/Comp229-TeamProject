<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Comp229_TeamProject.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            You are not logged in. Click on the login link to sign in.<br />
            <asp:HyperLink ID="LoginPage" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
        </AnonymousTemplate>
        <LoggedInTemplate>
            You are logged in...<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Logout.aspx">HyperLink</asp:HyperLink>

            <p>
                
                <asp:LoginView ID="LoginView2" runat="server">
                    <LoggedInTemplate>
                    <asp:LoginName ID="LoginName1" runat="server" />
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                        </LoggedInTemplate> 
                </asp:LoginView>
                


            </p>
        </LoggedInTemplate>
    </asp:LoginView>

    </asp:Content>

