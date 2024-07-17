WITH AeroportoOrigem AS (
    SELECT *
    FROM Aeroportos
    WHERE id = 1
)

SELECT
    COUNT(*) AS total_aeroportos_menos_20000_km
FROM
    AeroportoOrigem AO
JOIN
    Aeroportos A ON AO.id <> A.id
WHERE
    ROUND(6371 * ACOS(
        COS(RADIANS(AO.latitude)) * COS(RADIANS(A.latitude)) *
        COS(RADIANS(A.longitude) - RADIANS(AO.longitude)) +
        SIN(RADIANS(AO.latitude)) * SIN(RADIANS(A.latitude))
    ), 2) < 20000;

