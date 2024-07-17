-- Substitua 'Heathrow' pelo nome do aeroporto de interesse
WITH AeroportoOrigem AS (
    SELECT *
    FROM Aeroportos
    WHERE id = 1  -- Substitua pelo nome do aeroporto de origem desejado
)

SELECT
    AO.nome AS aeroporto_origem,
    A.nome AS aeroporto_destino,
    ROUND(6371 * ACOS(
        COS(RADIANS(AO.latitude)) * COS(RADIANS(A.latitude)) *
        COS(RADIANS(A.longitude) - RADIANS(AO.longitude)) +
        SIN(RADIANS(AO.latitude)) * SIN(RADIANS(A.latitude))
    ), 2) AS distancia_km
FROM
    AeroportoOrigem AO
JOIN
    Aeroportos A ON AO.id <> A.id  -- Garante que não estamos calculando a distância do aeroporto para ele mesmo
ORDER BY
    distancia_km;
