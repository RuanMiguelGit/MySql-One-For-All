CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        U.usuario_name AS usuario, H.historico_cancoes_name AS nome
    FROM
        SpotifyClone.usuario_dados AS U
            INNER JOIN
        SpotifyClone.historico_cancoes AS H ON H.usuario_dados_id = U.id
    ORDER BY usuario ASC , 
    nome ASC;
