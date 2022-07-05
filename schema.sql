/* Database schema to keep the structure of entire database. */

CREATE database vet_clinic

create table animals (
    id int primary key,
    name text,
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);
