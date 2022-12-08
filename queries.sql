/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01/01/2016' AND '01/01/2019';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Database Transactions */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is null;
COMMIT

BEGIN
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01/01/2022';
SAVEPOINT savepoint_1;
UPDATE animals SET weight_kg = (weight_kg * -1);
ROLLBACK TO savepoint_1;
UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
COMMIT;

/*Query questions*/
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT name FROM animals ORDER BY escape_attempts DESC LIMIT 1;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '01/01/1990' AND '01/01/2000'  GROUP BY species;

/*Queries with JOINs*/
-- What animals belong to Melody Pond?
SELECT A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg 
FROM animals A
JOIN owners OW ON A.owner_id = OW.id
WHERE OW.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT A.name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg, S.name as Species
FROM animals A
JOIN species S ON A.species_id = S.id
WHERE S.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT OW.full_name as owner_name, A.name as animal_name
FROM owners OW
LEFT JOIN animals A ON OW.id = A.owner_id;

-- How many animals are there per species?
SELECT S.name as species_name, COUNT(*) as no_of_animals
FROM animals A 
JOIN species S ON A.species_id = S.id  
GROUP BY S.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT A.name as animal_name, S.name as species_name, OW.full_name as owner_name
FROM animals A
JOIN species S ON A.species_id = S.id
JOIN owners OW ON A.owner_id = OW.id 
WHERE S.name = 'Digimon' AND OW.full_name = 'Jeniffer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT A.name as animal_name, A.escape_attempts, OW.full_name as owner_name 
FROM Animals A
JOIN owners OW ON A.owner_id = OW.id
WHERE OW.full_name = 'Dean Winchester' AND A.escape_attempts = 0;

-- Who owns the most animals?
SELECT OW.full_name as owner_name, COUNT(*) as count
FROM animals A
JOIN owners OW ON A.owner_id = OW.id 
GROUP BY OW.full_name
ORDER BY count DESC LIMIT 1;
