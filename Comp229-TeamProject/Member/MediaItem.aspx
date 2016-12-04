<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="MediaItem.aspx.cs" Inherits="Comp229_TeamProject.MediaItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:SqlDataSource ID="ItemMediaDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' 
        SelectCommand="SELECT  [IT].[Id]
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
                        WHERE ([IT].[Id] = @Id) ">
        <SelectParameters>
            <asp:RouteParameter RouteKey="itemid" DefaultValue="0" Name="Id" Type="Int32"></asp:RouteParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ItemMediaDataSource">
        <ItemTemplate>
            <div class="col-md-offset-2 col-md-8">
                <div class="list_view_box">
                    <div class="featured_left">
                        <asp:Image runat="server" ImageUrl='<%# "/Resources/Uploads/" + Eval("cover_image") %>' CssClass="home_image" />
                    </div>
                    <div class="featured_right">
                        <div class="featured_title_box">
                            <h3 class="home_title_featured"><%# Eval("name") %></h3>
                            <asp:Label runat="server" Text='<%# "publisher: "  + Eval("publisher") %>' CssClass="home_info" />
                            <asp:Label runat="server" Text='<%# "released on " + Eval("release_date", "{0:MMM dd, yyyy}") %>' CssClass="home_info" />
                            <asp:Label runat="server" Text="Review Score:" CssClass="home_info" />
                        </div>
                        <%# Eval("description") %>
                    </div>
                    <div class="list_view_buttons">
                        <a class="btn btn-primary " href="#" role="button">Read More</a>
                        <asp:Label runat="server" Text='Comments' CssClass="home_info" />
                    </div>
                </div>

            </div>
        </ItemTemplate>
    </asp:Repeater>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>' SelectCommand="SELECT * FROM [Item]"></asp:SqlDataSource>
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ItemMediaDataSource">
        <ItemTemplate>
            <%# Eval("name") %><br />
        </ItemTemplate>
    </asp:Repeater>
    ----

</asp:Content>
