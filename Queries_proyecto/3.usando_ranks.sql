--Ordenando con respecto a percentiles, en forma ascendente.

SELECT
	peliculas.pelicula_id AS pelicula_nro,
	peliculas.titulo,
	COUNT(*) AS numero_rentas,
	PERCENT_RANK() OVER(
		ORDER BY COUNT(*) ASC
	) AS lugar
FROM	rentas
	INNER JOIN inventarios ON rentas.inventario_id = inventarios.inventario_id
	INNER JOIN peliculas ON inventarios.pelicula_id = peliculas.pelicula_id
GROUP BY peliculas.pelicula_id
ORDER BY numero_rentas DESC;

--Ordenando con respecto al ranking sin gaps, en forma ascendente.

SELECT
	peliculas.pelicula_id AS pelicula_nro,
	peliculas.titulo,
	COUNT(*) AS numero_rentas,
	DENSE_RANK() OVER(
		ORDER BY COUNT(*) DESC
	) AS lugar
FROM	rentas
	INNER JOIN inventarios ON rentas.inventario_id = inventarios.inventario_id
	INNER JOIN peliculas ON inventarios.pelicula_id = peliculas.pelicula_id
GROUP BY peliculas.pelicula_id
ORDER BY numero_rentas DESC;

--Si solo queremos los lugares menos o iguales a 10, debemos usar WHERE y por lo tanto convertir la query, en una subquery.

SELECT *
FROM (
	SELECT
	peliculas.pelicula_id AS pelicula_nro,
	peliculas.titulo,
	COUNT(*) AS numero_rentas,
	DENSE_RANK() OVER(
		ORDER BY COUNT(*) DESC
	) AS lugar
	FROM	rentas
		INNER JOIN inventarios ON rentas.inventario_id = inventarios.inventario_id
		INNER JOIN peliculas ON inventarios.pelicula_id = peliculas.pelicula_id
	GROUP BY peliculas.pelicula_id
	ORDER BY numero_rentas DESC
) AS top_10
WHERE lugar <= 10;