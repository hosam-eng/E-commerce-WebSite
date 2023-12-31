USE [DBSTore]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/9/2023 2:37:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[categoryId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 6/9/2023 2:37:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/9/2023 2:37:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[UnitInStock] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description], [categoryId]) VALUES (1, N'Women', N'All Women Clothes', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [categoryId]) VALUES (2, N'Men', N'All Men Clothes', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [categoryId]) VALUES (3, N'Bag', N'All Bags', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [categoryId]) VALUES (4, N'Watches', N'All Classic and Casual Watches', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [categoryId]) VALUES (5, N'T-Shirt', N'men Clothes casual', 2)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [categoryId]) VALUES (6, N'Trouser', N'Men Clothes outfit', 2)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [categoryId]) VALUES (7, N'Dresses', N'Woment Casual', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (1, N'product-01.jpg', 1)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (2, N'product-13.jpg', 1)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (5, N'product-02.jpg', 3)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (6, N'item-cart-01.jpg', 3)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (7, N'product-03.jpg', 5)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (8, N'product-11.jpg', 5)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (9, N'product-04.jpg', 6)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (10, N'product-05.jpg', 7)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (13, N'product-06.jpg', 8)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (14, N'product-15.jpg', 8)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (15, N'product-16.jpg', 9)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (16, N'slide-04.jpg', 9)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (17, N'product-08.jpg', 10)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (18, N'item-cart-01.jpg', 10)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (19, N'product-min-03.jpg', 11)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (20, N'item-cart-05.jpg', 11)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (21, N'product-detail-03.jpg', 12)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (22, N'product-detail-02.jpg', 12)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (24, N'thumb-02.jpg', 13)
INSERT [dbo].[Images] ([Id], [Name], [ProductID]) VALUES (25, N'slide-06.jpg', 13)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (1, N'Esprit Ruffle Shirt ', CAST(200.00 AS Decimal(18, 2)), 20, 1, N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (3, N'Herschel supply', CAST(250.00 AS Decimal(18, 2)), 20, 1, N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (5, N'Only Check Trouser', CAST(300.00 AS Decimal(18, 2)), 10, 1, N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (6, N'Classic Trench Coat', CAST(800.00 AS Decimal(18, 2)), 5, 1, N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (7, N'Front Pocket Jumper', CAST(200.00 AS Decimal(18, 2)), 10, 1, N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (8, N'Vintage Inspired Classic', CAST(250.00 AS Decimal(18, 2)), 30, 1, N'classic watches', 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (9, N'Shirt in Stretch Cotton', CAST(200.00 AS Decimal(18, 2)), 20, 1, N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (10, N'Pieces Metallic Printed', CAST(250.00 AS Decimal(18, 2)), 10, 1, N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 1)
INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (11, N'Herschel supply', CAST(800.00 AS Decimal(18, 2)), 20, 1, N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (12, N'Polo T-shirt', CAST(250.00 AS Decimal(18, 2)), 20, 1, N'Men Clothes up', 5)
INSERT [dbo].[Products] ([Id], [Name], [Price], [UnitInStock], [Status], [Description], [CategoryId]) VALUES (13, N'Round  T-shirt', CAST(300.00 AS Decimal(18, 2)), 10, 1, N'Rounded Neck T-shirt', 5)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories_categoryId] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories_categoryId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products_ProductID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
