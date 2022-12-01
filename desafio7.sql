SELECT 
    artist.name AS 'artista',
    album.name AS 'album',
    COUNT(follow.user_id) AS 'seguidores'
FROM
    SpotifyClone.artist AS artist
        INNER JOIN
    SpotifyClone.album AS album ON artist.id = album.artist_id
        INNER JOIN
    SpotifyClone.following_artist AS follow ON artist.id = follow.artist_id
    GROUP BY album.id
    ORDER BY seguidores DESC, artist.name, album.name;
