--Trabajando con objetos JSON

CREATE TABLE ordenes (
	ID serial NOT NULL PRIMARY KEY,
	info json NOT NULL
);

--Insertamos valores con formato JSON

INSERT INTO ordenes(info)
VALUES
	(
		'{"cliente": "David Sanchez", "items": {"producto": "Biberon", "cantidad": "24"}}'
	),
	(
			'{"cliente": "Edna Cardenas", "items": {"producto": "Carro juguete", "cantidad": "1"}}'
	),
	(
			'{"cliente": "Israel Vazquez", "items": {"producto": "Tren juguete", "cantidad": "2"}}'
	);
	
--Extraemos los datos en formato json

SELECT
	info -> 'cliente' AS cliente
FROM ordenes;

--Extraemos los datos en formato texto (nos da mas flexibilidad)

SELECT
	info ->> 'cliente' AS cliente
FROM ordenes;

--Utilizando WHERE

SELECT
	info ->> 'cliente' AS cliente
FROM ordenes
WHERE info -> 'items' ->> 'producto' = 'Biberon';