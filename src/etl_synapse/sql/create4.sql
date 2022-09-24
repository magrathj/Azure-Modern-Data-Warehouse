CREATE TABLE Star.TripDetails (
    trip_details_id INT IDENTITY(1,1) PRIMARY KEY NONCLUSTERED NOT ENFORCED,
    trip_id VARCHAR(100) NOT NULL,
    user_id INT NOT NULL,
    address VARCHAR(100) ,
    first_name VARCHAR(100), 
    second_name VARCHAR(100), 
    birth_date DATE, 
    is_member BIT,
    member_start_date_id INT,
    member_end_date_id INT,
    rideable_type VARCHAR(100),
    start_station_name VARCHAR(100),
    start_station_latitude FLOAT,
    start_station_longitude FLOAT,
    end_station_name VARCHAR(100),
    end_station_latitude FLOAT,
    end_station_longitude FLOAT
);