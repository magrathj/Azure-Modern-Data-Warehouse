import os
from pathlib import Path

os.environ['HOME'] = ""
    

script_path =  Path(
        os.environ['HOME'],
        'src',
        'etl_synapse'
    )

create_scripts_config = [
    'sql/create0.sql',
    'sql/create1.sql',
    'sql/create2.sql',
    'sql/create3.sql',
    'sql/create4.sql',
    'sql/create5.sql',
    'sql/create6.sql'
]
drop_scripts_config = [
    'sql/drop1.sql',
    'sql/drop2.sql',
    'sql/drop3.sql',
    'sql/drop4.sql',
    'sql/drop5.sql',
    'sql/drop6.sql',
    'sql/drop0.sql'
]

load_scripts_config = [
    'sql/load1.sql',
    'sql/load2.sql',
    'sql/load3.sql',
    'sql/load4.sql',
    'sql/load5.sql',
    'sql/load6.sql'
]

#Set db variables
driver='{ODBC Driver 17 for SQL Server}'
server='[HOSTNAME].sql.azuresynapse.net'
dbname='[DATABASE_NAME]'
user='[USER_NAME]'
password='[PASSWORD]'