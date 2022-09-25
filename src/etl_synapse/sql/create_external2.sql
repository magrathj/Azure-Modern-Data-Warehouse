CREATE EXTERNAL TABLE [ext].[payments] (
    payment_id INTEGER, 
    date DATE, 
    amount MONEY, 
    rider_id INTEGER
)
WITH (
    LOCATION = 'publicpayments.csv',
    DATA_SOURCE = [udacityStorageAccount],
    FILE_FORMAT = [scsvFile]
)