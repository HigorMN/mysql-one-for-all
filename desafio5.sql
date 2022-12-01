SELECT 
    song.name AS 'cancao',
    COUNT(history.date_reproductions) AS 'reproducoes'
FROM
    SpotifyClone.song AS song
        INNER JOIN
    SpotifyClone.user_history_reproductions AS history ON history.song_id = song.id
GROUP BY history.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;