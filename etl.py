import os
import psycopg2

# Relacional
source_dbname = os.environ.get('SOURCE_DB_NAME')
source_user = os.environ.get('SOURCE_DB_USER')
source_password = os.environ.get('SOURCE_DB_PASSWORD')
source_host = os.environ.get('SOURCE_DB_HOST')
source_port = os.environ.get('SOURCE_DB_PORT')

# OLAP
dest_dbname = os.environ.get('DEST_DB_NAME')
dest_user = os.environ.get('DEST_DB_USER')
dest_password = os.environ.get('DEST_DB_PASSWORD')
dest_host = os.environ.get('DEST_DB_HOST')
dest_port = os.environ.get('DEST_DB_PORT')

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

#Extraccion
query_estado = "SELECT * FROM ESTADO;"
estado_results = execute_source_query(query_estado)

query_ciudad = "SELECT * FROM CIUDAD;"
ciudad_results = execute_source_query(query_ciudad)


query_tipo_provee = "SELECT * FROM TIPO_PROVEE;"
tipo_provee_results = execute_source_query(query_tipo_provee)


query_provee = "SELECT * FROM PROVEE;"
provee_results = execute_source_query(query_provee)

query_especialidad = "SELECT * FROM ESPECIALIDAD;"
especialidad_results = execute_source_query(query_especialidad)

query_sx = "SELECT * FROM SX;"
sx_results = execute_source_query(query_sx)


query_estado_civil = "SELECT * FROM ESTADO_CIVIL;"
estado_civil_results = execute_source_query(query_estado_civil)

query_medico = "SELECT * FROM MEDICO;"
medico_results = execute_source_query(query_medico)


query_tiene = "SELECT * FROM TIENE;"
tiene_results = execute_source_query(query_tiene)


query_area = "SELECT * FROM AREA;"
area_results = execute_source_query(query_area)


query_medicina = "SELECT * FROM MEDICINA;"
medicina_results = execute_source_query(query_medicina)

query_trabaja = "SELECT * FROM TRABAJA;"
trabaja_results = execute_source_query(query_trabaja)


query_personal_sanitario = "SELECT * FROM PERSONAL_SANITARIO;"
personal_sanitario_results = execute_source_query(query_personal_sanitario)

query_diagn = "SELECT * FROM DIAGN;"
diagn_results = execute_source_query(query_diagn)

query_cama = "SELECT * FROM CAMA;"
cama_results = execute_source_query(query_cama)


query_tratamiento = "SELECT * FROM TRATAMIENTO;"
tratamiento_results = execute_source_query(query_tratamiento)


query_aplica = "SELECT * FROM APLICA;"
aplica_results = execute_source_query(query_aplica)


query_pac = "SELECT * FROM PAC;"
pac_results = execute_source_query(query_pac)


query_intervencion = "SELECT * FROM INTERVENCION;"
intervencion_results = execute_source_query(query_intervencion)


query_prescribe = "SELECT * FROM PRESCRIBE;"
prescribe_results = execute_source_query(query_prescribe)


query_practica = "SELECT * FROM PRACTICA;"
practica_results = execute_source_query(query_practica)


query_realiza = "SELECT * FROM REALIZA;"
realiza_results = execute_source_query(query_realiza)


query_ocupa = "SELECT * FROM OCUPA;"
ocupa_results = execute_source_query(query_ocupa)

##Extraer datos de archivos extra



##Transformar data
data_hechos = [(row[0], row[1], row[2]) for row in _results]
data_lugar = [(row[0], row[1], row[2]) for row in _results]

## Ejemplo para combinar tablas
joined_results = []
for prescribe_row in prescribe_results:
    for practica_row in practica_results:
        if prescribe_row["id"] == practica_row["id"]:
            joined_results.append({**prescribe_row, **practica_row})

##ejemplo para filtrar algunas columnas de una tabla
filtered_results = []


#Inserts
dest_table = 'tabla_hechos'
query_hechos = "INSERT INTO {dest_table} (column1, column2, column3) VALUES (%s, %s, %s);"
execute_dest_query(query_hechos, data_hechos)


dest_table = 'DIM_TIPO_SERVICIO'
query_Dim_Tipo_servicio = "INSERT INTO {dest_table} (COD_TIPO_SERVICIO, DESCRIPCION_TIPO_SERVICIO,) VALUES (%s, %s);"
execute_dest_query(query_hechos, Data_Dim_Tipo_servicio)

dest_table = 'DIM_POLIZA'
query_Dim_Tipo_servicio = "INSERT INTO {dest_table} (EMPRESA, TIPO_POLIZA,HOSPITALIZACION,CIRUGIA,MATERNIDAD,RADIOGRAFIAS,EXAMENES,AMBULANCIA,COBERTURA,APROBADA) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
execute_dest_query(query_hechos, DATA_Poliza)






source_cur.close()
source_conn.close()
dest_cur.close()
dest_conn.close()
