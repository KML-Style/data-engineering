-- What clubs are producing the most banal interviews ?
SELECT c.id, c.name, COUNT(*) AS nb_declarations, AVG(f.banality_index) as avg_banality_index, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY f.banality_index) AS mdn_banality
FROM Dim_Club c JOIN Fact_Declaration f on c.id = f.club_id
GROUP BY c.id, c.name
HAVING nb_declarations >= 5 --to reduce statistical aberration
ORDER BY mdn_banality DESC
