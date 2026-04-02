SELECT dc.country_name, fh.gdp_per_capita, fh.happiness_score
FROM fact_happiness fh
JOIN dim_country dc ON fh.country_id = dc.country_id;