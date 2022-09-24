CREATE TABLE Star.Time (
    time_id INT UNIQUE NOT ENFORCED,
    hour INT NOT NULL,
    min INT NOT NULL,
    second INT NOT NULL
);