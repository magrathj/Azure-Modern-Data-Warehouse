# https://stackoverflow.com/questions/17261061/execute-sql-schema-in-psycopg2-in-python

import pyodbc
from config import *


def set_up(connection):
    print("""Setup started.""")
    for script in create_scripts_config:
        print(f"Running script {script}")
        with connection as cursor:
            script_location = script_path.joinpath(f"{script}")
            cursor.execute(open(script_location, "r").read())
        print(f"Completed script {script}")
    
def load_tables(connection):
    print("""Load started.""")
    for script in load_scripts_config:
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
    set_up(connection)


