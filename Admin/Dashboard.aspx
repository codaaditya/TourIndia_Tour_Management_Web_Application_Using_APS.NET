<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication11.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile">
        <asp:Label ID="lblUser" runat="server" Text=""></asp:Label>
    </div>
     <div class="dashboard-cards">
            <div class="card">
                <h4>Total Bookings</h4>
                <p><asp:TextBox ID="totalBooking" runat="server"></asp:TextBox></p>
            </div>
            <div class="card">
                <h4>Registered Users</h4>
                <p><asp:TextBox ID="regUsers" runat="server"></asp:TextBox></p>
            </div>
            <div class="card">
                <h4>Total Revenue</h4>
                <p><asp:TextBox ID="totalrev" runat="server"></asp:TextBox></p>
            </div>
        </div>
</asp:Content>
