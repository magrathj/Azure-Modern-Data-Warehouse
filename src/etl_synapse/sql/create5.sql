CREATE TABLE Star.Stations (
    station_id VARCHAR(50) PRIMARY KEY NONCLUSTERED NOT ENFORCED, 
    station_name VARCHAR(75), 
    station_latitude FLOAT, 
    station_longitude FLOAT
);