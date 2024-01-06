CREATE TABLE t_tomas_benes_project_sql_secondary_final
SELECT
t3.value_growth_rate,
t3.salary_growth_rate,
t4.GDP_growth_rate,
t4.year
FROM (
SELECT
	t1.year,
	round((t1.unit_value-t2.unit_value)/t2.unit_value*100,2) AS value_growth_rate,
	round((t1.payroll_value-t2.payroll_value)/t2.payroll_value*100,2) AS salary_growth_rate
FROM (
	SELECT
	ttbpspf.year,
	round(avg(ttbpspf.unit_value),2) AS unit_value,
	round(avg(ttbpspf.payroll_value),2) AS payroll_value
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE ttbpspf.industry_name IS NULL
		AND ttbpspf.value_name = 'Průměrná hrubá mzda na zaměstnance'
	GROUP BY ttbpspf.year
	) t1
RIGHT JOIN (	
	SELECT
	ttbpspf.year,
	round(avg(ttbpspf.unit_value),2) AS unit_value,
	round(avg(ttbpspf.payroll_value),2) AS payroll_value
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE ttbpspf.industry_name IS NULL
		AND ttbpspf.value_name = 'Průměrná hrubá mzda na zaměstnance'
	GROUP BY ttbpspf.year
	) t2
ON t1.YEAR = t2.YEAR + 1
) t3
JOIN (
	SELECT
	round((e.GDP-e2.GDP)/e2.GDP*100,2) AS GDP_growth_rate,
	e.year,
	e2.year AS previous_year
	FROM economies e
	JOIN economies e2
	ON e.year= e2.YEAR + 1
	AND e.country = e2.country
	AND e.country = 'Czech Republic'
	) t4
ON t3.year = t4.year