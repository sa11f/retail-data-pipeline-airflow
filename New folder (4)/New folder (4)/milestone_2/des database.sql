--very importmat 
CREATE TABLE traffic_sensors_data (
    -- 
    ID INT IDENTITY(1,1) PRIMARY KEY, 
    [timestamp] DATETIME2 NOT NULL,
    street_name NVARCHAR(100) NOT NULL,
    vehicle_count INT,
    vehicle_speed FLOAT,
    hour_of_day INT,
    day_of_week NVARCHAR(20),
    Is_peak_hour TINYINT, 
    congestion_level NVARCHAR(10), 
    Is_congested TINYINT
);


CREATE TABLE traffic_weather_conditions (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    [timestamp] DATETIME2 NOT NULL,
    street_name NVARCHAR(100) NOT NULL,
    light_level NVARCHAR(50),
    weather NVARCHAR(50),
    traffic_light NVARCHAR(20) 
);

CREATE TABLE traffic_energy_analysis (
    ID INT IDENTITY(1,1) PRIMARY KEY, 
    [timestamp] DATETIME2 NOT NULL,
    street_name NVARCHAR(100) NOT NULL,

   
    solar_energy_level FLOAT,
    lighting_demand NVARCHAR(10), 
    lighting_demand_kW FLOAT,
    lighting_consumption_kWh FLOAT,
    
   
    energy_alert_flag TINYINT 
);  

