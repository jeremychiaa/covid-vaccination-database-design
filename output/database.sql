CREATE TABLE vaccinations_by_age_group(
        ID INTEGER,
        location VARCHAR(50),
        date DATE,
        age_group VARCHAR(30),
        people_vaccinated_per_hundred REAL,
        people_fully_vaccinated_per_hundred REAL,
        PRIMARY KEY (ID, location)
);

CREATE TABLE vaccinations_by_manufacturer(
        ID INTEGER,
        location VARCHAR(50),
        date DATE,
        vaccine VARCHAR,
        total_vaccinations INTEGER,
        PRIMARY KEY (ID, location)
);

CREATE TABLE vaccinations(
        ID INTEGER,
        location VARCHAR(50),
        iso_code VARCHAR(5),
        date DATE,
        total_vaccinations INTEGER,
        people_vaccinated INTEGER,
        people_fully_vaccinated INTEGER,
        total_boosters INTEGER,
        daily_vaccinations_raw INTEGER,
        daily_vaccinations INTEGER,
        total_vaccinations_per_hundred REAL,
        people_vaccinated_per_hundred REAL,
        people_fully_vaccinated_per_hundred REAL,
        total_boosters_per_hundred REAL,
        daily_vaccinations_per_million REAL,
        PRIMARY KEY (ID, iso_code)     
);

CREATE TABLE locations(
        location VARCHAR(50),
        iso_code VARCHAR(5) PRIMARY KEY,
        vaccines VARCHAR(200),
        last_observation_date DATE,
        source_name VARCHAR,
        source_website VARCHAR
);


CREATE TABLE united_states(
        location VARCHAR(50),
        total_vaccinations INTEGER,
        date DATE PRIMARY KEY,
        vaccine VARCHAR,
        source_url VARCHAR,
        people_vaccinated INTEGER,
        people_fully_vaccinated INTEGER,
        total_boosters INTEGER,
        iso_code VARCHAR(5),
        FOREIGN KEY (iso_code) REFERENCES locations(iso_code)
);

CREATE TABLE us_state_vaccinations(
        date DATE,
        location_state VARCHAR(100),
        total_vaccinations INTEGER,
        total_distributed INTEGER,
        people_vaccinated INTEGER,
        people_fully_vaccinated_per_hundred REAL,
        total_vaccinations_per_hundred REAL,
        people_fully_vaccinated INTEGER,
        people_vaccinated_per_hundred REAL,
        distributed_per_hundred REAL,
        daily_vaccinations_raw INTEGER,
        daily_vaccinations INTEGER,
        daily_vaccinations_per_million REAL,
        share_doses_used REAL,
        location_country VARCHAR(50),
        PRIMARY KEY (date, location_state)
);

CREATE TABLE australia(
        date DATE PRIMARY KEY,
        total_vaccinations INTEGER,
        people_fully_vaccinated INTEGER,
        people_vaccinated INTEGER,
        vaccine VARCHAR,
        location VARCHAR(50),
        source_url VARCHAR,
        total_boosters INTEGER,
        iso_code VARCHAR(5),
        FOREIGN KEY (iso_code) REFERENCES locations(iso_code)
);

CREATE TABLE israel(
        date DATE PRIMARY KEY,
        total_vaccinations INTEGER,
        people_vaccinated INTEGER,
        people_fully_vaccinated INTEGER,
        total_boosters INTEGER,
        location VARCHAR(50),
        source_url VARCHAR,
        vaccine VARCHAR,
        iso_code VARCHAR(5),
        FOREIGN KEY (iso_code) REFERENCES locations(iso_code)
);


CREATE TABLE france(
        date DATE PRIMARY KEY,
        total_vaccinations INTEGER,
        people_vaccinated INTEGER,
        people_fully_vaccinated INTEGER,
        total_boosters INTEGER,
        vaccine VARCHAR,
        location VARCHAR(50),
        source_url VARCHAR,
        iso_code VARCHAR(5),
        FOREIGN KEY (iso_code) REFERENCES locations(iso_code)
);


CREATE TABLE contains_age_groups_manufacturers(
        location VARCHAR(50),
        iso_code VARCHAR(5),
        PRIMARY KEY (location, iso_code)
);