SELECT
	table1.industry_name,
	table1.year AS previous_year,
	AVG (table1.payroll_value) AS avg_payroll_value_previous_year,
	table2.year,
	AVG (table2.payroll_value) AS avg_payroll_value,
	CASE
	WHEN AVG (table1.payroll_value) < AVG (table2.payroll_value) THEN '↑'
	ELSE '↓'
END AS payroll_growth 
FROM (
	SELECT *
	FROM t_tomas_benes_project_sql_primary_final ttbpspft
	WHERE value_name = 'Průměrná hrubá mzda na zaměstnance'
		AND industry_name IS NOT NULL
 ) table1
 JOIN (
	SELECT *
	FROM t_tomas_benes_project_sql_primary_final ttbpspft
	WHERE value_name = 'Průměrná hrubá mzda na zaměstnance'
		AND industry_name IS NOT NULL
 ) table2
	 ON table1.industry_name = table2.industry_name
	 AND table1.year = table2.YEAR -1
GROUP BY 	table1.industry_name, table1.year, table2.YEAR
HAVING payroll_growth = '↓'