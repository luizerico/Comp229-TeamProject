<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Comp229_TeamProject.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <body>
    <form id="form1" runat="server">
        
        <!-- Main Navigation -->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Default.aspx"><i class="fa fa-fort-awesome fa-lg"></i>  Survey Site</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li id="home" runat="server"><a href="Default.aspx"><i class="fa fa-home fa-lg"></i>  Home</a></li>
                        <li id="survey" runat="server"><a href="SurveyPage.aspx"><i class="fa fa-th fa-lg"></i>  Survey</a></li>
                       
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <!-- Main Content -->
        <main>
            <asp:ContentPlaceHolder ID="MainContent" runat="server">
                
            </asp:ContentPlaceHolder>
        </main>
    </form>

    <!-- Footer -->
    <nav class="navbar navbar-default navbar-floating-bottom">
        <div class="container">
            <h4>&copy; 2016 - TeamProject - All Rights Reserved</h4>
        </div>
    </nav>

    <!-- Scripts Section -->
    <script src="Scripts/jquery-2.2.4.js"></script>
    <script src="Scripts/jquery-2.2.4.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/app.js"></script>
</body>
</html>





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

