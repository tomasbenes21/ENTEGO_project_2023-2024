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
	ROUND (AVG (unit_value),2) AS price_value,
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
	joined.YEAR,
	joined.price_value,
	joined.payroll_value,
	joined2.price_value AS previous_price_value,
	joined2.payroll_value AS previous_payroll_value,
	ROUND ((joined.price_value - joined2.price_value) *100 / joined2.price_value, 2) AS price_difference,
	ROUND ((joined.payroll_value - joined2.payroll_value) *100 / joined2.payroll_value, 2) AS payroll_difference,
	ROUND ((((joined.price_value - joined2.price_value) / joined2.price_value) / ((joined.payroll_value - joined2.payroll_value) / joined2.payroll_value) - 1),2)*100 AS '%'
FROM joined
JOIN (
	SELECT *
	FROM joined
	) joined2
ON joined.YEAR = joined2.YEAR +1

