-- 1 Sacar los datos de abril y mayo
SELECT * FROM rawdata
WHERE MONTH(dataDate) 
IN (4, 5);

-- 2 Para pasar a la fase 5 se necesita tener al menos un 65% de recuperaciones totales y al menos un 15%
-- de camas de ICU libres
CREATE OR REPLACE VIEW recuperaciones AS 
SELECT recoveredToday, SUM(recoveredToday) / SUM(ICUPatients) * 10 AS Porcentaje_Recuperados
FROM rawdata
GROUP BY recoveredToday
HAVING recoveredToday >= 65; 

CREATE OR REPLACE VIEW num_camas AS 
SELECT r.numberOfICUBeds, SUM(r.numberOfICUBeds) / SUM(rd.ICUPatients) * 10 AS Porcentaje_Camas_Dispo
FROM regions r, rawdata rd
GROUP BY r.numberOfICUBeds
HAVING r.numberOfICUBeds >= 15;

SELECT DISTINCT regionName FROM regions r, recuperaciones rec, num_camas nc

