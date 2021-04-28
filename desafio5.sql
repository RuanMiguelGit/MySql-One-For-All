CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        C.cancoes_name AS cancao,
        COUNT(H.historico_cancoes_name) AS reproducoes
    FROM
        SpotifyClone.cancoes AS C
            INNER JOIN
        SpotifyClone.historico_cancoes AS H ON C.cancoes_name = H.historico_cancoes_name
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao ASC
    LIMIT 2;