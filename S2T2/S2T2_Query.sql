-- Base de datos Universidad

-- 1. SELECT DISTINCT p.id, p.apellido1, p.apellido2, p.nombre FROM persona p JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno ORDER BY p.apellido1;
-- 2. SELECT DISTINCT p.id, p. nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno WHERE p.telefono IS NULL;
-- 3. SELECT DISTINCT p.id, p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno WHERE YEAR(p.fecha_nacimiento) = 1999;
-- 4. SELECT p.id, p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN profesor pr ON p.id = pr.id_profesor WHERE p.telefono IS NULL AND p.nif LIKE '%K';
-- 5. SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- 6. SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departamento FROM profesor pr JOIN persona p ON pr.id_profesor = p.id JOIN departamento d ON pr.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;
-- 7. SELECT a.nombre AS nombre_asignatura, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura ama JOIN asignatura a ON ama.id_asignatura = a.id JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id JOIN universidad.persona p ON ama.id_alumno = p.id WHERE p.nif = '26902806M';
-- 8. SELECT DISTINCT d.nombre AS nombre_departamento FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento JOIN asignatura a ON pr.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- 9. SELECT DISTINCT p.nombre, p.apellido1, p.apellido2, p.nif FROM alumno_se_matricula_asignatura ama JOIN persona p ON ama.id_alumno = p.id JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1. SELECT d.nombre AS nombre_departamento, p.apellido1, p.apellido2, p.nombre AS nombre_profesor FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN persona p ON pr.id_profesor = p.id ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
-- 2. SELECT p.apellido1, p.apellido2, p.nombre AS nombre_profesor FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN persona p ON pr.id_profesor = p.id WHERE pr.id_departamento IS NULL;
-- 3. SELECT d.nombre AS nombre_departamento FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL;
-- 4. SELECT p.apellido1, p.apellido2, p.nombre AS nombre_profesor FROM profesor pr LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor LEFT JOIN persona p ON pr.id_profesor = p.id WHERE a.id_profesor IS NULL;
-- 5. SELECT a.nombre AS nombre_asignatura FROM asignatura a LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor WHERE a.id_profesor IS NULL;
-- 6. SELECT d.nombre AS nombre_departamento FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;

-- Consultas resumen:

-- 1. SELECT COUNT(*) AS total_alumnos FROM persona WHERE tipo = 'alumno';
-- 2. SELECT COUNT(*) AS alumnos_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- 3. SELECT d.nombre AS nombre_departamento, COUNT(pr.id_profesor) AS num_profesores FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre HAVING num_profesores > 0 ORDER BY num_profesores DESC;
-- 4. SELECT d.nombre AS nombre_departamento, COUNT(pr.id_profesor) AS num_profesores FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre;
-- 5. SELECT g.nombre AS nombre_grado, COUNT(a.id) AS num_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY num_asignaturas DESC;
-- 6. SELECT g.nombre AS nombre_grado, COUNT(a.id) AS num_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING num_asignaturas > 40;
-- 7. SELECT g.nombre AS nombre_grado, a.tipo, SUM(a.creditos) AS suma_creditos FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;
-- 8. SELECT ce.anyo_inicio, COUNT(DISTINCT asa.id_alumno) AS num_alumnos FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura asa ON ce.id = asa.id_curso_escolar GROUP BY ce.anyo_inicio;
-- 9. SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS num_asignaturas FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY num_asignaturas DESC;
-- 10. SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
-- 11. SELECT p.id, p.nombre, p.apellido1, p.apellido2, d.nombre AS nombre_departamento FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 'profesor' AND a.id IS NULL;

-- Base de datos Tienda 

-- 1. SELECT nombre FROM producto;
-- 2. SELECT nombre, precio FROM producto; 
-- 3. SELECT * FROM producto;
-- 4. SELECT nombre, precio, precio * 1.1 AS precio_usd FROM producto;
-- 5. SELECT nombre AS nombre_de_producto, precio AS euros, precio * 1.1 AS dolares FROM producto;
-- 6. SELECT UPPER(nombre) AS nombre, precio FROM producto;
-- 7. SELECT LOWER(nombre) AS nombre, precio FROM producto;
-- 8. SELECT nombre, UPPER(LEFT(nombre, 2)) AS iniciales FROM fabricante;
-- 9. SELECT nombre, ROUND(precio, 2) AS precio FROM producto;
-- 10. SELECT nombre, TRUNCATE(precio, 0) AS precio FROM producto;
-- 11. SELECT codigo_fabricante FROM producto;
-- 12. SELECT DISTINCT codigo_fabricante FROM producto;
-- 13. SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 14. SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15. SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
-- 16. SELECT * FROM fabricante LIMIT 5;
-- 17. SELECT * FROM fabricante LIMIT 3, 2;
-- 18. SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
-- 19. SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20. SELECT nombre FROM producto WHERE codigo_fabricante = 2;
