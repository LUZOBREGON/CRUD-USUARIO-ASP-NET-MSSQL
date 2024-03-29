USE [master]
GO
/****** Object:  Database [SISDEWEB_PRU]    Script Date: 22/1/2024 17:22:37 ******/
CREATE DATABASE [SISDEWEB_PRU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SISDEWEB_PRU', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SISDEWEB_PRU.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SISDEWEB_PRU_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SISDEWEB_PRU_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SISDEWEB_PRU] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SISDEWEB_PRU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SISDEWEB_PRU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET ARITHABORT OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SISDEWEB_PRU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SISDEWEB_PRU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SISDEWEB_PRU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SISDEWEB_PRU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET RECOVERY FULL 
GO
ALTER DATABASE [SISDEWEB_PRU] SET  MULTI_USER 
GO
ALTER DATABASE [SISDEWEB_PRU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SISDEWEB_PRU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SISDEWEB_PRU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SISDEWEB_PRU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SISDEWEB_PRU] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SISDEWEB_PRU] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SISDEWEB_PRU', N'ON'
GO
ALTER DATABASE [SISDEWEB_PRU] SET QUERY_STORE = ON
GO
ALTER DATABASE [SISDEWEB_PRU] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SISDEWEB_PRU]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[IdDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](50) NOT NULL,
	[IdDepartamento] [int] NOT NULL,
	[Sueldo] [int] NOT NULL,
	[FechaContrato] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ID] [int] IDENTITY(1000,2) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[proveedor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contrasenia] [varchar](50) NOT NULL,
	[rol] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departamento] ON 

