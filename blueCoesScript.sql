USE [master]
GO
/****** Object:  Database [BlueCoes]    Script Date: 27/11/2018 22:40:04 ******/
CREATE DATABASE [BlueCoes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlueCoes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BlueCoes.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlueCoes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BlueCoes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BlueCoes] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlueCoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlueCoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlueCoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlueCoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlueCoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlueCoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlueCoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlueCoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlueCoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlueCoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlueCoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlueCoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlueCoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlueCoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlueCoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlueCoes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlueCoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlueCoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlueCoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlueCoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlueCoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlueCoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlueCoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlueCoes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlueCoes] SET  MULTI_USER 
GO
ALTER DATABASE [BlueCoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlueCoes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlueCoes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlueCoes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BlueCoes] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BlueCoes]
GO
/****** Object:  Table [dbo].[Beneficiario]    Script Date: 27/11/2018 22:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Beneficiario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Agente] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](100) NULL,
	[Foto] [varbinary](max) NULL,
	[Sexo] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[FechaEntrada] [date] NOT NULL,
	[FechaSalida] [date] NULL,
	[FechaAltaProyecto] [date] NULL,
	[FechaBajaProyecto] [date] NULL,
	[Beca] [varchar](50) NULL,
	[Proyecto] [varchar](100) NOT NULL,
	[NotaCurso] [float] NULL,
	[ComunidadNacimiento] [varchar](50) NULL,
	[ComunidadViviendo] [varchar](50) NULL,
	[Observaciones] [varchar](300) NULL,
 CONSTRAINT [PK_Beneficiario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Coordinador]    Script Date: 27/11/2018 22:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coordinador](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](100) NULL,
	[Foto] [varbinary](max) NULL,
	[Sexo] [varchar](10) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[FechaEntrada] [date] NOT NULL,
	[FechaSalida] [date] NULL,
	[Privilegios] [int] NOT NULL,
	[Dirección] [varchar](200) NULL,
	[Telefono] [varchar](20) NULL,
	[Trabajo] [varchar](50) NULL,
	[Observaciones] [varchar](300) NULL,
 CONSTRAINT [PK_Coordinador] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiario_Coordinador] FOREIGN KEY([Agente])
REFERENCES [dbo].[Coordinador] ([ID])
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [FK_Beneficiario_Coordinador]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gente que recibe las ayudas en Honduras' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Beneficiario'
GO
USE [master]
GO
ALTER DATABASE [BlueCoes] SET  READ_WRITE 
GO
