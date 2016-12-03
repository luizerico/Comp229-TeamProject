<%--
    File: Login.aspx
    Author: Luiz Érico and SiTe Li (Rister)
    Date: 11-21-2016
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Comp229_TeamProject.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="LastItems" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT TOP 4 [Id], [name], [description], [cover_image], [status], [info_url] FROM [Item] ORDER BY [updated_date] "></asp:SqlDataSource>
    <asp:SqlDataSource ID="FeaturedItems" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT TOP 2[Id], [name], [description], [cover_image], [info_url] FROM [Item] WHERE ([status] <> @status) ">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="status" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:LoginView ID="LoginView1" runat="server">
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
    <div class="row">
        <asp:Repeater ID="FeaturedItemsList" runat="server" DataSourceID="FeaturedItems">
            <ItemTemplate>
                <div class="col-md-6">
                    <div class="featured_box">
                        <h3><%# Eval("name") %></h3>
                        <div class="featured_left">
                            <asp:Image runat="server" ImageUrl='<%# "/Resources/Uploads/" + Eval("cover_image") %>' CssClass="listview_image" />
                        </div>
                        <div class="featured_right">
                            <%# Eval("description") %>
                        </div>
                        <p><a class="btn btn-primary " href="#" role="button">Learn more</a></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="row">
        <asp:Repeater ID="LastItemsList" runat="server" DataSourceID="LastItems">
            <ItemTemplate>
                <div class="col-md-3">
                    <div class="jumbotron">
                        <h3><%# Eval("name") %></h3>
                        <p><%# Eval("description") %></p>
                        <p><a class="btn btn-primary " href="#" role="button">Learn more</a></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>

