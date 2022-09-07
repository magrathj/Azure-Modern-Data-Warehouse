import os
from pathlib import Path

os.environ['HOME'] = ""
    
#Set path
schema_path = Path(
        os.environ['HOME'],
        'src',
        'schemas',
        'postgres',
        'schemas.yaml'
    )
data_path =  Path(
        os.environ['HOME'],
        'data'
    )

#Set db variables
host='localhost'
port=54320
dbname='ht_db'
user='postgres'