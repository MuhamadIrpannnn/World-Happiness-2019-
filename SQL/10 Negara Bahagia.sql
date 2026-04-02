SELECT dc.country_name, fh.happiness_score
FROM fact_happiness fh
JOIN dim_country dc ON fh.country_id = dc.country_id
ORDER BY fh.happiness_score DESC
LIMIT 10;