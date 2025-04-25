<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManagePackages.aspx.cs" Inherits="WebApplication11.Admin.ViewPaclage" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
     <asp:Button ID="Button1" runat="server" Text="Package Report" OnClick="Button1_Click" />
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
             <asp:ListItem Text="Non-Veg" Value="NonVeg"></asp:ListItem>
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
         
         <asp:Label runat="server" Text="Image:"></asp:Label>
         <asp:FileUpload runat="server" ID="fileUpload" CssClass="file-input"/>

         <div class="buttons">
             <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click"/>
         </div>
         <div>
             <asp:Label ID="Message" runat="server" Text=""></asp:Label>
         </div>
       

     </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PackageName">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("PackageName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TouristPlaces">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("TouristPlaces") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NoOfDays">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("NoOfDays") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NoOfNight">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("NoOfNights") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TourDate">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("TourDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NoOfPerson">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("NoOfPerson") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="HotelStay">
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("HotelStay") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FoodType">
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("FoodType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TravelBy">
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("TravelBy") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AdultAmount">
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("AdultAmount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ChildAmount">
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("ChildAmount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ImagePath">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>' height="100" Width="100"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_Edit">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_Delete">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField></asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
