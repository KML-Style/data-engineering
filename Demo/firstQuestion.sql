--  Which players and coaches use clichéd expressions most often ? 
SELECT p.id, p.firstname, p.name, COUNT(*) AS nb_declarations, SUM(CASE WHEN f.banality_index >= :threshold THEN 1 ELSE 0 END) AS nb_banal_declarations, AVG(CASE WHEN f.banality_index >= :threshold THEN 1.0 ELSE 0.0 END) AS ratio
FROM Dim_Person p JOIN Fact_Declaration f ON p.id = f.person_id
GROUP BY p.id, p.firstname, p.name
ORDER BY ratio DESC

-- Only the coaches
SELECT p.id, p.firstname, p.name, COUNT(*) AS nb_declarations, SUM(CASE WHEN f.banality_index >= :threshold THEN 1 ELSE 0 END) AS nb_banal_declarations, AVG(CASE WHEN f.banality_index >= :threshold THEN 1.0 ELSE 0.0 END) AS ratio
FROM Dim_Person p JOIN Fact_Declaration f ON p.id = f.person_id
WHERE p.position = 'coach'
GROUP BY p.id, p.firstname, p.name
ORDER BY ratio DESC

-- N.B. : The thresold corresponds to the minimal banality_index classified as a banal declaration.
