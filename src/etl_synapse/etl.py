# https://stackoverflow.com/questions/17261061/execute-sql-schema-in-psycopg2-in-python

with connection as cursor:
    cursor.execute(open("sql/schema1.sql", "r").read())