--Uso de diferentes JOINS.

SELECT  c.ciudad_id,
		c.ciudad,
		COUNT(*) AS rentas_por_ciudad
FROM 	ciudades AS c
	INNER JOIN direcciones AS d ON d.ciudad_id = c.ciudad_id
	INNER JOIN tiendas AS t ON t.direccion_id = d.direccion_id
	INNER JOIN inventarios AS i ON i.tienda_id = t.tienda_id
	INNER JOIN rentas AS r ON r.inventario_id = i.inventario_id
GROUP BY c.ciudad_id;