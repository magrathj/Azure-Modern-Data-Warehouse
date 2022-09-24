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
    'sql/create5.sql'
]

load_scripts_config = [
    'sql/load1.sql',
    'sql/load2.sql',
    'sql/load3.sql',
    'sql/load4.sql',
    'sql/load5.sql'
]

#Set db variables
driver='{ODBC Driver 17 for SQL Server}'
server='[].sql.azuresynapse.net'
dbname=''
user=''
password=''
