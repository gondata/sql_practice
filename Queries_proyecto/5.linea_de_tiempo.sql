--Si queremos hacer una linea de tiempo: Sacamos cantidad de peliculas rentadas por anio y mes

SELECT  date_part('year', r.fecha_renta) AS anio,
		date_part('month', r.fecha_renta) AS mes,
		p.titulo,
		COUNT (*) AS numero_rentas
FROM	rentas AS r
	INNER JOIN inventarios AS i ON i.inventario_id = r.inventario_id
	INNER JOIN peliculas AS p ON p.pelicula_id = i.pelicula_id
GROUP BY anio, mes, p.pelicula_id
ORDER BY anio;

--Numero de rentas totales por anio y mes

SELECT  date_part('year', r.fecha_renta) AS anio,
		date_part('month', r.fecha_renta) AS mes,
		COUNT (*) AS numero_rentas
FROM	rentas AS r
GROUP BY anio, mes
ORDER BY anio;