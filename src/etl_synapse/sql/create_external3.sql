CREATE EXTERNAL TABLE [ext].[trips] (
    trip_id VARCHAR(50), 
    rideable_type VARCHAR(75), 
    start_at VARCHAR(50), 
    ended_at VARCHAR(50), 
    start_station_id VARCHAR(50), 
    end_station_id VARCHAR(50), 
    rider_id INTEGER
)
WITH (
    LOCATION = 'publictrips.csv',
    DATA_SOURCE = [udacityStorageAccount],
    FILE_FORMAT = [scsvFile]
)