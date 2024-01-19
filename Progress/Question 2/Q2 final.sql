SELECT 
	unit_value,
	category_name,
	payroll_value,
	YEAR AS year,
	ROUND (payroll_value / unit_value, 2) AS possibility_of_purchase
FROM t_tomas_benes_project_sql_primary_final ttbpspf
WHERE year IN (2006, 2018)
	AND (category_name LIKE 'mléko%'
	OR category_name LIKE 'chléb%')
	AND industry_name IS NULL
	AND value_name = 'Průměrná hrubá mzda na zaměstnance'
	