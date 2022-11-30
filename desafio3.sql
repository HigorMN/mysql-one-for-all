SELECT DISTINCT
    (user.name) AS 'usuario',
    COUNT(history.user_id) AS 'qt_de_musicas_ouvidas',
    SUM(ROUND(song.duration_seconds / 60, 2)) AS 'total_minutos'
FROM
    SpotifyClone.user AS user
        INNER JOIN
    SpotifyClone.user_history_reproductions AS history ON history.user_id = user.id
        INNER JOIN
    SpotifyClone.song AS song ON song.id = history.song_id
GROUP BY user.name
ORDER BY user.name;