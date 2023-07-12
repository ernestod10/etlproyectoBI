CREATE TABLE dim_area
(
    sk_dim_area serial NOT NULL,
    id_area integer NOT NULL,
    piso integer NOT NULL,
    pasillo integer,
    id_especialidad integer,
    descripcion_especialidad text,
    PRIMARY KEY (sk_dim_area)
);



CREATE TABLE dim_diagnostico
(
    sk_dim_diagnostico serial NOT NULL,
    id_diagnostico integer NOT NULL,
    descripcion_diagnostico text NOT NULL,
    tipo_diagnostico text NOT NULL,
    costo double precision NOT NULL,
    PRIMARY KEY (sk_dim_diagnostico)
);



CREATE TABLE dim_historia_medica
(
    sk_dim_historia_medica serial NOT NULL,
    nro_historia integer NOT NULL,
    peso_actual double precision,
    peso_ideal double precision,
    tension text,
    fumador boolean,
    prob_respiratorio boolean,
    PRIMARY KEY (sk_dim_historia_medica)
);


CREATE TABLE dim_intervencion
(
    sk_dim_intervencion serial NOT NULL,
    id_intervencion integer NOT NULL,
    descripcion_intervencion text NOT NULL,
    tipo_intervencion text NOT NULL,
    PRIMARY KEY (sk_dim_intervencion)
);



CREATE TABLE dim_medicamento
(
    sk_dim_medicamento serial NOT NULL,
    id_medicina integer NOT NULL,
    nombre_medicina text,
    presentacion text,
    posologia text,
    efectos_secundarios text,
    PRIMARY KEY (sk_dim_medicamento)
);



CREATE TABLE dim_medico
(
    sk_dim_medico serial NOT NULL,
    cedula integer NOT NULL,
    cod_colegio_medicos integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    fecha_nacimiento date,
    fecha_contratacion date,
    sexo_id integer,
    descripcion_sexo text,
    edo_civil_id integer,
    descripcion_edo_civil text,
    anos_exper integer,
    id_area integer,
    piso integer,
    pasillo integer,
    PRIMARY KEY (sk_dim_medico)
);


CREATE TABLE dim_paciente
(
    sk_dim_paciente serial NOT NULL,
    cedula integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    fecha_nacimiento date NOT NULL,
    tipo_sangre text NOT NULL,
    sexo_id integer NOT NULL,
    descripcion_sexo text NOT NULL,
    edo_civil_id integer NOT NULL,
    descrip_edo_civil text NOT NULL,
    nacionalidad text NOT NULL,
    hipertenso boolean,
    artritis boolean,
    osteoporosis boolean,
    diabetes boolean,
    PRIMARY KEY (sk_dim_paciente)
);



CREATE TABLE dim_personal_sanit
(
    sk_dim_personal_sanit serial NOT NULL,
    ci_personal integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    funcion text NOT NULL,
    area_id integer NOT NULL,
    sexo_id integer NOT NULL,
    descripcion_sexo text NOT NULL,
    edo_civil_id integer NOT NULL,
    descripcion_edo_civil text NOT NULL,
    nacionalidad text NOT NULL,
    piso integer,
    pasillo integer,
    id_especialidad integer,
    descripcion_especialidad text,
    PRIMARY KEY (dim_dim_personal_sanit)
);


CREATE TABLE dim_poliza
(
    sk_dim_poliza serial NOT NULL,
    empresa text NOT NULL,
    tipo_poliza text NOT NULL,
    hospitalizacion boolean,
    cirugia boolean,
    maternidad boolean,
    radiografias boolean,
    examenes boolean,
    ambulancia boolean,
    cobertura double precision,
    aprobada boolean,
    PRIMARY KEY (sk_dim_poliza)
);


CREATE TABLE dim_riesgo
(
    sk_dim_riesgo serial NOT NULL,
    cod_riesgo integer NOT NULL,
    descripcion_riesgo text NOT NULL,
    PRIMARY KEY (sk_dim_riesgo)
);


