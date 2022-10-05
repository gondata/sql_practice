--Agregacion de datos

--Sacamos el maximo del precio de renta

SELECT MAX(precio_renta)
FROM peliculas;

--Mismo query pero agrupando por titulo

SELECT titulo, MAX(precio_renta)
FROM peliculas
GROUP BY titulo;

--Mismo query pero ahora el Minimo

SELECT titulo, MIN(precio_renta)
FROM peliculas
GROUP BY titulo;

--Nos preguntamos cuanto saldria alquilar todas las peliculas

SELECT SUM(precio_renta)
FROM peliculas;

--Nos preguntamos cuantas peliculas hay en cada clasificacion

SELECT clasificacion, COUNT(*)
FROM peliculas
GROUP BY clasificacion;

-- Precio promedio de una pelicula

SELECT AVG(precio_renta)
FROM peliculas;

--Precio promedio de las peliculas, agrupadas por clasificacion y de mayor a menor.

SELECT clasificacion, AVG(precio_renta) AS precio_promedio
FROM peliculas
GROUP BY clasificacion
ORDER BY precio_promedio DESC;

--Duracion promedio de las peliculas, agrupadas por clasificacion y de mayor a menor.

SELECT clasificacion, AVG(duracion) AS duracion_promedio
FROM peliculas
GROUP BY clasificacion
ORDER BY duracion_promedio DESC;

--Cuanto tiempo rentan las peliculas en promedio, agrupadas por clasificacion y de mayor a menor.

SELECT clasificacion, AVG(duracion_renta) AS duracion_renta_promedio
FROM peliculas
GROUP BY clasificacion
ORDER BY duracion_renta_promedio DESC;