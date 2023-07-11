import psycopg2

# Relacional
source_dbname = 'Hospital_relacional'
source_user = 'postgres'
source_password = '1234'
source_host = 'localhost'
source_port = '5432'

# Warehouse
dest_dbname = 'Hospital_warehouse'
dest_user = 'postgres'
dest_password = '1234'
dest_host = 'localhost'
dest_port = '5432'


source_conn = psycopg2.connect(dbname=source_dbname, user=source_user, password=source_password, host=source_host, port=source_port)
source_cur = source_conn.cursor()


dest_conn = psycopg2.connect(dbname=dest_dbname, user=dest_user, password=dest_password, host=dest_host, port=dest_port)
dest_cur = dest_conn.cursor()


def execute_source_query(query):
    source_cur.execute(query)
    rows = source_cur.fetchall()
    return rows

def execute_dest_query(query, data):
    dest_cur.executemany(query, data)
    dest_conn.commit()

# ejemplo Extraccion
source_query = "SELECT * FROM tabla1;"
results = execute_source_query(source_query)

#ejemplo config Destino
dest_table = 'tabla_hechos'
dest_query = f"INSERT INTO {dest_table} (column1, column2, column3) VALUES (%s, %s, %s);"

#ejemplo Transformacion
data = [(row[0], row[1], row[2]) for row in results]

#ejemplo Inserts
execute_dest_query(dest_query, data)

source_cur.close()
source_conn.close()
dest_cur.close()
dest_conn.close()
