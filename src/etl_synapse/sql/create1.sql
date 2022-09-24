CREATE TABLE Star.Date (
    date_id INT UNIQUE NOT ENFORCED,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    day_of_week VARCHAR(100) NOT NULL
);