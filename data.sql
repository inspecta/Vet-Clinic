/* Populate database with sample data. */
insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Agumon', '03/02/2020', 0, TRUE, 10.23);
insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Gabumon', '07/01/2021', 2, TRUE, 8.00);
insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Pikachu', '07/01/2021', 1, FALSE, 15.04);
insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) values('Devimon', '12/05/2017', 5, TRUE, 11.00);

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
