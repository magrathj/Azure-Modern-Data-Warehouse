CREATE EXTERNAL TABLE [ext].[riders] (
    rider_id INTEGER, 
    first VARCHAR(50), 
    last VARCHAR(50), 
    address VARCHAR(100), 
    birthday DATE, 
    account_start_date DATE, 
    account_end_date DATE, 
    is_member BIT
)
WITH (
    LOCATION = 'publicriders.csv',
    DATA_SOURCE = [udacityStorageAccount],
    FILE_FORMAT = [scsvFile]
)
