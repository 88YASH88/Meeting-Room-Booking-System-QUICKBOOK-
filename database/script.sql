USE [master]
GO
/****** Object:  Database [MeetingRoomBookingSystem]    Script Date: 02-03-2025 15:23:39 ******/
CREATE DATABASE [MeetingRoomBookingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MeetingRoomBookingSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MeetingRoomBookingSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MeetingRoomBookingSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MeetingRoomBookingSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MeetingRoomBookingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MeetingRoomBookingSystem]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 02-03-2025 15:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[BookingDate] [datetime] NOT NULL,
	[CheckInDate] [datetime] NOT NULL,
	[CheckOutDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 02-03-2025 15:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
	[RecipientUserID] [int] NOT NULL,
	[SentAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 02-03-2025 15:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentStatus] [nvarchar](50) NOT NULL,
	[RefundStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Query]    Script Date: 02-03-2025 15:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Query](
	[QueryID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
	[SubmissionDate] [datetime] NULL,
	[ResponseStatus] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[ContactNo] [int] NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QueryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 02-03-2025 15:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](100) NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Availability] [bit] NOT NULL,
	[Capacity] [int] NOT NULL,
	[AC_Type] [nvarchar](50) NOT NULL,
	[Equipments] [varchar](500) NOT NULL,
	[ImagePath] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02-03-2025 15:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[PhoneNo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Rooms_AC_Type]    Script Date: 02-03-2025 15:23:40 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_AC_Type] ON [dbo].[Rooms]
(
	[AC_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_Availability]    Script Date: 02-03-2025 15:23:40 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_Availability] ON [dbo].[Rooms]
(
	[Availability] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_Capacity]    Script Date: 02-03-2025 15:23:40 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_Capacity] ON [dbo].[Rooms]
(
	[Capacity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Rooms_Location]    Script Date: 02-03-2025 15:23:40 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_Location] ON [dbo].[Rooms]
(
	[Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_Price]    Script Date: 02-03-2025 15:23:40 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_Price] ON [dbo].[Rooms]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Rooms_RoomName]    Script Date: 02-03-2025 15:23:40 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_RoomName] ON [dbo].[Rooms]
(
	[RoomName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT (getdate()) FOR [SentAt]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT ('Not Requested') FOR [RefundStatus]
GO
ALTER TABLE [dbo].[Query] ADD  DEFAULT (getdate()) FOR [SubmissionDate]
GO
ALTER TABLE [dbo].[Query] ADD  DEFAULT ((0)) FOR [ContactNo]
GO
ALTER TABLE [dbo].[Query] ADD  DEFAULT ('No Subject') FOR [Subject]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((1)) FOR [Availability]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [PhoneNo]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([RecipientUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[Query]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[UpdateExpiredBookings]    Script Date: 02-03-2025 15:23:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateExpiredBookings]
AS
BEGIN
    SET NOCOUNT ON;

    -- 1️⃣ Make rooms available again if booking expired
    UPDATE Rooms
    SET Availability = 1
    WHERE RoomID IN (
        SELECT RoomID FROM Booking WHERE CheckOutDate < GETDATE() AND Status != 'Completed'
    );

    -- 2️⃣ Mark booking as "Completed" if checkout date has passed
    UPDATE Booking
    SET Status = 'Completed'
    WHERE CheckOutDate < GETDATE() AND Status != 'Completed';
END;
GO
USE [master]
GO
ALTER DATABASE [MeetingRoomBookingSystem] SET  READ_WRITE 
GO
