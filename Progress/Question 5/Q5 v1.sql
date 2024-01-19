SELECT
	ttbpssf.YEAR AS 'year',
	ttbpssf.GDP_growth_rate,
	-- ttbpssf.value_growth_rate,
	-- ttbpssf.salary_growth_rate,
	-- ttbpssf2.value_growth_rate AS value_growth_rate_following_year,
	-- ttbpssf2.salary_growth_rate AS salary_growth_rate_following_year,
	CASE 
		WHEN ttbpssf.GDP_growth_rate > 5 THEN '↑↑↑↑↑↑'
		WHEN ttbpssf.GDP_growth_rate > 4 AND ttbpssf.GDP_growth_rate <= 5 THEN '↑↑↑↑↑'
		WHEN ttbpssf.GDP_growth_rate > 3 AND ttbpssf.GDP_growth_rate <= 4 THEN '↑↑↑↑'
		WHEN ttbpssf.GDP_growth_rate > 2 AND ttbpssf.GDP_growth_rate <= 3 THEN '↑↑↑'
		WHEN ttbpssf.GDP_growth_rate > 1 AND ttbpssf.GDP_growth_rate <= 2 THEN '↑↑'
		WHEN ttbpssf.GDP_growth_rate > 0 AND ttbpssf.GDP_growth_rate <= 1 THEN '↑'
		WHEN ttbpssf.GDP_growth_rate = 0 THEN '-'
		WHEN ttbpssf.GDP_growth_rate < 0 AND ttbpssf.GDP_growth_rate >= -1 THEN '↓'
		WHEN ttbpssf.GDP_growth_rate < -1 AND ttbpssf.GDP_growth_rate >= -2 THEN '↓↓'
		WHEN ttbpssf.GDP_growth_rate < -2 AND ttbpssf.GDP_growth_rate >= -3 THEN '↓↓↓'
		WHEN ttbpssf.GDP_growth_rate < -3 AND ttbpssf.GDP_growth_rate >= -4 THEN '↓↓↓↓'
		WHEN ttbpssf.GDP_growth_rate < -4 AND ttbpssf.GDP_growth_rate >= -5 THEN '↓↓↓↓↓'
		WHEN ttbpssf.GDP_growth_rate < -5 THEN '↓↓↓↓↓↓'
	END AS GDP_this_year,
		CASE 
		WHEN ttbpssf.salary_growth_rate > 5 THEN '↑↑↑↑↑↑'
		WHEN ttbpssf.salary_growth_rate > 4 AND ttbpssf.salary_growth_rate <= 5 THEN '↑↑↑↑↑'
		WHEN ttbpssf.salary_growth_rate > 3 AND ttbpssf.salary_growth_rate <= 4 THEN '↑↑↑↑'
		WHEN ttbpssf.salary_growth_rate > 2 AND ttbpssf.salary_growth_rate <= 3 THEN '↑↑↑'
		WHEN ttbpssf.salary_growth_rate > 1 AND ttbpssf.salary_growth_rate <= 2 THEN '↑↑'
		WHEN ttbpssf.salary_growth_rate > 0 AND ttbpssf.salary_growth_rate <= 1 THEN '↑'
		WHEN ttbpssf.salary_growth_rate = 0 THEN '-'
		WHEN ttbpssf.salary_growth_rate < 0 AND ttbpssf.salary_growth_rate >= -1 THEN '↓'
		WHEN ttbpssf.salary_growth_rate < -1 AND ttbpssf.salary_growth_rate >= -2 THEN '↓↓'
		WHEN ttbpssf.salary_growth_rate < -2 AND ttbpssf.salary_growth_rate >= -3 THEN '↓↓↓'
		WHEN ttbpssf.salary_growth_rate < -3 AND ttbpssf.salary_growth_rate >= -4 THEN '↓↓↓↓'
		WHEN ttbpssf.salary_growth_rate < -4 AND ttbpssf.salary_growth_rate >= -5 THEN '↓↓↓↓↓'
		WHEN ttbpssf.salary_growth_rate < -5 THEN '↓↓↓↓↓↓'
	END AS salary_this_year,
		CASE 
		WHEN ttbpssf2.salary_growth_rate > 5 THEN '↑↑↑↑↑↑'
		WHEN ttbpssf2.salary_growth_rate > 4 AND ttbpssf2.salary_growth_rate <= 5 THEN '↑↑↑↑↑'
		WHEN ttbpssf2.salary_growth_rate > 3 AND ttbpssf2.salary_growth_rate <= 4 THEN '↑↑↑↑'
		WHEN ttbpssf2.salary_growth_rate > 2 AND ttbpssf2.salary_growth_rate <= 3 THEN '↑↑↑'
		WHEN ttbpssf2.salary_growth_rate > 1 AND ttbpssf2.salary_growth_rate <= 2 THEN '↑↑'
		WHEN ttbpssf2.salary_growth_rate > 0 AND ttbpssf2.salary_growth_rate <= 1 THEN '↑'
		WHEN ttbpssf2.salary_growth_rate = 0 THEN '-'
		WHEN ttbpssf2.salary_growth_rate < 0 AND ttbpssf2.salary_growth_rate >= -1 THEN '↓'
		WHEN ttbpssf2.salary_growth_rate < -1 AND ttbpssf2.salary_growth_rate >= -2 THEN '↓↓'
		WHEN ttbpssf2.salary_growth_rate < -2 AND ttbpssf2.salary_growth_rate >= -3 THEN '↓↓↓'
		WHEN ttbpssf2.salary_growth_rate < -3 AND ttbpssf2.salary_growth_rate >= -4 THEN '↓↓↓↓'
		WHEN ttbpssf2.salary_growth_rate < -4 AND ttbpssf2.salary_growth_rate >= -5 THEN '↓↓↓↓↓'
		WHEN ttbpssf2.salary_growth_rate < -5 THEN '↓↓↓↓↓↓'
	END AS salary_following_year,
	CASE 
		WHEN ttbpssf.value_growth_rate > 5 THEN '↑↑↑↑↑↑'
		WHEN ttbpssf.value_growth_rate > 4 AND ttbpssf.value_growth_rate <= 5 THEN '↑↑↑↑↑'
		WHEN ttbpssf.value_growth_rate > 3 AND ttbpssf.value_growth_rate <= 4 THEN '↑↑↑↑'
		WHEN ttbpssf.value_growth_rate > 2 AND ttbpssf.value_growth_rate <= 3 THEN '↑↑↑'
		WHEN ttbpssf.value_growth_rate > 1 AND ttbpssf.value_growth_rate <= 2 THEN '↑↑'
		WHEN ttbpssf.value_growth_rate > 0 AND ttbpssf.value_growth_rate <= 1 THEN '↑'
		WHEN ttbpssf.value_growth_rate = 0 THEN '-'
		WHEN ttbpssf.value_growth_rate < 0 AND ttbpssf.value_growth_rate >= -1 THEN '↓'
		WHEN ttbpssf.value_growth_rate < -1 AND ttbpssf.value_growth_rate >= -2 THEN '↓↓'
		WHEN ttbpssf.value_growth_rate < -2 AND ttbpssf.value_growth_rate >= -3 THEN '↓↓↓'
		WHEN ttbpssf.value_growth_rate < -3 AND ttbpssf.value_growth_rate >= -4 THEN '↓↓↓↓'
		WHEN ttbpssf.value_growth_rate < -4 AND ttbpssf.value_growth_rate >= -5 THEN '↓↓↓↓↓'
		WHEN ttbpssf.value_growth_rate < -5 THEN '↓↓↓↓↓↓'
	END AS value_this_year,
	CASE 
		WHEN ttbpssf2.value_growth_rate > 5 THEN '↑↑↑↑↑↑'
		WHEN ttbpssf2.value_growth_rate > 4 AND ttbpssf2.value_growth_rate <= 5 THEN '↑↑↑↑↑'
		WHEN ttbpssf2.value_growth_rate > 3 AND ttbpssf2.value_growth_rate <= 4 THEN '↑↑↑↑'
		WHEN ttbpssf2.value_growth_rate > 2 AND ttbpssf2.value_growth_rate <= 3 THEN '↑↑↑'
		WHEN ttbpssf2.value_growth_rate > 1 AND ttbpssf2.value_growth_rate <= 2 THEN '↑↑'
		WHEN ttbpssf2.value_growth_rate > 0 AND ttbpssf2.value_growth_rate <= 1 THEN '↑'
		WHEN ttbpssf2.value_growth_rate = 0 THEN '-'
		WHEN ttbpssf2.value_growth_rate < 0 AND ttbpssf2.value_growth_rate >= -1 THEN '↓'
		WHEN ttbpssf2.value_growth_rate < -1 AND ttbpssf2.value_growth_rate >= -2 THEN '↓↓'
		WHEN ttbpssf2.value_growth_rate < -2 AND ttbpssf2.value_growth_rate >= -3 THEN '↓↓↓'
		WHEN ttbpssf2.value_growth_rate < -3 AND ttbpssf2.value_growth_rate >= -4 THEN '↓↓↓↓'
		WHEN ttbpssf2.value_growth_rate < -4 AND ttbpssf2.value_growth_rate >= -5 THEN '↓↓↓↓↓'
		WHEN ttbpssf2.value_growth_rate < -5 THEN '↓↓↓↓↓↓'
	END AS value_following_year
FROM t_tomas_benes_project_sql_secondary_final ttbpssf
JOIN t_tomas_benes_project_sql_secondary_final ttbpssf2
ON ttbpssf2.YEAR = ttbpssf.YEAR + 1