INSERT [dbo].[Departamento] ([IdDepartamento], [Nombre]) VALUES (1, N'Administración')
INSERT [dbo].[Departamento] ([IdDepartamento], [Nombre]) VALUES (2, N'Marketing')
INSERT [dbo].[Departamento] ([IdDepartamento], [Nombre]) VALUES (3, N'Ventas')
INSERT [dbo].[Departamento] ([IdDepartamento], [Nombre]) VALUES (4, N'Comercio')
SET IDENTITY_INSERT [dbo].[Departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([IdEmpleado], [NombreCompleto], [IdDepartamento], [Sueldo], [FechaContrato]) VALUES (1, N'Franco Hernandez', 1, 1400, CAST(N'2024-01-18' AS Date))
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1084, N'Beef Wellington', 49, 7367, N'Brainlounge')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1086, N'Pastry - Plain Baked Croissant', 12, 5422, N'Fatz')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1088, N'Chef Hat 25cm', 38, 9628, N'Kanoodle')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1090, N'Marjoram - Dried, Rubbed', 43, 243, N'Camimbo')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1092, N'Pepper - Green, Chili', 62, 5581, N'Zoovu')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1094, N'Shrimp - Baby, Warm Water', 68, 5961, N'Voonder')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1096, N'Chocolate - Compound Coating', 91, 6660, N'Yambee')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1098, N'Shiratamako - Rice Flour', 63, 7362, N'Midel')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1100, N'Water - Mineral, Carbonated', 78, 2322, N'Dablist')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1102, N'Bacardi Mojito', 74, 8958, N'Zazio')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1104, N'Coke - Classic, 355 Ml', 80, 4472, N'Meembee')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1106, N'Pork - Smoked Kassler', 98, 4034, N'Topicblab')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1108, N'Wasabi Paste', 80, 7630, N'Skyvu')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1110, N'Bok Choy - Baby', 92, 6204, N'Photojam')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1112, N'Tuna - Loin', 39, 3033, N'Jabberbean')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1114, N'Pesto - Primerba, Paste', 56, 6342, N'Feedmix')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1116, N'Coffee - Hazelnut Cream', 14, 8557, N'Kamba')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1118, N'Sauce - Ranch Dressing', 62, 8151, N'Janyx')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1120, N'Soup - Beef, Base Mix', 17, 5081, N'Jamia')
INSERT [dbo].[Productos] ([ID], [nombre], [cantidad], [precio], [proveedor]) VALUES (1122, N'Coffee - Colombian, Portioned', 98, 7056, N'Zooxo')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1055, N'Jesse y joy', N'jburgoine1@devhub.com', N'lector', N'lector', 0)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1056, N'Davin', N'mdaud2@craigslist.org', N'editor', N'editor', 2)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1057, N'Hortense', N'hgerwood3@a8.net', N'hlaherty3', N'1795', 1)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1058, N'NeliaAAA', N'nsandercock4@dropbox.com', N'NOL', N'1008', 2)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1059, N'Deny', N'dwadge5@wufoo.com', N'dosborn5', N'1701', 3)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1060, N'Xenia', N'xrossetti6@ustream.tv', N'xwestover6', N'1732', 1)
INSERT [dbo].[Usuarios] ([ID], [nombre], [correo], [usuario], [contrasenia], [rol]) VALUES (1066, N'luz', N'lobre@enfpp.edu.pe', N'abc', N'123', 3)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([IdDepartamento])
GO
/****** Object:  StoredProcedure [dbo].[actualizarProducto]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarProducto] 
	@id int,
	@nombre varchar(50),
	@cantidad int,
	@precio float,
	@proveedor varchar(50)
AS
	BEGIN
		UPDATE Productos 
		SET nombre = @nombre,
		cantidad = @cantidad,
		precio = @precio,
		proveedor = @proveedor
		WHERE ID = @id
	END
GO
/****** Object:  StoredProcedure [dbo].[actualizarUsuario]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizarUsuario]
	@nombre varchar(50),
	@correo varchar(50),
	@usuario varchar(50),
	@rol int,
	@id int
as
	begin
		update Usuarios 
		set nombre = @nombre,
		correo = @correo,
		usuario = @usuario,
		rol = @rol
		where id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[AgregarProducto]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarProducto] 
	@nombre varchar(50),
	@cantidad int,
	@precio float,
	@proveedor varchar(50)
AS
	BEGIN
		INSERT INTO Productos(nombre, cantidad, precio, proveedor)
		VALUES (@nombre, @cantidad, @precio, @proveedor)
	END
GO
/****** Object:  StoredProcedure [dbo].[agregarUsuario]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agregarUsuario] 
	@nombre varchar(50), 
	@correo varchar(50),
	@usuario varchar(50),
	@contrasenia varchar(50),
	@rol int
AS 
BEGIN
	INSERT INTO Usuarios(nombre, correo, usuario, contrasenia, rol)
	VALUES (@nombre, @correo, @usuario, @contrasenia, @rol)
END
GO
/****** Object:  StoredProcedure [dbo].[agregarUsuario2]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[agregarUsuario2] 
	@nombre varchar(50), 
	@correo varchar(50),
	@usuario varchar(50),
	@contrasenia varchar(50),
	@rol int
AS 
BEGIN
	INSERT INTO Usuarios(nombre, correo, usuario, contrasenia, rol)
	VALUES (@nombre, @correo, @usuario, @contrasenia, @rol)
END
GO
/****** Object:  StoredProcedure [dbo].[cambiaContrasenia]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cambiaContrasenia]
	@usuario varchar(50),
	@correo varchar(50),
	@contrasenia varchar(50)
AS
	BEGIN
		UPDATE Usuarios SET contrasenia = @contrasenia
		WHERE usuario = @usuario AND  correo = @correo
	END
GO
/****** Object:  StoredProcedure [dbo].[cargaDatos]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[cargaDatos]
as
begin
	select ID, nombre, correo, usuario, rol from Usuarios
end
GO
/****** Object:  StoredProcedure [dbo].[eliminarProducto]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminarProducto] @id int
AS
	BEGIN
		DELETE Productos WHERE id = @id
	END
GO
/****** Object:  StoredProcedure [dbo].[eliminarUsuario]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarUsuario] 
	@id int
as
begin
	delete Usuarios where ID = @id
end
GO
/****** Object:  StoredProcedure [dbo].[loginUsuario]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[loginUsuario]
	@usuario varchar(50),
	@contrasenia varchar(50),
	@rol int out
as
	begin
		set @rol = 0

		if exists (select * from Usuarios where usuario = @usuario and contrasenia = @contrasenia)

		set @rol = (select rol from Usuarios where usuario = @usuario and contrasenia = @contrasenia)
	end
GO
/****** Object:  StoredProcedure [dbo].[productoCantidad]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[productoCantidad]
	@cantidad int
as
begin
	select *  from Productos where cantidad = @cantidad
end
GO
/****** Object:  StoredProcedure [dbo].[productoID]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[productoID] 
	@id int
as
begin
	select *  from Productos where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[productoNombre]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[productoNombre] 
	@nombre varchar(50)
as
begin
	select *  from Productos where nombre = @nombre
end
GO
/****** Object:  StoredProcedure [dbo].[productoPrecio]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[productoPrecio]
	@precio float
as
begin
	select *  from Productos where precio = @precio
end
GO
/****** Object:  StoredProcedure [dbo].[productoProveedor]    Script Date: 22/1/2024 17:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[productoProveedor]
	@proveedor varchar(50)
as
begin
	select *  from Productos where proveedor = @proveedor
end
GO
USE [master]
GO
ALTER DATABASE [SISDEWEB_PRU] SET  READ_WRITE 
GO
