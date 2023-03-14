# SQLDesign
Given three databases of data, redesign and improve the schema.

Download starter code and seed the files using the following command command in your directory: psql < file.sql

*Postgresql must be running for this to work.
- To check if postgresql is running, use the command: sudo service postgresql status
- To start postgresql, use the command: sudo service postgresql start
- To stop postgresql, use the command: sudo service postgresql stop

# OuterSpaceSQL
Practice Query:

SELECT m.name, p.name, s.name, g.name
	FROM moons m
RIGHT JOIN planets p
	ON m.orbits = p.id
RIGHT JOIN stars s
	ON p.orbits = s.id
RIGHT JOIN galaxies g
	ON s.galaxy = g.id;

- Shows all celestial bodies, with and without matches in each table

# AirTrafficSQL
Practice Query:

SELECT a.name, x.name AS to_city, z.name AS from_city, t.seat, p.first_name, p.last_name
    FROM tickets t
JOIN passengers p
	ON p.id = t.passenger
JOIN flights f
	ON f.id = t.flight
JOIN airlines a
	ON a.id = f.airline
JOIN cities x
	ON x.id = f.to_city
JOIN cities z
	ON z.id = f.from_city;

- Shows each ticket with the passenger's name, to and from cities, seat numbers, and airline

# MusicSQL
Practice Query:

SELECT song_title, artist_name, album_name, producer_name
	FROM song_artists x
JOIN artists a
	ON x.song_artist = a.artist_id
JOIN songs s
	ON x.artist_song = s.song_id
JOIN albums l
	ON s.song_album = l.album_id
JOIN album_producers y
	ON l.album_id = y.album_produced
JOIN producers p
	ON y.producer_of_album = p.producer_id
ORDER BY song_title, artist_name, producer_name;

- Shows the song title, artist, album, and producer (with duplicates for songs/albums with multiple artists or multiple producers)