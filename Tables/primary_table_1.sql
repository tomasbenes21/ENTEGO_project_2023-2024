
CREATE TABLE t_tomas_benes_project_SQL_primary_final AS
SELECT
	cp.id AS czechia_price_id,
	cp.value AS price,
	year(cp.date_from) AS 'year',
	cpc.name AS product_name,
	cpc.price_value,
	cpc.price_unit,
	cp3.id AS payroll_id,
	cp3.value,
	cp3.unit_code,
	cp3.payroll_year,
	cp3.name AS industry_name
FROM czechia_price cp
LEFT JOIN czechia_price_category cpc
	ON cpc.code = cp.category_code
LEFT JOIN (
	SELECT 
	cp2.*,
	cpib.name
	FROM czechia_payroll cp2
	LEFT JOIN czechia_payroll_industry_branch cpib
	ON cpib.code = cp2.industry_branch_code
	) cp3
	ON cp3.payroll_year = year(cp.date_from);	



