-- D.1
-- The dates were spliced to allow for SQLite to recognise the Singapore's earliest administered vaccine date up till 30/06/2021.
SELECT location AS "Country", date AS "Observation Date", daily_vaccinations AS "Administered Vaccine"
    FROM vaccinations
    WHERE location = "Singapore" AND
    substr(date,7)||'-'||substr(date,4,2)||'-'||substr(date,1,2) BETWEEN 
                                                                    (SELECT min(date)
                                                                    FROM vaccinations
                                                                    WHERE location = "Singapore") AND 
                                                                    '2021-06-30'
;

-- D.2
-- Cumulative doses for each country. This is done by summing up the daily vaccinations count for each country.       
SELECT location AS "Country", SUM(daily_vaccinations) AS "Cumulative Doses"
    FROM vaccinations
    GROUP BY location
    HAVING SUM(daily_vaccinations) AND
    location IN (SELECT location FROM locations)
;
    
-- D.3
-- The query produces a table of countries and the vaccine types given in those countries.
SELECT DISTINCT location AS "Country", vaccine AS "Vaccine Type"
    FROM vaccinations_by_manufacturer
;

-- D.4
-- As some source names have different source URLs, the query is grouped by source name and source website to account for this.
SELECT l.source_name as "Source Name", SUM(v.daily_vaccinations) AS "Total Administered Vaccines", l.source_website AS "Source URL"
    FROM locations l INNER JOIN vaccinations v ON l.location = v.location
    GROUP BY source_name, source_website
    HAVING SUM(v.daily_vaccinations)
    ORDER BY "Total Administered Vaccines" DESC
;

-- D.5
-- Joining the tables on dates in common. The beginning and ending dates recorded are different for those 4 countries.
SELECT date as "Date", a.people_fully_vaccinated AS "Australia", us.people_fully_vaccinated AS "United States", f.people_fully_vaccinated AS "France", i.people_fully_vaccinated AS "Israel"
    FROM australia a INNER JOIN united_states us ON a.date = us.date
        INNER JOIN france f ON us.date = f.date
        INNER JOIN israel i ON f.date = i.date;