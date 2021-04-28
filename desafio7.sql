CREATE VIEW perfil_artistas AS 
SELECT 
    A.artistas_name AS artista,
    AL.album_name AS album,
    COUNT(S.seguindo_name) AS seguidores
FROM
    SpotifyClone.artistas AS A
        INNER JOIN
    SpotifyClone.album AS AL ON AL.artistas_id = A.id
        INNER JOIN
    SpotifyClone.seguindo_artistas AS S ON S.artistas_id = AL.artistas_id
GROUP BY album , artista
ORDER BY seguidores DESC , artista ASC , album ASC;
