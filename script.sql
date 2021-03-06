USE [QL_CuaHangDT]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[total] [float] NOT NULL,
	[date] [datetime] NOT NULL CONSTRAINT [DF_Bill_date]  DEFAULT (getdate()),
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bill_id] [int] NOT NULL,
	[phone_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_Bill_Details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[phone_number] [nvarchar](11) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[identity_number] [float] NULL CONSTRAINT [DF_Customer_identity_number]  DEFAULT ((0)),
	[birthday] [date] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[action] [nvarchar](100) NOT NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_Log_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[details] [nvarchar](200) NULL,
 CONSTRAINT [PK_Function] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[menu_id] [int] NOT NULL,
 CONSTRAINT [PK_Auth] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phone]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[amount] [int] NOT NULL,
	[price] [float] NOT NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_Phones_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[username] [nvarchar](200) NOT NULL,
	[password] [nvarchar](200) NOT NULL,
	[phone_number] [nvarchar](11) NOT NULL,
	[identity_number] [float] NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[birthday] [date] NOT NULL,
	[position] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_User_1] UNIQUE NONCLUSTERED 
(
	[identity_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bills_Customers]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bills_Users]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Details_Bills] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_Bill_Details_Bills]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Details_Phones] FOREIGN KEY([phone_id])
REFERENCES [dbo].[Phone] ([id])
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_Bill_Details_Phones]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_User]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Auth_Function] FOREIGN KEY([menu_id])
REFERENCES [dbo].[Menu] ([id])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Auth_Function]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Auth_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Auth_User]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phones_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phones_Categories]
GO
/****** Object:  StoredProcedure [dbo].[Bill_Function]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Bill_Function]
	@action int,
	@id int output,
	@user_id int,
	@customer_id int,
	@total float
AS

IF @action=0
	BEGIN
		INSERT INTO Bill(user_id,customer_id,total)
		VALUES(@user_id,@customer_id,@total)
		SET @id=@@IDENTITY
	END
ELSE IF @action=1
	BEGIN
		UPDATE Bill
		SET  user_id=@user_id,customer_id=@customer_id,total=@total
		WHERE id=@id
	END
ELSE IF @action=2
	BEGIN
		DELETE Bill WHERE id=@id
	END

GO
/****** Object:  StoredProcedure [dbo].[Bill_Id]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Bill_Id]
	@id int
AS
	SELECT * FROM Bill WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[BillDetails_Function]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BillDetails_Function]
	@action int,
	@id int output,
	@bill_id int,
	@phone_id int,
	@amount int,
	@price float
	
AS
IF @action=0
	BEGIN
		INSERT INTO BillDetails(bill_id,phone_id,amount,price)
		VALUES(@bill_id,@phone_id,@amount,@price)
		SET @id= @@IDENTITY
	END
ELSE IF @action=1
	BEGIN
		UPDATE BillDetails
		SET bill_id=@bill_id,phone_id=@phone_id,amount=@amount,price=@price
		WHERE id=@id
	END
ELSE IF @action=2
	BEGIN
		DELETE BillDetails WHERE id=@id
	END

GO
/****** Object:  StoredProcedure [dbo].[BillDetails_Id]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BillDetails_Id]
	@id int
AS
	SELECT * FROM BillDetails WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[Category_Function]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Function]
	@action int,
	@id int output,
	@name nvarchar(200)
AS
IF @action=0
	BEGIN
		INSERT INTO Category(name)
		VALUES(@name)
		SET @id=@@IDENTITY
	END
ELSE IF @action=1
	BEGIN
		UPDATE Category
		SET name=@name
		WHERE id=@id
	END
ELSE IF @action=2
	BEGIN
		DELETE Category WHERE id=@id
	END

GO
/****** Object:  StoredProcedure [dbo].[Category_Id]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Id]
	@id int
AS
	SELECT * FROM Category WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[Customer_Function]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Customer_Function]
	@action int,
	@id int output,
	@name nvarchar(200),
	@phone_number nvarchar(11),
	@address nvarchar(200),
	@identity_number int,
	@birthday date
AS
IF @action=0
	BEGIN
		INSERT INTO Customer(name,phone_number,address,identity_number,birthday)
		VALUES(@name,@phone_number,@address,@identity_number,@birthday)
		SET @id=@@IDENTITY
	END
IF @action=1
	BEGIN
		UPDATE Customer
		SET name=@name,phone_number=@phone_number,address=@address,identity_number=@identity_number,birthday=@birthday
		WHERE id=@id
	END
IF @action=2
	BEGIN
		DELETE Customer WHERE id=@id
	END


GO
/****** Object:  StoredProcedure [dbo].[Customer_Id]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Customer_Id]
	@id int
AS
	SELECT * FROM Customer WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[GetAll]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAll]
	@TableName nvarchar(200)
AS
	DECLARE @GetFrom nvarchar(500)
	SET @GetFrom = 'SELECT *FROM ['+@TableName+']'
	EXEC (@GetFrom)

GO
/****** Object:  StoredProcedure [dbo].[Log_Function]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Log_Function]
	@action int,
	@id int output,
	@user_id int,
	@action_ nvarchar(100)
AS
IF @action=0
	BEGIN
		INSERT INTO [Log](user_id, action)
		VALUES(@user_id, @action_)
		SET @id=@@IDENTITY
	END
ELSE IF @action=1
	BEGIN
		UPDATE [Log]
		SET user_id=@user_id, action=@action_
		WHERE id=@id
	END
ELSE IF @action=2
	BEGIN
		DELETE [Log] WHERE id=@id
	END
GO
/****** Object:  StoredProcedure [dbo].[Log_Id]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Log_Id]
	@id int
AS
	SELECT * FROM [Log] WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[Menu_Function]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Menu_Function]
	@action int,
	@id int output,
	@name nvarchar(200),
	@details nvarchar(200) NULL
AS
IF @action=0
	BEGIN
		INSERT INTO Menu(name, details)
		VALUES(@name, @details)
		SET @id=@@IDENTITY
	END
ELSE IF @action=1
	BEGIN
		UPDATE Menu
		SET name=@name, details=@details
		WHERE id=@id
	END
ELSE IF @action=2
	BEGIN
		DELETE Menu WHERE id=@id
	END
GO
/****** Object:  StoredProcedure [dbo].[Menu_Id]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Menu_Id]
	@id int
AS
	SELECT * FROM Menu WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[Permission_Function]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Permission_Function]
	@action int,
	@id int out,
	@user_id int,
	@menu_id int
AS
IF @action=0
	BEGIN
		INSERT INTO Permission(user_id, menu_id)
		VALUES(@user_id, @menu_id)
		SET @id=@@IDENTITY
	END
ELSE IF @action=1
	BEGIN
		UPDATE Permission
		SET user_id=@user_id, menu_id=@menu_id
		WHERE id=@id
	END
ELSE IF @action=2
	BEGIN
		DELETE Permission WHERE id=@id
	END
GO
/****** Object:  StoredProcedure [dbo].[Permission_Id]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Permission_Id]
	@id int
AS
	SELECT * FROM Permission WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[Phone_Function]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Phone_Function]
	@action int,
	@id int output,
	@category_id int,
	@name nvarchar(200),
	@amount int,
	@price float
AS
IF @action=0
	BEGIN
		INSERT INTO Phone(category_id,name,amount,price)
		VALUES(@category_id,@name,@amount,@price)
		SET @id=@@IDENTITY
	END
ELSE IF @action=1
	BEGIN
		UPDATE Phone
		SET category_id=@category_id,name=@name,amount=@amount,price=@price
		WHERE id=@id
	END
ELSE IF @action=2
	BEGIN
		DELETE Phone where id=@id
	END

GO
/****** Object:  StoredProcedure [dbo].[Phone_Id]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Phone_Id]
	@id int
AS
	SELECT * FROM Phone WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[User_Function]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Function]
	@action int,
	@id int output,
	@name nvarchar(200),
	@username nvarchar(200),
	@password nvarchar(200),
	@phone_number nvarchar(11),
	@identity_number int,
	@address nvarchar(200),
	@birthday date,
	@position nvarchar(200)

AS
IF @action=0
	BEGIN
		INSERT INTO [User](name,username,password,phone_number,identity_number,address,birthday,position)
		VALUES(@name,@username,@password,@phone_number,@identity_number,@address ,@birthday,@position)
		SET @id=@@IDENTITY
	END
IF @action=1
	BEGIN
		UPDATE [User]
		SET name=@name,username=@username,password=@password,phone_number=@phone_number,identity_number=@identity_number,address=@address,birthday=@birthday,position=@position
		WHERE id=@id
	END
IF @action=2
	BEGIN	
		DELETE [User] WHERE id=@id
	END


GO
/****** Object:  StoredProcedure [dbo].[User_Id]    Script Date: 4/28/2016 9:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Id]
	@id int
AS
	SELECT * FROM [User] WHERE id=@id

GO
