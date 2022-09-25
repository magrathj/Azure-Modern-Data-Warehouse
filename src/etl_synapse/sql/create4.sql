CREATE TABLE Star.Users (
    user_id INT NOT NULL PRIMARY KEY NONCLUSTERED NOT ENFORCED,
    address VARCHAR(100) ,
    first_name VARCHAR(100), 
    second_name VARCHAR(100), 
    birth_date DATE, 
    is_member BIT,
    member_start_date_id INT,
    member_end_date_id INT
);