CREATE TABLE dim_tiempo
(
    sk_dim_tiempo serial NOT NULL,
    fecha_completa date NOT NULL,
    dia integer,
    mes integer,
    annio integer,
    PRIMARY KEY (sk_dim_tiempo)
);


CREATE TABLE dim_tipo_servicio
(
    sk_dim_tipo_servicio serial NOT NULL,
    cod_tipo_servicio integer NOT NULL,
    descripcion_tipo_servicio text NOT NULL,
    PRIMARY KEY (sk_dim_tipo_servicio)
);



CREATE TABLE dim_tratamiento
(
    sk_dim_tratamiento serial NOT NULL,
    id_tratamiento integer NOT NULL,
    descripcion_tratamiento text NOT NULL,
    costo double precision NOT NULL,
    PRIMARY KEY (sk_dim_tratamiento)
);



CREATE TABLE IF NOT EXISTS dim_proveedor
(
    sk_dim_proveedor bigserial NOT NULL,
    id_proveedor integer,
    nombre text COLLATE pg_catalog."default",
    rif text COLLATE pg_catalog."default",
    telefono text COLLATE pg_catalog."default",
    tipo_proveedor_id integer,
    descripcion_tipo_provee text COLLATE pg_catalog."default",
    edo_civil_id integer,
    descrip_edo_civil text COLLATE pg_catalog."default",
    ciudad_id integer,
    nombre_ciudad text COLLATE pg_catalog."default",
    direccion text COLLATE pg_catalog."default",
    tipo_proveedor integer,
    descrip_tipo text COLLATE pg_catalog."default",
    id_estado integer,
    descrip_estado text COLLATE pg_catalog."default",
    sk_medicamento integer,
    CONSTRAINT dim_proveedor_pkey PRIMARY KEY (sk_dim_proveedor),
    CONSTRAINT sk_medicamento FOREIGN KEY (sk_medicamento) references dim_medicamento (sk_dim_medicamento)
);

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------FACTS-----------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------




CREATE TABLE IF NOT EXISTS fact_facturacion
(
    SK_Fact_Facturacion serial NOT NULL,
    sk_dim_paciente integer,
    sk_dim_tipo_servicio integer,
    Sk_dim_fecha_facturacion integer,
    sk_dim_poliza integer,
    sk_dim_fecha_historia_medica integer,
    sk_dim_area integer,
    sk_fecha_inicio integer,
    costo_bolivares float,
    Numero_poliza integer,
    Estado_factura varchar(20),
    dias_cubiertos_seguro integer,
    cant_dias integer,
    numero_cama integer,

    CONSTRAINT fk_dim_paciente FOREIGN KEY (sk_dim_paciente) REFERENCES dim_paciente (SK_dim_paciente),
    CONSTRAINT fk_dim_tipo_servicio FOREIGN KEY (sk_dim_tipo_servicio) REFERENCES dim_tipo_servicio (SK_dim_tipo_servicio),
    CONSTRAINT fk_dim_fecha_facturacion FOREIGN KEY (Sk_dim_fecha_facturacion) REFERENCES dim_tiempo (sk_dim_tiempo),
    CONSTRAINT fk_dim_poliza FOREIGN KEY (sk_dim_poliza) REFERENCES dim_poliza (SK_dim_poliza),
    CONSTRAINT fk_dim_fecha_historia_medica FOREIGN KEY (sk_dim_fecha_historia_medica) REFERENCES dim_tiempo (sk_dim_tiempo),
    CONSTRAINT fk_dim_area FOREIGN KEY (sk_dim_area) REFERENCES dim_area (SK_dim_area),
    CONSTRAINT fk_fecha_inicio FOREIGN KEY (sk_fecha_inicio) REFERENCES dim_tiempo (sk_dim_tiempo)
);

