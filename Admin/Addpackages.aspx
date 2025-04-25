
<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Addpackages.aspx.cs" Inherits="WebApplication11.Admin.Addpackages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="form-container">

            <asp:Label runat="server" Text="Package Name:"></asp:Label>
            <asp:TextBox runat="server" ID="txtPackageName" CssClass="input-field"></asp:TextBox>

            <asp:Label runat="server" Text="Tourist Places:"></asp:Label>
            <asp:TextBox runat="server" ID="txtTouristPlaces" CssClass="input-field"></asp:TextBox>

            <asp:Label runat="server" Text="No. Of Days:"></asp:Label>
            <asp:TextBox runat="server" ID="txtNoOfDays" CssClass="input-field" TextMode="Number"></asp:TextBox>

            <asp:Label runat="server" Text="Number of Nights:"></asp:Label>
            <asp:TextBox runat="server" ID="txtNoOfNights" CssClass="input-field" TextMode="Number"></asp:TextBox>

            <asp:Label runat="server" Text="Description:"></asp:Label>
            <asp:TextBox runat="server" ID="txtDescription" CssClass="input-field" TextMode="MultiLine"></asp:TextBox>

            <asp:Label runat="server" Text="Tour Date:"></asp:Label>
            <asp:TextBox runat="server" ID="txtTourDate" CssClass="input-field" TextMode="Date"></asp:TextBox>


            <asp:Label runat="server" Text="No. Of Person:"></asp:Label>
            <asp:DropDownList runat="server" ID="ddlNoOfPerson" CssClass="dropdown">
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                <asp:ListItem Text="3" Value="3"></asp:ListItem>
            </asp:DropDownList>

            <asp:Label runat="server" Text="Hotels To Stay:"></asp:Label>
            <asp:DropDownList runat="server" ID="ddlHotels" CssClass="dropdown">
                <asp:ListItem Text="3 Star" Value="3Star"></asp:ListItem>
                <asp:ListItem Text="4 Star" Value="4Star"></asp:ListItem>
                <asp:ListItem Text="5 Star" Value="5Star"></asp:ListItem>
            </asp:DropDownList>

            <asp:Label runat="server" Text="Food Type:"></asp:Label>
            <asp:DropDownList runat="server" ID="ddlFoodType" CssClass="dropdown">
                <asp:ListItem Text="Veg" Value="Veg"></asp:ListItem>
                <asp:ListItem Text="Non-Veg" Value="Non-Veg"></asp:ListItem>
            </asp:DropDownList>

            <asp:Label runat="server" Text="Travel By:"></asp:Label>
            <asp:DropDownList runat="server" ID="ddlTravel" CssClass="dropdown">
               <asp:ListItem Text="By Bus" Value="By Bus"></asp:ListItem>
                <asp:ListItem Text="By Train" Value="By Train"></asp:ListItem>
                <asp:ListItem Text="By Flight" Value="By Flight"></asp:ListItem>
            </asp:DropDownList>

            <asp:Label runat="server" Text="Adult (amount):"></asp:Label>
            <asp:TextBox runat="server" ID="txtAdultAmount" CssClass="input-field" TextMode="Number"></asp:TextBox>

            <asp:Label runat="server" Text="Child (amount):"></asp:Label>
            <asp:TextBox runat="server" ID="txtChildAmount" CssClass="input-field" TextMode="Number"></asp:TextBox>

            <asp:Label runat="server" Text="Tour Trip:"></asp:Label>
            <asp:DropDownList runat="server" ID="ddlTrip" CssClass="dropdown" OnSelectedIndexChanged="ddlTrip_SelectedIndexChanged">
               <asp:ListItem Text="General Trip" Value="General Trip"></asp:ListItem>
                <asp:ListItem Text="Family Trip " Value="Family Trip"></asp:ListItem>
                <asp:ListItem Text="Adventure Trip" Value="Adventure Trip"></asp:ListItem>
            </asp:DropDownList>

           
            <asp:Label runat="server" Text="Image:"></asp:Label>
            <asp:FileUpload runat="server" ID="fileUpload" CssClass="file-input"/>

            <div class="buttons">
                <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click1"/>
            </div>
            <div>
                <asp:Label ID="Message" runat="server" Text=""></asp:Label>
            </div>

        </div>

</asp:Content>
