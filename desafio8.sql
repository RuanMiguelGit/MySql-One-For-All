DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.usuario_dados
    FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.historico_cancoes AS HC
	WHERE HC.usuario_dados_id = OLD.HC.usuario_dados_id;
DELETE FROM SpotifyClone.seguindo_artistas AS A 
WHERE
    A.usuario_dados_id = OLD.A.usuario_dados_id;
END $$
DELIMITER ;