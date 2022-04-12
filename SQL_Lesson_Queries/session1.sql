SELECT t.TrackId, t.name, t.AlbumId
FROM tracks AS t
JOIN albums AS a
ON t.AlbumId = a.AlbumId AND a.Title = "Faceless";