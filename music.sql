-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music

CREATE TABLE artists
(
  artist_id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

INSERT INTO artists
  (artist_name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boys II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper')
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavinge'),
  ('Destiny''s Child');

CREATE TABLE producers
(
  producer_id SERIAL PRIMARY KEY,
  producer_name TEXT UNIQUE
);

INSERT INTO producers
  (producer_name)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

CREATE TABLE albums
(
  album_id SERIAL PRIMARY KEY,
  album_name TEXT,
  release_date DATE NOT NULL
);

INSERT INTO albums
  (album_name, release_date)
VALUES
  ('Middle of Nowhere', '04-15-1997'),
  ('A Night at the Opera', '10-31-1975'),
  ('Daydream', '11-14-1995'),
  ('A Star Is Born', '09-27-2018'),
  ('Silver Side Up', '08-21-2001'),
  ('The Blueprint 3', '10-20-2009'),
  ('Prism', '12-17-2013'),
  ('Hands All Over', '06-21-2011'),
  ('Let Go', '05-14-2002'),
  ('The Writing''s on the Wall', '11-07-1999');

CREATE TABLE songs
(
  song_id SERIAL PRIMARY KEY,
  song_title TEXT NOT NULL,
  song_duration INTEGER NOT NULL,
  song_album INT REFERENCES albums(album_id),
);

INSERT INTO songs
  (song_title, song_duration, song_album)
VALUES
  ('MMMBop', 238, 1),
  ('Bohemian Rhapsody', 355, 2),
  ('One Sweet Day', 282, 3),
  ('Shallow', 216, 4),
  ('How You Remind Me', 223, 5),
  ('New York State of Mind', 276, 6),
  ('Dark Horse', 215, 7),
  ('Moves Like Jagger', 201, 8),
  ('Complicated', 244, 9),
  ('Say My Name', 240, 10);

CREATE TABLE album_producers
(
  album_producer_id SERIAL PRIMARY KEY,
  album_produced INT REFERENCES albums(album_id),
  producer_of_album INT REFERENCES producers(producer_id)
);

INSERT INTO album_producers
  (album_produced, producer_of_album)
VALUES
  (1, 1)
  (1, 2)
  (2, 3)
  (3, 4)
  (4, 5)
  (5, 6)
  (6, 7)
  (7, 8)
  (7, 9)
  (8, 10)
  (8, 11)
  (9, 12)
  (10, 13);

  CREATE TABLE song_artists
  (
    artist_song_id SERIAL PRIMARY KEY,
    artist_song INT REFERENCES songs(song_id),
    song_artist INT REFERENCES artists(artist_id)
  );

  INSERT INTO song_artists
    (song_artist, artist_song)
  VALUES
    (1, 1)
    (2, 2)
    (3, 3)
    (3, 4)
    (4, 5)
    (4, 6)
    (5, 7)
    (6, 8)
    (6, 9)
    (7, 10),
    (7, 11)
    (8, 12)
    (8, 13)
    (9, 14)
    (10, 15);

-- (song_title, song_duration, release_date, artists, album, producers)
  -- ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  -- ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  -- ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
  -- ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
  -- ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
  -- ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
  -- ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
  -- ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  -- ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
  -- ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
