import string
import psycopg2 as pg
import yaml
from pathlib import Path
import os
import pandas as pd
import configparser
from config import *

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


def load_config() -> list:
    with open(schema_path) as schema_file:
        config = yaml.load(schema_file)
    return config

def create_tables(config: list, connection: pg.extensions.connection):
    cur = connection.cursor()
    for table in config:
        name = table.get('name')
        schema = table.get('schema')
        ddl = f"""CREATE TABLE IF NOT EXISTS {name} ({schema})"""
        cur.execute(ddl)
        print("""Created {} table.""".format(name))

    connection.commit()
    print("""Commited all creations.""")


def create_database(database_name: string, connection: pg.extensions.connection):
    print("""Creating database: {}.""".format(database_name))
    # establish connection
    cursor = connection.cursor()
    # drop old db if it exists and create new one
    cursor.execute(f'DROP DATABASE IF EXISTS {database_name}')
    cursor.execute(f"CREATE DATABASE {database_name}")
    print("""Created database: {}.""".format(database_name))
    # clean up
    connection.commit()
    cursor.close()
    connection.close()
    print("""Close connection """)

def set_up(default_dbname = "postgres"):
    # DB connection
    print("""Setup started.""")
    print("""Establishing connection to postgres {} listening on {}, port {} with user name: {}.""".format(default_dbname, host, port, user))
    connection = pg.connect(
        host=host,
        port=port,
        dbname=default_dbname,
        user=user
    )
    create_database(database_name=dbname, connection=connection)
    print("""Setup completed""")

def etl():
    # DB connection
    print("""ETL started.""")
    print("""Establishing connection to database {} listening on {}, port {} with user name: {}.""".format(dbname, host, port, user))
    connection = pg.connect(
        host=host,
        port=port,
        dbname=dbname,
        user=user
    )
    print("""Successfully created db connection.""")
    # Table creation 
    config = load_config()
    create_tables(config=config, connection=connection)
    print("""ETL completed.""")

if __name__ == '__main__':
    set_up()
    etl()


