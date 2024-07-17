SELECT
    A1.nome AS aeroporto1,
    A2.nome AS aeroporto2,
    ROUND(6371 * ACOS(
        COS(RADIANS(A1.latitude)) * COS(RADIANS(A2.latitude)) *
        COS(RADIANS(A2.longitude) - RADIANS(A1.longitude)) +
        SIN(RADIANS(A1.latitude)) * SIN(RADIANS(A2.latitude))
    ), 2) AS distancia_km
FROM
    Aeroportos A1
CROSS JOIN
    Aeroportos A2
WHERE
    A1.id < A2.id 
    AND A1.nome <> A2.nome
ORDER BY
    distancia_km; 