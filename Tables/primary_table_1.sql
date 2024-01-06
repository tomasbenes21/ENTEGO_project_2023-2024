CREATE TABLE t_tomas_benes_project_sql_primary_final
WITH price AS (
	SELECT 
	round(avg(cp.value),2) AS unit_value,
	cpc.code AS cat_code,
	cpc.name AS category_name,
	cpc.price_value,
	cpc.price_unit,
	YEAR(cp.date_from) AS czechia_price_year
	FROM czechia_price cp
	LEFT JOIN czechia_price_category cpc
	ON cpc.code=cp.category_code
	LEFT JOIN czechia_region cr
	ON cr.code=cp.region_code
	AND cp.region_code IS NULL
	GROUP BY category_code, cpc.name, cpc.price_value, cpc.price_unit, YEAR(cp.date_from)
	)
SELECT 
	price.unit_value,
	price.category_name,
	price.price_value,
	price.price_unit,
	pay.payroll_value,
	pay.value_name,
	pay.unit_name,
	pay.industry_name,
	pay.payroll_year AS 'year'
FROM price
LEFT JOIN (
	SELECT
	round(avg(cpa.value),2) AS payroll_value,
	cpvt.name AS value_name,
	cpu.name AS unit_name,
	cpa.industry_branch_code AS industry_code,
	cpib.name AS industry_name,
	cpa.payroll_year
FROM czechia_payroll cpa
LEFT JOIN czechia_payroll_calculation cpc
	ON cpc.code=cpa.calculation_code
LEFT JOIN czechia_payroll_industry_branch cpib
	ON cpib.code=cpa.industry_branch_code
LEFT JOIN czechia_payroll_unit cpu
	ON cpu.code=cpa.unit_code
LEFT JOIN czechia_payroll_value_type cpvt
	ON cpvt.code=cpa.value_type_code
GROUP BY cpvt.name, cpu.name, cpa.industry_branch_code, cpib.name, cpa.payroll_year
) pay
ON price.czechia_price_year = pay.payroll_year;