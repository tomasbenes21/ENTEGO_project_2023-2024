SELECT
	unit.year,
	unit.unit_value,
	unit.category_name AS unit_name,
	payroll.average_payroll_value,
	FLOOR (payroll.average_payroll_value / unit.unit_value) AS possibility_of_purchase
FROM (
	SELECT 
		YEAR AS year,
		unit_value,
		category_name
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE year IN (2006, 2018)
		AND (category_name LIKE 'mléko%'
		OR category_name LIKE 'chléb%')
		AND industry_name IS NULL
		AND value_name = 'Průměrná hrubá mzda na zaměstnance'
	) unit
LEFT JOIN (
	SELECT 
	year,
	ROUND (AVG (payroll_value), 2) AS average_payroll_value
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE year IN (2006, 2018)
		AND value_name = 'Průměrná hrubá mzda na zaměstnance'
		AND payroll_value IS NOT NULL
	GROUP BY YEAR
	) payroll
	ON unit.year = payroll.YEAR;