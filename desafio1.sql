DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan(
	id INT PRIMARY KEY NOT NULL,
    plano_name VARCHAR(100) NOT NULL, 
    valor_plano DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE usuari(
	id INT PRIMARY KEY NOT NULL ,
    usuario_name VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano(id)
) engine = InnoDB;


CREATE TABLE historico_cancoe(
	id INT PRIMARY KEY NOT NULL,
    historico_cancoes_name VARCHAR(100) NOT NULL, 
	plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano(id),
	usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario (id)
) engine = InnoDB;


CREATE TABLE artista(
	id INT PRIMARY KEY NOT NULL,
    artistas_name VARCHAR(100) NOT NULL
) engine = InnoDB;


CREATE TABLE albu(
	id INT PRIMARY KEY NOT NULL,
    album_name VARCHAR(100) NOT NULL, 
	artistas_id INT NOT NULL,
    FOREIGN KEY (artistas_id) REFERENCES artistas(id)
) engine = InnoDB;

CREATE TABLE cancoe(
	id INT PRIMARY KEY NOT NULL,
    cancoes_name VARCHAR(100) NOT NULL, 
	album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(id),
	artistas_id INT NOT NULL,
    FOREIGN KEY (artistas_id) REFERENCES artistas(id)
) engine = InnoDB;


CREATE TABLE seguindo_artista(
	id INT PRIMARY KEY NOT NULL,
    seguindo_name VARCHAR(100) NOT NULL, 
	plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano(id),
	usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    artistas_id INT NOT NULL,
    FOREIGN KEY (artistas_id) REFERENCES artistas(id)
) engine = InnoDB;

INSERT INTO plan (id, plano_name, valor_plano)
VALUES
  ( 1, 'Gratuito', 0 ),
  ( 2, 'Famniliar', 7.99 ),
  ( 3, 'Universitatio', 5.99);

INSERT INTO usuari (id, usuario_name, idade, plano_id)
VALUES
  ( 1, 'Thati', 23, 1 ),
  ( 2, 'Cintia', 35, 2 ),
  ( 3, 'Bill', 20, 3 ),
  ( 4, 'Roger', 45, 1 );
  
  INSERT INTO  historico_cancoe(id,  historico_cancoes_name, plano_id, usuario_id )
VALUES
(1,'Freedie Shannon',1, 1),
(2,'Lance Day',1,1),
(3,'Walter Phoenix',1,1),
(4,'Walter Phoenix',2,2),
(5,'Lance Day',2,2),
(6,'Walter Phoenix',3,3),
(7,'Peter Strong',3,3),
(8,'Freedie Shannon',1,4);

INSERT INTO artista(id, artistas_name)
VALUES
  ( 1, 'Walter Phoenix'),
  ( 2, 'Peter Strong'),
  ( 3, 'Lance Day'),
  ( 4, 'Freedie Shannon');
  
  INSERT INTO albu(id, album_name, artistas_id )
VALUES
(1,	'Envious',1),
(2, 'Exuberant',1),
(3,	'Hallowed Steam',2),
(4,	'Incandescent',3),
(5,	'Temporary Culture'	,4);

 INSERT INTO cancoe(album_id, cancoes_name, id, artistas_id )
VALUES
(1, 'Soul For us', 1, 1),
(1, 'Reflections OF magic', 2,1),
(1,'Dance With her Own',3,1),
(2,'Troubles Of My Inner Fire',4,1),
(2, 'Time Fireworks',5,1),
(3, 'Magic Circus', 6,2),
(3, 'Honey, So DO I', 7,2),  
(3, 'Sweetie',8,2),
(3, 'Let’s Go Wild',9,2),
(3, 'She knows', 10,2),
(4, 'Fantasy For Me', 11, 3),
(4, 'Celebration Of More',12, 3),
(4, 'Rock his Everything',13,3),
(4, 'Home Forever',14,3),
(4, 'Diamond Power',15,3),
(4, 'Honey lets be silly',16,3),
(5, 'Thang Of Thunder', 17, 4),
(5, 'Words Of Her Life', 18,4),
(5,  'Without My Streets',19,4),
(4, 'Lets be silly',20,3);

INSERT INTO seguindo_artista(id, seguindo_name, plano_id,  usuario_id, artistas_id)
VALUES
(1,'Freedie Shannon',1,4, 4),
(2,'Lance Day',3,3, 3),
(3,'Walter Phoenix',1,1,1),
(4,'Walter Phoenix',1,1,1),
(5,'Lance Day',3,3, 3),
(6,'Walter Phoenix',1,1,1),
(7,'Peter Strong',2,2,2),
(8,'Freedie Shannon',1,4,4);

