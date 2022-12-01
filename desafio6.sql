SELECT 
    ROUND(MIN(plan.value), 2) AS faturamento_minimo,
    MAX(plan.value) AS 'faturamento_maximo',
    ROUND(AVG(plan.value), 2) AS 'faturamento_medio',
    ROUND(SUM(plan.value), 2) AS 'faturamento_total'
FROM
    SpotifyClone.user AS user
        INNER JOIN
    SpotifyClone.plan AS plan ON plan.id = user.plan_id;