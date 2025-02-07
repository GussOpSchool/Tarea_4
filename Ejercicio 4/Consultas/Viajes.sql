use `Ejercicio 4`;
SELECT p.idPoliza, t.Nombre, p.Cliente_DNI, c.Nombre, c.Apellidos
FROM poliza p
JOIN tipo_poliza t ON p.Tipo_Poliza_idTipo_Poliza = t.idTipo_Poliza
JOIN cliente c ON p.Cliente_DNI = c.DNI
WHERE t.Nombre = "Viaje"