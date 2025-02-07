use `ejercicio 6`;
SELECT v.idVuelo, r.idReserva, v.Destino as Llegada
FROM vuelo v
JOIN reserva r ON v.idVuelo = r.Vuelo_idVuelo
WHERE v.Destino = 'Espana'