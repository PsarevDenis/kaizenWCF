USE [kaizenCommand]
GO
/****** Object:  User [kaizen]    Script Date: 19.09.2018 23:23:54 ******/
CREATE USER [kaizen] FOR LOGIN [kaizen] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [kaizen]
GO
/****** Object:  UserDefinedTableType [dbo].[MembersTableType]    Script Date: 19.09.2018 23:23:55 ******/
CREATE TYPE [dbo].[MembersTableType] AS TABLE(
	[Member] [nvarchar](1000) NOT NULL
)
GO
/****** Object:  Table [dbo].[Classifier]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classifier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommandType]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommandType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Event] [nvarchar](1000) NOT NULL,
	[RootCausesId] [int] NOT NULL,
	[Implementation] [bit] NOT NULL,
	[Responsible] [nvarchar](1000) NOT NULL,
	[PlanDate] [datetime] NOT NULL,
	[FaktDate] [datetime] NOT NULL,
	[Resource] [nvarchar](1000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goals]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WhatEliminate] [nvarchar](1000) NOT NULL,
	[Measure] [nvarchar](1000) NOT NULL,
	[Result] [nvarchar](1000) NOT NULL,
	[WhenGetResult] [nvarchar](1000) NOT NULL,
	[GoalText] [nvarchar](1000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KaizenCommand]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KaizenCommand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeaderId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DepartmnetId] [int] NOT NULL,
	[CommandTypeId] [int] NOT NULL,
	[Subject] [nvarchar](1000) NOT NULL,
	[CommandName] [nvarchar](1000) NOT NULL,
	[CommandEnd] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KaizenCommandEvent]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KaizenCommandEvent](
	[KaizenCommandId] [int] NOT NULL,
	[EventId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KaizenCommandGoal]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KaizenCommandGoal](
	[GoalId] [int] NOT NULL,
	[KaizenCommandId] [int] NOT NULL,
	[GoalAchieved] [bit] NOT NULL,
	[Comment] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KaizenCommandProblem]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KaizenCommandProblem](
	[KaizenCommandId] [int] NOT NULL,
	[ProblemId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[KaizenCommandId] [int] NOT NULL,
	[UsersId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Problems]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProblemText] [nvarchar](1000) NOT NULL,
	[WhatHappen] [nvarchar](1000) NOT NULL,
	[WhereHappen] [nvarchar](1000) NOT NULL,
	[WhenHappen] [nvarchar](1000) NOT NULL,
	[HowOften] [nvarchar](1000) NOT NULL,
	[HowDoYouKnow] [nvarchar](1000) NOT NULL,
	[WhyImportant] [nvarchar](1000) NOT NULL,
	[WasWorked] [bit] NOT NULL,
	[Effect] [nvarchar](1000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProblemsAdditional]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProblemsAdditional](
	[ProblemId] [int] NOT NULL,
	[HowSolveProblem] [nvarchar](1000) NOT NULL,
	[WhatIdeasIdWorked] [int] NOT NULL,
	[WhyIdeasNotImplemanted] [nvarchar](1000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProblemsFakt]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProblemsFakt](
	[ProblemId] [int] NOT NULL,
	[Fakt1] [nvarchar](1000) NOT NULL,
	[Fakt2] [nvarchar](1000) NULL,
	[Fakt3] [nvarchar](1000) NULL,
	[Fakt4] [nvarchar](1000) NULL,
	[Fakt5] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RootCauses]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RootCauses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProblemId] [int] NOT NULL,
	[Cause] [nvarchar](1000) NOT NULL,
	[СlassifierId] [int] NOT NULL,
	[Prioritizing] [real] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[SecondName] [nvarchar](256) NOT NULL,
	[ThirdName] [nvarchar](256) NOT NULL,
	[PositionId] [int] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Login] [nvarchar](256) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetClassifier]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClassifier]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Classifier;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCommandType]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCommandType]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM CommandType;
END
GO
/****** Object:  StoredProcedure [dbo].[GetDepartment]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDepartment]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Department;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEvent]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEvent]
	-- Add the parameters for the stored procedure here
	@eventId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT 
	
		ev.Id,
		ev.Event,
		rC.Cause,
		ev.Implementation,
		ev.Responsible,
		ev.PlanDate,
		ev.FaktDate,
		ev.Resource

	FROM [Events] AS ev
	INNER JOIN RootCauses AS rC ON rC.Id = ev.RootCausesId
	WHERE ev.Id = @eventId
END
GO
/****** Object:  StoredProcedure [dbo].[GetFio]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetFio]
	-- Add the parameters for the stored procedure here
	@PartialName varchar (258)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare       
		@vLastName varchar(86),      
		@vFirstName varchar(86),      
		@vMiddleName varchar(86),      
		@vSubstring varchar(258),      
		@idx int,      
		@Result bit      
      
	-- Замена "." на пробел  и замена всех двойных пробелов одинарным, удаление пробела в начале и конце      
	SELECT @vSubstring = LTRIM(RTRIM(replace(replace(replace(replace(@PartialName,'.',' '),'  ',' '+CHAR(1)), CHAR(1)+' ',''), CHAR(1),'')))      
      
	select  @vFirstName  =NULL,      
			@vMiddleName =NULL      
      
	-- @vSubstring содержит Ф[И[O]]      
	-- Отделим фамилию по пробелу первого слова        
	set @idx = CHARINDEX (' ',@vSubstring)       
	if (@idx = 0 )       
		-- Только фамилия      
		set @vLastName = @vSubstring      
	else begin       
		select @vLastName  = SUBSTRING(@vSubstring ,1,@idx-1)      
		select @vSubstring = SUBSTRING(@vSubstring ,@idx+1 , LEN(@vSubstring)-@idx+1)      
		-- @vSubstring содержит И[O] , Разделитель может быть , а Может и не быть       
		declare @iCh int,      
		@cCh nchar(1)      
		set @iCh = 2      
		while (@iCh <= LEN(@vSubstring) ) begin      
		select @cCh = substring(@vSubstring,@iCh,1)      
		if ( UNICODE(UPPER(@cCh) ) = UNICODE(@cCh) )  begin -- Верхний символ          
		select  @vFirstName   = LTRIM(RTRIM(substring (@vSubstring,1,@iCh-1)))      
		select  @vMiddleName = LTRIM(RTRIM(substring (@vSubstring,@iCh,LEN(@vSubstring)-@iCh+1)))      
		break      
		end      
		set @iCh = @iCh+1      
		end      
		if ( @vFirstName IS NULL )      
		select @vFirstName = @vSubstring      
	end      

	SELECT  @vLastName AS LastName,      
		@vFirstName AS FirstName,      
		@vMiddleName AS MiddleName
END
GO
/****** Object:  StoredProcedure [dbo].[GetGoals]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetGoals]
	-- Add the parameters for the stored procedure here
	@goalId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 

		goals.WhatEliminate,
		goals.Measure,
		goals.Result,
		goals.WhenGetResult,
		goals.GoalText

	FROM Goals AS goals
	WHERE goals.Id = @goalId
END
GO
/****** Object:  StoredProcedure [dbo].[GetKaizenCommand]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetKaizenCommand]
	-- Add the parameters for the stored procedure here
	@commandId int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @commandId = NULL

		SELECT KC.Id,KC.CommandName FROM KaizenCommand AS KC

	ELSE

		SELECT 
			DEP.Name AS department,
			KC.CommandName AS commandName,
			Customer.SecondName + ' ' + Customer.FirstName + ' ' + Customer.ThirdName + ', ' + CustPos.Name AS customer,
			Leader.SecondName + ' ' + Leader.FirstName + ' ' + Leader.ThirdName + ', ' + LeaderPos.Name AS leader,
			cT.Name AS commandType,
			KC.Subject AS subject
		FROM KaizenCommand AS KC
		INNER JOIN Department AS DEP ON DEP.Id = KC.DepartmnetId
		INNER JOIN Users AS Customer ON Customer.Id = KC.CustomerId
		INNER JOIN Users AS Leader ON Leader.Id = KC.LeaderId
		INNER JOIN Positions AS CustPos ON CustPos.Id = Customer.PositionId
		INNER JOIN Positions AS LeaderPos ON LeaderPos.Id = Leader.PositionId
		INNER JOIN CommandType AS cT ON cT.id = KC.CommandTypeId
		WHERE KC.Id = @commandId

END
GO
/****** Object:  StoredProcedure [dbo].[GetKaizenCommandMembers]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetKaizenCommandMembers]
	-- Add the parameters for the stored procedure here
	@commandId int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT 

		Users.SecondName + ' ' + Users.FirstName + ' ' + Users.ThirdName + ', ' + Positions.Name As member

	FROM Members AS mem
	INNER JOIN Users AS Users ON Users.Id = mem.UsersId
	INNER JOIN Positions AS Positions ON Positions.Id = Users.PositionId
	WHERE mem.KaizenCommandId = @commandId
END
GO
/****** Object:  StoredProcedure [dbo].[GetListEvents]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetListEvents]
	-- Add the parameters for the stored procedure here
	@commandId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
	
		ev.Id,
		ev.Event,
		rC.Cause,
		ev.Implementation,
		ev.Responsible,
		ev.PlanDate,
		ev.FaktDate,
		ev.Resource

	FROM [Events] AS ev
	INNER JOIN KaizenCommandEvent AS kCE ON kCE.KaizenCommandId = @commandId
	INNER JOIN RootCauses AS rC ON rC.Id = ev.RootCausesId
END
GO
/****** Object:  StoredProcedure [dbo].[GetListGoals]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetListGoals] 
	-- Add the parameters for the stored procedure here
	@commandId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT 

		goals.Id,
		goals.WhatEliminate,
		goals.Measure,
		goals.Result,
		goals.WhenGetResult

	FROM Goals AS goals
	INNER JOIN KaizenCommandGoal AS kCG ON kCG.KaizenCommandId = @commandId
END
GO
/****** Object:  StoredProcedure [dbo].[GetListProblem]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetListProblem]
	@commandId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		problems.Id,
		problems.ProblemText
	FROM KaizenCommandProblem AS kCP
	INNER JOIN Problems AS problems ON problems.Id = kCP.ProblemId
	
	WHERE kCP.KaizenCommandId = @commandId
END
GO
/****** Object:  StoredProcedure [dbo].[GetListRootCauses]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetListRootCauses]
	@problemId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT rc.Id,rc.Cause FROM RootCauses AS rc
	WHERE rc.ProblemId = @problemId
END
GO
/****** Object:  StoredProcedure [dbo].[GetProblem]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProblem]
	-- Add the parameters for the stored procedure here
	@problemId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
	
		prob.ProblemText,
		prob.WhatHappen,
		prob.WhereHappen,
		prob.WhenHappen,
		prob.HowOften,
		prob.HowDoYouKnow,
		prob.WhyImportant,
		prob.WasWorked,
		prob.Effect,
		pF.Fakt1,
		pF.Fakt2,
		pF.Fakt3,
		pF.Fakt4,
		pF.Fakt5,
		pA.HowSolveProblem,
		pA.WhatIdeasIdWorked,
		pA.WhyIdeasNotImplemanted
	 
	FROM Problems AS prob
	INNER JOIN ProblemsFakt AS pF ON pF.ProblemId = prob.Id
	INNER JOIN ProblemsAdditional AS pA ON pA.ProblemId = prob.Id

END
GO
/****** Object:  StoredProcedure [dbo].[GetRootCauses]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRootCauses]
	@idCause int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT rc.Cause,cl.Name AS Classifier,rc.Prioritizing FROM RootCauses AS rc
	INNER JOIN Classifier AS cl ON cl.Id = rc.СlassifierId
	WHERE rc.Id = @idCause
END
GO
/****** Object:  StoredProcedure [dbo].[SetCommandMembers]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetCommandMembers]
	-- Add the parameters for the stored procedure here
	@members MembersTableType Readonly,
	@commandId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @FIO nvarchar(256),
	@position nvarchar(256),
	@memberId int,
	@positionId int
	
	DECLARE @FioTable AS Table(LastName nvarchar(86), FirstName nvarchar(86), MiddleName nvarchar(86))

	declare @MemberEnumerator CURSOR

	SET @MemberEnumerator = CURSOR LOCAL FAST_FORWARD FOR
	select *
	from @members

	OPEN @MemberEnumerator

	declare @member nvarchar(1000)

	while (1=1)
	begin
		 FETCH NEXT FROM @MemberEnumerator into @member
		 if (@@FETCH_STATUS <> 0) break
 
		SELECT @FIO = SUBSTRING(@member,1,CHARINDEX(',',@member) - 1);
		SELECT @position = SUBSTRING(@member,CHARINDEX(',',@member)+1,LEN(@member) - CHARINDEX(',',@member));
		
		IF EXISTS(SELECT * FROM Positions WHERE Positions.Name = @position)
			SET @positionId = (SELECT Id FROM Positions WHERE Positions.Name = @position);
		ELSE
		BEGIN
			INSERT INTO Positions VALUES(@position);
			SET @positionId = @@IDENTITY;
		END
		
		INSERT into @FioTable 
		EXEC GetFio @FIO	

		IF EXISTS(
			SELECT * FROM Users AS Users 
			INNER JOIN @FioTable AS fio ON 
				Users.FirstName = fio.FirstName and 
				Users.SecondName = fio.LastName and 
				Users.ThirdName = fio.MiddleName and 
				Users.PositionId = @positionId)

			SET @memberId = (SELECT id FROM Users AS Users 
				INNER JOIN @FioTable AS fio ON 
					Users.FirstName = fio.FirstName and 
					Users.SecondName = fio.LastName and 
					Users.ThirdName = fio.MiddleName and 
					Users.PositionId = @positionId)
		ELSE
		BEGIN
			INSERT INTO Users VALUES(
				(SELECT FirstName FROM @FioTable),
				(SELECT LastName FROM @FioTable),
				(SELECT MiddleName FROM @FioTable),
				@positionId,
				'email',
				'login');
			SET @memberId = @@IDENTITY;
		END

		IF NOT EXISTS (SELECT * FROM Members WHERE Members.KaizenCommandId = @commandId and Members.UsersId = @memberId)
			INSERT INTO Members VALUES(@commandId,@memberId);
	end

	CLOSE @MemberEnumerator
	DEALLOCATE @MemberEnumerator
	
END
GO
/****** Object:  StoredProcedure [dbo].[SetEvent]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetEvent]
	-- Add the parameters for the stored procedure here
	@event nvarchar(1000),
	@rootCauseId int,
	@Implemantation bit,
	@responsible nvarchar(1000),
	@planDate datetime,
	@faktDate datetime,
	@resource nvarchar(1000),
	@commandId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @eventId int

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT * FROM [Events] AS ev WHERE ev.Event = @event and ev.RootCausesId = @rootCauseId)
	BEGIN
		INSERT INTO [Event] VALUES(@event,@rootCauseId,@Implemantation,@responsible,@planDate,@faktDate,@resource);
		SET @eventId = (SELECT @@IDENTITY);
	END
	ELSE
		SET @eventId = (SELECT ev.Id FROM [Events] AS ev WHERE ev.Event = @event and ev.RootCausesId = @rootCauseId);

	IF NOT EXISTS(SELECT * FROM KaizenCommandEvent AS kCE WHERE kCE.KaizenCommandId = @commandId and kCE.EventId = @eventId)
		INSERT INTO KaizenCommandEvent VALUES(@commandId,@eventId);
END
GO
/****** Object:  StoredProcedure [dbo].[SetGoals]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetGoals] 
	@whatEliminate nvarchar(1000),
	@measure nvarchar(1000),
	@result nvarchar(1000),
	@whenGetResult nvarchar(1000),
	@goalText nvarchar(1000),
	@commandId int,
	@goalAchieved bit,
	@comment nvarchar(1000)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @goalId int

    IF NOT EXISTS(SELECT * FROM Goals AS goals WHERE  goals.WhatEliminate = @whatEliminate and goals.Measure = @measure and goals.Result = @result and goals.WhenGetResult = @whenGetResult and goals.GoalText = @goalText)
	BEGIN	
		INSERT INTO Goals VALUES(@whatEliminate,@measure,@result,@whenGetResult,@goalText);
		SET @goalId = (SELECT @@IDENTITY);
	END
	ELSE
		SET @goalId = (SELECT goals.Id FROM Goals AS goals WHERE  goals.WhatEliminate = @whatEliminate and goals.Measure = @measure and goals.Result = @result and goals.WhenGetResult = @whenGetResult and goals.GoalText = @goalText)

	IF NOT EXISTS(SELECT * FROM KaizenCommandGoal AS kCG WHERE kCG.KaizenCommandId = @commandId and kCG.GoalId = @goalId)
		INSERT INTO KaizenCommandGoal VALUES(@goalId,@commandId,@goalAchieved,@comment);
END
GO
/****** Object:  StoredProcedure [dbo].[SetKaizenCommand]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetKaizenCommand]
	-- Add the parameters for the stored procedure here
	@leader nvarchar(1000),
	@customer nvarchar(1000),
	@departmentName nvarchar(1000),
	@commandName nvarchar(1000),
	@commandTypeId int,
	@subject nvarchar(1000),
	@commandId int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @FIOLeader nvarchar(256),
	@positionLeader nvarchar(256),
	@FIOcustomer nvarchar(256),
	@positioncustomer nvarchar(256),
	@positionLeaderId int,
	@positioncustomerId int,
	@customerId int,
	@leaderId int,
	@departmentId int
	
	DECLARE @FioTable AS Table(LastName nvarchar(86), FirstName nvarchar(86), MiddleName nvarchar(86))

	IF @commandId = NULL
	BEGIN

		IF EXISTS(SELECT * FROM Department AS dep WHERE dep.Name = @departmentName)
			SET @departmentId = (SELECT dep.id FROM Department AS dep WHERE dep.Name = @departmentName);	
		ELSE
		BEGIN 
			INSERT INTO Department VALUES(@departmentName);
			SET @departmentId = @@IDENTITY;
		END

		SELECT @FIOLeader = SUBSTRING(@leader,1,CHARINDEX(',',@leader) - 1);
		SELECT @positionLeader = SUBSTRING(@leader,CHARINDEX(',',@leader)+1,LEN(@leader) - CHARINDEX(',',@leader));

		SELECT @FIOcustomer = SUBSTRING(@customer,1,CHARINDEX(',',@customer) - 1);
		SELECT @positioncustomer = SUBSTRING(@customer,CHARINDEX(',',@customer)+1,LEN(@customer) - CHARINDEX(',',@customer));

		IF EXISTS(SELECT * FROM Positions WHERE Positions.Name = @positionLeader)
			SET @positionLeaderId = (SELECT Id FROM Positions WHERE Positions.Name = @positionLeader);
		ELSE
		BEGIN
			INSERT INTO Positions VALUES(@positionLeader);
			SET @positionLeaderId = @@IDENTITY;
		END

		IF EXISTS(SELECT * FROM Positions WHERE Positions.Name = @positioncustomer)
			SET @positioncustomerId = (SELECT Id FROM Positions WHERE Positions.Name = @positioncustomer);
		ELSE
		BEGIN
			INSERT INTO Positions VALUES(@positioncustomer);
			SET @positioncustomerId = @@IDENTITY;
		END

		INSERT into @FioTable 
		EXEC GetFio @FIOLeader	

		IF EXISTS(
			SELECT * FROM Users AS Users 
			INNER JOIN @FioTable AS fio ON 
				Users.FirstName = fio.FirstName and 
				Users.SecondName = fio.LastName and 
				Users.ThirdName = fio.MiddleName and 
				Users.PositionId = @positionLeaderId)

			SET @leaderId = (SELECT id FROM Users AS Users 
				INNER JOIN @FioTable AS fio ON 
					Users.FirstName = fio.FirstName and 
					Users.SecondName = fio.LastName and 
					Users.ThirdName = fio.MiddleName and 
					Users.PositionId = @positionLeaderId)
		ELSE
		BEGIN
			INSERT INTO Users VALUES(
				(SELECT FirstName FROM @FioTable),
				(SELECT LastName FROM @FioTable),
				(SELECT MiddleName FROM @FioTable),
				@positionLeaderId,
				'email',
				'login');
			SET @leaderId = @@IDENTITY;
		END

		DELETE FROM @FioTable;

		INSERT into @FioTable 
		EXEC GetFio @FIOcustomer	

		IF EXISTS(
			SELECT * FROM Users AS Users 
			INNER JOIN @FioTable AS fio ON 
				Users.FirstName = fio.FirstName and 
				Users.SecondName = fio.LastName and 
				Users.ThirdName = fio.MiddleName and 
				Users.PositionId = @positioncustomerId)

			SET @customerId = (SELECT id FROM Users AS Users 
				INNER JOIN @FioTable AS fio ON 
					Users.FirstName = fio.FirstName and 
					Users.SecondName = fio.LastName and 
					Users.ThirdName = fio.MiddleName and 
					Users.PositionId = @positioncustomerId)
		ELSE
		BEGIN
			INSERT INTO Users VALUES(
				(SELECT FirstName FROM @FioTable),
				(SELECT LastName FROM @FioTable),
				(SELECT MiddleName FROM @FioTable),
				@positioncustomerId,
				'email',
				'login');
			SET @customerId = @@IDENTITY;
		END

		DELETE FROM @FioTable;

		IF EXISTS(SELECT * FROM KaizenCommand AS KC WHERE KC.CommandName = @commandName and Kc.Subject = @subject)
			UPDATE KaizenCommand
			SET CommandName = @commandName, Subject = @subject, LeaderId = @leaderId, CustomerId = @customerId, DepartmnetId = @departmentId, CommandEnd = 0, CommandTypeId = @commandTypeId
			WHERE CommandName = @commandName and Subject = @subject
		ELSE
			INSERT INTO KaizenCommand VALUES(
			@leaderId,@customerId,@departmentId,@commandTypeId,@subject,@commandName,0)

			SELECT @@IDENTITY
	END
	ELSE

		IF EXISTS(SELECT * FROM KaizenCommand AS KC WHERE KC.id = @commandId)
			UPDATE KaizenCommand
			SET CommandName = @commandName, Subject = @subject, LeaderId = @leaderId, CustomerId = @customerId, DepartmnetId = @departmentId, CommandEnd = 0, CommandTypeId = @commandTypeId
			WHERE CommandName = @commandName and Subject = @subject
		ELSE
			INSERT INTO KaizenCommand VALUES(
			@leaderId,@customerId,@departmentId,@commandTypeId,@subject,@commandName,0)

			SELECT @@IDENTITY

END
GO
/****** Object:  StoredProcedure [dbo].[SetProblems]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetProblems] 
	@problemText nvarchar(1000),
	@whatHappen nvarchar(1000),
	@whereHappen nvarchar(1000),
	@whenHappen nvarchar(1000),
	@howOften nvarchar(1000),
	@howDoYouKnow nvarchar(1000),
	@whyImportant nvarchar(1000),
	@wasWarked bit,
	@effect nvarchar(1000),
	@fakt1 nvarchar(1000),
	@fakt2 nvarchar(1000),
	@fakt3 nvarchar(1000),
	@fakt4 nvarchar(1000),
	@fakt5 nvarchar(1000),
	@howSolveProblem nvarchar(1000),
	@whatIdeasIdWorked nvarchar(1000),
	@whyIdeasNotImplemanted nvarchar(1000),
	@commandId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @problemId int

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT * FROM Problems AS pr WHERE pr.ProblemText = @problemText)
	BEGIN
		INSERT INTO Problems VALUES (@problemText,@whatHappen,@whereHappen,@whenHappen,@howOften,@howDoYouKnow,@whyImportant,@wasWarked,@effect)
		SET @problemId = (SELECT @@IDENTITY)
	END

	IF NOT EXISTS(SELECT * FROM ProblemsAdditional AS pA WHERE pA.ProblemId = @problemId)
		INSERT INTO ProblemsAdditional VALUES(@problemId,@howSolveProblem,@whatIdeasIdWorked,@whyIdeasNotImplemanted)
	ELSE
		UPDATE ProblemsAdditional SET HowSolveProblem = @howSolveProblem, WhatIdeasIdWorked = @whatIdeasIdWorked, WhyIdeasNotImplemanted = @whyIdeasNotImplemanted
		WHERE ProblemId = @problemId

	IF NOT EXISTS(SELECT * FROM ProblemsFakt AS pK WHERE pk.ProblemId = @problemId)
		INSERT INTO ProblemsFakt VALUES(@problemId,@fakt1,@fakt2,@fakt3,@fakt4,@fakt5)
	ELSE
		UPDATE ProblemsFakt SET Fakt1 = @fakt1,Fakt2 = @fakt2,Fakt3 = @fakt3,Fakt4 = @fakt4,Fakt5 = @fakt5
		WHERE ProblemId = @problemId

	IF NOT EXISTS(SELECT * FROM KaizenCommandProblem AS kCP WHERE kCP.KaizenCommandId = @commandId and kCP.ProblemId = @problemId)
		INSERT INTO KaizenCommandProblem VALUES (@commandId, @problemId)


END
GO
/****** Object:  StoredProcedure [dbo].[SetRootCauses]    Script Date: 19.09.2018 23:23:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetRootCauses]
	@problemId int,
	@cause nvarchar(1000),
	@classifier nvarchar(1000),
	@prioriti real
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @classId int

	IF NOT EXISTS (SELECT * FROM Classifier AS class WHERE class.Name = @classifier)
	BEGIN
		INSERT INTO Classifier VALUES(@classifier);
		SET @classId = (SELECT @@IDENTITY);
	END
	ELSE
		SET @classId = (SELECT class.Id FROM Classifier AS class WHERE class.Name = @classifier);

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT * FROM RootCauses AS rc WHERE rc.ProblemId = @problemId and rc.Cause = @cause)
		INSERT INTO RootCauses VALUES(@problemId,@cause,@classId,@prioriti);
	ELSE
		UPDATE RootCauses SET СlassifierId = @classId, Prioritizing = @prioriti
		WHERE ProblemId = @problemId and Cause = @cause;
END
GO
