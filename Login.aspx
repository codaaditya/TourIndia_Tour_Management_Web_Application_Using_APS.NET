<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication11.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/s1.css" />
    <title>login</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <form id="loginForm" runat="server">
            <h2 class="form-title">Login to TourIndia</h2>

            <!-- Message Label -->
            <asp:Label ID="lblMessage" runat="server" CssClass="form-message" />

            <!-- Email -->
            <div class="form-group">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
            </div>

            <!-- Login Button -->
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" CssClass="btn-primary" Text="Login" OnClick="btnLogin_Click"/>
            </div>

            <!-- Link to Register -->
            <div class="form-footer text-center">
                <p>Don't have an account? <a href="Signup.aspx" class="form-link">Register here</a>.</p>
            </div>
    </form>
</asp:Content>

