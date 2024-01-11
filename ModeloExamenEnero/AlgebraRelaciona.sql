/* USANDO CALCULADORA Y DATASET y CURSO:
    Calculadora: https://dbis-uibk.github.io/relax/calc/gist/62414bd8eaf6ea30b329c838c565cca9
    DATASET y Curso: https://www.youtube.com/watch?v=YbkzfKW8FhI&t=257s
*/

-- 1) Encontrar la informacion de todos los prestamos realizados en MERIDA
	    σ nombresucursal = 'MERIDA' (prestamo ⨝ sucursal)
	
-- 2) Determinar el nombre de los lientes que viden en OAXACA
	    σ estado = 'OAXACA' (cliente)

-- 3) Nombre de todos los clientes del banco que tienen una cuenta, un prestamo o ambas
	-- Utilizando operadores de conjunto
	    π nombrecliente (cliente	⨝ (ctacliente ∪ prestatario))
	
-- 4) Relacion de los clientes que tienen abierta una cuenta, pero no tienen ninguna de credito
		-- Por resta o diferencia de conjuntos
		    cliente ⨝ (π idcliente ctacliente - π idcliente prestatario)
		-- Usando JOIN EXTERNO
		    -- ctacliente ⨝ prestatario
		    π nombrecliente, numcta(cliente ⨝ ((ctacliente ⟕ prestatario) - (ctacliente ⨝ prestatario)))
		

-- Todos los clientes que tienen un prestamo y una cuenta abierta
-- Nombre de todos los clientes que tienen un credito en la sucursal TULUM
-- Nombre de todos los clientes que tienen un prestamo y el importe del mismo
-- El nombre de todas las sucursales con clientes que tienen una cuenta abierta en el banco y que viven en CHIAPAS