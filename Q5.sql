-- ARTIST|TRACK SUM|

SELECT ar.name artist_name,
    COUNT(*) tracks_count

FROM Artist ar
JOIN Album al 
ON ar.ArtistId = al.ArtistId
JOIN Track tr 
ON al.AlbumId = tr.AlbumId
JOIN Genre ge 
ON ge.GenreId = tr.GenreId
WHERE ge.Name = 'Rock'
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10
