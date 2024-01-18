SELECT
	ttbpssf.YEAR AS 'year',
	ttbpssf.GDP_growth_rate,
	ttbpssf.value_growth_rate,
	ttbpssf.salary_growth_rate,
	ttbpssf2.value_growth_rate AS value_growth_rate_following_year,
	ttbpssf2.salary_growth_rate AS salary_growth_rate_following_year,
	CASE 
		WHEN ttbpssf.GDP_growth_rate > 5 THEN '↑↑↑'
		WHEN ttbpssf.GDP_growth_rate > 1.66 AND ttbpssf.GDP_growth_rate <= 5 THEN '↑↑'
		WHEN ttbpssf.GDP_growth_rate > 0 AND ttbpssf.GDP_growth_rate <= 1.66 THEN '↑'
		WHEN ttbpssf.GDP_growth_rate < 0 AND ttbpssf.GDP_growth_rate >= -1.66 THEN '↓'
		WHEN ttbpssf.GDP_growth_rate < -1.66 AND ttbpssf.GDP_growth_rate >= -5 THEN '↓↓'
		WHEN ttbpssf.GDP_growth_rate < -5 THEN '↓↓↓'
		ELSE '-'
	END AS GDP_this_year,
		CASE 
		WHEN (ttbpssf.salary_growth_rate > 6.66) OR (ttbpssf.value_growth_rate > 6.66) THEN '↑↑↑'
		WHEN (ttbpssf.salary_growth_rate > 3.33 AND ttbpssf.salary_growth_rate <= 6.66) OR (ttbpssf.value_growth_rate > 3.33 AND ttbpssf.value_growth_rate <= 6.66) THEN '↑↑'
		WHEN (ttbpssf.salary_growth_rate > 0 AND ttbpssf.salary_growth_rate <= 3.33) OR (ttbpssf.value_growth_rate > 0 AND ttbpssf.value_growth_rate <= 3.33) THEN '↑'
		WHEN (ttbpssf.salary_growth_rate < 0 AND ttbpssf.salary_growth_rate >= -3.33) OR (ttbpssf.value_growth_rate < 0 AND ttbpssf.value_growth_rate >= -3.33) THEN '↓'
		WHEN (ttbpssf.salary_growth_rate < 3.33 AND ttbpssf.salary_growth_rate >= -6.66) OR (ttbpssf.value_growth_rate < 3.33 AND ttbpssf.value_growth_rate >= -6.66) THEN '↓↓'
		WHEN (ttbpssf.salary_growth_rate < 6.66) OR (ttbpssf.value_growth_rate > -6.66) THEN '↓↓↓'
		ELSE '-'
	END AS salary_or_value_this_year,
		CASE 
		WHEN (ttbpssf2.salary_growth_rate > 6.66) OR (ttbpssf2.value_growth_rate > 6.66) THEN '↑↑↑'
		WHEN (ttbpssf2.salary_growth_rate > 3.33 AND ttbpssf2.salary_growth_rate <= 6.66) OR (ttbpssf2.value_growth_rate > 3.33 AND ttbpssf2.value_growth_rate <= 6.66) THEN '↑↑'
				WHEN (ttbpssf2.salary_growth_rate > 0 AND ttbpssf2.salary_growth_rate <= 3.33) OR (ttbpssf2.value_growth_rate > 0 AND ttbpssf2.value_growth_rate <= 3.33) THEN '↑'
		WHEN (ttbpssf2.salary_growth_rate < 0 AND ttbpssf2.salary_growth_rate >= -3.33) OR (ttbpssf2.value_growth_rate < 0 AND ttbpssf2.value_growth_rate >= -3.33) THEN '↓'
		WHEN (ttbpssf2.salary_growth_rate < 3.33 AND ttbpssf2.salary_growth_rate >= -6.66) OR (ttbpssf2.value_growth_rate < 3.33 AND ttbpssf2.value_growth_rate >= -6.66) THEN '↓↓'
		WHEN (ttbpssf2.salary_growth_rate < 6.66) OR (ttbpssf2.value_growth_rate > -6.66) THEN '↓↓↓'
		ELSE '-'
	END AS salary_or_value_following_year
FROM t_tomas_benes_project_sql_secondary_final ttbpssf
JOIN t_tomas_benes_project_sql_secondary_final ttbpssf2
ON ttbpssf2.YEAR = ttbpssf.YEAR + 1