-- ============================================================
--  SOURCE 1: Hotel Reference Table  (SQL Server)
--  This script creates the hotel reference table in SQL Server
--  and inserts all 30 hotels.
--
--  WHY A SQL TABLE AS A SOURCE?
--  The assignment requires at least 2 SOURCE TYPES.
--  Keeping hotel master data in a SQL table simulates a
--  real-world scenario where hotel info is maintained in an
--  operational database (e.g., a property management system),
--  while booking transactions live in flat CSV files.
-- ============================================================

-- Step 1: Create a staging/source database (run once)
 IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'HotelBookings_Source')
     CREATE DATABASE HotelBookings_Source;
 GO
 USE HotelBookings_Source;
 GO

-- Step 2: Create the hotels reference table
IF OBJECT_ID('dbo.src_hotels', 'U') IS NOT NULL
    DROP TABLE dbo.src_hotels;

CREATE TABLE dbo.src_hotels (
    hotel_id    INT           NOT NULL PRIMARY KEY,
    hotel_name  NVARCHAR(100) NOT NULL,
    hotel_type  NVARCHAR(50)  NOT NULL,   -- 'City Hotel' or 'Resort Hotel'
    city        NVARCHAR(50)  NOT NULL
);

-- Step 3: Insert all 30 hotels
INSERT INTO dbo.src_hotels (hotel_id, hotel_name, hotel_type, city) VALUES
(1,  'Resort Hotel - Chandigarh', 'Resort Hotel', 'Chandigarh'),
(2,  'Resort Hotel - Mumbai',     'Resort Hotel', 'Mumbai'),
(3,  'Resort Hotel - Delhi',      'Resort Hotel', 'Delhi'),
(4,  'Resort Hotel - Kolkata',    'Resort Hotel', 'Kolkata'),
(5,  'Resort Hotel - Hyderabad',  'Resort Hotel', 'Hyderabad'),
(6,  'Resort Hotel - Ahmedabad',  'Resort Hotel', 'Ahmedabad'),
(7,  'Resort Hotel - Pune',       'Resort Hotel', 'Pune'),
(8,  'Resort Hotel - Jaipur',     'Resort Hotel', 'Jaipur'),
(9,  'Resort Hotel - Goa',        'Resort Hotel', 'Goa'),
(10, 'Resort Hotel - Bhopal',     'Resort Hotel', 'Bhopal'),
(11, 'Resort Hotel - Surat',      'Resort Hotel', 'Surat'),
(12, 'Resort Hotel - Lucknow',    'Resort Hotel', 'Lucknow'),
(13, 'Resort Hotel - Indore',     'Resort Hotel', 'Indore'),
(14, 'Resort Hotel - Nagpur',     'Resort Hotel', 'Nagpur'),
(15, 'Resort Hotel - Visakhapatnam', 'Resort Hotel', 'Visakhapatnam'),
(16, 'City Hotel - Chandigarh',   'City Hotel',   'Chandigarh'),
(17, 'City Hotel - Mumbai',       'City Hotel',   'Mumbai'),
(18, 'City Hotel - Delhi',        'City Hotel',   'Delhi'),
(19, 'City Hotel - Kolkata',      'City Hotel',   'Kolkata'),
(20, 'City Hotel - Hyderabad',    'City Hotel',   'Hyderabad'),
(21, 'City Hotel - Ahmedabad',    'City Hotel',   'Ahmedabad'),
(22, 'City Hotel - Pune',         'City Hotel',   'Pune'),
(23, 'City Hotel - Jaipur',       'City Hotel',   'Jaipur'),
(24, 'City Hotel - Goa',          'City Hotel',   'Goa'),
(25, 'City Hotel - Bhopal',       'City Hotel',   'Bhopal'),
(26, 'City Hotel - Surat',        'City Hotel',   'Surat'),
(27, 'City Hotel - Lucknow',      'City Hotel',   'Lucknow'),
(28, 'City Hotel - Indore',       'City Hotel',   'Indore'),
(29, 'City Hotel - Nagpur',       'City Hotel',   'Nagpur'),
(30, 'City Hotel - Visakhapatnam','City Hotel',   'Visakhapatnam');

-- Step 4: Verify
SELECT * FROM dbo.src_hotels ORDER BY hotel_id;
