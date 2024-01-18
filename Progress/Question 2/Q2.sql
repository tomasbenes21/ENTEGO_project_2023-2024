SELECT
round(avg(payroll_value),2) AS payroll_2006_2018,
round(avg(unit_value),2) AS avg_price_milk_bread,
round(avg(payroll_value/unit_value),2) AS l_kg_quantity
FROM t_tomas_benes_project_sql_primary_final ttbpspf
WHERE year IN (2006,2018)
	AND (category_name LIKE 'mléko%'
	OR category_name LIKE 'chléb%')
	AND industry_name IS NULL
	AND value_name = 'Průměrná hrubá mzda na zaměstnance'