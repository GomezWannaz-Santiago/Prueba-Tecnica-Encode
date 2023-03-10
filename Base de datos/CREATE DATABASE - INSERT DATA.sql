USE [master]
GO
/****** Object:  Database [EncodeTestDB]    Script Date: 28/12/2022 9:05:19 ******/
CREATE DATABASE [EncodeTestDB]
ALTER DATABASE [EncodeTestDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EncodeTestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EncodeTestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EncodeTestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EncodeTestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EncodeTestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EncodeTestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EncodeTestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EncodeTestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EncodeTestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EncodeTestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EncodeTestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EncodeTestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EncodeTestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EncodeTestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EncodeTestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EncodeTestDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EncodeTestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EncodeTestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EncodeTestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EncodeTestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EncodeTestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EncodeTestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EncodeTestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EncodeTestDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EncodeTestDB] SET  MULTI_USER 
GO
ALTER DATABASE [EncodeTestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EncodeTestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EncodeTestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EncodeTestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EncodeTestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EncodeTestDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EncodeTestDB] SET QUERY_STORE = OFF
GO


USE [EncodeTestDB]
GO
/****** Object:  Table [dbo].[actividades]    Script Date: 28/12/2022 9:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actividades](
	[Id_Actividad] [int] IDENTITY(1,1) NOT NULL,
	[Create_date] [datetime] NOT NULL,
	[Id_usuario] [int] NOT NULL,
	[Actividad] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 28/12/2022 9:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Apellido] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[Telefono] [bigint] NULL,
	[Pais] [varchar](3) NOT NULL,
	[Contacto] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[actividades] ON 

INSERT [dbo].[actividades] ([Id_Actividad], [Create_date], [Id_usuario], [Actividad]) VALUES (1, CAST(N'2022-12-26T20:21:33.963' AS DateTime), 1, N'Modificación de Usuario')
INSERT [dbo].[actividades] ([Id_Actividad], [Create_date], [Id_usuario], [Actividad]) VALUES (2, CAST(N'2022-12-26T20:22:15.300' AS DateTime), 4, N'Modificación de Usuario')
INSERT [dbo].[actividades] ([Id_Actividad], [Create_date], [Id_usuario], [Actividad]) VALUES (3, CAST(N'2022-12-26T23:33:02.763' AS DateTime), 1003, N'Creación de Usuario')
INSERT [dbo].[actividades] ([Id_Actividad], [Create_date], [Id_usuario], [Actividad]) VALUES (4, CAST(N'2022-12-28T08:20:30.503' AS DateTime), 1004, N'Creación de Usuario')
SET IDENTITY_INSERT [dbo].[actividades] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([Id_Usuario], [Nombre], [Apellido], [Email], [Fecha_Nacimiento], [Telefono], [Pais], [Contacto]) VALUES (1, N'Santiago', N'Gomez Wannaz', N'santiagogomezwannaz@outlook.com', CAST(N'2022-12-22' AS Date), NULL, N'ARG', 1)
INSERT [dbo].[usuarios] ([Id_Usuario], [Nombre], [Apellido], [Email], [Fecha_Nacimiento], [Telefono], [Pais], [Contacto]) VALUES (3, N'Carlos', N'Perez', N'mail@mail.com', CAST(N'2021-08-09' AS Date), 3512075930, N'PER', 1)
INSERT [dbo].[usuarios] ([Id_Usuario], [Nombre], [Apellido], [Email], [Fecha_Nacimiento], [Telefono], [Pais], [Contacto]) VALUES (4, N'Pablo', N'Benitez', N'mail@mail2.com', CAST(N'2000-07-29' AS Date), 3512075859, N'ARG', 1)
INSERT [dbo].[usuarios] ([Id_Usuario], [Nombre], [Apellido], [Email], [Fecha_Nacimiento], [Telefono], [Pais], [Contacto]) VALUES (5, N'Juan', N'Benitez', N'mail@mail2.com', CAST(N'2000-07-29' AS Date), 3512075859, N'ARG', 0)
INSERT [dbo].[usuarios] ([Id_Usuario], [Nombre], [Apellido], [Email], [Fecha_Nacimiento], [Telefono], [Pais], [Contacto]) VALUES (6, N'Esteban', N'Quito', N'mail@mail2.com', CAST(N'2000-07-29' AS Date), NULL, N'ARG', 0)
INSERT [dbo].[usuarios] ([Id_Usuario], [Nombre], [Apellido], [Email], [Fecha_Nacimiento], [Telefono], [Pais], [Contacto]) VALUES (7, N'Juan', N'Perez Gomez', N'juanperezgomez@gmail.com', CAST(N'2022-12-21' AS Date), 30000000, N'ARG', 0)
INSERT [dbo].[usuarios] ([Id_Usuario], [Nombre], [Apellido], [Email], [Fecha_Nacimiento], [Telefono], [Pais], [Contacto]) VALUES (8, N'Candela', N'Martinez', N'candela@martinez.com.ar', CAST(N'2022-12-10' AS Date), 1234567890, N'ARB', 0)
INSERT [dbo].[usuarios] ([Id_Usuario], [Nombre], [Apellido], [Email], [Fecha_Nacimiento], [Telefono], [Pais], [Contacto]) VALUES (9, N'Usuario', N'Invitado', N'usu@inviado.com', CAST(N'2000-07-29' AS Date), 9999999999, N'SAD', 0)
INSERT [dbo].[usuarios] ([Id_Usuario], [Nombre], [Apellido], [Email], [Fecha_Nacimiento], [Telefono], [Pais], [Contacto]) VALUES (1003, N'Candela', N'Mercado', N'candecomercado@gmail.com', CAST(N'2002-02-19' AS Date), 3513963800, N'Arg', 0)
INSERT [dbo].[usuarios] ([Id_Usuario], [Nombre], [Apellido], [Email], [Fecha_Nacimiento], [Telefono], [Pais], [Contacto]) VALUES (1004, N'Pedro', N'Pérez', N'PedroPerez@gmail.com', CAST(N'2000-07-29' AS Date), 3512075859, N'PER', 0)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
ALTER TABLE [dbo].[actividades] ADD  DEFAULT (getdate()) FOR [Create_date]
GO
ALTER TABLE [dbo].[actividades]  WITH CHECK ADD FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[usuarios] ([Id_Usuario])
GO
