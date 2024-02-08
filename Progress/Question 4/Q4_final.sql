WITH base AS (
	SELECT *
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE industry_name IS NULL
		AND payroll_value IS NOT NULL
		AND value_name = 'Průměrná hrubá mzda na zaměstnance'
	ORDER BY YEAR
	),
price AS (
SELECT 
	ROUND (AVG (unit_value), 2) AS price_value,
	year
FROM base
GROUP BY YEAR
),
payroll AS (
SELECT 
	payroll_value,
	year
FROM base
GROUP BY YEAR
),
joined AS (
SELECT
	price.year,
	price.price_value,
	payroll.payroll_value
FROM price
LEFT JOIN payroll
	ON price.year = payroll.year
)
SELECT
	joined.year,
	ROUND (joined.price_value, 1) AS price_value,
	ROUND(joined.payroll_value, 0) AS payroll_value,
	ROUND(joined2.price_value,1) AS previous_price_value,
	ROUND(joined2.payroll_value, 0) AS previous_payroll_value,
	ROUND((joined.price_value - joined2.price_value) / joined2.price_value *100, 1) AS 'price_difference_%',
	ROUND((joined.payroll_value - joined2.payroll_value) / joined2.payroll_value *100, 1) AS 'payroll_difference_%',
	ROUND (((joined.price_value - joined2.price_value) / joined2.price_value * 100) - ((joined.payroll_value - joined2.payroll_value) / joined2.payroll_value * 100), 1) AS 'price/payroll_difference_%'
FROM joined
JOIN (
	SELECT *
	FROM joined
	) joined2
ON joined.YEAR = joined2.YEAR +1
ORDER BY ((joined.price_value - joined2.price_value) / joined2.price_value * 100) - ((joined.payroll_value - joined2.payroll_value) / joined2.payroll_value * 100) DESC
