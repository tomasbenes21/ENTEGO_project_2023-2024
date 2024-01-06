SELECT
t06.category_name,
t06.price_2006,
t07.price_2007,
t08.price_2008,
t09.price_2009,
t10.price_2010,
t11.price_2011,
t12.price_2012,
t13.price_2013,
t14.price_2014,
t15.price_2015,
t16.price_2016,
t17.price_2017,
t18.price_2018,
round((power(t18.price_2018/t06.price_2006,1/12)-1)*100,2) AS 'yearly_growth_in_%'
FROM (
	SELECT
	category_name,
	avg(unit_value) AS price_2006,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2006
	GROUP BY category_name,price_unit
) t06
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2007,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2007
	GROUP BY category_name,price_unit
) t07
ON t06.category_name = t07.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2008,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2008
	GROUP BY category_name,price_unit
) t08
ON t06.category_name = t08.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2009,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2009
	GROUP BY category_name,price_unit
) t09
ON t06.category_name = t09.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2010,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2010
	GROUP BY category_name,price_unit
) t10
ON t06.category_name = t10.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2011,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2011
	GROUP BY category_name,price_unit
) t11
ON t06.category_name = t11.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2012,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2012
	GROUP BY category_name,price_unit
) t12
ON t06.category_name = t12.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2013,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2013
	GROUP BY category_name,price_unit
) t13
ON t06.category_name = t13.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2014,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2014
	GROUP BY category_name,price_unit
) t14
ON t06.category_name = t14.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2015,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2015
	GROUP BY category_name,price_unit
) t15
ON t06.category_name = t15.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2016,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2016
	GROUP BY category_name,price_unit
) t16
ON t06.category_name = t16.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2017,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2017
	GROUP BY category_name,price_unit
) t17
ON t06.category_name = t17.category_name
LEFT JOIN (	
	SELECT
	category_name,
	avg(unit_value) AS price_2018,
	price_unit
	FROM t_tomas_benes_project_sql_primary_final ttbpspf
	WHERE czechia_price_year = 2018
	GROUP BY category_name,price_unit
) t18
ON t06.category_name = t18.category_name
ORDER BY round((power(t18.price_2018/t06.price_2006,1/12)-1)*100,2) ASC 