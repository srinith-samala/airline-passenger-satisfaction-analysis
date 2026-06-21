CREATE DATABASE Airline;
use Airline 
Create Table airline(
	customer_id varchar(100),
	id VARCHAR(100),
    Gender VARCHAR(100),
    Customer_Type VARCHAR(100),
    Age VARCHAR(100),
    Type_of_Travel VARCHAR(100),
    Class VARCHAR(100),
    Flight_Distance VARCHAR(100),
    Inflight_wifi_service VARCHAR(100),
    Departure_Arrival_time_convenient VARCHAR(100),
    Ease_of_Online_booking VARCHAR(100),
    Gate_location VARCHAR(100),
    Food_and_drink VARCHAR(100),
    Online_boarding VARCHAR(100),
    Seat_comfort VARCHAR(100),
    Inflight_entertainment VARCHAR(100),
    On_board_service VARCHAR(100),
    Leg_room_service VARCHAR(100),
    Baggage_handling VARCHAR(100),
    Checkin_service VARCHAR(100),
    Inflight_service VARCHAR(100),
    Cleanliness VARCHAR(100),
    Departure_Delay_in_Minutes VARCHAR(100),
    Arrival_Delay_in_Minutes VARCHAR(100),
    satisfaction varchar(100)
    );

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Airline.csv'
INTO TABLE airline
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from airline limit 5;

describe airline;

# Cleaning 
#duplicates ( No duplicates found) 
SELECT id,count(*) AS OCCURNACE 
from airline 
group by id 
having count(*) > 1;

# Null values ( no null,values found) 
SELECT
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls,
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_nulls,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS gender_nulls,
    SUM(CASE WHEN Customer_Type IS NULL THEN 1 ELSE 0 END) AS customer_type_nulls,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS age_nulls,
    SUM(CASE WHEN Type_of_Travel IS NULL THEN 1 ELSE 0 END) AS travel_type_nulls,
    SUM(CASE WHEN Class IS NULL THEN 1 ELSE 0 END) AS class_nulls,
    SUM(CASE WHEN Flight_Distance IS NULL THEN 1 ELSE 0 END) AS distance_nulls,
    SUM(CASE WHEN Inflight_wifi_service IS NULL THEN 1 ELSE 0 END) AS wifi_nulls,
    SUM(CASE WHEN Departure_Arrival_time_convenient IS NULL THEN 1 ELSE 0 END) AS time_nulls,
    SUM(CASE WHEN Ease_of_Online_booking IS NULL THEN 1 ELSE 0 END) AS booking_nulls,
    SUM(CASE WHEN Gate_location IS NULL THEN 1 ELSE 0 END) AS gate_nulls,
    SUM(CASE WHEN Food_and_drink IS NULL THEN 1 ELSE 0 END) AS food_nulls,
    SUM(CASE WHEN Online_boarding IS NULL THEN 1 ELSE 0 END) AS boarding_nulls,
    SUM(CASE WHEN Seat_comfort IS NULL THEN 1 ELSE 0 END) AS seat_nulls,
    SUM(CASE WHEN Inflight_entertainment IS NULL THEN 1 ELSE 0 END) AS entertainment_nulls,
    SUM(CASE WHEN On_board_service IS NULL THEN 1 ELSE 0 END) AS onboard_nulls,
    SUM(CASE WHEN Leg_room_service IS NULL THEN 1 ELSE 0 END) AS legroom_nulls,
    SUM(CASE WHEN Baggage_handling IS NULL THEN 1 ELSE 0 END) AS baggage_nulls,
    SUM(CASE WHEN Checkin_service IS NULL THEN 1 ELSE 0 END) AS checkin_nulls,
    SUM(CASE WHEN Inflight_service IS NULL THEN 1 ELSE 0 END) AS inflight_nulls,
    SUM(CASE WHEN Cleanliness IS NULL THEN 1 ELSE 0 END) AS cleanliness_nulls,
    SUM(CASE WHEN Departure_Delay_in_Minutes IS NULL THEN 1 ELSE 0 END) AS dep_delay_nulls,
    SUM(CASE WHEN Arrival_Delay_in_Minutes IS NULL THEN 1 ELSE 0 END) AS arr_delay_nulls,
    SUM(CASE WHEN satisfaction IS NULL THEN 1 ELSE 0 END) AS satisfaction_nulls
FROM airline;

SELECT * FROM AIRLINE LIMIT 2;
select distinct(Departure_Delay_in_Minutes), length(Departure_Delay_in_Minutes) as length from airline ;
select distinct(Arrival_Delay_in_Minutes), length(Arrival_Delay_in_Minutes) as length from airline ;
select * from airline 

SELECT DISTINCT(customer_type) from airline;
select distinct(Class) from airline ;

# Chnaging Departure deplay to hh and mm format by adding new column  
ALTER TABLE airline
ADD COLUMN Departure_Delay_HHMM VARCHAR(10);

update airline 
set Departure_Delay_HHMM = 0 
where Departure_Delay_HHMM is null;

UPDATE airline
SET Departure_Delay_HHMM = CONCAT(
    LPAD(FLOOR(CAST(Departure_Delay_in_Minutes AS UNSIGNED)/60),1,'0'),
    ':',
    LPAD(CAST(Departure_Delay_in_Minutes AS UNSIGNED) % 60,2,'0')
)
WHERE Departure_Delay_in_Minutes IS NOT NULL
  AND CAST(Departure_Delay_in_Minutes AS UNSIGNED) >= 1;

# chnaging arrival delay to hh and mm fomat by adding new column 
ALTER TABLE airline
ADD COLUMN arrival_delay VARCHAR(10);

