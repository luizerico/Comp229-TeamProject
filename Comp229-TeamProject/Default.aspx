<%--
    File: Login.aspx
    Author: Luiz Érico and SiTe Li (Rister)
    Date: 11-21-2016
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Comp229_TeamProject.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="LastItems" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' 
        SelectCommand="SELECT TOP 6 [IT].[Id]
                              ,[IT].[name]
                              ,[IT].[type] 
                              ,[TY].[type] as type_name
                              ,[IT].[description]
                              ,Left([IT].[description], 20) as truncdesc
                              ,[IT].[status] 
                              ,[ST].[status] as status_name
                              ,[IT].[completed]
                              ,[IT].[cover_image]
                              ,[IT].[publisher]
                              ,[IT].[release_date]
                              ,[IT].[info_url]
                              ,[IT].[quantity]
                              ,[IT].[registered_date] 
                              ,[USR].[Username] as registered
                              ,[IT].[registered_by]
                              ,[IT].[updated_date]
                              ,[USU].[Username] as updated
                              ,[IT].[updated_by]
                        FROM [Item] AS IT
                        JOIN [Type] AS TY ON [TY].[Id] = [IT].[Type] 
                        JOIN [Status] AS ST ON [ST].[Id] = [IT].[Status]
                        JOIN [Users] AS USr ON [USR].[Id] = [IT].[registered_by]
                        JOIN [Users] AS USU ON [USU].[Id] = [IT].[updated_by]
                        ORDER BY [updated_date] ">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="FeaturedItems" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' 
         SelectCommand="SELECT TOP 3 [IT].[Id]
                              ,[IT].[name]
                              ,[IT].[type] 
                              ,[TY].[type] as type_name
                              ,[IT].[description]
                              ,Left([IT].[description], 20) as truncdesc
                              ,[IT].[status] 
                              ,[ST].[status] as status_name
                              ,[IT].[completed]
                              ,[IT].[cover_image]
                              ,[IT].[publisher]
                              ,[IT].[release_date]
                              ,[IT].[info_url]
                              ,[IT].[quantity]
                              ,[IT].[registered_date] 
                              ,[USR].[Username] as registered
                              ,[IT].[registered_by]
                              ,[IT].[updated_date]
                              ,[USU].[Username] as updated
                              ,[IT].[updated_by]
                        FROM [Item] AS IT
                        JOIN [Type] AS TY ON [TY].[Id] = [IT].[Type] 
                        JOIN [Status] AS ST ON [ST].[Id] = [IT].[Status]
                        JOIN [Users] AS USr ON [USR].[Id] = [IT].[registered_by]
                        JOIN [Users] AS USU ON [USU].[Id] = [IT].[updated_by]
                        WHERE ([IT].[status] <> @status) ">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="status" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row">
        <h3 class="featured_title">Featured Items</h3>
        </div>
    <div class="row">
        <asp:Repeater ID="FeaturedItemsList" runat="server" DataSourceID="FeaturedItems">
            <ItemTemplate>
                <div class="col-md-4 featured_box">
                    <div class="featured_box">                        
                        <div class="featured_left">
                            <asp:Image runat="server" ImageUrl='<%# "/Resources/Uploads/" + Eval("cover_image") %>' CssClass="home_image" />   
                            <asp:Label runat="server" Text="Review Score:" CssClass="home_info" />                        
                            <asp:Label runat="server" Text='<%# "Status: " + Eval("status_name") %>' CssClass="home_info" />
                        </div>
                        <div class="featured_right">
                            <div class="featured_title_box">
                                <h3 class="home_title_featured"><%# Eval("name") %></h3>
                                <asp:Label runat="server" Text= '<%# "publisher: "  + Eval("publisher") %>'  CssClass="home_info" />
                                <asp:Label runat="server" Text='<%# "released on " + Eval("release_date", "{0:MMM dd, yyyy}") %>' CssClass="home_info" />
                            </div>
                            <%# Eval("description") %>
                        </div>                        
                    </div>
                    <div class="featured_buttons">
                        <a class="btn btn-primary " href="/Member/MediaItem.aspx?itemid=<%# Eval("Id") %>" role="button">Read More</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="row">
        <h3 class="last_title">Last Updated Items</h3>
        </div>
    <div class="row">
        <asp:Repeater ID="LastItemsList" runat="server" DataSourceID="LastItems">
            <ItemTemplate>
                <div class="col-lg-2 col-md-4 col-sm-6 featured_box">
                    <div class="last_items_box">                        
                        <div class="last_item_image">
                            <h3 class="home_title_featured"><%# Eval("name") %></h3>
                            <asp:Image runat="server" ImageUrl='<%# "/Resources/Uploads/" + Eval("cover_image") %>' CssClass="home_image" />   
                        </div>
                        <div class="last_item_info">
                            <div class="featured_title_box">
                                <asp:Label runat="server" Text= '<%# "publisher: "  + Eval("publisher") %>'  CssClass="home_info" />
                                <asp:Label runat="server" Text='<%# "released on " + Eval("release_date", "{0:yyyy-MM-dd}") %>' CssClass="home_info" />
                                <asp:Label runat="server" Text="Review Score:" CssClass="home_info" />                        
                                <asp:Label runat="server" Text='<%# "Status: " + Eval("status_name") %>' CssClass="home_info" />
                            </div>
                            <div class="featured_buttons">
                        <a class="btn btn-primary " href="/Member/MediaItem.aspx?itemid=<%# Eval("Id") %>" role="button">Read More</a>
                    </div>
                        </div>                        
                    </div>
                    
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>

