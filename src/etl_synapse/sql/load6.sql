INSERT INTO [star].[Trip]
SELECT DISTINCT
    t.trip_id,
    1,
    ((DATEPART(hour, convert(DATETIME, start_at + ':00', 103)) * 3600) + (DATEPART(minute, convert(DATETIME, start_at + ':00', 103)) * 60) + DATEPART(second, convert(DATETIME, start_at + ':00', 103))),
    Convert(INT, CONVERT(varchar(10), convert(DATE, t.start_at + ':00', 103), 112)),
    ((DATEPART(hour, convert(DATETIME, t.ended_at + ':00', 103)) * 3600) + (DATEPART(minute, convert(DATETIME, t.ended_at + ':00', 103)) * 60) + DATEPART(second, convert(DATETIME, t.ended_at + ':00', 103))), 
    Convert(INT, CONVERT(varchar(10), convert(DATE, t.ended_at + ':00', 103), 112)),
    ((DATEPART(hour, convert(DATETIME, ended_at + ':00', 103)) * 3600) + (DATEPART(minute, convert(DATETIME, ended_at + ':00', 103)) * 60) + DATEPART(second, convert(DATETIME, ended_at + ':00', 103))) - ((DATEPART(hour, convert(DATETIME, start_at + ':00', 103)) * 3600) + (DATEPART(minute, convert(DATETIME, start_at + ':00', 103)) * 60) + DATEPART(second, convert(DATETIME, start_at + ':00', 103))),
    r.rider_id,
    t.rideable_type,
    t.start_station_id,
    t.end_station_id
FROM trips t
JOIN riders r 
ON t.rider_id = r.rider_id