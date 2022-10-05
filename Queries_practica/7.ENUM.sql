--Practicando tipos de datos. ENUM nos sirve para definir una lista de posibilidades entre las cuales el usuario puede elegir.

CREATE TYPE humor AS ENUM ('triste', 'normal', 'feliz');

--Creamos tabla para verificar.

CREATE TABLE persona_prueba(
	nombre text,
	humor_actual humor
);

--Insertamos datos para verificar.

INSERT INTO persona_prueba VALUES ('pablo', 'feliz');