-- Crear base de datos llamada películas
CREATE DATABASE peliculas;

-- Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes, determinando la relación entre ambas tablas.
CREATE TABLE peliculas(id SERIAL, pelicula VARCHAR(150), año_estreno INT, director VARCHAR(100), PRIMARY KEY (id));

CREATE TABLE reparto(id INT, actor VARCHAR(100), FOREIGN KEY (id) REFERENCES peliculas(id));

