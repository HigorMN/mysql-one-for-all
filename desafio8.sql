SELECT 
    artist.name AS 'artista',
    album.name AS 'album'
FROM
    SpotifyClone.artist AS artist
        INNER JOIN
    SpotifyClone.album AS album ON artist.id = album.artist_id
    WHERE artist.name = "Elis Regina"
    ORDER BY album.name;