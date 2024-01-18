SELECT
	price.category_name,
	price.YEAR,
	price.unit_value,
	price2.unit_value AS unit_value_previous_year,
	round (((price.unit_value - price2.unit_value) / price2.unit_value) * 100, 2)  AS difference
FROM (
	SELECT 
		ttbpspf.unit_value,
		ttbpspf.category_name,
		ttbpspf.year
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	GROUP BY ttbpspf.category_name, ttbpspf.YEAR
	) price
JOIN (
	SELECT 
		ttbpspf.unit_value,
		ttbpspf.category_name,
		ttbpspf.year
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	GROUP BY ttbpspf.category_name, ttbpspf.YEAR
	) price2
	ON price.year = price2.YEAR + 12
	AND price.category_name = price2.category_name
	AND price.YEAR = 2018
ORDER BY (price.unit_value - price2.unit_value) / price2.unit_value;
	

