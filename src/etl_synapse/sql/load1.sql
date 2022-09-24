DECLARE @StartDate DATETIME = '01/01/2013' --Starting value of Date Range
DECLARE @EndDate DATETIME = '12/31/2022' --End Value of Date Range
DECLARE @CurrentDate AS DATETIME = @StartDate

WHILE @CurrentDate < @EndDate
BEGIN

    INSERT INTO [star].[Date]
    SELECT
        Convert(INT, CONVERT(varchar(10), @CurrentDate, 112)) as date_id,
        DAY(@CurrentDate) AS [day],
        MONTH(@CurrentDate) AS [month],
        YEAR(@CurrentDate) AS [year],
        DATEPART(DW, @CurrentDate) AS [day_of_week]
    SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END
