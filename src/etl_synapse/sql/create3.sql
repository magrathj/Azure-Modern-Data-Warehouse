-- DROP TABLE Star.Trip;
-- FOREIGN KEY constraint is not supported in dedicated SQL pool.

CREATE TABLE Star.Trip (
    trip_id INT PRIMARY KEY NONCLUSTERED NOT ENFORCED,
    trip_counter INT NOT NULL,
    start_at_time_id INT NOT NULL,
    start_at_date_id INT NOT NULL,
    end_at_time_id INT NOT NULL, 
    end_at_date_id INT NOT NULL,
    total_trip_time INT NOT NULL,
    user_id INT NOT NULL,
    start_station_id INT NOT NULL,
    end_station_id INT NOT NULL,
);