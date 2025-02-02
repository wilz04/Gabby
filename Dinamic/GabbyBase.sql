if exists (select * from sysobjects where id = object_id(N'[dbo].[Messages]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Messages]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Ussers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Ussers]
GO

CREATE TABLE [dbo].[Messages] (
	[number] [int] IDENTITY (1, 1) NOT NULL ,
	[originator] [nvarchar] (50) NULL ,
	[receiver] [nvarchar] (50) NULL ,
	[matter] [nvarchar] (50) NULL ,
	[message] [nvarchar] (50) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Ussers] (
	[number] [int] IDENTITY (1, 1) NOT NULL ,
	[alias] [nvarchar] (50) NULL ,
	[password] [nvarchar] (50) NULL ,
	[name] [nvarchar] (50) NULL ,
	[firstName] [nvarchar] (50) NULL ,
	[lastName] [nvarchar] (50) NULL ,
	[id] [nvarchar] (50) NULL ,
	[male] [bit] NOT NULL ,
	[adress] [nvarchar] (50) NULL 
) ON [PRIMARY]
GO

