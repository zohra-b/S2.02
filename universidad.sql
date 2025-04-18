use universidad;
-- PRIMERES CONSULTES --
--1 Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

-- 2 Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;

--3 Retorna el llistat dels alumnes que van néixer en 1999.
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

-- 4 Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- 5 Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND CURSO = 3 AND id_grado = 7;

-- 6 Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS 'departamento' FROM persona INNER JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id WHERE tipo = 'profesor' ORDER BY apellido1 ASC, apellido2 ASC, persona.nombre ASC ;

-- 7 Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM alumno_se_matricula_asignatura INNER JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE nif = '26902806M';

-- 8 Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT persona.apellido1 AS 'apellido', persona.nombre AS 'nombre', departamento.nombre AS 'departamento', asignatura.nombre AS 'asignatura', grado.nombre AS 'grado' FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre LIKE '%Informática%';

-- 9 Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT persona.apellido1 AS 'apellido', persona.nombre AS 'nombre' FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE curso_escolar.anyo_inicio = 2018 ;


-- CONSULTES AMB clàusules LEFT JOIN i RIGHT JOIN --
-- 1 Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats.
SELECT persona.apellido1 , persona.apellido2 , persona.nombre,  departamento.nombre AS 'departamento' FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- 2 Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT persona.apellido1 , persona.apellido2 , persona.nombre,  departamento.nombre AS 'departamento' FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- 3 Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT * FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL;

-- 4 Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT * FROM persona left JOIN asignatura ON persona.id = asignatura.id_profesor WHERE persona.tipo = 'profesor' AND asignatura.id_profesor IS NULL;

-- 5 Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT * FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;

-- 6 Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT departamento.nombre as 'departamento', asignatura.nombre as 'asignatura' FROM asignatura RIGHT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor RIGHT JOIN departamento ON profesor.id_departamento = departamento.id WHERE asignatura.nombre IS NULL;

-- CONSULTES RESUM --
-- 1 Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';

-- 2 Calcula quants alumnes van néixer en 1999.
SELECT COUNT(*)  FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31' ;

-- 3 Calcula quants professors/es hi ha en cada departament.
SELECT departamento.nombre as 'departamento', COUNT(*) as 'profesors' FROM profesor JOIN departamento ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY COUNT(*) DESC;

-- 4 Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells.
SELECT departamento.nombre as 'departamento', persona.apellido1 as 'apellido', persona.nombre FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id LEFT join persona ON persona.id = profesor.id_profesor ORDER BY departamento.nombre ASC, persona.apellido1 ASC ;

-- 5 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun.
SELECT grado.nombre AS 'grado', COUNT(*) FROM asignatura RIGHT JOIN grado ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY COUNT(*) DESC;

-- 6 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT grado.nombre as 'grado', count(*) FROM asignatura RIGHT JOIN grado ON asignatura.id_grado = grado.id GROUP BY grado.nombre HAVING count(*) > 40 ORDER BY count(*) desc;

-- 7 Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura.
SELECT grado.nombre as 'grado', asignatura.tipo as 'tipo asignatura', SUM(creditos) FROM asignatura left JOIN grado ON asignatura.id_grado = grado.id GROUP BY grado.nombre, asignatura.tipo;

-- 8 Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars.
SELECT curso_escolar.anyo_inicio, COUNT(*) as 'numero de alumnos matriculados' FROM alumno_se_matricula_asignatura JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id GROUP BY curso_escolar.anyo_inicio;

-- 9 Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a.
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id) as 'numero de asignaturas' FROM profesor LEFT JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor GROUP BY persona.id ORDER BY COUNT(asignatura.id) desc;

-- 10 Retorna totes les dades de l'alumne/a més jove.
SELECT * FROM persona LEFT JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno LEFT JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor LEFT JOIN grado ON grado.id= asignatura.id_grado WHERE persona.tipo = 'alumno' order by (persona.fecha_nacimiento) DESC LIMIT 1;

--11 Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre as 'departamento' FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id right JOIN departamento ON profesor.id_departamento = departamento.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id is null AND profesor.id_profesor is not null;




