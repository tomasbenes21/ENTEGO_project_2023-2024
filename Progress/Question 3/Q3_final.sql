SELECT
	price.category_name,
	price.YEAR AS year,
	price.unit_value,
	price2.unit_value AS unit_value_previous_year,
	ROUND (IF ((price.unit_value - price2.unit_value) / price2.unit_value > 0, (price.unit_value - price2.unit_value) / price2.unit_value + 1, (price.unit_value - price2.unit_value) / price2.unit_value), 2) AS 'difference_%'
FROM (
	SELECT 
		ttbpspf.unit_value,
		ttbpspf.category_name,
		ttbpspf.year
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	GROUP BY ttbpspf.category_name, ttbpspf.year
	) price
JOIN (
	SELECT 
		ttbpspf.unit_value,
		ttbpspf.category_name,
		ttbpspf.year
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	GROUP BY ttbpspf.category_name, ttbpspf.year
	) price2
	ON price.year = price2.year + 12
	AND price.category_name = price2.category_name
	AND price.YEAR = 2018
	ORDER BY (price.unit_value - price2.unit_value) / price2.unit_value;
	
	

