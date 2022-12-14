/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(20);

/* Create owners table */
CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

/*Create Species table */
CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

/*Constraints */
ALTER TABLE animals 
ADD COLUMN species_id INT CONSTRAINT species_animals_fk 
REFERENCES species(id)
ON DELETE CASCADE;

ALTER TABLE animals 
ADD COLUMN owner_id INT CONSTRAINT owners_animals_fk 
REFERENCES owners(id) 
ON DELETE CASCADE;

/*Vets*/
CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE
)

/*Specialisations*/
CREATE TABLE specializations(
    species_id INT REFERENCES species(id) ON DELETE CASCADE,
    vet_id INT REFERENCES vets(id) ON DELETE CASCADE
);

/*Visits*/
CREATE TABLE visits(
    animal_id INT REFERENCES animals(id) ON DELETE CASCADE,
    vet_id INT REFERENCES vets(id) ON DELETE CASCADE,
    visit_date DATE
);

-- Performance Indexes
CREATE INDEX animal_id_asc ON visits (animal_id ASC);
CREATE INDEX owner_email_desc ON owners (email DESC);
CREATE INDEX vet_id_asc ON visits(vet_id ASC);