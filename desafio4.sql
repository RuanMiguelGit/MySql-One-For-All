CREATE VIEW top_3_artistas AS
    SELECT 
        A.artistas_name AS artistas,
        COUNT(S.usuario_dados_id) AS seguidores
    FROM
        SpotifyClone.artistas AS A
            INNER JOIN
        SpotifyClone.seguindo_artistas AS S ON S.artistas_id = A.id
    GROUP BY artistas
    ORDER BY seguidores DESC , artistas ASC
    LIMIT 3;