create table if not exists fact_diagnostico
(
    sk_dim_medico integer,
    sk_dim_paciente integer,
    sk_dim_diagnostico integer,
    sk_dim_fecha_elaboracion integer,
    num_ingreso numeric,

    CONSTRAINT fk_dim_medico FOREIGN KEY (sk_dim_medico) references dim_medico(sk_dim_medico),
    CONSTRAINT fk_dim_paciente FOREIGN KEY (sk_dim_paciente) references dim_paciente (sk_dim_paciente),
    CONSTRAINT fk_dim_diagnostico FOREIGN KEY (sk_dim_diagnostico) references dim_diagnostico (sk_dim_diagnostico),
    CONSTRAINT fk_dim_fecha_elaboracion FOREIGN KEY (sk_dim_fecha_elaboracion) references dim_tiempo (sk_dim_tiempo)
)

create table if not exists fact_intervencion
(
    sk_dim_medico integer,
    sk_dim_paciente integer,
    sk_dim_intervencion integer,
    sk_dim_personal_sanit_primario integer,
    sk_dim_personal_sanit_secundario integer,
    sk_dim_fecha_practica integer,
    sk_dim_riesgo integer,

    gastos_equipos float,
    costo float,
    Honorario_equipo float,
    duracion float,


    CONSTRAINT fk_dim_medico FOREIGN KEY (sk_dim_medico) references dim_medico(sk_dim_medico),
    CONSTRAINT fk_dim_paciente FOREIGN KEY (sk_dim_paciente) references dim_paciente (sk_dim_paciente),
    CONSTRAINT fk_dim_intervencion FOREIGN KEY (sk_dim_intervencion) references dim_intervencion (sk_dim_intervencion),
    CONSTRAINT fk_dim_personal_sanit_primario FOREIGN KEY (sk_dim_personal_sanit_primario) references dim_personal_sanit(sk_dim_personal_sanit),
    CONSTRAINT fk_dim_personal_sanit_secundario FOREIGN KEY (sk_dim_personal_sanit_secundario) references dim_personal_sanit (sk_dim_personal_sanit),
    CONSTRAINT fk_dim_fecha_practica FOREIGN KEY (sk_dim_fecha_practica) references dim_tiempo (sk_dim_tiempo),
    CONSTRAINT fk_dim_riesgo FOREIGN KEY (sk_dim_riesgo) references dim_riesgo (sk_dim_riesgo)
)

create table if not exists fact_tratamiento
(
    sk_dim_medicamento integer,
    sk_dim_tratamiento integer,
    sk_dim_fecha_inicio integer,
    sk_dim_fecha_fin integer,
    sk_dim_medico integer,
    sk_dim_paciente integer,
    sk_dim_fecha_elaboracion integer,

    cant_dias integer,
    num_ingreso integer,
    
    CONSTRAINT fk_dim_medicamento FOREIGN KEY (sk_dim_medicamento) references dim_medicamento (sk_dim_medicamento),
    CONSTRAINT fk_dim_tratamiento FOREIGN KEY (sk_dim_tratamiento) references dim_tratamiento (sk_dim_tratamiento),
    CONSTRAINT fk_dim_fecha_inicio FOREIGN KEY (sk_dim_fecha_inicio) references dim_tiempo (sk_dim_tiempo),
    CONSTRAINT fk_dim_fecha_fin FOREIGN KEY (sk_dim_fecha_fin) references dim_tiempo (sk_dim_tiempo),
    CONSTRAINT fk_dim_medico FOREIGN KEY (sk_dim_medico) references dim_medico (sk_dim_medico),
    CONSTRAINT fk_dim_paciente FOREIGN KEY (sk_dim_paciente) references dim_paciente (sk_dim_paciente),
    CONSTRAINT fk_dim_fecha_elaboracion FOREIGN KEY (sk_dim_fecha_elaboracion) references dim_tiempo (sk_dim_tiempo)
    
)

