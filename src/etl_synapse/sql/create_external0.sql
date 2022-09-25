
CREATE DATABASE SCOPED CREDENTIAL udacityCrediential
WITH IDENTITY = 'udacitystorageacc',
  SECRET = '[ACCESS_KEY]';

CREATE EXTERNAL DATA SOURCE udacityStorageAccount
WITH (
    TYPE = HADOOP,
    LOCATION = 'abfss://udacitystoragedatalake@udacitystorageacc.dfs.core.windows.net',
    CREDENTIAL = udacityCrediential
);

CREATE EXTERNAL FILE FORMAT [scsvFile] 
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = N',',
        STRING_DELIMITER = N'"',
        FIRST_ROW=2,
        USE_TYPE_DEFAULT=False
    );