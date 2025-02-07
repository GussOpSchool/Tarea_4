use `Ejercicio 6`;
SELECT p.DNI, p.Nombre, p.Apellidos, r.Vuelo_idVuelo, v.Origen, v.Destino, r.Importe
FROM pasagero p
JOIN reserva r ON p.DNI = r.Pasagero_DNI
JOIN vuelo v ON r.Vuelo_idVuelo = v.idVuelo