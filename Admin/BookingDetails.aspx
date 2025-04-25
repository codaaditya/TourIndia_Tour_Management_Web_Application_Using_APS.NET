<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="BookingDetails.aspx.cs" Inherits="WebApplication11.Admin.BookingDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
    HeaderStyle-CssClass="table-dark" RowStyle-CssClass="table-light" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:TemplateField HeaderText="Booking ID">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Booking_Id") %>' CssClass="fw-bold"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="User ID">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("User_Id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Package ID">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Package_Id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Package Info">
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Package_info") %>' CssClass="text-truncate" Style="max-width: 200px;"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="No. of Persons">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("NoOfPerson") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tour Date">
            <ItemTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%# Eval("TourDate", "{0:dd MMM yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Price">
            <ItemTemplate>
                <asp:Label ID="Label7" runat="server" Text='<%# Eval("TotalPrice", "{0:C}") %>' CssClass="fw-bold text-success"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Booking Date">
            <ItemTemplate>
                <asp:Label ID="Label8" runat="server" Text='<%# Eval("BookingDate", "{0:dd MMM yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Package Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# ResolveUrl("~/admin/" + Eval("PackageImage")) %>' CssClass="img-thumbnail" Width="100px" Height="80px" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Booking_Id") %>' CommandName="cmd_Delete">Delete</asp:LinkButton>
                    </ItemTemplate>
         </asp:TemplateField>
    </Columns>
</asp:GridView>

</asp:Content>
