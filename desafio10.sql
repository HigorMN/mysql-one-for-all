SELECT 
    song.name AS nome, COUNT(history.user_id) AS reproducoes
FROM
    SpotifyClone.song AS song
        INNER JOIN
    SpotifyClone.user_history_reproductions AS history ON history.song_id = song.id
        INNER JOIN
    SpotifyClone.user AS user ON user.id = history.user_id
        INNER JOIN
    SpotifyClone.plan AS plan ON plan.id = user.plan_id
WHERE
    plan.name IN ('gratuito' , 'pessoal')
GROUP BY song.name
ORDER BY song.name;