-- Are there medias producing more original interviews ?
SELECT m.id, m.name, COUNT(*) as nb_declarations, AVG(f.banality_index) as avg_banality_index, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY f.banality_index) AS mdn_banality
FROM Dim_Media m JOIN Fact_Declaration f on m.id = f.media_id
GROUP BY m.id, m.name
HAVING nb_declarations >= 5 --to reduce statistical aberration
ORDER BY mdn_banality ASC

-- Are there types of medias producing more original interviews ?
SELECT m.type COUNT(*) as nb_declarations, AVG(f.banality_index) as avg_banality_index, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY f.banality_index) AS mdn_banality
FROM Dim_Media m JOIN Fact_Declaration f on m.id = f.media_id
GROUP BY m.type
HAVING nb_declarations >= 5 --to reduce statistical aberration
ORDER BY mdn_banality ASC
