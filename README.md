
# SIMA Centro de Diagnóstico – Base de Datos

📃​Descripción

Base de datos relacional diseñada para gestionar la información del Centro de Diagnóstico SIMA. Permite administrar pacientes, médicos, turnos, análisis, facturación, pagos e historial de modificaciones, asegurando integridad, seguridad y trazabilidad de los registros.

​📋​Objetivo del sistema

Organizar y centralizar la información médica, administrativa y financiera del centro, optimizando la gestión de turnos, servicios, resultados clínicos y facturación.

💻​Tecnologías

​​​▪️​MySQL   
​​​▪️​SQL (DDL, DML, DCL)  
​​​▪️​Laragon / AlwaysData  
​​​▪️​Triggers, usuarios y permisos  
​​​▪️​Exportación con mysqldump

Funcionalidades principales

✔ Gestión de pacientes, médicos y obras sociales  
✔ Registro de turnos, servicios y análisis clínicos  
✔ Facturación, pagos y métodos de pago  
✔ Inventario y proveedores  
✔ Auditoría de cambios con tabla Historial_modificacion  
✔ Seguridad con usuario distinto a root  
✔ Campos de creación, modificación y borrado lógico

Modelo de Datos 

​😷​Paciente: datos personales, contacto, historial.

​👩‍⚕️​Médico: especialidad, matrícula, disponibilidad.

​​📅​Turno: fecha, hora, estado, paciente, médico.

​​​📋E​studio/Diagnóstico: tipo, resultados, informe, paciente.

​​​💰​Administración: pagos, facturación, estados.

📂 Base de Datos
El script completo de la base de datos se encuentra en el archivo larreazaira_sima_db.
Para restaurarlo:
1. Importar el archivo `larreazaira_sima_db.sql` en MySQL.
2. Verificar que se hayan creado todas las tablas y relaciones.

Autora ​​​🤠​

Zaira Larrea – Diseño y desarrollo de base de datos

## Catedra de Base de Datos
Base de datos 2do año 2025 🖥️​💾​
