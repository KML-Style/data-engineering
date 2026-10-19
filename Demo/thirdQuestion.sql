-- Is the result of the game influencing the banality index of a declaration ?
SELECT g.result, AVG(f.banality_index) as avg_banality_index, COUNT(*) as nb_declarations
FROM Dim_Game g JOIN Fact_Declaration f ON g.id = f.game_id
GROUP BY g.result

-- Is the type of interview influencing the banality index of a declaration ?
SELECT type, AVG(banality_index) as avg_banality_index, COUNT(*) as nb_declarations
FROM Fact_Declaration 
GROUP BY type

-- Is the stake of a match influencing the banality index of a declaration ?
SELECT g.stakes, AVG(f.banality_index) as avg_banality_index, COUNT(*) as nb_declarations
FROM Dim_Game g JOIN Fact_Declaration f ON g.id = f.game_id
GROUP BY g.stakes
