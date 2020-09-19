-- Crear base de datos llamada películas
CREATE DATABASE peliculas;

-- Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes, determinando la relación entre ambas tablas.
CREATE TABLE peliculas(id SERIAL, pelicula VARCHAR(150), año_estreno INT, director VARCHAR(100), PRIMARY KEY (id));

CREATE TABLE reparto(id INT, actor VARCHAR(100), FOREIGN KEY (id) REFERENCES peliculas(id));

-- Cargar ambos archivos a su tabla correspondiente.

-- \copy peliculas FROM 'path/peliculas.csv' csv header
-- \copy reparto FROM 'path/reparto.csv' csv

-- Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película, año de estreno, director y todo el reparto.

SELECT pelicula, año_estreno, director, actor FROM peliculas AS p INNER JOIN reparto AS r ON p.id=r.id WHERE p.pelicula='Titanic';

-- Listar los titulos de las películas donde actúe Harrison Ford.

SELECT pelicula FROM peliculas AS p INNER JOIN reparto AS r ON p.id=r.id WHERE r.actor='Harrison Ford';

-- Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100.

SELECT COUNT(pelicula) AS numero_peliculas, director FROM peliculas GROUP BY director ORDER BY numero_peliculas DESC LIMIT 10;