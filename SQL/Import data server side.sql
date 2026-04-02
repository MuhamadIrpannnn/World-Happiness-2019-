COPY dim_country(country_name, country_id)
FROM 'C:/temp/dim_country.csv'
DELIMITER ',' CSV HEADER;

COPY dim_years(year_id, year)
FROM 'C:/temp/dim_year.csv'
DELIMITER ',' CSV HEADER;

COPY fact_happiness(
    country_id, year_id,
    happiness_score, gdp_per_capita, social_support,
    life_expectancy, freedom, generosity, corruption
)
FROM 'C:/temp/fact_happiness.csv'
DELIMITER ',' CSV HEADER;