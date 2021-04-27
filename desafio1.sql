DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE informacao_do_plano(
    id INT PRIMARY KEY NOT NULL,
    plano_name VARCHAR(100) NOT NULL, 
    valor_plano DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE usuario_dados(
    id INT PRIMARY KEY NOT NULL ,
    usuario_name VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    informacao_do_plano_id INT NOT NULL,
    FOREIGN KEY (informacao_do_plano_id) REFERENCES informacao_do_plano(id)
) engine = InnoDB;

CREATE TABLE artistas(
    id INT PRIMARY KEY NOT NULL,
    artistas_name VARCHAR(100) NOT NULL
) engine = InnoDB;


CREATE TABLE album(
    id INT PRIMARY KEY NOT NULL,
    album_name VARCHAR(100) NOT NULL, 
    artistas_id INT NOT NULL,
    FOREIGN KEY (artistas_id) REFERENCES artistas(id)
) engine = InnoDB;

CREATE TABLE cancoes(
    id INT PRIMARY KEY NOT NULL,
    cancoes_name VARCHAR(100) NOT NULL, 
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(id),
    artistas_id INT NOT NULL,
    FOREIGN KEY (artistas_id) REFERENCES artistas(id)
) engine = InnoDB;

CREATE TABLE historico_cancoes (
    id INT NOT NULL,
    historico_cancoes_name VARCHAR(100) NOT NULL,
    informacao_do_plano_id INT NOT NULL,
    FOREIGN KEY (informacao_do_plano_id)
        REFERENCES informacao_do_plano (id),
    usuario_dados_id INT NOT NULL,
    FOREIGN KEY (usuario_dados_id)
        REFERENCES usuario_dados (id),
    cancoes_id INT NOT NULL,
    FOREIGN KEY (cancoes_id)
        REFERENCES cancoes (id),
    PRIMARY KEY (`id` , `informacao_do_plano_id`)
)  ENGINE=INNODB;

CREATE TABLE seguindo_artistas(
    id INT PRIMARY KEY NOT NULL,
    seguindo_name VARCHAR(100) NOT NULL, 
    informacao_do_plano_id INT NOT NULL,
    FOREIGN KEY (informacao_do_plano_id) REFERENCES informacao_do_plano(id),
    usuario_dados_id INT NOT NULL,
    FOREIGN KEY (usuario_dados_id) REFERENCES usuario_dados(id),
    artistas_id INT NOT NULL,
    FOREIGN KEY (artistas_id) REFERENCES artistas(id), 
	PRIMARY KEY (`id` , `informacao_do_plano_id`)
) engine = InnoDB;

INSERT INTO informacao_do_plano (id, plano_name, valor_plano)
VALUES
( 1, 'Gratuito', 0 ),
( 2, 'Famniliar', 7.99 ),
( 3, 'Universitatio', 5.99);

INSERT INTO usuario_dados (id, usuario_name, idade, informacao_do_plano_id)
VALUES
( 1, 'Thati', 23, 1 ),
( 2, 'Cintia', 35, 2 ),
( 3, 'Bill', 20, 3 ),
( 4, 'Roger', 45, 1 );
  


INSERT INTO artistas (id, artistas_name)
VALUES
( 1, 'Walter Phoenix'),
( 2, 'Peter Strong'),
( 3, 'Lance Day'),
( 4, 'Freedie Shannon');
  
INSERT INTO album (id, album_name, artistas_id )
VALUES
(1,	'Envious',1),
(2, 'Exuberant',1),
(3,	'Hallowed Steam',2),
(4,	'Incandescent',3),
(5,	'Temporary Culture'	,4);

INSERT INTO cancoes(album_id, cancoes_name, id, artistas_id )
VALUES
(1, 'Soul For us', 1, 1),
(1, 'Reflections OF magic', 2,1),
(1,'Dance With her Own',3,1),
(2,'Troubles Of My Inner Fire',4,1),
(2, 'Time Fireworks',5,1),
(3, 'Magic Circus', 6,2),
(3, ' Honey, So DO I', 7, 2),
(3, 'Sweetie lets go Wild',8,2),
(3, 'She knows', 9,2),
(4, 'Fantasy For Me', 10, 3),
(4, 'Celebration Of More',11, 3),
(4, 'Rock his Everything',12,3),
(4, 'Home Forever',13,3),
(4, 'Diamond Power',14,3),
(4, 'Honey, Lets Be Silly',15,3),
(5, 'Thang Of Thunder', 16, 4),
(5, 'Words Of Her Life', 17,4),
(5,  'Without My Streets',18,4);


INSERT INTO  historico_cancoes(id, historico_cancoes_name, informacao_do_plano_id, usuario_dados_id, cancoes_id )
VALUES
(1,'Soul For us', 1, 1, 1),
(2,'Magic Circus', 1, 1, 6),
(3,'Diamond power', 1, 1, 14),
(4,'Thang OF thunder',1, 1, 16),
(5,'Home forever', 2,2, 13),
(6,'Words of her life', 2,2, 17),
(7,'Reflecrtions of magic', 2,2, 2),
(8,'Honey, Lets Be Silly',2,2, 15),
(9,'Troubles Of My Inner Fire',3,3, 4),
(10,'Thang Of Thunder', 3,3, 16),
(11,'Magic Circus', 3,3, 6 ),
(12,'Dance With Her Own',1,4, 3),
(13,'Without My Streets', 1, 4, 18),
(14,'Celebration Of More',1,4, 11);

INSERT INTO seguindo_artistas (id, seguindo_name, informacao_do_plano_id,  usuario_dados_id, artistas_id)
VALUES
(1,'Freedie Shannon',1,4, 4),
(2,'Lance Day',3,3, 3),
(3,'Walter Phoenix',1,1,1),
(4,'Walter Phoenix',1,1,1),
(5,'Lance Day',3,3, 3),
(6,'Walter Phoenix',1,1,1),
(7,'Peter Strong',2,2,2),
(8,'Freedie Shannon',1,4,4);
