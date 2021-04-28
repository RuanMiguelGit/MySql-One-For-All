DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.usuario_dados
    FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.historico_cancoes 
	WHERE usuario_dados_id = OLD.id;
DELETE FROM SpotifyClone.seguindo_artistas 
WHERE
    usuario_dados_id = OLD.id;
END $$
DELIMITER ;