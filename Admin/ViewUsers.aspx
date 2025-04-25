<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewUsers.aspx.cs" Inherits="WebApplication11.Admin.ViewUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PhoneNo">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("PhoneNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ConPassword">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("ConPassword") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PostalCode">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("PostalCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Place1">
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("Place1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Place2">
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("Place2") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Place3">
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("Place3") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Place4">
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("Place4") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Place5">
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("Place5") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ProfileImage">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server"  ImageUrl='<%# ResolveUrl("~/" + Eval("ProfileImage")) %>'    height="100" width="100" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_Delete">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</asp:Content>
