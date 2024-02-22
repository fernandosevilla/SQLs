-- 1 Mostrar el sueldo medio de los actores de peliculas agrupados por genero
SELECT p.genero, AVG(a.sueldo) FROM peliculas p, actuar a
WHERE a.idPelicula = p.idPelicula
-- JOIN actuar a ON p.idPelicula = a.idPelicula
GROUP BY p.genero;

-- 2 Mostrar el id de la persona, apellidos y nombre que han cobrado por actuar mas que el director que mas ha cobrado por dirigir
SELECT p.idPersona, p.apellidos, p.nombre FROM personas p, actuar a
WHERE p.idPersona = a.actor
AND a.sueldo > (SELECT MAX(sueldo) FROM peliculas);

-- 3 Mostrar el id de la persona, apellidos y nombre que han trabajado como director y como actor a lo largo de su carrera
SELECT p.idPersona, p.apellidos, p.nombre FROM personas p, actuar a, directores d
WHERE p.idPersona = a.actor 
AND p.idPersona = d.idPersona;

-- 4 Listar los directores con el id, apellido y nombre que hayan dirigido mas de 2 peliculas del mismo genero
SELECT p.idPersona, p.apellidos, p.nombre FROM personas p, directores d
WHERE p.idPersona = d.idPersona
AND d.idPersona IN (SELECT director FROM peliculas
					WHERE genero = "Acción"
					GROUP BY director
					HAVING COUNT(director) >= 2);
                    
-- SELECT count(genero) AS Peliculas_Mismo_Genero_Director, director FROM peliculas
-- WHERE genero = "Acción"
-- GROUP BY director;

-- 5 Listar todas las personas (actores, directores) que trabajan en la pelicula de titulo Los Vengadores
SELECT p.idPersona, p.apellidos, p.nombre FROM personas p, actuar a, peliculas pel
WHERE a.actor = p.idPersona 
AND pel.titulo = "Los Vengadores"
AND a.idPelicula = pel.idPelicula
UNION
SELECT p.idPersona, p.apellidos, p.nombre FROM personas p, peliculas pel
WHERE pel.director = p.idPersona 
AND pel.titulo = "Los Vengadores"

