SELECT 
    COUNT(DISTINCT (song.id)) AS 'cancoes',
    COUNT(DISTINCT (artist.id)) AS 'artistas',
    COUNT(DISTINCT (album.id)) AS 'albuns'
FROM
    SpotifyClone.song AS song
        INNER JOIN
    SpotifyClone.artist AS artist
        INNER JOIN
    SpotifyClone.album AS album;