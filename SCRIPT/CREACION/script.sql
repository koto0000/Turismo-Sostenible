USE [master]
GO
/****** Object:  Database [TurismoBD]    Script Date: 25/06/2025 08:40:22 ******/
CREATE DATABASE [TurismoBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TurismoBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TurismoBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TurismoBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TurismoBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TurismoBD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TurismoBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TurismoBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TurismoBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TurismoBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TurismoBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TurismoBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [TurismoBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TurismoBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TurismoBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TurismoBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TurismoBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TurismoBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TurismoBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TurismoBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TurismoBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TurismoBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TurismoBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TurismoBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TurismoBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TurismoBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TurismoBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TurismoBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TurismoBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TurismoBD] SET RECOVERY FULL 
GO
ALTER DATABASE [TurismoBD] SET  MULTI_USER 
GO
ALTER DATABASE [TurismoBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TurismoBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TurismoBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TurismoBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TurismoBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TurismoBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TurismoBD', N'ON'
GO
ALTER DATABASE [TurismoBD] SET QUERY_STORE = ON
GO
ALTER DATABASE [TurismoBD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TurismoBD]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[lugar] [varchar](100) NOT NULL,
	[costo] [decimal](10, 2) NOT NULL,
	[categoria] [varchar](50) NULL,
	[dias] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_reserva] [int] NOT NULL,
	[tipo] [varchar](20) NULL,
	[monto_total] [decimal](10, 2) NOT NULL,
	[fecha_pago] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plin]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_metodo_pago] [int] NOT NULL,
	[numero_operacion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dni_turista] [varchar](8) NOT NULL,
	[id_destino] [int] NOT NULL,
	[ninos] [int] NULL,
	[adultos] [int] NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_final] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_metodo_pago] [int] NOT NULL,
	[numero_tarjeta] [varchar](20) NOT NULL,
	[mm_aa] [varchar](5) NOT NULL,
	[cvc] [varchar](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turista]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turista](
	[dni] [varchar](8) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidoPaterno] [varchar](50) NOT NULL,
	[apellidoMaterno] [varchar](50) NOT NULL,
	[telefono] [varchar](15) NULL,
	[direccion] [varchar](100) NULL,
	[correo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yape]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yape](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_metodo_pago] [int] NOT NULL,
	[numero_operacion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Destino] ON 

INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (1, N'Machu Picchu', N'Cusco', CAST(1200.00 AS Decimal(10, 2)), N'Aventura', 3)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (2, N'Lago Titicaca', N'Puno', CAST(900.00 AS Decimal(10, 2)), N'Cultural', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (3, N'Líneas de Nazca', N'Ica', CAST(750.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (4, N'Huacachina', N'Ica', CAST(600.00 AS Decimal(10, 2)), N'Aventura', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (5, N'Cañón del Colca', N'Arequipa', CAST(850.00 AS Decimal(10, 2)), N'Naturaleza', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (6, N'Kuelap', N'Amazonas', CAST(800.00 AS Decimal(10, 2)), N'Arqueológico', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (7, N'Reserva de Paracas', N'Ica', CAST(700.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (8, N'Manu', N'Madre de Dios', CAST(1500.00 AS Decimal(10, 2)), N'Ecoturismo', 4)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (9, N'Catarata Gocta', N'Amazonas', CAST(950.00 AS Decimal(10, 2)), N'Naturaleza', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (10, N'Huascarán', N'Ancash', CAST(1100.00 AS Decimal(10, 2)), N'Aventura', 3)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (11, N'Señor de Sipán', N'Lambayeque', CAST(650.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (12, N'Tingo María', N'Huánuco', CAST(700.00 AS Decimal(10, 2)), N'Ecoturismo', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (13, N'Valle Sagrado', N'Cusco', CAST(950.00 AS Decimal(10, 2)), N'Cultural', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (14, N'Aguas Calientes', N'Cusco', CAST(800.00 AS Decimal(10, 2)), N'Relax', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (15, N'Chan Chan', N'La Libertad', CAST(600.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (16, N'Laguna 69', N'Ancash', CAST(850.00 AS Decimal(10, 2)), N'Aventura', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (17, N'Río Amazonas', N'Loreto', CAST(1300.00 AS Decimal(10, 2)), N'Ecoturismo', 3)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (18, N'Montaña de 7 Colores', N'Cusco', CAST(900.00 AS Decimal(10, 2)), N'Aventura', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (19, N'Islas Ballestas', N'Ica', CAST(650.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (20, N'Ollantaytambo', N'Cusco', CAST(700.00 AS Decimal(10, 2)), N'Cultural', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (21, N'Selva Central', N'Pasco', CAST(850.00 AS Decimal(10, 2)), N'Ecoturismo', 3)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (22, N'Cavernas de Quiocta', N'Amazonas', CAST(700.00 AS Decimal(10, 2)), N'Aventura', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (23, N'Laguna de los Cóndores', N'Amazonas', CAST(850.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (24, N'Chavín de Huántar', N'Ancash', CAST(750.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (25, N'Callejón de Huaylas', N'Ancash', CAST(900.00 AS Decimal(10, 2)), N'Naturaleza', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (26, N'Ciudad Blanca', N'Arequipa', CAST(750.00 AS Decimal(10, 2)), N'Cultural', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (27, N'Valle del Volcanes', N'Arequipa', CAST(950.00 AS Decimal(10, 2)), N'Aventura', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (28, N'Salinas y Aguada Blanca', N'Arequipa', CAST(800.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (29, N'Pampa de Ayacucho', N'Ayacucho', CAST(700.00 AS Decimal(10, 2)), N'Histórico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (30, N'Wari', N'Ayacucho', CAST(650.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (31, N'Vilcashuamán', N'Ayacucho', CAST(750.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (32, N'Laguna Pumapacocha', N'Ayacucho', CAST(800.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (33, N'Ventanillas de Otuzco', N'Cajamarca', CAST(650.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (34, N'Baños del Inca', N'Cajamarca', CAST(600.00 AS Decimal(10, 2)), N'Relax', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (35, N'Cumbe Mayo', N'Cajamarca', CAST(700.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (36, N'Granja Porcón', N'Cajamarca', CAST(550.00 AS Decimal(10, 2)), N'Ecoturismo', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (37, N'Huaca del Sol y la Luna', N'La Libertad', CAST(650.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (38, N'Trujillo Colonial', N'La Libertad', CAST(550.00 AS Decimal(10, 2)), N'Cultural', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (39, N'Playas de Huanchaco', N'La Libertad', CAST(500.00 AS Decimal(10, 2)), N'Playas', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (40, N'Túcume', N'Lambayeque', CAST(600.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (41, N'Bosque de Pómac', N'Lambayeque', CAST(700.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (42, N'Museo Tumbas Reales', N'Lambayeque', CAST(550.00 AS Decimal(10, 2)), N'Cultural', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (43, N'Caral', N'Lima', CAST(500.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (44, N'Lunahuaná', N'Lima', CAST(550.00 AS Decimal(10, 2)), N'Aventura', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (45, N'Punta Hermosa', N'Lima', CAST(500.00 AS Decimal(10, 2)), N'Playas', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (46, N'Pucusana', N'Lima', CAST(450.00 AS Decimal(10, 2)), N'Playas', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (47, N'Reserva Nacional Pacaya Samiria', N'Loreto', CAST(1200.00 AS Decimal(10, 2)), N'Ecoturismo', 3)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (48, N'Iquitos', N'Loreto', CAST(900.00 AS Decimal(10, 2)), N'Cultural', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (49, N'Río Nanay', N'Loreto', CAST(750.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (50, N'Reserva Tambopata', N'Madre de Dios', CAST(1100.00 AS Decimal(10, 2)), N'Ecoturismo', 3)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (51, N'Lago Sandoval', N'Madre de Dios', CAST(850.00 AS Decimal(10, 2)), N'Naturaleza', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (52, N'Puerto Maldonado', N'Madre de Dios', CAST(700.00 AS Decimal(10, 2)), N'Cultural', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (53, N'Parque Nacional Yanachaga', N'Pasco', CAST(800.00 AS Decimal(10, 2)), N'Ecoturismo', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (54, N'Laguna Punrun', N'Pasco', CAST(650.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (55, N'Oxapampa', N'Pasco', CAST(700.00 AS Decimal(10, 2)), N'Cultural', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (56, N'Islas Uros', N'Puno', CAST(800.00 AS Decimal(10, 2)), N'Cultural', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (57, N'Sillustani', N'Puno', CAST(700.00 AS Decimal(10, 2)), N'Arqueológico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (58, N'Taquile', N'Puno', CAST(750.00 AS Decimal(10, 2)), N'Cultural', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (59, N'Catarata Ahuashiyacu', N'San Martín', CAST(700.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (60, N'Tarapoto', N'San Martín', CAST(750.00 AS Decimal(10, 2)), N'Cultural', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (61, N'Laguna Azul', N'San Martín', CAST(650.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (62, N'Rioja', N'San Martín', CAST(600.00 AS Decimal(10, 2)), N'Cultural', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (63, N'Playa Punta Sal', N'Tumbes', CAST(800.00 AS Decimal(10, 2)), N'Playas', 2)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (64, N'Santuario Manglares', N'Tumbes', CAST(750.00 AS Decimal(10, 2)), N'Naturaleza', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (65, N'Zarumilla', N'Tumbes', CAST(600.00 AS Decimal(10, 2)), N'Histórico', 1)
INSERT [dbo].[Destino] ([id], [nombre], [lugar], [costo], [categoria], [dias]) VALUES (66, N'Playa Zorritos', N'Tumbes', CAST(550.00 AS Decimal(10, 2)), N'Playas', 1)
SET IDENTITY_INSERT [dbo].[Destino] OFF
GO
SET IDENTITY_INSERT [dbo].[MetodoPago] ON 

INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (1, 1, N'Tarjeta', CAST(2400.00 AS Decimal(10, 2)), CAST(N'2024-01-02' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (2, 2, N'Yape', CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-01-07' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (3, 3, N'Plin', CAST(750.00 AS Decimal(10, 2)), CAST(N'2024-01-12' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (4, 4, N'Tarjeta', CAST(1200.00 AS Decimal(10, 2)), CAST(N'2024-01-17' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (5, 5, N'Yape', CAST(2550.00 AS Decimal(10, 2)), CAST(N'2024-01-22' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (6, 6, N'Plin', CAST(1600.00 AS Decimal(10, 2)), CAST(N'2024-01-27' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (7, 7, N'Tarjeta', CAST(1400.00 AS Decimal(10, 2)), CAST(N'2024-02-01' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (8, 8, N'Yape', CAST(3000.00 AS Decimal(10, 2)), CAST(N'2024-02-05' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (9, 9, N'Plin', CAST(950.00 AS Decimal(10, 2)), CAST(N'2024-02-10' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (10, 10, N'Tarjeta', CAST(3300.00 AS Decimal(10, 2)), CAST(N'2024-02-15' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (11, 11, N'Yape', CAST(1300.00 AS Decimal(10, 2)), CAST(N'2024-02-20' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (12, 12, N'Plin', CAST(2800.00 AS Decimal(10, 2)), CAST(N'2024-02-22' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (13, 13, N'Tarjeta', CAST(1900.00 AS Decimal(10, 2)), CAST(N'2024-02-25' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (14, 14, N'Yape', CAST(1700.00 AS Decimal(10, 2)), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (15, 15, N'Plin', CAST(600.00 AS Decimal(10, 2)), CAST(N'2024-03-05' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (16, 16, N'Tarjeta', CAST(3400.00 AS Decimal(10, 2)), CAST(N'2024-03-09' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (17, 17, N'Yape', CAST(2600.00 AS Decimal(10, 2)), CAST(N'2024-03-12' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (18, 18, N'Plin', CAST(3600.00 AS Decimal(10, 2)), CAST(N'2024-03-17' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (19, 19, N'Tarjeta', CAST(650.00 AS Decimal(10, 2)), CAST(N'2024-03-20' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (20, 20, N'Yape', CAST(1400.00 AS Decimal(10, 2)), CAST(N'2024-03-23' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (21, 21, N'Plin', CAST(2550.00 AS Decimal(10, 2)), CAST(N'2024-03-26' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (22, 22, N'Tarjeta', CAST(2400.00 AS Decimal(10, 2)), CAST(N'2024-04-02' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (23, 23, N'Yape', CAST(900.00 AS Decimal(10, 2)), CAST(N'2024-04-07' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (24, 24, N'Plin', CAST(2250.00 AS Decimal(10, 2)), CAST(N'2024-04-12' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (25, 25, N'Tarjeta', CAST(1200.00 AS Decimal(10, 2)), CAST(N'2024-04-17' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (26, 26, N'Yape', CAST(3400.00 AS Decimal(10, 2)), CAST(N'2024-04-19' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (27, 27, N'Plin', CAST(1600.00 AS Decimal(10, 2)), CAST(N'2024-04-23' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (28, 28, N'Tarjeta', CAST(2100.00 AS Decimal(10, 2)), CAST(N'2024-04-26' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (29, 29, N'Yape', CAST(3000.00 AS Decimal(10, 2)), CAST(N'2024-05-01' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (30, 30, N'Plin', CAST(950.00 AS Decimal(10, 2)), CAST(N'2024-05-05' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (31, 31, N'Tarjeta', CAST(3300.00 AS Decimal(10, 2)), CAST(N'2024-05-09' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (32, 32, N'Yape', CAST(1300.00 AS Decimal(10, 2)), CAST(N'2024-05-14' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (33, 33, N'Plin', CAST(700.00 AS Decimal(10, 2)), CAST(N'2024-05-18' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (34, 34, N'Tarjeta', CAST(3800.00 AS Decimal(10, 2)), CAST(N'2024-05-20' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (35, 35, N'Yape', CAST(1400.00 AS Decimal(10, 2)), CAST(N'2024-05-23' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (36, 36, N'Plin', CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (37, 37, N'Tarjeta', CAST(850.00 AS Decimal(10, 2)), CAST(N'2024-06-01' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (38, 38, N'Yape', CAST(2600.00 AS Decimal(10, 2)), CAST(N'2024-06-05' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (39, 39, N'Plin', CAST(2700.00 AS Decimal(10, 2)), CAST(N'2024-06-09' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (40, 40, N'Tarjeta', CAST(1300.00 AS Decimal(10, 2)), CAST(N'2024-06-12' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (41, 41, N'Yape', CAST(700.00 AS Decimal(10, 2)), CAST(N'2024-06-15' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (42, 42, N'Plin', CAST(3400.00 AS Decimal(10, 2)), CAST(N'2024-06-19' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (43, 43, N'Tarjeta', CAST(2400.00 AS Decimal(10, 2)), CAST(N'2024-06-25' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (44, 44, N'Yape', CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-07-01' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (45, 45, N'Plin', CAST(750.00 AS Decimal(10, 2)), CAST(N'2024-07-05' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (46, 46, N'Tarjeta', CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-07-09' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (47, 47, N'Yape', CAST(1700.00 AS Decimal(10, 2)), CAST(N'2024-07-12' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (48, 48, N'Plin', CAST(3200.00 AS Decimal(10, 2)), CAST(N'2024-07-17' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (49, 49, N'Tarjeta', CAST(650.00 AS Decimal(10, 2)), CAST(N'2024-07-20' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (50, 50, N'Yape', CAST(3000.00 AS Decimal(10, 2)), CAST(N'2024-07-23' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (51, 51, N'Plin', CAST(2850.00 AS Decimal(10, 2)), CAST(N'2024-07-28' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (52, 52, N'Tarjeta', CAST(2200.00 AS Decimal(10, 2)), CAST(N'2024-08-02' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (53, 53, N'Yape', CAST(650.00 AS Decimal(10, 2)), CAST(N'2024-08-07' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (54, 54, N'Plin', CAST(2100.00 AS Decimal(10, 2)), CAST(N'2024-08-12' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (55, 55, N'Tarjeta', CAST(1900.00 AS Decimal(10, 2)), CAST(N'2024-08-17' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (56, 56, N'Yape', CAST(2800.00 AS Decimal(10, 2)), CAST(N'2024-08-20' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (57, 57, N'Plin', CAST(600.00 AS Decimal(10, 2)), CAST(N'2024-08-23' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (58, 58, N'Tarjeta', CAST(1700.00 AS Decimal(10, 2)), CAST(N'2024-08-26' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (59, 59, N'Yape', CAST(3900.00 AS Decimal(10, 2)), CAST(N'2024-09-01' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (60, 60, N'Plin', CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-09-05' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (61, 61, N'Tarjeta', CAST(650.00 AS Decimal(10, 2)), CAST(N'2024-09-09' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (62, 62, N'Yape', CAST(2800.00 AS Decimal(10, 2)), CAST(N'2024-09-12' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (63, 63, N'Plin', CAST(1700.00 AS Decimal(10, 2)), CAST(N'2024-09-15' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (64, 64, N'Tarjeta', CAST(3600.00 AS Decimal(10, 2)), CAST(N'2024-09-20' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (65, 65, N'Yape', CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-09-24' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (66, 66, N'Plin', CAST(750.00 AS Decimal(10, 2)), CAST(N'2024-09-27' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (67, 67, N'Tarjeta', CAST(1200.00 AS Decimal(10, 2)), CAST(N'2024-10-02' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (68, 68, N'Yape', CAST(2550.00 AS Decimal(10, 2)), CAST(N'2024-10-07' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (69, 69, N'Plin', CAST(800.00 AS Decimal(10, 2)), CAST(N'2024-10-12' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (70, 70, N'Tarjeta', CAST(2800.00 AS Decimal(10, 2)), CAST(N'2024-10-15' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (71, 71, N'Yape', CAST(3000.00 AS Decimal(10, 2)), CAST(N'2024-10-19' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (72, 72, N'Plin', CAST(950.00 AS Decimal(10, 2)), CAST(N'2024-10-24' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (73, 73, N'Tarjeta', CAST(3300.00 AS Decimal(10, 2)), CAST(N'2024-10-27' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (74, 74, N'Yape', CAST(1300.00 AS Decimal(10, 2)), CAST(N'2024-11-02' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (75, 75, N'Plin', CAST(700.00 AS Decimal(10, 2)), CAST(N'2024-11-07' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (76, 76, N'Tarjeta', CAST(2800.00 AS Decimal(10, 2)), CAST(N'2024-11-12' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (77, 77, N'Yape', CAST(1400.00 AS Decimal(10, 2)), CAST(N'2024-11-15' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (78, 78, N'Plin', CAST(1800.00 AS Decimal(10, 2)), CAST(N'2024-11-19' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (79, 79, N'Tarjeta', CAST(850.00 AS Decimal(10, 2)), CAST(N'2024-11-22' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (80, 80, N'Yape', CAST(2600.00 AS Decimal(10, 2)), CAST(N'2024-11-25' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (81, 81, N'Plin', CAST(2700.00 AS Decimal(10, 2)), CAST(N'2024-12-02' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (82, 82, N'Tarjeta', CAST(1300.00 AS Decimal(10, 2)), CAST(N'2024-12-07' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (83, 83, N'Yape', CAST(700.00 AS Decimal(10, 2)), CAST(N'2024-12-12' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (84, 84, N'Plin', CAST(3400.00 AS Decimal(10, 2)), CAST(N'2024-12-17' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (85, 90, N'Yape', CAST(3600.00 AS Decimal(10, 2)), CAST(N'2025-06-23' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (86, 91, N'Plin', CAST(3800.00 AS Decimal(10, 2)), CAST(N'2025-06-23' AS Date))
INSERT [dbo].[MetodoPago] ([id], [id_reserva], [tipo], [monto_total], [fecha_pago]) VALUES (87, 92, N'Yape', CAST(3400.00 AS Decimal(10, 2)), CAST(N'2025-06-24' AS Date))
SET IDENTITY_INSERT [dbo].[MetodoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Plin] ON 

INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (1, 3, N'PLN00123456')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (2, 6, N'PLN00234567')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (3, 9, N'PLN00345678')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (4, 12, N'PLN00456789')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (5, 15, N'PLN00567890')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (6, 18, N'PLN00678901')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (7, 21, N'PLN00789012')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (8, 24, N'PLN00890123')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (9, 27, N'PLN00901234')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (10, 30, N'PLN01012345')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (11, 33, N'PLN01123456')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (12, 36, N'PLN01234567')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (13, 39, N'PLN01345678')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (14, 42, N'PLN01456789')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (15, 45, N'PLN01567890')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (16, 48, N'PLN01678901')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (17, 51, N'PLN01789012')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (18, 54, N'PLN01890123')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (19, 57, N'PLN01901234')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (20, 60, N'PLN02012345')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (21, 63, N'PLN02123456')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (22, 66, N'PLN02234567')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (23, 69, N'PLN02345678')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (24, 72, N'PLN02456789')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (25, 75, N'PLN02567890')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (26, 78, N'PLN02678901')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (27, 81, N'PLN02789012')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (28, 84, N'PLN02890123')
INSERT [dbo].[Plin] ([id], [id_metodo_pago], [numero_operacion]) VALUES (29, 86, N'')
SET IDENTITY_INSERT [dbo].[Plin] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 

INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (1, N'70000001', 1, 0, 2, CAST(N'2024-01-05' AS Date), CAST(N'2024-01-08' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (2, N'70000002', 2, 1, 2, CAST(N'2024-01-10' AS Date), CAST(N'2024-01-12' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (3, N'70000003', 3, 0, 1, CAST(N'2024-01-15' AS Date), CAST(N'2024-01-16' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (4, N'70000004', 4, 2, 2, CAST(N'2024-01-20' AS Date), CAST(N'2024-01-21' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (5, N'70000005', 5, 0, 3, CAST(N'2024-01-25' AS Date), CAST(N'2024-01-27' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (6, N'70000006', 6, 1, 2, CAST(N'2024-01-30' AS Date), CAST(N'2024-02-01' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (7, N'70000007', 7, 0, 2, CAST(N'2024-02-03' AS Date), CAST(N'2024-02-04' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (8, N'70000008', 8, 1, 2, CAST(N'2024-02-08' AS Date), CAST(N'2024-02-12' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (9, N'70000009', 9, 0, 1, CAST(N'2024-02-13' AS Date), CAST(N'2024-02-15' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (10, N'70000010', 10, 2, 3, CAST(N'2024-02-18' AS Date), CAST(N'2024-02-21' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (11, N'70000011', 11, 0, 2, CAST(N'2024-02-23' AS Date), CAST(N'2024-02-24' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (12, N'70000012', 12, 1, 4, CAST(N'2024-02-25' AS Date), CAST(N'2024-02-27' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (13, N'70000013', 13, 0, 2, CAST(N'2024-02-28' AS Date), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (14, N'70000014', 14, 2, 2, CAST(N'2024-03-02' AS Date), CAST(N'2024-03-03' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (15, N'70000015', 15, 0, 1, CAST(N'2024-03-07' AS Date), CAST(N'2024-03-08' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (16, N'70000016', 16, 1, 3, CAST(N'2024-03-12' AS Date), CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (17, N'70000017', 17, 0, 2, CAST(N'2024-03-15' AS Date), CAST(N'2024-03-18' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (18, N'70000018', 18, 2, 4, CAST(N'2024-03-20' AS Date), CAST(N'2024-03-21' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (19, N'70000019', 19, 0, 1, CAST(N'2024-03-22' AS Date), CAST(N'2024-03-23' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (20, N'70000020', 20, 1, 2, CAST(N'2024-03-25' AS Date), CAST(N'2024-03-26' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (21, N'70000021', 21, 0, 3, CAST(N'2024-03-28' AS Date), CAST(N'2024-03-31' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (22, N'70000022', 1, 1, 2, CAST(N'2024-04-05' AS Date), CAST(N'2024-04-08' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (23, N'70000023', 2, 0, 1, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-12' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (24, N'70000024', 3, 2, 3, CAST(N'2024-04-15' AS Date), CAST(N'2024-04-16' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (25, N'70000025', 4, 0, 2, CAST(N'2024-04-20' AS Date), CAST(N'2024-04-21' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (26, N'70000026', 5, 1, 4, CAST(N'2024-04-22' AS Date), CAST(N'2024-04-24' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (27, N'70000027', 6, 0, 2, CAST(N'2024-04-25' AS Date), CAST(N'2024-04-27' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (28, N'70000028', 7, 2, 3, CAST(N'2024-04-28' AS Date), CAST(N'2024-04-29' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (29, N'70000001', 8, 0, 2, CAST(N'2024-05-03' AS Date), CAST(N'2024-05-07' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (30, N'70000002', 9, 1, 1, CAST(N'2024-05-08' AS Date), CAST(N'2024-05-10' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (31, N'70000003', 10, 0, 3, CAST(N'2024-05-12' AS Date), CAST(N'2024-05-15' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (32, N'70000004', 11, 2, 2, CAST(N'2024-05-17' AS Date), CAST(N'2024-05-18' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (33, N'70000005', 12, 0, 1, CAST(N'2024-05-20' AS Date), CAST(N'2024-05-22' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (34, N'70000006', 13, 1, 4, CAST(N'2024-05-23' AS Date), CAST(N'2024-05-25' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (35, N'70000007', 14, 0, 2, CAST(N'2024-05-26' AS Date), CAST(N'2024-05-27' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (36, N'70000008', 15, 2, 3, CAST(N'2024-05-29' AS Date), CAST(N'2024-05-30' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (37, N'70000009', 16, 0, 1, CAST(N'2024-06-02' AS Date), CAST(N'2024-06-03' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (38, N'70000010', 17, 1, 2, CAST(N'2024-06-07' AS Date), CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (39, N'70000011', 18, 0, 3, CAST(N'2024-06-12' AS Date), CAST(N'2024-06-13' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (40, N'70000012', 19, 2, 2, CAST(N'2024-06-15' AS Date), CAST(N'2024-06-16' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (41, N'70000013', 20, 0, 1, CAST(N'2024-06-18' AS Date), CAST(N'2024-06-19' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (42, N'70000014', 21, 1, 4, CAST(N'2024-06-22' AS Date), CAST(N'2024-06-25' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (43, N'70000015', 1, 0, 2, CAST(N'2024-06-28' AS Date), CAST(N'2024-07-01' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (44, N'70000016', 2, 1, 2, CAST(N'2024-07-03' AS Date), CAST(N'2024-07-05' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (45, N'70000017', 3, 0, 1, CAST(N'2024-07-08' AS Date), CAST(N'2024-07-09' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (46, N'70000018', 4, 2, 3, CAST(N'2024-07-12' AS Date), CAST(N'2024-07-13' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (47, N'70000019', 5, 0, 2, CAST(N'2024-07-15' AS Date), CAST(N'2024-07-17' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (48, N'70000020', 6, 1, 4, CAST(N'2024-07-20' AS Date), CAST(N'2024-07-22' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (49, N'70000021', 7, 0, 1, CAST(N'2024-07-23' AS Date), CAST(N'2024-07-24' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (50, N'70000022', 8, 2, 2, CAST(N'2024-07-26' AS Date), CAST(N'2024-07-30' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (51, N'70000023', 9, 0, 3, CAST(N'2024-07-31' AS Date), CAST(N'2024-08-02' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (52, N'70000024', 10, 1, 2, CAST(N'2024-08-05' AS Date), CAST(N'2024-08-08' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (53, N'70000025', 11, 0, 1, CAST(N'2024-08-10' AS Date), CAST(N'2024-08-11' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (54, N'70000026', 12, 2, 3, CAST(N'2024-08-15' AS Date), CAST(N'2024-08-17' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (55, N'70000027', 13, 0, 2, CAST(N'2024-08-20' AS Date), CAST(N'2024-08-22' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (56, N'70000028', 14, 1, 4, CAST(N'2024-08-23' AS Date), CAST(N'2024-08-24' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (57, N'70000001', 15, 0, 1, CAST(N'2024-08-26' AS Date), CAST(N'2024-08-27' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (58, N'70000002', 16, 2, 2, CAST(N'2024-08-29' AS Date), CAST(N'2024-08-30' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (59, N'70000003', 17, 0, 3, CAST(N'2024-09-03' AS Date), CAST(N'2024-09-06' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (60, N'70000004', 18, 1, 2, CAST(N'2024-09-08' AS Date), CAST(N'2024-09-09' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (61, N'70000005', 19, 0, 1, CAST(N'2024-09-12' AS Date), CAST(N'2024-09-13' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (62, N'70000006', 20, 2, 4, CAST(N'2024-09-15' AS Date), CAST(N'2024-09-16' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (63, N'70000007', 21, 0, 2, CAST(N'2024-09-18' AS Date), CAST(N'2024-09-21' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (64, N'70000008', 1, 1, 3, CAST(N'2024-09-23' AS Date), CAST(N'2024-09-26' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (65, N'70000009', 2, 0, 2, CAST(N'2024-09-27' AS Date), CAST(N'2024-09-29' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (66, N'70000010', 3, 2, 1, CAST(N'2024-09-30' AS Date), CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (67, N'70000011', 4, 0, 2, CAST(N'2024-10-05' AS Date), CAST(N'2024-10-06' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (68, N'70000012', 5, 1, 3, CAST(N'2024-10-10' AS Date), CAST(N'2024-10-12' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (69, N'70000013', 6, 0, 1, CAST(N'2024-10-15' AS Date), CAST(N'2024-10-17' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (70, N'70000014', 7, 2, 4, CAST(N'2024-10-18' AS Date), CAST(N'2024-10-19' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (71, N'70000015', 8, 0, 2, CAST(N'2024-10-22' AS Date), CAST(N'2024-10-26' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (72, N'70000016', 9, 1, 1, CAST(N'2024-10-27' AS Date), CAST(N'2024-10-29' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (73, N'70000017', 10, 0, 3, CAST(N'2024-10-30' AS Date), CAST(N'2024-11-02' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (74, N'70000018', 11, 2, 2, CAST(N'2024-11-05' AS Date), CAST(N'2024-11-06' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (75, N'70000019', 12, 0, 1, CAST(N'2024-11-10' AS Date), CAST(N'2024-11-12' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (76, N'70000020', 13, 1, 4, CAST(N'2024-11-15' AS Date), CAST(N'2024-11-17' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (77, N'70000021', 14, 0, 2, CAST(N'2024-11-18' AS Date), CAST(N'2024-11-19' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (78, N'70000022', 15, 2, 3, CAST(N'2024-11-22' AS Date), CAST(N'2024-11-23' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (79, N'70000023', 16, 0, 1, CAST(N'2024-11-25' AS Date), CAST(N'2024-11-26' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (80, N'70000024', 17, 1, 2, CAST(N'2024-11-28' AS Date), CAST(N'2024-12-01' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (81, N'70000025', 18, 0, 3, CAST(N'2024-12-05' AS Date), CAST(N'2024-12-06' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (82, N'70000026', 19, 2, 2, CAST(N'2024-12-10' AS Date), CAST(N'2024-12-11' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (83, N'70000027', 20, 0, 1, CAST(N'2024-12-15' AS Date), CAST(N'2024-12-16' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (84, N'70000028', 21, 1, 4, CAST(N'2024-12-20' AS Date), CAST(N'2024-12-23' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (90, N'75102907', 1, 0, 3, CAST(N'2025-06-26' AS Date), CAST(N'2025-06-29' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (91, N'87679564', 13, 0, 4, CAST(N'2025-06-26' AS Date), CAST(N'2025-06-28' AS Date))
INSERT [dbo].[Reserva] ([id], [dni_turista], [id_destino], [ninos], [adultos], [fecha_inicio], [fecha_final]) VALUES (92, N'65456789', 16, 1, 3, CAST(N'2025-06-26' AS Date), CAST(N'2025-06-27' AS Date))
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarjeta] ON 

INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (1, 1, N'4532876512345678', N'05/25', N'123')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (2, 4, N'5123987643219876', N'06/26', N'456')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (3, 7, N'4024007198765432', N'07/27', N'789')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (4, 10, N'4485273312345678', N'08/28', N'321')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (5, 13, N'4539876543210987', N'09/29', N'654')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (6, 16, N'4916738523456789', N'10/30', N'987')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (7, 19, N'4555123487654321', N'11/31', N'321')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (8, 22, N'4532765187654321', N'12/32', N'654')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (9, 25, N'4024007156784321', N'01/33', N'987')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (10, 28, N'4485273365432187', N'02/34', N'321')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (11, 31, N'4539876512348765', N'03/35', N'654')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (12, 34, N'4916738543215678', N'04/36', N'987')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (13, 37, N'4555123412349876', N'05/37', N'321')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (14, 40, N'4532765187651234', N'06/38', N'654')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (15, 43, N'4024007198763456', N'07/39', N'987')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (16, 46, N'4485273312346543', N'08/40', N'321')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (17, 49, N'4539876543217890', N'09/41', N'654')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (18, 52, N'4916738523450987', N'10/42', N'987')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (19, 55, N'4555123487652109', N'11/43', N'321')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (20, 58, N'4532765187654320', N'12/44', N'654')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (21, 61, N'4024007156781234', N'01/45', N'987')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (22, 64, N'4485273365438765', N'02/46', N'321')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (23, 67, N'4539876512345670', N'03/47', N'654')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (24, 70, N'4916738543210987', N'04/48', N'987')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (25, 73, N'4555123412348765', N'05/49', N'321')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (26, 76, N'4532765187654329', N'06/50', N'654')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (27, 79, N'4024007198765438', N'07/51', N'987')
INSERT [dbo].[Tarjeta] ([id], [id_metodo_pago], [numero_tarjeta], [mm_aa], [cvc]) VALUES (28, 82, N'4485273312345677', N'08/52', N'321')
SET IDENTITY_INSERT [dbo].[Tarjeta] OFF
GO
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'65456789', N'David', N'Martines Segovia', N'', N'976548909', N'Sin dirección', N'david@gmail.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000001', N'Ana', N'García', N'López', N'999111001', N'Av. Primavera 123', N'ana.garcia@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000002', N'Carlos', N'Martínez', N'Sánchez', N'999111002', N'Jr. Libertad 456', N'carlos.martinez@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000003', N'María', N'Rodríguez', N'Pérez', N'999111003', N'Av. Flores 789', N'maria.rodriguez@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000004', N'Luis', N'Hernández', N'Gómez', N'999111004', N'Calle Luna 101', N'luis.hernandez@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000005', N'Laura', N'Díaz', N'Fernández', N'999111005', N'Jr. Sol 202', N'laura.diaz@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000006', N'Jorge', N'Vargas', N'Ruiz', N'999111006', N'Av. Estrella 303', N'jorge.vargas@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000007', N'Sofía', N'Torres', N'Jiménez', N'999111007', N'Calle Marte 404', N'sofia.torres@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000008', N'Pedro', N'Ramírez', N'Morales', N'999111008', N'Av. Júpiter 505', N'pedro.ramirez@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000009', N'Elena', N'Flores', N'Ortega', N'999111009', N'Jr. Saturno 606', N'elena.flores@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000010', N'Miguel', N'Castro', N'Medina', N'999111010', N'Av. Venus 707', N'miguel.castro@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000011', N'Carmen', N'Romero', N'Iglesias', N'999111011', N'Calle Neptuno 808', N'carmen.romero@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000012', N'Francisco', N'Álvarez', N'Cortés', N'999111012', N'Av. Urano 909', N'francisco.alvarez@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000013', N'Isabel', N'Gutiérrez', N'Santos', N'999111013', N'Jr. Plutón 112', N'isabel.gutierrez@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000014', N'Diego', N'Molina', N'Cruz', N'999111014', N'Av. Mercurio 223', N'diego.molina@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000015', N'Patricia', N'Suárez', N'Gallego', N'999111015', N'Calle Tierra 334', N'patricia.suarez@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000016', N'Ricardo', N'Navarro', N'Vega', N'999111016', N'Av. Andrómeda 445', N'ricardo.navarro@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000017', N'Lucía', N'Gil', N'Carmona', N'999111017', N'Jr. Orión 556', N'lucia.gil@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000018', N'Javier', N'Serrano', N'Márquez', N'999111018', N'Av. Casiopea 667', N'javier.serrano@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000019', N'Olga', N'Reyes', N'Delgado', N'999111019', N'Calle Pegaso 778', N'olga.reyes@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000020', N'Fernando', N'Méndez', N'Ramos', N'999111020', N'Av. Centauro 889', N'fernando.mendez@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000021', N'Raquel', N'Cabrera', N'Prieto', N'999111021', N'Jr. Hidra 990', N'raquel.cabrera@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000022', N'Héctor', N'Campos', N'Blanco', N'999111022', N'Av. Draco 121', N'hector.campos@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000023', N'Silvia', N'Vega', N'Santana', N'999111023', N'Calle Fénix 232', N'silvia.vega@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000024', N'Alberto', N'Fuentes', N'Pascual', N'999111024', N'Av. Grifo 343', N'alberto.fuentes@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000025', N'Beatriz', N'Carrasco', N'Herrera', N'999111025', N'Jr. Quimera 454', N'beatriz.carrasco@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000026', N'Roberto', N'Soto', N'Montero', N'999111026', N'Av. Minotauro 565', N'roberto.soto@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000027', N'Natalia', N'Peña', N'Lorenzo', N'999111027', N'Calle Esfinge 676', N'natalia.pena@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'70000028', N'Daniel', N'León', N'Ibáñez', N'999111028', N'Av. Dragón 787', N'daniel.leon@email.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'75102907', N'danilo', N'manrique', N'', N'921715730', N'Sin dirección', N'dani@gmail.com')
INSERT [dbo].[Turista] ([dni], [nombre], [apellidoPaterno], [apellidoMaterno], [telefono], [direccion], [correo]) VALUES (N'87679564', N'Danilo', N'Manrique ', N'', N'943567867', N'Sin dirección', N'da@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Yape] ON 

INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (1, 2, N'YAP00123456')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (2, 5, N'YAP00234567')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (3, 8, N'YAP00345678')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (4, 11, N'YAP00456789')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (5, 14, N'YAP00567890')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (6, 17, N'YAP00678901')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (7, 20, N'YAP00789012')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (8, 23, N'YAP00890123')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (9, 26, N'YAP00901234')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (10, 29, N'YAP01012345')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (11, 32, N'YAP01123456')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (12, 35, N'YAP01234567')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (13, 38, N'YAP01345678')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (14, 41, N'YAP01456789')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (15, 44, N'YAP01567890')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (16, 47, N'YAP01678901')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (17, 50, N'YAP01789012')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (18, 53, N'YAP01890123')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (19, 56, N'YAP01901234')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (20, 59, N'YAP02012345')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (21, 62, N'YAP02123456')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (22, 65, N'YAP02234567')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (23, 68, N'YAP02345678')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (24, 71, N'YAP02456789')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (25, 74, N'YAP02567890')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (26, 77, N'YAP02678901')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (27, 80, N'YAP02789012')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (28, 83, N'YAP02890123')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (29, 85, N'')
INSERT [dbo].[Yape] ([id], [id_metodo_pago], [numero_operacion]) VALUES (30, 87, N'')
SET IDENTITY_INSERT [dbo].[Yape] OFF
GO
/****** Object:  Index [UQ__Plin__85BE0EBD395A1071]    Script Date: 25/06/2025 08:40:23 ******/
ALTER TABLE [dbo].[Plin] ADD UNIQUE NONCLUSTERED 
(
	[id_metodo_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Tarjeta__85BE0EBDF03E1D23]    Script Date: 25/06/2025 08:40:23 ******/
ALTER TABLE [dbo].[Tarjeta] ADD UNIQUE NONCLUSTERED 
(
	[id_metodo_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Yape__85BE0EBD8CAA1B10]    Script Date: 25/06/2025 08:40:23 ******/
ALTER TABLE [dbo].[Yape] ADD UNIQUE NONCLUSTERED 
(
	[id_metodo_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reserva] ADD  DEFAULT ((0)) FOR [ninos]
GO
ALTER TABLE [dbo].[Reserva] ADD  DEFAULT ((1)) FOR [adultos]
GO
ALTER TABLE [dbo].[MetodoPago]  WITH CHECK ADD FOREIGN KEY([id_reserva])
REFERENCES [dbo].[Reserva] ([id])
GO
ALTER TABLE [dbo].[Plin]  WITH CHECK ADD FOREIGN KEY([id_metodo_pago])
REFERENCES [dbo].[MetodoPago] ([id])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([dni_turista])
REFERENCES [dbo].[Turista] ([dni])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([id_destino])
REFERENCES [dbo].[Destino] ([id])
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD FOREIGN KEY([id_metodo_pago])
REFERENCES [dbo].[MetodoPago] ([id])
GO
ALTER TABLE [dbo].[Yape]  WITH CHECK ADD FOREIGN KEY([id_metodo_pago])
REFERENCES [dbo].[MetodoPago] ([id])
GO
ALTER TABLE [dbo].[MetodoPago]  WITH CHECK ADD CHECK  (([tipo]='Plin' OR [tipo]='Yape' OR [tipo]='Tarjeta'))
GO
/****** Object:  StoredProcedure [dbo].[BuscarDestinoPorLugar]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[BuscarDestinoPorLugar]
    @lugar NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT id, nombre, lugar, costo, dias
    FROM Destino
    WHERE lugar LIKE '%' + @lugar + '%'
       OR nombre LIKE '%' + @lugar + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarDestinoPorNombre]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarDestinoPorNombre]
    @nombre NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT id, nombre, lugar, costo, dias
    FROM Destinos
    WHERE nombre LIKE '%' + @nombre + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarMetodoPago]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarMetodoPago]
    @id_reserva INT,
    @tipo VARCHAR(20),
    @monto_total DECIMAL(10,2),
    @fecha_pago DATE,
    @id_metodo_pago INT OUTPUT
AS
BEGIN
    INSERT INTO MetodoPago (id_reserva, tipo, monto_total, fecha_pago)
    VALUES (@id_reserva, @tipo, @monto_total, @fecha_pago);

    SET @id_metodo_pago = SCOPE_IDENTITY(); -- Devuelve el ID generado
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarPlin]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarPlin]
    @id_metodo_pago INT,
    @numero_operacion VARCHAR(50)
AS
BEGIN
    INSERT INTO Plin (id_metodo_pago, numero_operacion)
    VALUES (@id_metodo_pago, @numero_operacion);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarReserva]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarReserva]
    @dni_turista VARCHAR(8),
    @id_destino INT,
    @ninos INT,
    @adultos INT,
    @fecha_inicio DATE,
    @fecha_final DATE,
    @id_reserva INT OUTPUT
AS
BEGIN
    INSERT INTO Reserva (dni_turista, id_destino, ninos, adultos, fecha_inicio, fecha_final)
    VALUES (@dni_turista, @id_destino, @ninos, @adultos, @fecha_inicio, @fecha_final);

    SET @id_reserva = SCOPE_IDENTITY(); -- Devuelve el ID generado
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarTarjeta]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarTarjeta]
    @id_metodo_pago INT,
    @numero_tarjeta VARCHAR(20),
    @mm_aa VARCHAR(5),
    @cvc VARCHAR(4)
AS
BEGIN
    INSERT INTO Tarjeta (id_metodo_pago, numero_tarjeta, mm_aa, cvc)
    VALUES (@id_metodo_pago, @numero_tarjeta, @mm_aa, @cvc);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarTurista]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarTurista]
    @dni VARCHAR(8),
    @nombre VARCHAR(50),
    @apellidoPaterno VARCHAR(50),
    @apellidoMaterno VARCHAR(50),
    @telefono VARCHAR(15),
    @direccion VARCHAR(100),
    @correo VARCHAR(100)
AS
BEGIN
    INSERT INTO Turista (dni, nombre, apellidoPaterno, apellidoMaterno, telefono, direccion, correo)
    VALUES (@dni, @nombre, @apellidoPaterno, @apellidoMaterno, @telefono, @direccion, @correo);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarYape]    Script Date: 25/06/2025 08:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarYape]
    @id_metodo_pago INT,
    @numero_operacion VARCHAR(50)
AS
BEGIN
    INSERT INTO Yape (id_metodo_pago, numero_operacion)
    VALUES (@id_metodo_pago, @numero_operacion);
END
GO
USE [master]
GO
ALTER DATABASE [TurismoBD] SET  READ_WRITE 
GO
