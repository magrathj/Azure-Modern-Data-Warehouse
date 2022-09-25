CREATE TABLE Star.Trip (
    trip_id VARCHAR(100) PRIMARY KEY NONCLUSTERED NOT ENFORCED,
    trip_counter INT NOT NULL,
    start_at_time_id INT NOT NULL,
    start_at_date_id INT NOT NULL,
    end_at_time_id INT NOT NULL, 
    end_at_date_id INT NOT NULL,
    total_trip_time_seconds INT NOT NULL,
    user_id INT NOT NULL,
    rideable_type VARCHAR(100),
    start_station_id VARCHAR(50),
    end_station_id VARCHAR(50)
);