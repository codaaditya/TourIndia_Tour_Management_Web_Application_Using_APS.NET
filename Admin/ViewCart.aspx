<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="WebApplication11.Admin.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview-container">
            <Columns>
                <asp:TemplateField HeaderText="Cart_Id">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cart_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="User_Id">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("User_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Package_Id">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Package_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Package_info">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Package_info") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NoOfPerson">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("NoOfPerson") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TotalPrice">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</asp:Content>
