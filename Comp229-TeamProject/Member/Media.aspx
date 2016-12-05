<%--
    File: Login.aspx
    Author: Luiz Érico and Rister   
    Date: 11-21-2016
--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Media.aspx.cs" Inherits="Comp229_TeamProject.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Literal ID="ErrorLabel" runat="server"></asp:Literal>

    <asp:SqlDataSource ID="MediaListDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>'
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
                        ORDER BY [IT].[Id] "></asp:SqlDataSource>


    <asp:Panel ID="ListViewPanel" runat="server">

        <asp:ListView runat="server" DataSourceID="MediaListDataSource" DataKeyNames="Id">
            <EmptyDataTemplate>
                <div class="row">No data was returned.</div>
            </EmptyDataTemplate>
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
                            <a class="btn btn-primary " href="/Member/MediaItem.aspx?itemid=<%# Eval("Id") %>" role="button">Read More</a> 
                            <asp:Label runat="server" Text='Comments' CssClass="home_info" />
                        </div>
                    </div>

                </div>
            </ItemTemplate>
            <LayoutTemplate>
                    <div class="row">
                        <td runat="server" id="itemPlaceholder"></td>
                    </div>

                <div style="text-align:center;">
                    <div class="form-group">
                    <asp:DataPager runat="server" ID="DataPager2">
                        <Fields>
                            
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary"></asp:NextPreviousPagerField>
                            <asp:NumericPagerField></asp:NumericPagerField>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-primary"></asp:NextPreviousPagerField>
                                
                        </Fields>
                   
                     </asp:DataPager>
                        </div>
                </div>
            </LayoutTemplate>
        </asp:ListView>
    </asp:Panel>
</asp:Content>
