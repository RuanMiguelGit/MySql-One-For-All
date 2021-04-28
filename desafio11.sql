CREATE VIEW cancoes_premium AS
    SELECT 
        H.historico_cancoes_name AS nome,
        COUNT(H.historico_cancoes_name) AS reproducoes
    FROM
        SpotifyClone.historico_cancoes AS H
            INNER JOIN
        SpotifyClone.informacao_do_plano AS P ON H.informacao_do_plano_id = P.id
    WHERE
        plano_name IN ('Familiar' , 'Universitário')
    GROUP BY nome
    ORDER BY nome ASC; 