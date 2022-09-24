DECLARE @Time as time;
SET @Time = '0:00';
 
DECLARE @counter as int;
SET @counter = 0;
 
 
-- Two variables to store the day part for two languages
DECLARE @daypartEN as varchar(20);
set @daypartEN = '';
 
DECLARE @daypartNL as varchar(20);
SET @daypartNL = '';
 
 
-- Loop 1440 times (24hours * 60minutes)
WHILE @counter < 1440
BEGIN
 
    INSERT INTO [star].[Time]
    SELECT
        ((DATEPART(hour, @Time) * 3600) + (DATEPART(minute, @Time) * 60) + DATEPART(second, @Time)) as time_id,
        DATEPART(HOUR, @Time) AS [hour],
        DATEPART(MINUTE, @Time) AS [minute],
        DATEPART(SECOND, @Time) AS [second]
 
    -- Raise time with one minute
    SET @Time = DATEADD(minute, 1, @Time);
 
    -- Raise counter by one
    set @counter = @counter + 1;
END




