-- Agregacion con JSON

--Sacamos minimo

SELECT
	MIN(
		CAST(
			info -> 'items' ->> 'cantidad' AS INTEGER
		)
	)
FROM ordenes;

--Sacamos maximo

SELECT
	MAX(
		CAST(
			info -> 'items' ->> 'cantidad' AS INTEGER
		)
	)
FROM ordenes;

--Sacamos suma

SELECT
	SUM(
		CAST(
			info -> 'items' ->> 'cantidad' AS INTEGER
		)
	)
FROM ordenes;

--Sacamos promedio

SELECT
	AVG(
		CAST(
			info -> 'items' ->> 'cantidad' AS INTEGER
		)
	)
FROM ordenes;