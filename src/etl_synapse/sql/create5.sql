CREATE TABLE Star.Payment (
    payment_id INT PRIMARY KEY NONCLUSTERED NOT ENFORCED,
    user_id INT NOT NULL,
    payment_date_id INT NOT NULL,
    payment_amount FLOAT NOT NULL
);