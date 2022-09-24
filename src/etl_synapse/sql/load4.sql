INSERT INTO [star].[TripDetails]
SELECT DISTINCT
    t.trip_id,
    r.rider_id,
    r.address,
    r.first, 
    r.last, 
    r.birthday, 
    r.is_member,
    Convert(INT, CONVERT(varchar(10), r.account_start_date, 112)),
    Convert(INT, CONVERT(varchar(10), r.account_end_date, 112)),
    t.rideable_type,
    s1.name,
    s1.latitude,
    s1.longitude,
    s2.name,
    s2.latitude,
    s2.longitude
FROM trips t
JOIN riders r 
ON t.rider_id = r.rider_id
JOIN stations s1
ON s1.station_id = t.start_station_id
JOIN stations s2
ON s2.station_id = t.end_station_id

