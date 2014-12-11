﻿USE AdventureWorks2012
-- The following Sql must be run against AdventureWorks2012 for the tests to compile.

DROP PROCEDURE MyProc
DROP PROCEDURE SingleElementProc
DROP PROCEDURE [Init]
DROP PROCEDURE [Get]
DROP PROCEDURE [Swap]
DROP TYPE MyTableType
DROP TYPE SingleElementType
GO

create procedure [dbo].[Swap]
	@input int = 4 ,
	@bitWithDefault bit = 1,
    @output int output,
	@nullOutput bit output,
	@nullStringOutput varchar output
as
begin
	set @output = @input
	return @input
end
go

CREATE TYPE Person.MyTableType AS TABLE (myId int not null, myName nvarchar(30) null)
GO

CREATE PROCEDURE Person.MyProc @p1 MyTableType readonly AS
BEGIN
   SELECT * from @p1 p
END
GO

CREATE TYPE SingleElementType AS TABLE (myId int not null)
GO

CREATE PROCEDURE SingleElementProc @p1 SingleElementType readonly AS
BEGIN
   SELECT * from @p1 p
END
GO

create procedure [Init]
AS
begin
    exec sp_getapplock 
        @Resource = 'R',
        @LockMode = 'Exclusive',
        @LockOwner = 'Session',
        @LockTimeout = -1;
END
GO

create procedure [Get]
as
begin
    create table #result (id  uniqueidentifier not null)
    select * from #result
end


CREATE TYPE [dbo].[u_int64] FROM NUMERIC (20) NOT NULL;