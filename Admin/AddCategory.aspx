<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="WebApplication11.Admin.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="add-category">
    <!-- Label -->
    <asp:Label ID="Label1" runat="server" Text="Add Package Types" CssClass="category-label"></asp:Label>

    <!-- TextBox -->
       <asp:TextBox ID="txtName" runat="server" CssClass="input-field" TextMode="SingleLine"></asp:TextBox>

       <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <!-- Button -->
    <asp:Button ID="Button1" runat="server" Text="Add Package Type" CssClass="category-button" OnClick="Button1_Click" />
</div>
</asp:Content>
