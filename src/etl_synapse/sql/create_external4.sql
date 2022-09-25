CREATE EXTERNAL TABLE [ext].[stations] (
    station_id VARCHAR(50), 
    name VARCHAR(75), 
    latitude FLOAT, 
    longitude FLOAT
)
WITH (
    LOCATION = 'publicstations.csv',
    DATA_SOURCE = [udacityStorageAccount],
    FILE_FORMAT = [scsvFile]
)