--Actualizando precios de usd a otro tipo de cambio

SELECT  peliculas.pelicula_id,
		tipos_cambio.tipo_cambio_id,
		tipos_cambio.cambio_usd * peliculas.precio_renta AS precio_mxn
FROM	peliculas,
		tipos_cambio
WHERE tipos_cambio.codigo = 'MXN';

--Creamos la funcion que va a ejecutar el trigger. Este trigger va a actualizar los precios al tipo de cambio actual cada vez que se adhiera una pelicula

CREATE OR REPLACE FUNCTION precio_peliculas_tipo_cambio()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO precio_peliculas_tipo_cambio(
        pelicula_id,
        tipo_cambio_id,
        precio_tipo_cambio,
        ultima_actualizacion
    )
    SELECT NEW.pelicula_id,
        tipos_cambio.tipo_cambio_id,
        tipos_cambio.cambio_usd * NEW.precio_renta AS precio_tipo_cambio,
        CURRENT_TIMESTAMP
    FROM tipos_cambio
    WHERE tipos_cambio.codigo = 'MXN';
    RETURN NEW;
END
$$;

--Creamos el trigger

CREATE TRIGGER trigger_update_tipos_cambio
	AFTER INSERT OR UPDATE
	ON public.peliculas
	FOR EACH ROW
	EXECUTE PROCEDURE public.precio_peliculas_tipo_cambio();
	

