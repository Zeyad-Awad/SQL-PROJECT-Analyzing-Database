-- VIS 1
SELECT pl.Name PlaylistName,
    COUNT(*) NumberOfTracks

FROM Playlist pl 
JOIN PlaylistTrack pl_tr
ON pl.PlaylistId = pl_tr.PlaylistId
GROUP BY pl_tr.PlaylistId
ORDER BY PlaylistName
