INSERT INTO [star].[Users]
SELECT DISTINCT
    r.rider_id,
    r.address,
    r.first, 
    r.last, 
    r.birthday, 
    r.is_member,
    Convert(INT, CONVERT(varchar(10), r.account_start_date, 112)),
    Convert(INT, CONVERT(varchar(10), r.account_end_date, 112))
FROM riders r 
