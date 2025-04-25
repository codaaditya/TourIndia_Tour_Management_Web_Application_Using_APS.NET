<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="WebApplication11.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>signupform</title>
    <link rel="stylesheet" type="text/css" href="css/s1.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="registerForm" runat="server"> 
<div>  
    <h2 class="form-title">Registration to TourIndia</h2>

    <asp:Label ID="lblMessage" runat="server" CssClass="form-message" />

    <!-- Full Name -->
    <div class="form-group">
        <label for="txtFullName" class="form-label">Full Name</label>
        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name" Required="true"></asp:TextBox>
    </div>

   <!-- Mobile Number -->
<div class="form-group">
    <label for="txtPhone" class="form-label">Mobile Number</label>
    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter 10-digit mobile number" TextMode="Phone"></asp:TextBox>

   
    <asp:RequiredFieldValidator ID="reqPhone" runat="server" ControlToValidate="txtPhone" 
        ErrorMessage="Mobile number is required!" CssClass="text-danger" Display="Dynamic" ForeColor="Red" />

    <asp:RegularExpressionValidator ID="regPhone" runat="server" ControlToValidate="txtPhone"
        ErrorMessage="Enter a valid 10-digit mobile number!" CssClass="text-danger"
        Display="Dynamic" ForeColor="Red" 
        ValidationExpression="^[6-9]\d{9}$" />
</div>


   <!-- Email -->
<div class="form-group">
    <label for="txtEmail" class="form-label">Email</label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
    
   
    <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" 
        ErrorMessage="Email is required!" CssClass="text-danger" Display="Dynamic" ForeColor="Red" />

  
    <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail"
        ErrorMessage="Invalid email format!" CssClass="text-danger" Display="Dynamic" ForeColor="Red"
        ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$" />
</div>

<!-- Password -->
<div class="form-group">
    <label for="txtPassword" class="form-label">Password</label>
    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Create a password"></asp:TextBox>

 
    <asp:RequiredFieldValidator ID="reqPassword" runat="server" ControlToValidate="txtPassword" 
        ErrorMessage="Password is required!" CssClass="text-danger" Display="Dynamic" ForeColor="Red" />

    
    <asp:RegularExpressionValidator ID="regPassword" runat="server" ControlToValidate="txtPassword"
        ErrorMessage="Password must be at least 6 characters with 1 uppercase & 1 number!" CssClass="text-danger"
        Display="Dynamic" ForeColor="Red" 
        ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{6,}$" />
</div>

<!-- Confirm Password -->
<div class="form-group">
    <label for="txtConPassword" class="form-label">Confirm Password</label>
    <asp:TextBox ID="txtConPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm your password"></asp:TextBox>

    <asp:RequiredFieldValidator ID="reqConPassword" runat="server" ControlToValidate="txtConPassword" 
        ErrorMessage="Confirm password is required!" CssClass="text-danger" Display="Dynamic" ForeColor="Red" />


    <asp:CompareValidator ID="compPassword" runat="server" ControlToValidate="txtConPassword"
        ControlToCompare="txtPassword" ErrorMessage="Passwords do not match!" CssClass="text-danger"
        Display="Dynamic" ForeColor="Red" />
</div>



    <!-- Gender -->
    <div class="form-group">
        <label class="form-label">Gender</label>
        <asp:RadioButtonList ID="rbGender" runat="server" CssClass="form-radio">
            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
        </asp:RadioButtonList>
    </div>

    <!-- State Selection -->
    <div class="form-group">
        <label for="ddlState" class="form-label">Select State</label>
        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-select">
            <asp:ListItem Text="Select State" Value="" />
            <asp:ListItem Text="Uttar Pradesh" Value="UP" />
            <asp:ListItem Text="Maharashtra" Value="MH" />
            <asp:ListItem Text="Delhi" Value="DL" />
            <asp:ListItem Text="Rajasthan" Value="RJ" />
            <asp:ListItem Text="Karnataka" Value="KA" />
            <asp:ListItem Text="West Bengal" Value="WB" />
        </asp:DropDownList>
    </div>
        <!-- City Name -->
    <div class="form-group">
        <label for="txtCity" class="form-label">City</label>
        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter City" Required="true"></asp:TextBox>
    </div>
        <!-- PostalCode -->
    <div class="form-group">
        <label for="txtCode" class="form-label">Postal Code</label>
        <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" placeholder="Enter PostalCode" Required="true"></asp:TextBox>
    </div>

    <!-- TouristPlace (Checkbox) -->
    <div class="form-group">
        <label class="form-label">Tourist Place</label><br />
        <asp:CheckBoxList ID="chkPlace" runat="server" CssClass="form-checkbox">
            <asp:ListItem Text="Pilgrimage" Value="Pilgrimage"></asp:ListItem>
            <asp:ListItem Text="Adventure Tour" Value="Adventure"></asp:ListItem>
            <asp:ListItem Text="Family Trip" Value="Family"></asp:ListItem>
            <asp:ListItem Text="Honeymoon" Value="Honeymoon"></asp:ListItem>
            <asp:ListItem Text="Hill Station" Value="HillStation"></asp:ListItem>
        </asp:CheckBoxList>
    </div>


    <!-- Profile Picture Upload -->
    <div class="form-group">
        <label for="fuProfilePic" class="form-label">Upload Profile Picture</label>
        <asp:FileUpload ID="ProfilePic" runat="server" CssClass="form-control" />
    </div>

    

    <!-- Register Button -->
    <div class="form-group">
        <asp:Button ID="btnRegister" runat="server" CssClass="btn-primary" Text="Register" OnClick="btnRegister_Click"/>
    </div>

    <!-- Link to Login -->
    <div class="form-footer">
        <p>Already have an account? <a href="login.aspx" class="form-link">Login here</a>.</p>
    </div>
    <!--<div>-->
	 <!--</div>-->
        </div>

    <asp:GridView runat="server" AutoGenerateColumns="False" OnRowCommand="Unnamed1_RowCommand" ID="GridView1" OnSelectedIndexChanged="Unnamed1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProfileImage") %>' Height="100" width="100"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_Edit" CausesValidation="False">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_Delete" CausesValidation="False">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        </asp:GridView>

    </form>

</asp:Content>

