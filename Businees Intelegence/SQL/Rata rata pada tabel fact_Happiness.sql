SELECT
    ROUND(AVG(happiness_score),3) AS avg_score,
    ROUND(AVG(gdp_per_capita),3) AS avg_gdp,
    ROUND(AVG(social_support),3) AS avg_social,
    ROUND(AVG(life_expectancy),3) AS avg_health,
    ROUND(AVG(freedom),3) AS avg_freedom,
    ROUND(AVG(generosity),3) AS avg_generosity,
    ROUND(AVG(corruption),3) AS avg_corruption
FROM fact_happiness;