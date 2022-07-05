/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name like '%mon';
SELECT * from animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
SELECT NAME FROM animals WHERE NEUTERED = TRUE AND ESCAPE_ATTEMPTS < 3;
SELECT DATE_OF_BIRTH FROM animals WHERE NAME = 'Agumon' OR NAME = 'Pikachu';
SELECT NAME, ESCAPE_ATTEMPTS FROM animals WHERE WEIGHT_KG > 10.5;
SELECT * FROM animals WHERE NEUTERED = TRUE;
SELECT * FROM animals WHERE NOT NAME = 'Gabumon';
SELECT * FROM animals WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <=17.3;
