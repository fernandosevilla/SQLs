-- 1 Listar todos los jugadores mas viejos que el jugador mas viejo que haya jugado en el Real Madrid
CREATE OR REPLACE VIEW jugador_viejo AS
SELECT nombre, fecha_nacimiento FROM jugadores
WHERE fecha_nacimiento < (SELECT 
ORDER BY fecha_nacimiento
LIMIT 1;

CREATE OR REPLACE VIEW 

-- 2 