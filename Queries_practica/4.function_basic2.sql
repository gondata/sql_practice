--Creamos funcion que devuelve todos los registros de la tabla peliculas

CREATE OR REPLACE FUNCTION count_total_movies()
RETURNS int
LANGUAGE plpgsql
AS $$
BEGIN
	RETURN COUNT(*) FROM peliculas;
END
$$;

--Ejecutamos la funcion

SELECT count_total_movies();