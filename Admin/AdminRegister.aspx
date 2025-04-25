<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="WebApplication11.Admin.AdminRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-container">
    <h2>Admin Registration</h2>

    <!-- Full Name -->
    <asp:Label runat="server" Text="Full Name:" />
    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter full name" Required="true"></asp:TextBox>
    <br />

    <!-- Email -->
    <asp:Label runat="server" Text="Email:" />
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter email" Required="true"></asp:TextBox>
    <br />

    <!-- Full Name -->
    <asp:Label runat="server" Text="Phone No:" />
    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter Phone Number" Required="true"></asp:TextBox>
    <br />

    <!-- Password -->
    <asp:Label runat="server" Text="Password:" />
    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password" Required="true"></asp:TextBox>
    <br />

    <!-- Confirm Password -->
    <asp:Label runat="server" Text="Confirm Password:" />
    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm password" Required="true"></asp:TextBox>
    <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" ForeColor="Red" Display="Dynamic" />
    <br />

    <!-- Submit Button -->
    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
    
    <!-- Message Label -->
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
</div>

</asp:Content>
