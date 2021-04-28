USE SpotifyClone;
DROP VIEW estatisticas_musicais;
CREATE VIEW estatisticas_musicais AS 
SELECT 
    COUNT(*) AS cancoes,
    (SELECT 
            COUNT(*)
        FROM
            SpotifyClone.artistas) AS artistas,
    (SELECT 
            COUNT(*)
        FROM
            SpotifyClone.album) AS albuns
FROM
    SpotifyClone.cancoes;
