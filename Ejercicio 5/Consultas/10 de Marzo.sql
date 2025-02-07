use `Ejercicio 5`;
SELECT c.idCita, c.Dia, c.Hora, c.Cliente_Usuario, c.Vehiculo_Numero_Matricula, v.Tipo_Vehiculo, v.Marca
FROM Cita c
JOIN Cliente cl ON c.Cliente_Usuario = cl.Usuario
JOIN Vehiculo v ON c.Vehiculo_Numero_Matricula = v.Numero_Matricula
WHERE c.Dia >= "2022-03-10"