DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN aname VARCHAR(100))
BEGIN
SELECT A.artistas_name AS artista, AL.album_name AS album 
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.album AS AL
ON A.id = AL.artistas_id
WHERE A.artistas_name = aname;
END $$
DELIMITER 
;
