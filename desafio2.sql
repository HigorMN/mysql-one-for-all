SELECT 
    COUNT(DISTINCT (s.id)) AS 'cancoes',
    COUNT(DISTINCT (a.id)) AS 'artistas',
    COUNT(DISTINCT (al.id)) AS 'albuns'
FROM
    SpotifyClone.song AS s
        INNER JOIN
    SpotifyClone.artist AS a
        INNER JOIN
    SpotifyClone.album AS al;