use `Ejercicio 6`;
SELECT r.idReserva, r.Pasagero_DNI, r.Fecha, r.Vuelo_idVuelo, r.Importe, v.`Fecha Salida`
FROM reserva r
JOIN vuelo v ON r.Vuelo_idVuelo = v.idVuelo
WHERE v.`Fecha Salida` = "2022-05-06"