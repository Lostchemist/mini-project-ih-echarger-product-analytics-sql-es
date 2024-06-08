-- SQLite
-- LEVEL 1

SELECT COUNT(*) FROM Sessions;

SELECT COUNT(*) FROM chargers;

SELECT COUNT(*) FROM users;


PRAGMA table_info(Users);
PRAGMA table_info(Chargers);
PRAGMA table_info(Sessions);

PRAGMA index_list(Users);
PRAGMA index_list(Chargers);
PRAGMA index_list(Sessions);


PRAGMA foreign_keys;
-- Question 1: Number of users with sessions

SELECT COUNT(DISTINCT user_id) AS NumberOfUsersWithSessions
FROM Sessions;


-- Question 2: Number of chargers used by user with id 1

SELECT COUNT(DISTINCT charger_id) AS NumberOfChargersForId_1
FROM Sessions
WHERE user_id = 1;


-- LEVEL 2

-- Question 3: Number of sessions per charger type (AC/DC):
SELECT DISTINCT type
FROM chargers;

SELECT 
    c.type AS ChargerType,
    COUNT(s.id) AS TypeCounts
FROM sessions s
JOIN chargers c ON s.charger_id = c.id
GROUP BY c.type;



-- Question 4: Chargers being used by more than one user

SELECT  charger_id, COUNT(DISTINCT user_id) AS NUMBER_OF_USERS
FROM sessions
GROUP BY charger_id
HAVING COUNT (DISTINCT user_id) >1;

-- Question 5: Average session time per charger

WITH TIME_MIN AS 
(
SELECT charger_id, (STRFTIME('%s', end_time)-STRFTIME('%s', start_time))/60 AS MINUTES
FROM sessions
)
SELECT charger_id, ROUND(AVG(MINUTES), 2) AS AVG_TIME
FROM TIME_MIN
GROUP BY charger_id;


-- LEVEL 3

-- Question 6: Full username of users that have used more than one charger in one day (NOTE: for date only consider start_time)

WITH UserChargerCounts AS (
    SELECT 
        DISTINCT s.user_id,
        DATE(s.start_time) AS usage_date,
        COUNT(DISTINCT s.charger_id) AS charger_count
    FROM 
        sessions s
    GROUP BY 
        s.user_id, 
        DATE(s.start_time)
    HAVING 
        COUNT(DISTINCT s.charger_id) > 1
)
SELECT 
    DISTINCT u.id AS UserID,
    u.name || ' ' || u.surname AS FullName
FROM 
    UserChargerCounts ucc
JOIN 
    users u ON ucc.user_id = u.id;



-- Question 7: Top 3 chargers with longer sessions
WITH LongestSession AS (
SELECT charger_id, (STRFTIME('%s', end_time)-STRFTIME('%s', start_time))/60 AS MINUTES
FROM sessions
)
SELECT charger_id, MINUTES 
FROM LongestSession
GROUP BY charger_id
ORDER BY MINUTES DESC
LIMIT 3;


-- Question 8: Average number of users per charger (per charger in general, not per charger_id specifically)
WITH TotalUsers AS (
    SELECT 
        COUNT(DISTINCT id) AS TotalUsers
    FROM 
        users
),
TotalChargers AS (
    SELECT 
        COUNT(DISTINCT id) AS TotalChargers
    FROM 
        chargers
)
SELECT 
    TotalChargers.TotalChargers / CAST(TotalUsers.TotalUsers AS FLOAT) AS AvgUsersPerCharger
FROM 
    TotalUsers, TotalChargers;


-- Question 9: Top 3 users with more chargers being used

SELECT 
    u.id AS UserID,
    u.name || ' ' || u.surname AS FullName,
    COUNT(DISTINCT s.charger_id) AS ChargerCount
FROM 
    sessions s
JOIN 
    users u ON s.user_id = u.id
GROUP BY 
    u.id, u.name, u.surname
ORDER BY 
    ChargerCount DESC
LIMIT 3;


-- LEVEL 4

-- Question 10: Number of users that have used only AC chargers, DC chargers or both

WITH UserChargerTypes AS (
    SELECT 
        s.user_id,
        GROUP_CONCAT(DISTINCT c.type) AS ChargerTypes
    FROM 
        sessions s
    JOIN 
        chargers c ON s.charger_id = c.id
    GROUP BY 
        s.user_id
)
SELECT 
    SUM(CASE WHEN ChargerTypes = 'AC' THEN 1 ELSE 0 END) AS OnlyAC,
    SUM(CASE WHEN ChargerTypes = 'DC' THEN 1 ELSE 0 END) AS OnlyDC,
    SUM(CASE WHEN ChargerTypes = 'AC,DC' OR ChargerTypes = 'DC,AC' THEN 1 ELSE 0 END) AS Both
FROM 
    UserChargerTypes;


-- Question 11: Monthly average number of users per charger

WITH MonthlyUserCounts AS (
    SELECT
        strftime('%Y-%m', s.start_time) AS Month,
        s.charger_id,
        COUNT(DISTINCT s.user_id) AS UserCount
    FROM
        sessions s
    GROUP BY
        strftime('%Y-%m', s.start_time),
        s.charger_id
),
MonthlyAverages AS (
    SELECT
        Month,
        AVG(UserCount) AS AvgUsersPerCharger
    FROM
        MonthlyUserCounts
    GROUP BY
        Month
)
SELECT
    Month,
    ROUND(AvgUsersPerCharger, 2) AS AvgUsersPerCharger
FROM
    MonthlyAverages
ORDER BY
    Month;


-- Question 12: Top 3 users per charger (for each charger, number of sessions)

-- Top 3 users per charger based on the number of sessions
WITH UserSessionsPerCharger AS (
    SELECT 
        s.charger_id,
        s.user_id,
        COUNT(s.id) AS SessionCount
    FROM 
        sessions s
    GROUP BY 
        s.charger_id,
        s.user_id
),
RankedUsers AS (
    SELECT 
        usc.charger_id,
        usc.user_id,
        usc.SessionCount,
        RANK() OVER (PARTITION BY usc.charger_id ORDER BY usc.SessionCount DESC) AS UserRank
    FROM 
        UserSessionsPerCharger usc
)
SELECT 
    r.charger_id,
    r.user_id,
    r.SessionCount
FROM 
    RankedUsers r
WHERE 
    r.UserRank <= 3
ORDER BY 
    r.charger_id,
    r.UserRank;



-- LEVEL 5

-- Question 13: Top 3 users with longest sessions per month (consider the month of start_time)
    
-- Question 14. Average time between sessions for each charger for each month (consider the month of start_time)
