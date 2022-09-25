INSERT INTO [star].[TripDetails]
SELECT DISTINCT
    station_id,
    s.name,
    s.latitude,
    s.longitude
FROM stations s

