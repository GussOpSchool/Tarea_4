use `ejercicio 7`;
SELECT t.idTiquet, t.Numero_Factura, t.Fecha, t.Hora, t.Empleados_idEmpleados, e.Nombre as Nombre_empleado, l.Producto_Descripcion
FROM tiquet t
JOIN empleado e ON t.Empleados_idEmpleados = e.idEmpleado
JOIN linea_tiquet l ON t.idTiquet = l.Tiquet_idTiquet
WHERE l.Producto_Descripcion = "XXXXX"