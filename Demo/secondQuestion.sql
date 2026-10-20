 -- What are the five most used banal declrations ?
SELECT c.id, c.expression, SUM(dc.occurrences) as occurrence
FROM Dim_Cliche c JOIN Association_Declaration_Cliche dc on c.id = dc.cliche_id JOIN Fact_Declaration f on f.id = dc.declaration_id
GROUP BY c.id, c.expression
ORDER BY occurrence DESC
LIMIT 5;
