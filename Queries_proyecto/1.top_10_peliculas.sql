--Top 10 de peliculas mas rentadas

SELECT
	ROW_NUMBER() OVER(
		ORDER BY COUNT(*) DESC
	) AS lugar,
	peliculas.pelicula_id AS pelicula_nro,
	peliculas.titulo,
	COUNT(*) AS numero_rentas
FROM	rentas
	INNER JOIN inventarios ON rentas.inventario_id = inventarios.inventario_id
	INNER JOIN peliculas ON inventarios.pelicula_id = peliculas.pelicula_id
GROUP BY peliculas.pelicula_id
ORDER BY numero_rentas DESC
LIMIT 10;