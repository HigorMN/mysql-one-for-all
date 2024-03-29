DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan(
	  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    value DECIMAL(3, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE user(
	  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    date_subscription DATE NOT NULL,
	FOREIGN KEY (plan_id) REFERENCES plan(id)
) engine = InnoDB;

CREATE TABLE artist(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
) engine = InnoDB;

CREATE TABLE album(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year YEAR NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist(id)
) engine = InnoDB;

CREATE TABLE song(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    duration_seconds INT NOT NULL,
    release_year YEAR NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist(id),
    FOREIGN KEY (album_id) REFERENCES album(id)
) engine = InnoDB;

CREATE TABLE following_artist(
	user_id INT NOT NULL, 
	artist_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (artist_id) REFERENCES artist(id)
) engine = InnoDB;

CREATE TABLE user_history_reproductions(
	user_id INTEGER,
	song_id INTEGER,
	date_reproductions DATETIME NOT NULL,
	PRIMARY KEY(user_id, song_id),
	FOREIGN KEY (user_id) REFERENCES user(id),
  FOREIGN KEY (song_id) REFERENCES song(id)
) engine = InnoDB;

INSERT INTO plan(name, value)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);
  
INSERT INTO user(name, age, plan_id, date_subscription)
VALUES
  ('Barbara Liskov', 82, 1,	'2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler', 46,	2, '2017-01-17'),
  ('Sandi Metz', 58, 2, '2018-04-29'),
  ('Paulo Freire', 19,	3, '2018-02-14'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander',	85,	4, '2019-06-05'),
  ('Judith Butler', 45,	4, '2020-05-13'),
  ('Jorge Amado', 58, 4, '2017-02-17');
  
INSERT INTO artist(name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
  
INSERT INTO album(name, artist_id, release_year)
VALUES
	('Renaissance', 1, 2022),
	('Jazz', 2, 1978),
	('Hot Space', 2, 1982),
	('Falso Brilhante', 3, 1998),
	('Vento de Maio', 3, 2001),
	('QVVJFA?', 4, 2003),
	('Somewhere Far Beyond', 5, 2007),
	('I Put A Spell On You', 6, 2012);

INSERT INTO song(name, duration_seconds, release_year, artist_id, album_id)
VALUES
	('BREAK MY SOUL', 279, 2022, 1, 1),
	('VIRGO’S GROOVE', 369, 2022, 1, 1),
	('ALIEN SUPERSTAR', 116, 2022, 1, 1),
	('Don’t Stop Me Now', 203, 1978, 2, 2),
	('Under Pressure', 152, 1982, 2, 3),
	('Como Nossos Pais', 105, 1998, 3, 4),
	('O Medo de Amar é o Medo de Ser Livre', 207, 2001, 3, 5),
	('Samba em Paris', 267, 2003, 4, 6),
	('The Bard’s Song', 244, 2007, 5, 7),
	('Feeling Good', 100, 2012, 6, 8);
    
INSERT INTO following_artist(user_id, artist_id)
VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);

INSERT INTO user_history_reproductions(user_id, song_id, date_reproductions)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');