-- DROP TABLE Star.Time;
-- FOREIGN KEY constraint is not supported in dedicated SQL pool.

CREATE TABLE Star.Time (
    date_id INT UNIQUE NOT ENFORCED,
    hour INT NOT NULL,
    min INT NOT NULL,
    second INT NOT NULL
);