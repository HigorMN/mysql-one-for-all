SELECT DISTINCT
    (user.name) AS 'usuario',
    CASE
        WHEN YEAR(MAX(history.date_reproductions)) >= '2021' THEN 'Usuário ativo'
        ELSE 'Usuário inativo'
    END AS 'status_usuario'
FROM
    SpotifyClone.user AS user
        LEFT JOIN
    SpotifyClone.user_history_reproductions AS history ON history.user_id = user.id
GROUP BY user.name
ORDER BY user.name;