# https://stackoverflow.com/questions/17261061/execute-sql-schema-in-psycopg2-in-python

from config import *


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
    with connection as cursor:
        cursor.execute(open("sql/load1.sql", "r").read())
