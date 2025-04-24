Trabajo Práctico N° 3 - Mantenimiento de Bases de Datos
Federico Horacio Britez
Para realizar con MySql Workbench o un software equivalente:
1 Realizar un backup
Exportar una base de datos pequeña (puede usarse una base de ejemplo como la de BANCO, creada en el Trabajo Práctico anterior).
Guardar el Archivo como .sql
2 Restaurar el backup
Crear una nueva base de datos vacía llamada Banco_Restaurada en el mismo servidor  
Importar el archivo .sql
3 Diagnóstico y optimización
Ejecutar una consulta sin índice:
SELECT * FROM clientes WHERE apellido = 'Fernández';
  Ejecutar:  
  EXPLAIN SELECT * FROM clientes WHERE apellido = 'Fernández';
  Ahora, crear un índice:
CREATE INDEX idx_apellido ON clientes(apellido);
Entonces ejecutar nuevamente EXPLAIN y comparar resultados (Capturar el resultado).