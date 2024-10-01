/*
Author: Alvin Hartridge, Jr.
Project Title: Electric Vehicle Population


Purpose: Analyze and Organize data to understand Trends within the Electric Vehicle market currently

Key Performance Indictors: 
	1. Electric Cars Per State
	2. Create Categories of Electric vehicle by Make, Then separate Make by Model to answer questions:
		A. What are the Top 5 most populaar brands?
		B. What are the Bottom 5 least popular brands?
		C. What is the #1 brand? How many vehicles?
	3. CAFV Eligibility
		A. Top 3 Eligibile brands
	4. Vehicle Type
		A. Count
		B. Categorize Vehicle Type
		C. Top Brand in each Catrgory
		
*/


-- Viewing the whole dataset
SELECT * 
FROM Electric_Vehicle_Population

ALTER TABLE Electric_Vehicle_Population
ADD Customer_ID INT IDENTITY(1, 1) NOT NULL

-- Electric Vehicle by State
SELECT 
	State, 
	COUNT(DISTINCT Customer_ID) AS VehiclePerState
FROM Electric_Vehicle_Population
GROUP BY State 
ORDER BY VehiclePerState DESC

-- Cateogory of Vehicle by Make
-- TOP 5 Brands by Make
SELECT 
	TOP 5 MAKE, 
	COUNT(make) AS VehiclesByMake
FROM Electric_Vehicle_Population
GROUP BY Make
ORDER BY VehiclesByMake DESC

-- BOTTOM 5 Brands by Make
SELECT 
	TOP 5 MAKE, 
	COUNT(make) AS VehiclesByMake
FROM Electric_Vehicle_Population
GROUP BY Make
ORDER BY VehiclesByMake ASC

-- NUMBER 1 Brand and COUNT
SELECT 
	TOP 1 Make AS TopBrand, 
	COUNT(Make) AS TotalVehicles
FROM Electric_Vehicle_Population
GROUP BY Make
ORDER BY TotalVehicles DESC


-- Top 3 CAFV Eligibile brands
SELECT
	TOP 3 MAKE,
	COUNT(Customer_ID) AS TotalVehiclesEligible
FROM Electric_Vehicle_Population
WHERE Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility = 'Clean Alternative Fuel Vehicle Eligible'
GROUP BY Make
ORDER BY TotalVehiclesEligible DESC

				-- TotalVehicles Eligible
SELECT
	COUNT(Customer_ID) AS TotalVehiclesEligible
FROM Electric_Vehicle_Population
WHERE Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility = 'Clean Alternative Fuel Vehicle Eligible'
ORDER BY TotalVehiclesEligible DESC


-- Categorize Vehicle Type
SELECT
	Electric_Vehicle_Type
FROM Electric_Vehicle_Population
GROUP BY Electric_Vehicle_Type

		-- Brands by Vehicle Type
SELECT 
	DISTINCT MAKE AS BEVBrands
FROM Electric_Vehicle_Population
WHERE Electric_Vehicle_Type = 'Battery Electric Vehicle (BEV)'
GROUP BY Make

SELECT 
	DISTINCT MAKE AS PHEVBrands
FROM Electric_Vehicle_Population
WHERE Electric_Vehicle_Type = 'Plug-in Hybrid Electric Vehicle (PHEV)'
GROUP BY Make

		-- Brands by Vehicle Type and Total vehicles 
SELECT 
	DISTINCT MAKE AS BEVBrands,
	COUNT(Model) AS TotalVehiclePerType
FROM Electric_Vehicle_Population
WHERE Electric_Vehicle_Type = 'Battery Electric Vehicle (BEV)'
GROUP BY Make 
ORDER BY TotalVehiclePerType DESC

SELECT 
	DISTINCT MAKE AS PHEVBrands,
	COUNT(Model) AS TotalVehiclePerType
FROM Electric_Vehicle_Population
WHERE Electric_Vehicle_Type = 'Plug-in Hybrid Electric Vehicle (PHEV)'
GROUP BY Make
ORDER BY TotalVehiclePerType DESC