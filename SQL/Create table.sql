CREATE TABLE dim_years (
    year_id INT PRIMARY KEY,
    year INT
);

CREATE TABLE dim_country (
    country_id SERIAL PRIMARY KEY,
    country_name TEXT
);

CREATE TABLE fact_happiness (
    fact_id SERIAL PRIMARY KEY,
    country_id INT,
    year_id INT,
    overall_rank INT,
    happiness_score DECIMAL(5,3),
    gdp_per_capita DECIMAL(5,3),
    social_support DECIMAL(5,3),
    life_expectancy DECIMAL(5,3),
    freedom DECIMAL(5,3),
    generosity DECIMAL(5,3),
    corruption DECIMAL(5,3),

    FOREIGN KEY (country_id) REFERENCES dim_country(country_id),
    FOREIGN KEY (year_id) REFERENCES dim_years(year_id)
);