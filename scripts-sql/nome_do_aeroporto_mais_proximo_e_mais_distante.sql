WITH AeroportoOrigem AS (
    SELECT *
    FROM Aeroportos
    WHERE id = 1
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
    Aeroportos A ON AO.id <> A.id
ORDER BY
    distancia_km;

WITH AeroportoOrigem AS (
    SELECT *
    FROM Aeroportos
    WHERE id = 1
)

SELECT
    AO.nome AS aeroporto_origem,
    MIN(ROUND(6371 * ACOS(
        COS(RADIANS(AO.latitude)) * COS(RADIANS(A.latitude)) *
        COS(RADIANS(A.longitude) - RADIANS(AO.longitude)) +
        SIN(RADIANS(AO.latitude)) * SIN(RADIANS(A.latitude))
    ), 2)) AS menor_distancia_km,
    MAX(ROUND(6371 * ACOS(
        COS(RADIANS(AO.latitude)) * COS(RADIANS(A.latitude)) *
        COS(RADIANS(A.longitude) - RADIANS(AO.longitude)) +
        SIN(RADIANS(AO.latitude)) * SIN(RADIANS(A.latitude))
    ), 2)) AS maior_distancia_km
FROM
    AeroportoOrigem AO
JOIN
    Aeroportos A ON AO.id <> A.id
GROUP BY
    AO.nome;
