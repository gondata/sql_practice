--Creamos un Stored Procedure de prueba.

CREATE OR REPLACE PROCEDURE test_dropcreate_procedure()
LANGUAGE SQL
AS $$
	DROP TABLE IF EXISTS aaa;
	CREATE TABLE aaa (bbb char(5) CONSTRAINT firstkey PRIMARY KEY);
$$;

--Llamamos al procedure

CALL test_dropcreate_procedure();