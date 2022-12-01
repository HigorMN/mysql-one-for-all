SELECT 
    COUNT(user.id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.user AS user
        INNER JOIN
    SpotifyClone.user_history_reproductions AS history ON user.id = history.user_id
WHERE
    user.name = 'Barbara Liskov';