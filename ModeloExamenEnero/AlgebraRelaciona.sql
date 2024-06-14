/* USANDO CALCULADORA Y DATASET y CURSO:
    Calculadora: https://dbis-uibk.github.io/relax/calc/gist/62414bd8eaf6ea30b329c838c565cca9
    DATASET y Curso: https://www.youtube.com/watch?v=YbkzfKW8FhI&t=257s
*/

-- 1) Encontrar la informacion de todos los prestamos realizados en MERIDA
	    σ nombresucursal = 'MERIDA' (prestamo ⨝ sucursal)
	
-- 2) Determinar el nombre de los clientes que viven en OAXACA
	    σ estado = 'OAXACA' (cliente)

-- 3) Nombre de todos los clientes del banco que tienen una cuenta, un préstamo o ambas
	-- Utilizando operadores de conjunto
	    π nombrecliente (cliente ⨝ (ctacliente ∪ prestatario))
	
-- 4) Relación de los clientes que tienen abierta una cuenta, pero no tienen ninguna de crédito
		-- Por resta o diferencia de conjuntos
		    cliente ⨝ (π idcliente ctacliente - π idcliente prestatario)
		-- Usando JOIN EXTERNO
		    -- ctacliente ⨝ prestatario NATURAL JOIN
			-- ctacliente ⟕ prestatario LEFT JOIN
		    π nombrecliente, numcta(cliente ⨝ ((ctacliente ⟕ prestatario) - (ctacliente ⨝ prestatario)))

-- 5) Todos los clientes que tienen un préstamo y una cuenta abierta
		-- Por Intersección de conjuntos
			π nombrecliente, idcliente(cliente ⨝ (π idcliente (ctacliente) ∩ π idcliente (prestatario)))
		-- Por NATURAL JOIN
			π idcliente, nombrecliente, numcta, numprestamo(cliente ⨝ (ctacliente ⨝ prestatario))

-- 6) Nombre de todos los clientes que tienen un crédito en la sucursal TULUM
		-- Primera forma:
			r = π idcliente,nombrecliente (cliente)
			σ nombresucursal = 'TULUM'( r	⨝ prestatario ⨝ prestamo ⨝ sucursal)
		-- Segunda forma:
			r = π idcliente,nombrecliente (cliente)
			r ⨝ prestatario ⨝ prestamo ⨝ (σ nombresucursal = 'TULUM' (sucursal))

-- 7) Nombre de todos los clientes que tienen un préstamo y el importe del mismo
		-- Forma fácil con NATURAL JOIN
 			π nombrecliente,numprestamo,importe(cliente ⨝ prestatario ⨝ prestamo)
		-- Con THETA JOIN
			r = cliente ⨝ cliente.idcliente = prestatario.idcliente prestatario
			s = r ⨝ prestatario.numprestamo = prestamo.numprestamo (prestamo)
			π cliente.nombrecliente,prestatario.numprestamo,prestamo.importe (s)

-- 8) El nombre de todas las sucursales con clientes que tienen una cuenta abierta en el banco y que viven en CHIAPAS

			r = π idcliente,nombrecliente (σ estado = 'CHIAPAS' (cliente))
			π nombresucursal(r ⨝ ctacliente ⨝ cuenta ⨝ sucursal)

-- 9) Toda la información de los clientes que tienen una cuenta y un prestamo en el banco

			r = prestatario ⨝ ctacliente
			π idcliente,nombrecliente,direccion,estado,nacimiento (cliente ⨝ r )

-- 10) Nombre de los clientes con cuenta en YUCATÁN y que viven en CAMPECHE
		-- viven en CAMPECHE
			r = π idcliente,nombrecliente (σ estado = 'CAMPECHE' (cliente)) 
		-- con cuenta en YUCATÁN
			s = π idcliente,nombrecliente(cliente ⨝ ctacliente ⨝ cuenta ⨝ (σ estado = 'YUCATÁN' (sucursal))) 
		-- con cuenta en YUCATÁN y viven en CAMPECHE
			r ∩ s

-- 11) Nombre de los clientes con un prestamo mayor a $60,000.00

			r = σ importe > 60000.00 (prestamo)
			π nombrecliente,prestamo.importe(cliente ⨝ prestatario ⨝ r)

