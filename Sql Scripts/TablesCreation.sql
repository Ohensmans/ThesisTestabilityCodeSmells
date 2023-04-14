USE [TestabilityCodeSmellsDB]
GO
/****** Object:  Table [dbo].[CLASSES]    Script Date: 4/12/2023 2:54:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLASSES](
	[id_class] [bigint] NOT NULL,
	[id_package] [bigint] NOT NULL,
	[className] [nvarchar](max) NOT NULL,
	[ATFD] [decimal](18, 6) NULL,
	[CBO] [decimal](18, 6) NULL,
	[JTA] [decimal](18, 6) NULL,
	[JTM] [decimal](18, 6) NULL,
	[DAC] [decimal](18, 6) NULL,
	[DIT] [decimal](18, 6) NULL,
	[CHD] [decimal](18, 6) NULL,
	[CHEF] [decimal](18, 6) NULL,
	[CHER] [decimal](18, 6) NULL,
	[CHL] [decimal](18, 6) NULL,
	[CHVC] [decimal](18, 6) NULL,
	[CHVL] [decimal](18, 6) NULL,
	[LCOM] [decimal](18, 6) NULL,
	[CMI] [decimal](18, 6) NULL,
	[MPC] [decimal](18, 6) NULL,
	[NCSS] [decimal](18, 6) NULL,
	[NOAC] [decimal](18, 6) NULL,
	[NOAM] [decimal](18, 6) NULL,
	[NOA] [decimal](18, 6) NULL,
	[SIZE2] [decimal](18, 6) NULL,
	[NOC] [decimal](18, 6) NULL,
	[NOM] [decimal](18, 6) NULL,
	[NOO] [decimal](18, 6) NULL,
	[NOOM] [decimal](18, 6) NULL,
	[NOPA] [decimal](18, 6) NULL,
	[RFC] [decimal](18, 6) NULL,
	[TCC] [decimal](18, 6) NULL,
	[WOC] [decimal](18, 6) NULL,
	[WMC] [decimal](18, 6) NULL,
 CONSTRAINT [PK_CLASSES] PRIMARY KEY CLUSTERED 
(
	[id_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[METHODS]    Script Date: 4/12/2023 2:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[METHODS](
	[id_class] [bigint] NOT NULL,
	[id_method] [bigint] NOT NULL,
	[methodName] [nvarchar](max) NOT NULL,
	[CND] [decimal](18, 6) NULL,
	[CDISP] [decimal](18, 6) NULL,
	[CINT] [decimal](18, 6) NULL,
	[FDP] [decimal](18, 6) NULL,
	[HD] [decimal](18, 6) NULL,
	[HEF] [decimal](18, 6) NULL,
	[HER] [decimal](18, 6) NULL,
	[HL] [decimal](18, 6) NULL,
	[HVC] [decimal](18, 6) NULL,
	[HVL] [decimal](18, 6) NULL,
	[LOC] [decimal](18, 6) NULL,
	[LAA] [decimal](18, 6) NULL,
	[LND] [decimal](18, 6) NULL,
	[MMI] [decimal](18, 6) NULL,
	[MND] [decimal](18, 6) NULL,
	[CC] [decimal](18, 6) NULL,
	[NOAV] [decimal](18, 6) NULL,
	[NOL] [decimal](18, 6) NULL,
	[NOPM] [decimal](18, 6) NULL,
 CONSTRAINT [PK_METHODS] PRIMARY KEY CLUSTERED 
(
	[id_method] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACKAGES]    Script Date: 4/12/2023 2:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACKAGES](
	[id_package] [bigint] NOT NULL,
	[id_project] [bigint] NOT NULL,
	[packageName] [nvarchar](max) NOT NULL,
	[A] [decimal](18, 6) NULL,
	[Ca] [decimal](18, 6) NULL,
	[Ce] [decimal](18, 6) NULL,
	[PAHD] [decimal](18, 6) NULL,
	[PACHEF] [decimal](18, 6) NULL,
	[PACHER] [decimal](18, 6) NULL,
	[PACHL] [decimal](18, 6) NULL,
	[PACHVC] [decimal](18, 6) NULL,
	[PAHVL] [decimal](18, 6) NULL,
	[I] [decimal](18, 6) NULL,
	[PLOC] [decimal](18, 6) NULL,
	[PAMI] [decimal](18, 6) NULL,
	[PNCSS] [decimal](18, 6) NULL,
	[D] [decimal](18, 6) NULL,
	[PNOAC] [decimal](18, 6) NULL,
	[PNOCC] [decimal](18, 6) NULL,
	[PNOI] [decimal](18, 6) NULL,
	[PNOSC] [decimal](18, 6) NULL,
 CONSTRAINT [PK_PACKAGES] PRIMARY KEY CLUSTERED 
(
	[id_package] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROJECTS]    Script Date: 4/12/2023 2:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJECTS](
	[id_project] [bigint] NOT NULL,
	[projectName] [nvarchar](max) NOT NULL,
	[AHF] [decimal](18, 6) NULL,
	[AIF] [decimal](18, 6) NULL,
	[CF] [decimal](18, 6) NULL,
	[Effectiveness] [decimal](18, 6) NULL,
	[Extendibility] [decimal](18, 6) NULL,
	[Flexibility] [decimal](18, 6) NULL,
	[Functionality] [decimal](18, 6) NULL,
	[PRHD] [decimal](18, 6) NULL,
	[PRCHEF] [decimal](18, 6) NULL,
	[PRCHER] [decimal](18, 6) NULL,
	[PRCHL] [decimal](18, 6) NULL,
	[PRCHVC] [decimal](18, 6) NULL,
	[PRHVL] [decimal](18, 6) NULL,
	[PLOC] [decimal](18, 6) NULL,
	[PRMI] [decimal](18, 6) NULL,
	[MHF] [decimal](18, 6) NULL,
	[MIF] [decimal](18, 6) NULL,
	[PNCSS] [decimal](18, 6) NULL,
	[PNOAC] [decimal](18, 6) NULL,
	[PNOCC] [decimal](18, 6) NULL,
	[PNOI] [decimal](18, 6) NULL,
	[PNOSC] [decimal](18, 6) NULL,
	[PF] [decimal](18, 6) NULL,
	[Reusability] [decimal](18, 6) NULL,
	[Understandability] [decimal](18, 6) NULL,
 CONSTRAINT [PK_PROJECTS] PRIMARY KEY CLUSTERED 
(
	[id_project] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CLASSES]  WITH CHECK ADD  CONSTRAINT [FK_CLASSES_PACKAGES] FOREIGN KEY([id_package])
REFERENCES [dbo].[PACKAGES] ([id_package])
GO
ALTER TABLE [dbo].[CLASSES] CHECK CONSTRAINT [FK_CLASSES_PACKAGES]
GO
ALTER TABLE [dbo].[METHODS]  WITH CHECK ADD  CONSTRAINT [FK_METHODS_CLASSES] FOREIGN KEY([id_class])
REFERENCES [dbo].[CLASSES] ([id_class])
GO
ALTER TABLE [dbo].[METHODS] CHECK CONSTRAINT [FK_METHODS_CLASSES]
GO
ALTER TABLE [dbo].[PACKAGES]  WITH CHECK ADD  CONSTRAINT [FK_PACKAGES_PROJECTS] FOREIGN KEY([id_project])
REFERENCES [dbo].[PROJECTS] ([id_project])
GO
ALTER TABLE [dbo].[PACKAGES] CHECK CONSTRAINT [FK_PACKAGES_PROJECTS]
GO
