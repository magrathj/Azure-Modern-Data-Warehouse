# https://stackoverflow.com/questions/17261061/execute-sql-schema-in-psycopg2-in-python

import pyodbc
from config import *


def run_scripts(connection, config):
    print(f"""Starting {config.__getattribute__} """)
    for script in config:
        print(f"Running script {script}")
        with connection as cursor:
            script_location = script_path.joinpath(f"{script}")
            cursor.execute(open(script_location, "r").read())
        print(f"Completed script {script}")


if __name__ == '__main__':
    # DB connection
    print("""Establishing connection with DRIVER={};User={};Password={};Server={};Database={};""".format(driver, user, password, server, dbname))
    connection = pyodbc.connect('DRIVER='+driver+';SERVER=tcp:'+server+';PORT=1433;DATABASE='+dbname+';UID='+user+';PWD='+ password+";Trusted_Connection = yes;")
    connection.autocommit = True
    # Run drop script 
    run_scripts(connection, drop_scripts_config)
    # Run set up scripts
    run_scripts(connection, create_scripts_config)
    # Run load scripts
    run_scripts(connection, load_scripts_config)


