use `Ejercicio 7`;
SELECT COUNT(*)
FROM tiquet t
JOIN empleado e ON t.Empleados_idEmpleados = e.idEmpleado
WHERE t.Fecha <> "2025-07-02" AND LEFT(e.Nombre, 1) = "O"