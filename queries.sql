/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name like '%mon';
SELECT * from animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
SELECT NAME FROM animals WHERE NEUTERED = TRUE AND ESCAPE_ATTEMPTS < 3;
SELECT DATE_OF_BIRTH FROM animals WHERE NAME = 'Agumon' OR NAME = 'Pikachu';
SELECT NAME, ESCAPE_ATTEMPTS FROM animals WHERE WEIGHT_KG > 10.5;
SELECT * FROM animals WHERE NEUTERED = TRUE;
SELECT * FROM animals WHERE NOT NAME = 'Gabumon';
SELECT * FROM animals WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <=17.3;

-- day 2

BEGIN;
UPDATE animals set species='unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE NAME LIKE '%mon';
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT BEFORE2022;
UPDATE animals SET weight_kg = (weight_kg*-1);
ROLLBACK TO BEFORE2022;
UPDATE animals SET weight_kg = (weight_kg*-1) WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM ANIMALS WHERE escape_attempts > 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- day 3

SELECT name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.id = species.id WHERE species.name = 'Pokemon';
SELECT full_name as owner_name, name as animal_name FROM owners LEFT JOIN animals ON owners.id = animals.owners_id;
SELECT species.name,COUNT(*) FROM animals LEFT JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id JOIN owners ON owners_id = owners.id WHERE species.name = 'Digimon' AND full_name = 'Jennifer Orwell';
SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT full_name, COUNT(*) FROM animals JOIN owners ON owners_id = owners.id GROUP BY full_name ORDER BY COUNT(*) DESC LIMIT 1;

-- da 4

SELECT animals.name FROM animals 
JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'William Tatcher' 
ORDER BY visits.date DESC LIMIT 1;

SELECT count(animals.name) FROM animals 
JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM vets 
JOIN specializations ON specializations.vets_id = vets.id
JOIN species ON species.id = specializations.species_id;

SELECT animals.name from animals 
JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON visits.vets_id = vets.id 
WHERE vets.name = 'Stephanie Mendez' AND visits.date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(animals.name) FROM animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name
ORDER BY COUNT(animals.name) DESC LIMIT 1;

SELECT animals.name FROM animals 
JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith' 
ORDER BY visits.date LIMIT 1;

SELECT animals.*, vets.*, visits.date FROM animals 
JOIN visits ON visits.animals_id = animals.id 
JOIN vets ON vets.id = visits.vets_id
ORDER BY visits.date DESC LIMIT 1;

SELECT COUNT (*) from visits
FULL JOIN animals ON animals.id = visits.animals_id
FULL JOIN vets ON vets.id = visits.vets_id
FULL JOIN specializations ON specializations.vets_id = vets.id
WHERE specializations.species_id is NULL;

SELECT species.name, COUNT(*) FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name 
ORDER BY COUNT(*) DESC LIMIT 1;
