USE [master]
GO
/****** Object:  Database [PV_Examen02]    Script Date: 24/04/2024 ******/
CREATE DATABASE [PV_Examen02]
 CONTAINMENT = NONE
GO
ALTER DATABASE [PV_Examen02] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PV_Examen02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PV_Examen02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PV_Examen02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PV_Examen02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PV_Examen02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PV_Examen02] SET ARITHABORT OFF 
GO
ALTER DATABASE [PV_Examen02] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PV_Examen02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PV_Examen02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PV_Examen02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PV_Examen02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PV_Examen02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PV_Examen02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PV_Examen02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PV_Examen02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PV_Examen02] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PV_Examen02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PV_Examen02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PV_Examen02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PV_Examen02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PV_Examen02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PV_Examen02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PV_Examen02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PV_Examen02] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PV_Examen02] SET  MULTI_USER 
GO
ALTER DATABASE [PV_Examen02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PV_Examen02] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PV_Examen02] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PV_Examen02] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PV_Examen02] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PV_Examen02] SET QUERY_STORE = OFF
GO
USE [PV_Examen02]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 24/04/2024 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[idProvincia] [int] NOT NULL,
	[nombreCompleto] [varchar](150) NOT NULL,
	[telefono] [varchar](9) NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[salario] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 24/04/2024 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[idProvincia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 
GO
INSERT [dbo].[Persona] ([idPersona], [idProvincia], [nombreCompleto], [telefono], [fechaNacimiento], [salario]) VALUES (1, 1, N'Alfredo Rivera Coto', N'5214-6352', CAST(N'1994-03-15T00:00:00.000' AS DateTime), CAST(684362.25 AS Numeric(10, 2)))
GO
INSERT [dbo].[Persona] ([idPersona], [idProvincia], [nombreCompleto], [telefono], [fechaNacimiento], [salario]) VALUES (2, 1, N'Mariana Solera Díaz', N'8596-4762', CAST(N'1988-06-21T00:00:00.000' AS DateTime), CAST(974526.63 AS Numeric(10, 2)))
GO
INSERT [dbo].[Persona] ([idPersona], [idProvincia], [nombreCompleto], [telefono], [fechaNacimiento], [salario]) VALUES (3, 3, N'Mónica Rodríguez Zeledón', N'2569-8451', CAST(N'1947-09-01T00:00:00.000' AS DateTime), CAST(256987.14 AS Numeric(10, 2)))
GO
INSERT [dbo].[Persona] ([idPersona], [idProvincia], [nombreCompleto], [telefono], [fechaNacimiento], [salario]) VALUES (4, 2, N'Rodrígo Mena Álvarez', N'2569-8451', CAST(N'1955-11-09T00:00:00.000' AS DateTime), CAST(156325.87 AS Numeric(10, 2)))
GO
INSERT [dbo].[Persona] ([idPersona], [idProvincia], [nombreCompleto], [telefono], [fechaNacimiento], [salario]) VALUES (5, 4, N'Alejandra Contreras Masís', N'2569-8549', CAST(N'1979-05-14T00:00:00.000' AS DateTime), CAST(2569415.48 AS Numeric(10, 2)))
GO
INSERT [dbo].[Persona] ([idPersona], [idProvincia], [nombreCompleto], [telefono], [fechaNacimiento], [salario]) VALUES (6, 5, N'Bryan Fonseca Bonilla', N'7845-9652', CAST(N'2000-08-30T00:00:00.000' AS DateTime), CAST(1052965.05 AS Numeric(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 
GO
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (1, N'San José')
GO
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (2, N'Alajuela')
GO
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (3, N'Cartago')
GO
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (4, N'Heredia')
GO
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (5, N'Guanacaste')
GO
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (6, N'Puntarenas')
GO
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (7, N'Limón')
GO
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Provincia] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincia] ([idProvincia])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Provincia]
GO
/****** Object:  StoredProcedure [dbo].[spConsultarPersonaPorId]    Script Date: 24/04/2024 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarPersonaPorId]
	@idPersona INT
AS
BEGIN
	SELECT
		prs.idPersona,
		prs.idProvincia,
		prs.nombreCompleto,
		prs.telefono,
		prs.fechaNacimiento,
		prs.salario
	FROM dbo.Persona prs
	WHERE prs.idPersona = @idPersona
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTodasLasPersonas]    Script Date: 24/04/2024 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarTodasLasPersonas]
AS
BEGIN
	SELECT
		prs.idPersona,
		prs.idProvincia,
		prv.nombre nombreProvincia,
		prs.nombreCompleto,
		prs.telefono,
		prs.fechaNacimiento,
		prs.salario
	FROM dbo.Persona prs
	LEFT JOIN dbo.Provincia prv ON prs.idProvincia = prv.idProvincia
	ORDER BY prs.nombreCompleto ASC, prv.nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTodasLasProvincias]    Script Date: 24/04/2024 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarTodasLasProvincias]
AS
BEGIN
	SELECT
		p.idProvincia,
		p.nombre
	FROM dbo.Provincia p
	ORDER BY p.nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearPersona]    Script Date: 24/04/2024 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearPersona]
	@idProvincia INT,
	@nombreCompleto VARCHAR(150),
	@telefono VARCHAR(9),
	@fechaNacimiento DATETIME,
	@salario NUMERIC(10,2)
AS
BEGIN
	INSERT INTO dbo.Persona (idProvincia, nombreCompleto, telefono, fechaNacimiento, salario)
	VALUES (@idProvincia, @nombreCompleto, @telefono, @fechaNacimiento, @salario)
END
GO
/****** Object:  StoredProcedure [dbo].[spEditarPersona]    Script Date: 24/04/2024 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEditarPersona]
	@idPersona INT,
	@idProvincia INT,
	@nombreCompleto VARCHAR(150),
	@telefono VARCHAR(9),
	@fechaNacimiento DATETIME,
	@salario NUMERIC(10,2)
AS
BEGIN
	UPDATE dbo.Persona
	SET
		idProvincia = @idProvincia, 
		nombreCompleto = @nombreCompleto, 
		telefono = @telefono, 
		fechaNacimiento = @fechaNacimiento, 
		salario = @salario
	WHERE idPersona = @idPersona
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarPersona]    Script Date: 24/04/2024 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarPersona]
	@idPersona INT
AS
BEGIN
	DELETE FROM dbo.Persona
	WHERE idPersona = @idPersona
END
GO
USE [master]
GO
ALTER DATABASE [PV_Examen02] SET  READ_WRITE 
GO