UPDATE airline
SET Arrival_Delay = CONCAT(
    LPAD(FLOOR(CAST(NULLIF(SUBSTRING_INDEX(Arrival_Delay_in_Minutes,'.',1) ,'') AS UNSIGNED)/60),1,'0'),
    ':',
    LPAD(CAST(NULLIF(SUBSTRING_INDEX(Arrival_Delay_in_Minutes,'.',1) ,'') AS UNSIGNED) % 60,2,'0')
)
WHERE Arrival_Delay_in_Minutes IS NOT NULL
  AND Arrival_Delay_in_Minutes <> '';

# chnaging dissatised and netrual as ony dissatissfied 
select distinct satisfaction from airline;
UPDATE airline
SET satisfaction = 'Dissatisfied'
WHERE TRIM(REPLACE(satisfaction, '\r', '')) = 'neutral or dissatisfied';

UPDATE airline
SET satisfaction = 'Satisfied'
WHERE TRIM(REPLACE(satisfaction, '\r', '')) = 'satisfied';
select * from airline limit 5;
# Quries 
SELECT 
    'Inflight_wifi_service' AS factor,
    AVG(CASE WHEN satisfaction='Satisfied' THEN Inflight_wifi_service END) -
    AVG(CASE WHEN satisfaction='Dissatisfied' THEN Inflight_wifi_service END) AS rating_gap
FROM airline

UNION ALL
SELECT 
    'Seat_comfort' AS factor,
    AVG(CASE WHEN satisfaction='Satisfied' THEN Seat_comfort END) -
    AVG(CASE WHEN satisfaction='Dissatisfied' THEN Seat_comfort END) AS rating_gap
FROM airline

UNION ALL
SELECT 
    'Leg_room_service' AS factor,
    AVG(CASE WHEN satisfaction='Satisfied' THEN Leg_room_service END)-
    AVG(CASE WHEN satisfaction='Dissatisfied' THEN Leg_room_service END) AS rating_gap
FROM airline

UNION ALL
SELECT 
    'Food_and_drink' AS factor,
    AVG(CASE WHEN satisfaction='Satisfied' THEN Food_and_drink END)-
    AVG(CASE WHEN satisfaction='Dissatisfied' THEN Food_and_drink END) AS rating_gap
FROM airline

UNION ALL
SELECT 
    'Online_boarding' AS factor,
    AVG(CASE WHEN satisfaction='Satisfied' THEN Online_boarding END)-
    AVG(CASE WHEN satisfaction='Dissatisfied' THEN Online_boarding END) AS rating_gap
FROM airline

UNION ALL
SELECT 
    'Inflight_entertainment' AS factor,
    AVG(CASE WHEN satisfaction='Satisfied' THEN Inflight_entertainment END)-
    AVG(CASE WHEN satisfaction='Dissatisfied' THEN Inflight_entertainment END) AS rating_gap
FROM airline

UNION ALL
SELECT 
    'Baggage_handling' AS factor,
    AVG(CASE WHEN satisfaction='Satisfied' THEN Baggage_handling END)-
    AVG(CASE WHEN satisfaction='Dissatisfied' THEN Baggage_handling END) AS rating_gap
FROM airline
union all 
SELECT 
    'Cleanliness' AS factor,
    AVG(CASE WHEN satisfaction='Satisfied' THEN Cleanliness END)-
    AVG(CASE WHEN satisfaction='Dissatisfied' THEN Cleanliness END) AS rating_gap
FROM airline
union all 
SELECT 
    'Checkin_service' AS factor,
    AVG(CASE WHEN satisfaction='Satisfied' THEN Checkin_service END)-
    AVG(CASE WHEN satisfaction='Dissatisfied' THEN Checkin_service END) AS rating_gap
FROM airline
ORDER BY rating_gap DESC;


# Do passengers with online boarding vs traditional check-in show different satisfaction levels?
SELECT 
    CASE 
        WHEN Online_boarding = 0 THEN 'Traditional'
        ELSE 'Online'
    END AS boarding_type,
    AVG(CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END)* 100 AS satisfaction_rate
FROM airline
GROUP BY boarding_type
ORDER BY satisfaction_rate ASC;

# Which travel class has the lowest satisfaction?
select Class,
	AVG(CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END)*100 AS satisfaction_rate
from airline 
group by class 
order by satisfaction_rate desc;

# Are loyal customers more or less satisfied than disloyal customers?
SELECT 
	Customer_Type,
    AVG(CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END)*100 AS satisfaction_rate
from airline 
group by Customer_type 
order by satisfaction_rate desc;
    

# Does departure or arrival delay affect passenger satisfaction?
SELECT 
    'Departure' AS delay_type,
    CASE 
        WHEN Departure_Delay_in_Minutes <= 15  THEN 'On-time'
        ELSE 'Delayed'
    END AS status,
    AVG(CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END) * 100 AS satisfaction_rate
FROM airline
GROUP BY delay_type,status

UNION ALL

SELECT 
    'Arrival' AS delay_type,
    CASE 
        WHEN Arrival_Delay_in_Minutes <= 15 THEN 'On-time'
        ELSE 'Delayed'
    END AS status,
    AVG(CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END) * 100 AS satisfaction_rate
FROM airline
GROUP BY delay_type,status;


SELECT 
  MIN(Departure_Delay_in_Minutes), MAX(Departure_Delay_in_Minutes), AVG(Departure_Delay_in_Minutes),
  SUM(CASE WHEN Departure_Delay_in_Minutes = 0 THEN 1 ELSE 0 END) as zero_delay,
  SUM(CASE WHEN Departure_Delay_in_Minutes BETWEEN 1 AND 15 THEN 1 ELSE 0 END) as short_delay,
  SUM(CASE WHEN Departure_Delay_in_Minutes > 15 THEN 1 ELSE 0 END) as long_delay
FROM airline;


