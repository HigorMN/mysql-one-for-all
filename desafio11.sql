SELECT 
    song.name AS nome_musica,
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(song.name,
                        'SUPERSTAR',
                        'SUPERDEV'),
                    'SOUL',
                    'CODE'),
                'Pais',
                'Pull Requests'),
            'Amar',
            'Code Review'),
        'Bard',
        'QA') AS novo_nome
FROM
    SpotifyClone.song AS song
WHERE
    song.name IN ('The Bard’s Song' , 'O Medo de Amar é o Medo de Ser Livre', 'Como Nossos Pais', 'BREAK MY SOUL', 'ALIEN SUPERSTAR')
ORDER BY novo_nome DESC;