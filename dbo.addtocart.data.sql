SET IDENTITY_INSERT [dbo].[addtocart] ON
INSERT INTO [dbo].[addtocart] ([Cart_Id], [User_Id], [Package_Id], [Package_info], [NoOfPerson], [TotalPrice]) VALUES (1, N'1', N'2', N'Kaichidham', N'2', N'8000.00')
INSERT INTO [dbo].[addtocart] ([Cart_Id], [User_Id], [Package_Id], [Package_info], [NoOfPerson], [TotalPrice]) VALUES (2, N'1', N'1', N'Kedarnath', N'2', N'5000.00')
INSERT INTO [dbo].[addtocart] ([Cart_Id], [User_Id], [Package_Id], [Package_info], [NoOfPerson], [TotalPrice]) VALUES (3, N'1', N'5', N'Vaishno Devi', N'2', N'4000.00')
INSERT INTO [dbo].[addtocart] ([Cart_Id], [User_Id], [Package_Id], [Package_info], [NoOfPerson], [TotalPrice]) VALUES (4, N'1', N'2', N'Kaichidham', N'2', N'4000.00')
SET IDENTITY_INSERT [dbo].[addtocart] OFF
