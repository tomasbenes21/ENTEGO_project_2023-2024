SELECT *
FROM (
SELECT
	t1.year,
	round((t1.unit_value-t2.unit_value)/t2.unit_value*100,2) AS 'value_growth_rate_%',
	round((t1.payroll_value-t2.payroll_value)/t2.payroll_value*100,2) AS 'salary_growth_rate_%',
	CASE 
		WHEN (t1.unit_value-t2.unit_value)/t2.unit_value < 0 THEN 'no'
		WHEN ((((t1.unit_value-t2.unit_value)/t2.unit_value)-((t1.payroll_value-t2.payroll_value)/t2.payroll_value))/((t1.unit_value-t2.unit_value)/t2.unit_value)) > 0.1 THEN 'yes'
		ELSE 'no'
	END 'over_10%',
	round(((((t1.unit_value-t2.unit_value)/t2.unit_value)-((t1.payroll_value-t2.payroll_value)/t2.payroll_value))/((t1.unit_value-t2.unit_value)/t2.unit_value)*100),2) AS 'comparison_%',
	t1.unit_value,
	t1.payroll_value
FROM (
	SELECT
	ttbpspf.year AS 'year',
	round(avg(ttbpspf.unit_value),2) AS unit_value,
	round(avg(ttbpspf.payroll_value),2) AS payroll_value
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE ttbpspf.industry_name IS NULL
		AND ttbpspf.value_name = 'Průměrná hrubá mzda na zaměstnance'
	GROUP BY ttbpspf.year
	) t1
RIGHT JOIN (	
	SELECT
	ttbpspf.year AS 'year',
	round(avg(ttbpspf.unit_value),2) AS unit_value,
	round(avg(ttbpspf.payroll_value),2) AS payroll_value
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE ttbpspf.industry_name IS NULL
		AND ttbpspf.value_name = 'Průměrná hrubá mzda na zaměstnance'
	GROUP BY ttbpspf.year
	) t2
ON t1.YEAR = t2.YEAR + 1
) t3
WHERE t3.year IS NOT NULL 