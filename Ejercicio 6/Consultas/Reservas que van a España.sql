use `ejercicio 6`;
SELECT v.idVuelo, r.Pasagero_DNI, p.Nombre, v.Destino as Llegada
FROM reserva r
JOIN vuelo v ON r.Vuelo_idVuelo = v.idVuelo
JOIN pasagero p ON r.Pasagero_DNI = p.DNI
WHERE v.Destino = "Espana";
SELECT Count(*) as `Vuelos que van a Espana`
FROM vuelo v
WHERE v.Destino = "Espana"