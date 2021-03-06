USE [master]
GO
/****** Object:  Database [merckslide]    Script Date: 13-12-2017 14:15:51 ******/
CREATE DATABASE [merckslide]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'merckslide', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\merckslide.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'merckslide_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\merckslide_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [merckslide] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [merckslide].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [merckslide] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [merckslide] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [merckslide] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [merckslide] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [merckslide] SET ARITHABORT OFF 
GO
ALTER DATABASE [merckslide] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [merckslide] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [merckslide] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [merckslide] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [merckslide] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [merckslide] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [merckslide] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [merckslide] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [merckslide] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [merckslide] SET  ENABLE_BROKER 
GO
ALTER DATABASE [merckslide] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [merckslide] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [merckslide] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [merckslide] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [merckslide] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [merckslide] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [merckslide] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [merckslide] SET RECOVERY FULL 
GO
ALTER DATABASE [merckslide] SET  MULTI_USER 
GO
ALTER DATABASE [merckslide] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [merckslide] SET DB_CHAINING OFF 
GO
ALTER DATABASE [merckslide] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [merckslide] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [merckslide] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'merckslide', N'ON'
GO
USE [merckslide]
GO
/****** Object:  Table [dbo].[category]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[categoryid] [bigint] IDENTITY(10,1) NOT NULL,
	[categoryname] [varchar](150) NOT NULL,
	[datecreated] [datetime] NOT NULL CONSTRAINT [DF_category_datecreated]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[folder]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[folder](
	[folderid] [bigint] IDENTITY(100,1) NOT NULL,
	[foldername] [varchar](250) NOT NULL,
	[datecreated] [datetime] NOT NULL CONSTRAINT [DF_folder_datecreated]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[metatag]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[metatag](
	[tagid] [bigint] IDENTITY(10,1) NOT NULL,
	[tagname] [varchar](150) NOT NULL,
	[createddate] [datetime] NOT NULL CONSTRAINT [DF_metatag_createddate]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[presentation]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[presentation](
	[presentationid] [bigint] IDENTITY(100,1) NOT NULL,
	[presentationname] [varchar](500) NOT NULL,
	[categoryid] [bigint] NOT NULL,
	[folderid] [bigint] NOT NULL,
	[description] [varchar](max) NULL,
	[metatag] [varchar](max) NOT NULL,
	[createddate] [datetime] NOT NULL CONSTRAINT [DF_presentation_createddate]  DEFAULT (getdate()),
	[createdby] [bigint] NOT NULL CONSTRAINT [DF_presentation_createdby]  DEFAULT ((0)),
	[status] [int] NOT NULL CONSTRAINT [DF_presentation_status]  DEFAULT ((0)),
	[percentagecompleted] [int] NOT NULL CONSTRAINT [DF_presentation_percentagecompleted]  DEFAULT ((0)),
	[type] [varchar](50) NOT NULL CONSTRAINT [DF_presentation_type]  DEFAULT ('.ppt')
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[slides]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[slides](
	[slideid] [bigint] IDENTITY(1000,1) NOT NULL,
	[presentationid] [bigint] NOT NULL,
	[slidename] [varchar](500) NOT NULL,
	[createddate] [datetime] NOT NULL CONSTRAINT [DF_slide_createddate]  DEFAULT (getdate()),
	[slideindex] [int] NOT NULL CONSTRAINT [DF_slides_slideindex]  DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userpresentation]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userpresentation](
	[presentationid] [bigint] IDENTITY(1,1) NOT NULL,
	[userid] [bigint] NOT NULL,
	[createddate] [datetime] NOT NULL CONSTRAINT [DF_userpresentation_createddate]  DEFAULT (getdate()),
	[downloaded] [int] NOT NULL CONSTRAINT [DF_userpresentation_downloaded]  DEFAULT ((0)),
	[status] [int] NOT NULL CONSTRAINT [DF_userpresentation_status]  DEFAULT ((0)),
	[expirydate] [datetime] NOT NULL CONSTRAINT [DF_userpresentation_expirydate]  DEFAULT (getdate()+(60))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userslides]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userslides](
	[slideid] [bigint] NOT NULL,
	[presentationid] [bigint] NOT NULL,
	[ordernumber] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[addUserSlide]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addUserSlide]
	-- Add the parameters for the stored procedure here
	@userid bigint,
	@slideid bigint,
	@ordernumber int

AS
BEGIN
	Declare @presentationid bigint
	SET @presentationid = 0
	Select @presentationid = presentationid from userpresentation where userid = @userid AND status = 0

	if(@presentationid = 0)
		BEGIN
			Insert into userpresentation(userid) VALUES(@userid)
			SET @presentationid = @@IDENTITY
		END

	Declare @slide bigint
	SET @slide = 0
	Select @slide = COUNT(*) From userslides where presentationid = @presentationid AND slideid = @slideid

	IF(@slide = 0)
		BEGIN
		Insert into userslides(presentationid,slideid,ordernumber) VALUES(@presentationid,@slideid,@ordernumber)
		END
	else
		BEGIN
		update userslides set ordernumber = @ordernumber where @presentationid = presentationid AND slideid = @slideid
		END
END

GO
/****** Object:  StoredProcedure [dbo].[createCategory]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createCategory]
	-- Add the parameters for the stored procedure here
	@categoryname nvarchar(500)
AS
BEGIN
	declare @count int
	set @count = 0

	Select @count = categoryid from category where categoryname like @categoryname

	if(@count = 0)
	BEGIN
		Insert into category(categoryname) values(@categoryname)
	END
END

GO
/****** Object:  StoredProcedure [dbo].[createFolder]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createFolder]
	-- Add the parameters for the stored procedure here
	@foldername nvarchar(500)
AS
BEGIN
	declare @count int
	set @count = 0

	Select @count = folderid from folder where foldername like @foldername

	if(@count = 0)
	BEGIN
		Insert into folder(foldername) values(@foldername)
	END
END

GO
/****** Object:  StoredProcedure [dbo].[createPresentation]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createPresentation]
	-- Add the parameters for the stored procedure here
	@presentationname nvarchar(500),
	@categoryid bigint,
	@folderid bigint,
	@description varchar(MAX),
	@metatag varchar(MAX),
	@type varchar(50)

AS
BEGIN
	Insert into presentation(presentationname, categoryid, folderid, [description], metatag, [type]) values(@presentationname, @categoryid, @folderid, @description, @metatag, @type)
	SELECT presentationid from presentation where presentationid = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[createSlide]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createSlide]
	-- Add the parameters for the stored procedure here
	@slidename nvarchar(500),
	@presentationid bigint,
	@slideindex int
AS
BEGIN
	Insert into slides(slidename, presentationid, slideindex) values(@slidename,@presentationid, @slideindex)
	SELECT slideid from slides where slideid = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[deleteUserSlide]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteUserSlide]
	-- Add the parameters for the stored procedure here
	@userid bigint,
	@slideid bigint

AS
BEGIN
	Declare @presentationid bigint
	SET @presentationid = 0
	Select @presentationid = presentationid from userpresentation where userid = @userid AND status = 0
	
	update userslides set ordernumber = ordernumber - 1 from userslides where ordernumber > (select ordernumber from userslides where presentationid = @presentationid AND slideid = @slideid) AND presentationid = @presentationid
	delete from userslides where slideid = @slideid and presentationid = @presentationid

END

GO
/****** Object:  StoredProcedure [dbo].[getActiveSlides]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getActiveSlides]
	-- Add the parameters for the stored procedure here
	@userid bigint
AS
BEGIN
	Select slides.slideid, slides.slidename, slides.slideindex, slides.presentationid, presentation.type,userslides.ordernumber, userslides.presentationid as userpresentaitionid  from userslides 
	inner join slides on slides.slideid = userslides.slideid
	inner join presentation on slides.presentationid = presentation.presentationid
	where userslides.presentationid in (select presentationid from userpresentation where userid = @userid AND status = 0) order by ordernumber
 END

GO
/****** Object:  StoredProcedure [dbo].[getAllSlides]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllSlides]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	Select slideid, slidename, category.categoryname, slides.createddate from slides 
	inner join presentation on presentation.presentationid = slides.presentationid
	inner join category on category.categoryid = presentation.categoryid
	where presentation.status = 1 order by slides.createddate desc
END

GO
/****** Object:  StoredProcedure [dbo].[getCategory]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getCategory]
AS
BEGIN
	Select categoryid, categoryname from category
END

GO
/****** Object:  StoredProcedure [dbo].[getFolders]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getFolders]
AS
BEGIN
	Select  folderid, foldername from folder
END

GO
/****** Object:  StoredProcedure [dbo].[updatePresentation]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updatePresentation]
	-- Add the parameters for the stored procedure here
	@status int,
	@presentationid bigint,
	@percentage int


AS
BEGIN
	IF @status != 0
	   BEGIN
			Update presentation Set status = @status Where presentationid = @presentationid
	   END
	ELSE IF @percentage != 0
		BEGIN
			Update presentation Set percentagecompleted = @percentage Where presentationid = @presentationid
		END
	ELSE IF @status != 0 AND  @percentage != 0
		BEGIN
			Update presentation Set percentagecompleted = @percentage,status = @status  Where presentationid = @presentationid
		END
END

GO
/****** Object:  StoredProcedure [dbo].[updateUserPresentation]    Script Date: 13-12-2017 14:15:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateUserPresentation]
	-- Add the parameters for the stored procedure here
	@status int,
	@presentationid bigint

AS
BEGIN
	Update userpresentation Set status = @status Where presentationid = @presentationid
END

GO
USE [master]
GO
ALTER DATABASE [merckslide] SET  READ_WRITE 
GO
