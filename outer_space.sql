-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space_v2;

CREATE DATABASE outer_space_v2;

\c outer_space_v2

CREATE TABLE galaxy_name 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,

);

INSERT INTO galaxy_name (name)
VALUES 
('Milky Way');

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO orbits_around (name)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES orbits_around on DELETE CASCADE,
  galaxy_name INTEGER REFERENCES galaxy_name on DELETE CASCADE,
  moons TEXT[]
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy_name, moons)
VALUES
  ('Earth', 1.00, 1, 1, '{"The Moon"}'),
  ('Mars', 1.88, 1, 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 1, 1, '{}'),
  ('Neptune', 164.8, 1, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 2, 1, '{}'),
  ('Gliese 876 b', 0.23, 3, 1, '{}');





