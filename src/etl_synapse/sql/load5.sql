INSERT INTO [star].[Stations]
SELECT DISTINCT
    station_id,
    s.name,
    s.latitude,
    s.longitude
FROM stations s

