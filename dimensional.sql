CREATE TABLE public.dim_area
(
    sk_dim_area serial NOT NULL,
    id_area integer NOT NULL,
    piso integer NOT NULL,
    pasillo integer,
    id_especialidad integer,
    descripcion_especialidad text,
    PRIMARY KEY (sk_dim_area)
);

ALTER TABLE IF EXISTS public.dim_area
    OWNER to postgres;


CREATE TABLE public.dim_diagnostico
(
    sk_dim_diagnostico serial NOT NULL,
    id_diagnostico integer NOT NULL,
    descripcion_diagnostico text NOT NULL,
    tipo_diagnostico text NOT NULL,
    costo double precision NOT NULL,
    PRIMARY KEY (sk_dim_diagnostico)
);

ALTER TABLE IF EXISTS public.dim_diagnostico
    OWNER to postgres;


CREATE TABLE public.dim_historia_medica
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

ALTER TABLE IF EXISTS public.dim_historia_medica
    OWNER to postgres;


CREATE TABLE public.dim_intervencion
(
    sk_dim_intervencion serial NOT NULL,
    id_intervencion integer NOT NULL,
    descripcion_intervencion text NOT NULL,
    tipo_intervencion text NOT NULL,
    PRIMARY KEY (sk_dim_intervencion)
);

ALTER TABLE IF EXISTS public.dim_intervencion
    OWNER to postgres;


CREATE TABLE public.dim_medicamento
(
    sk_dim_medicamento serial NOT NULL,
    id_medicina integer NOT NULL,
    nombre_medicina text,
    presentacion text,
    posologia text,
    efectos_secundarios text,
    PRIMARY KEY (sk_dim_medicamento)
);

ALTER TABLE IF EXISTS public.dim_medicamento
    OWNER to postgres;


CREATE TABLE public.dim_medico
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

ALTER TABLE IF EXISTS public.dim_medico
    OWNER to postgres;


CREATE TABLE public.dim_paciente
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

ALTER TABLE IF EXISTS public.dim_paciente
    OWNER to postgres;


CREATE TABLE public.dim_personal_sanit
(
    dim_dim_personal_sanit serial NOT NULL,
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

ALTER TABLE IF EXISTS public.dim_personal_sanit
    OWNER to postgres;


CREATE TABLE public.dim_poliza
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

ALTER TABLE IF EXISTS public.dim_poliza
    OWNER to postgres;


CREATE TABLE public.dim_riesgo
(
    sk_dim_riesgo serial NOT NULL,
    cod_riesgo integer NOT NULL,
    descripcion_riesgo text NOT NULL,
    PRIMARY KEY (sk_dim_riesgo)
);

ALTER TABLE IF EXISTS public.dim_riesgo
    OWNER to postgres;


CREATE TABLE public.dim_tiempo
(
    sk_dim_tiempo serial NOT NULL,
    fecha_completa date NOT NULL,
    dia integer,
    mes integer,
    annio integer,
    PRIMARY KEY (sk_dim_tiempo)
);

ALTER TABLE IF EXISTS public.dim_tiempo
    OWNER to postgres;


CREATE TABLE public.dim_tipo_servicio
(
    sk_dim_tipo_servicio serial NOT NULL,
    cod_tipo_servicio integer NOT NULL,
    descripcion_tipo_servicio text NOT NULL,
    PRIMARY KEY (sk_dim_tipo_servicio)
);

ALTER TABLE IF EXISTS public.dim_tipo_servicio
    OWNER to postgres;


CREATE TABLE public.dim_tratamiento
(
    sk_dim_tratamiento serial NOT NULL,
    id_tratamiento integer NOT NULL,
    descripcion_tratamiento text NOT NULL,
    costo double precision NOT NULL,
    PRIMARY KEY (sk_dim_tratamiento)
);

ALTER TABLE IF EXISTS public.dim_tratamiento
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS public.dim_proveedor
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
    CONSTRAINT sk_medicamento FOREIGN KEY (sk_medicamento)
);

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
    CONSTRAINT fk_dim_fecha_facturacion FOREIGN KEY REFERENCES dim_tiempo (sk_dim_tiempo),
    CONSTRAINT fk_dim_poliza FOREIGN KEY (sk_dim_poliza) REFERENCES dim_poliza (SK_dim_poliza),
    CONSTRAINT fk_dim_fecha_historia_medica FOREIGN KEY (sk_dim_fecha_historia_medica) REFERENCES dim_tiempo (sk_dim_tiempo),
    CONSTRAINT fk_dim_area FOREIGN KEY (sk_dim_area) REFERENCES dim_area (SK_dim_area),
    CONSTRAINT fk_fecha_inicio FOREIGN KEY (sk_fecha_inicio) REFERENCES dim_tiempo (sk_dim_tiempo),
);
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------FACTS-----------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------


