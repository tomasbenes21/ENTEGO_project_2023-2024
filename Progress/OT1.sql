SELECT 
y06.industry_name,
y06.total_value AS value_2006,
y12.total_value AS value_2012,
y18.total_value AS value_2018,
CASE
	WHEN y06.total_value < y18.total_value THEN 'yes'
	ELSE 'no'
END AS is_ascending
FROM (
	SELECT 
	industry_name,
	year,
	round(payroll_value,0) AS total_value
FROM t_tomas_benes_project_sql_primary_final ttbpspf
WHERE ttbpspf.value_name = 'Průměrná hrubá mzda na zaměstnance'
	AND ttbpspf.industry_name IS NOT NULL
	AND year = 2006
GROUP BY industry_name, year
) y06
LEFT JOIN (
	SELECT industry_name,
	year,
	round(payroll_value,0) AS total_value
FROM t_tomas_benes_project_sql_primary_final ttbpspf
WHERE ttbpspf.value_name = 'Průměrná hrubá mzda na zaměstnance'
	AND ttbpspf.industry_name IS NOT NULL
	AND year = 2012
GROUP BY industry_name, year
) y12
ON y06.industry_name = y12.industry_name
LEFT JOIN (
	SELECT industry_name,
	year,
	round(payroll_value,0) AS total_value
FROM t_tomas_benes_project_sql_primary_final ttbpspf
WHERE ttbpspf.value_name = 'Průměrná hrubá mzda na zaměstnance'
	AND ttbpspf.industry_name IS NOT NULL
	AND year = 2018
GROUP BY industry_name, year
) y18
ON y06.industry_name = y18.industry_name;