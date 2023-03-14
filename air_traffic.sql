-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'), 
  ('Delta'), 
  ('TUI Fly Belgium'), 
  ('Air China'), 
  ('American Airlines'), 
  ('Avianca Brasil');

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

INSERT INTO countries
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('France'),
  ('UAE'),
  ('Morocco'),
  ('Mexico'),
  ('China'),
  ('Brazil'),
  ('Chile');

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  country INT REFERENCES countries
);

INSERT INTO cities
  (name, country)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Tokyo', 2),
  ('London', 3),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('Paris', 4),
  ('Dubai', 5),
  ('Casablanca', 6),
  ('Mexico City', 7),
  ('Beijing', 8),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Sao Paolo', 9),
  ('Santiago', 10);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline INT REFERENCES airlines,
  arrival TIMESTAMP NOT NULL,
  departure TIMESTAMP NOT NULL,
  from_city INT REFERENCES cities,
  to_city INT REFERENCES cities
);

INSERT INTO flights
  (airline, from_city, to_city, departure, arrival)
VALUES
  (1, 1, 2, '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  (2, 3, 4, '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  (3, 5, 6, '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  (3, 2, 10, '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  (4, 7, 9, '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  (5, 8, 11, '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  (1, 12, 13, '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  (6, 14, 15, '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  (6, 13, 16, '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  (7, 17, 18, '2019-01-20 19:30:00', '2019-01-20 22:45:00');

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  flight INT REFERENCES flights,
  seat TEXT NOT NULL,
  passenger INT REFERENCES passengers
);

INSERT INTO tickets
  (flight, seat, passenger)
VALUES
  (1, '33B', 1),
  (2, '8A', 2),
  (3, '12F', 3),
  (4, '20A', 1),
  (5, '23D', 4),
  (6, '18C', 2),
  (7, '9E', 5),
  (8, '1A', 6),
  (9, '32B', 5),
  (10, '10D', 7);

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');