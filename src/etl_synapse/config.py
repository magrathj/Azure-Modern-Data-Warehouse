import os
from pathlib import Path

os.environ['HOME'] = ""
    
#Set path
schema_path = Path(
        os.environ['HOME'],
        'src',
        'schemas',
        'synapse',
        'schemas.yaml'
    )

#Set db variables
host='localhost'
port=54320
dbname='ht_db'
user='postgres'