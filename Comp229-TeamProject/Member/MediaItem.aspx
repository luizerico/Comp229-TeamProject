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

            <asp:QueryStringParameter DefaultValue="0" Name="Id" Type="Int32" QueryStringField="itemid" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ReviewGridDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnTeamProject %>'
        SelectCommand="SELECT [RV].[id], [RV].[Score], [RV].[Comment], [RV].[Registered_date], [US].[Username], [US].[Picture] FROM [Review] AS RV
                        JOIN [Users] AS US ON [US].[Id] = [RV].[username]
                        WHERE ([RV].[item] = @itemid)"
        DeleteCommand="DELETE FROM [Review] WHERE [Id] = @Id"
        InsertCommand="INSERT INTO [Review] ([Item], [Username], [Score], [Comment], [Registered_date]) VALUES (@Item, @Username, @Score, @Comment, @Registered_date)"
        UpdateCommand="UPDATE [Review] SET [Item] = @Item, [Username] = @Username, [Score] = @Score, [Comment] = @Comment, [Registered_date] = @Registered_date WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:QueryStringParameter QueryStringField="itemid" DefaultValue="-1" Name="Item" Type="Int32"></asp:QueryStringParameter>
            <asp:SessionParameter SessionField="userid" Name="Username" Type="Int32" DefaultValue="1" />
            <asp:Parameter Name="Score" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Comment" Type="String"></asp:Parameter>
            <asp:Parameter Name="Registered_date" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="itemid" DefaultValue="-1" Name="itemid" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:QueryStringParameter QueryStringField="itemid" DefaultValue="-1" Name="Item" Type="Int32"></asp:QueryStringParameter>
            <asp:Parameter Name="Username" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Score" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Comment" Type="String"></asp:Parameter>
            <asp:Parameter Name="Registered_date" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="row">
        <div class="col-md-offset-2 col-md-8">
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ItemMediaDataSource">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-12 featured_box">
                            <div class="item_box">
                                <div class="item_left">
                                    <asp:Image runat="server" ImageUrl='<%# "/Resources/Uploads/" + Eval("cover_image") %>' CssClass="home_image" />
                                </div>
                                <div class="item_right">
                                    <div class="featured_title_box">
                                        <h3 class="home_title_featured"><%# Eval("name") %></h3>
                                        <asp:Label runat="server" Text='<%# "publisher: "  + Eval("publisher") %>' CssClass="home_info" />
                                        <asp:Label runat="server" Text='<%# "released on " + Eval("release_date", "{0:MMM dd, yyyy}") %>' CssClass="home_info" />
                                        <asp:Label runat="server" Text="Review Score:" CssClass="home_info" />
                                    </div>
                                    <%# Eval("description") %>
                                </div>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>

            <asp:LoginView ID="LoginView1" runat="server">
                <LoggedInTemplate>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="ReviewGridDataSource" DataKeyNames="Id" InsertItemPosition="LastItem">
                        <InsertItemTemplate>
                            <div class="row comment_new">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="label8" Text="Comment:" CssClass="col-md-4 control-label " />
                                    <div class="col-md-8">
                                        <asp:TextBox TextMode="Multiline" Text='<%# Bind("Comment") %>' runat="server" ID="CommentTextBox" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="label13" Text="Score:" CssClass="col-md-4 control-label " />
                                    <div class="col-md-8">
                                        <asp:TextBox TextMode="Range" min="0" max="10" step="1" Text='<%# Bind("Score") %>' runat="server" ID="ScoreTextBox" ValidateRequestMode="Disabled" CssClass="form-control" />
                                        <asp:RangeValidator ID="Rangevalidator1" ErrorMessage="Please enter value between 0-100." ForeColor="Red" ControlToValidate="ScoreTextBox" MinimumValue="0" MaximumValue="5" runat="server" Type="Integer">
                                        </asp:RangeValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Button runat="server" CommandName="Insert" Text=" Insert New Comment" ID="InsertButton" CssClass="btn btn-primary" />
                                    &nbsp;
                <asp:Button runat="server" CommandName="Cancel" Text="  Clear  " ID="CancelButton" CssClass="btn btn-warning" />
                                </div>
                            </div>

                        </InsertItemTemplate>

                        <EmptyDataTemplate>
                            No data was returned.
                        </EmptyDataTemplate>


                        <ItemTemplate>
                            <div class="row comment_line">
                                <div class="comment_left">
                                    <asp:Image runat="server" ImageUrl='<%# "/Resources/Uploads/" + Eval("Picture") %>' CssClass="comment_image" />
                                </div>
                                <div class="comment_right">
                                    <strong class="comment_user">
                                        <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" /></strong><br />
                                    <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /><br />


                                    <span class="comment_info">Score:
                    <asp:Label Text='<%# Eval("Score") %>' runat="server" ID="ScoreLabel" /></span>
                                    <span class="comment_info">Registered_date:
                    <asp:Label Text='<%# Eval("Registered_date") %>' runat="server" ID="Registered_dateLabel" /></span>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="row">
                                <li runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="text-align: center;">
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
                </LoggedInTemplate>
                <AnonymousTemplate>
                    <div class="row">
                        <h4>You need to be logged to comment.</h4>
                    </div>
                </AnonymousTemplate>
            </asp:LoginView>
        </div>
    </div>
    
           <%-- 
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
   <asp:ListView ID="ListView2" runat="server" DataSourceID="ReviewGridDataSource" DataKeyNames="Id" InsertItemPosition="LastItem" >
       <AlternatingItemTemplate>
           <li style="">id:
               <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /><br />
               Score:
               <asp:Label Text='<%# Eval("Score") %>' runat="server" ID="ScoreLabel" /><br />
               Comment:
               <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /><br />
               Registered_date:
               <asp:Label Text='<%# Eval("Registered_date") %>' runat="server" ID="Registered_dateLabel" /><br />
               Username:
               <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" /><br />
               Picture:
               <asp:Label Text='<%# Eval("Picture") %>' runat="server" ID="PictureLabel" /><br />
           </li>
       </AlternatingItemTemplate>
       <EditItemTemplate>
           <li style="">id:
               <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel1" /><br />
               Score:
               <asp:TextBox Text='<%# Bind("Score") %>' runat="server" ID="ScoreTextBox" /><br />
               Comment:
               <asp:TextBox Text='<%# Bind("Comment") %>' runat="server" ID="CommentTextBox" /><br />
               Registered_date:
               <asp:TextBox Text='<%# Bind("Registered_date") %>' runat="server" ID="Registered_dateTextBox" /><br />
               Username:
               <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="UsernameTextBox" /><br />
               Picture:
               <asp:TextBox Text='<%# Bind("Picture") %>' runat="server" ID="PictureTextBox" /><br />
               <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /></li>
       </EditItemTemplate>
       <EmptyDataTemplate>
           No data was returned.
       </EmptyDataTemplate>
       <InsertItemTemplate>
           <li style="">Score:
               <asp:TextBox Text='<%# Bind("Score") %>' runat="server" ID="ScoreTextBox" /><br />
               Comment:
               <asp:TextBox Text='<%# Bind("Comment") %>' runat="server" ID="CommentTextBox" /><br />
               Registered_date:
               <asp:TextBox Text='<%# Bind("Registered_date") %>' runat="server" ID="Registered_dateTextBox" /><br />
               Username:
               <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="UsernameTextBox" /><br />
               Picture:
               <asp:TextBox Text='<%# Bind("Picture") %>' runat="server" ID="PictureTextBox" /><br />
               <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /></li>
       </InsertItemTemplate>
       <ItemSeparatorTemplate>
           <br />
       </ItemSeparatorTemplate>
       <ItemTemplate>
           <li style="">id:
               <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /><br />
               Score:
               <asp:Label Text='<%# Eval("Score") %>' runat="server" ID="ScoreLabel" /><br />
               Comment:
               <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /><br />
               Registered_date:
               <asp:Label Text='<%# Eval("Registered_date") %>' runat="server" ID="Registered_dateLabel" /><br />
               Username:
               <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" /><br />
               Picture:
               <asp:Label Text='<%# Eval("Picture") %>' runat="server" ID="PictureLabel" /><br />
           </li>
       </ItemTemplate>
       <LayoutTemplate>
           <ul runat="server" id="itemPlaceholderContainer" style="">
               <li runat="server" id="itemPlaceholder" />
           </ul>
           <div style="">
           </div>
       </LayoutTemplate>
       <SelectedItemTemplate>
           <li style="">id:
               <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /><br />
               Score:
               <asp:Label Text='<%# Eval("Score") %>' runat="server" ID="ScoreLabel" /><br />
               Comment:
               <asp:Label Text='<%# Eval("Comment") %>' runat="server" ID="CommentLabel" /><br />
               Registered_date:
               <asp:Label Text='<%# Eval("Registered_date") %>' runat="server" ID="Registered_dateLabel" /><br />
               Username:
               <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" /><br />
               Picture:
               <asp:Label Text='<%# Eval("Picture") %>' runat="server" ID="PictureLabel" /><br />
           </li>
       </SelectedItemTemplate>
   </asp:ListView>
                        </LoggedInTemplate>
                    <AnonymousTemplate>
                        <div class="row">
                            <h4>You need to be logged to comment.</h4>
                        </div>
                    </AnonymousTemplate>
                </asp:LoginView>
    --%>

</asp:Content>
