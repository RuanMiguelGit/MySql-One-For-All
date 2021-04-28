CREATE VIEW faturamento_atual AS
    SELECT 
        ROUND(MIN(I.valor_plano), 2) AS faturamento_minimo,
        ROUND(MAX(I.valor_plano), 2) AS faturamento_maximo,
        ROUND(AVG(I.valor_plano), 2) AS faturamento_medio,
        ROUND(SUM(I.valor_plano), 2) AS faturamento_total
    FROM
        SpotifyClone.informacao_do_plano AS I
            INNER JOIN
        SpotifyClone.usuario_dados AS U ON I.id = U.informacao_do_plano_id;