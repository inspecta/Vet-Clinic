/* Populate database with sample data. */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '03/02/2020', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '07/01/2021', 2, TRUE, 8.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '07/01/2021', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '12/05/2017', 5, TRUE, 11.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '08/02/2020', 0, FALSE, 11.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '15/11/2021', 2, TRUE, 5.70);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '02/04/1993', 3, FALSE, 12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '12/06/2005', 1, TRUE, 45.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '7/06/2005', 7, TRUE, 20.40);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '13/10/1998', 3, TRUE, 17.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '14/05/2022', 4, TRUE, 22.00);

/* Insert details of animal owners */
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jeniffer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

/* Insert details of animal species */
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

/*UPDATE ANIMAL's TABLE */

/*Add species_id to animals table */
UPDATE animals 
SET species_id = (SELECT id FROM species WHERE name = 'Digimon') 
WHERE name like '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id is null;

/*Add animal owners*/
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jeniffer Orwell')
WHERE name = 'Pikachu' OR name = 'Gabumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon'  OR name = 'Boarmon';

/* Vets*/
INSERT INTO vets(name, age, date_of_graduation) VALUES(
'William Tatcher', 45, '23/04/2000');

INSERT INTO vets(name, age, date_of_graduation) VALUES(
'Maisy Smith', 26, '17/01/2019');

INSERT INTO vets(name, age, date_of_graduation) VALUES(
'Stephaine Mendez', 64, '04/05/1981');

INSERT INTO vets(name, age, date_of_graduation) VALUES(
'Jack Harkness', 38, '08/06/2008');

/* Specialisations */

INSERT INTO specializations (species_id, vet_id) VALUES( 
  (SELECT id FROM species WHERE name = 'Pokemon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher')
);

INSERT INTO specializations (species_id, vet_id) VALUES( 
  (SELECT id FROM species WHERE name = 'Digimon'),
  (SELECT id FROM vets WHERE name = 'Stephaine Mendez')
);

INSERT INTO specializations (species_id, vet_id) VALUES( 
  (SELECT id FROM species WHERE name = 'Pokemon'),
  (SELECT id FROM vets WHERE name = 'Stephaine Mendez')
);

INSERT INTO specializations (species_id, vet_id) VALUES( 
  (SELECT id FROM species WHERE name = 'Digimon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness')
);


/*Visits*/
-- Agumon visited William Tatcher on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'24/04/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'Stephaine Mendez'),
'22/07/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Gabumon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'02/02/2021');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'05/01/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'08/03/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'14/05/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Devimon'),
(SELECT id FROM vets WHERE name = 'Stephaine Mendez'),
'04/05/2021');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Charmander'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'24/02/2021');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'21/12/2019');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'10/08/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'07/04/2021');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Squirtle'),
(SELECT id FROM vets WHERE name = 'Stephaine Mendez'),
'29/09/2019');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'03/10/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'),
'04/11/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'24/01/2019');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'15/05/2019');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'27/02/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'),
'03/08/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Blossom'),
(SELECT id FROM vets WHERE name = 'Stephaine Mendez'),
'24/05/2020');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES(
(SELECT id FROM animals WHERE name = 'Blossom'),
(SELECT id FROM vets WHERE name = 'William Tatcher'),
'11/01/2021');

-- Performance Tuning
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT * FROM (SELECT id FROM animals) animal_ids,
(SELECT id FROM vets)
vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

INSERT INTO owners (full_name, email)
SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';