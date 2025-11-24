PRAGMA FOREIGN_KEYS = ON;
DROP TABLE IF EXISTS district;
DROP TABLE IF EXISTS municipality;
DROP TABLE IF EXISTS party;
DROP TABLE IF EXISTS independent;
DROP TABLE IF EXISTS coalition;
DROP TABLE IF EXISTS coalition_member;
DROP TABLE IF EXISTS party_votes;   
-- A.
CREATE TABLE district (
    id INTEGER PRIMARY KEY CHECK (id BETWEEN 1 AND 20),
    name TEXT UNIQUE NOT NULL,
    type TEXT NOT NULL DEFAULT 'District' 
        CHECK (type IN ('District', 'Autonomous Region'))
);

-- B.

CREATE TABLE municipality (
    code CHAR(6) PRIMARY KEY,
    name TEXT NOT NULL, 
    district INTEGER ,
    mandates INTEGER,
    registered_votes INTEGER,
    valid_votes INTEGER,
    blank_votes INTEGER,
    null_votes INTEGER,
    FOREIGN KEY (district) REFERENCES district(id) ON DELETE SET NULL ON UPDATE CASCADE
);


-- C. 
--INSERT INTO district (id, name) VALUES
--(13, 'PORTO'); 

-- D. 
--SELECT * FROM municipality; 

-- E. 

CREATE TABLE party (
    id INTEGER PRIMARY KEY, 
    shortname TEXT NOT NULL UNIQUE, 
    name TEXT NOT NULL
);



CREATE TABLE independent (
    municipality_code INTEGER , 
    shortname TEXT NOT NULL,
    name TEXT NOT NULL, 
    votes INTEGER CHECK (votes >= 0),
    FOREIGN KEY (municipality_code) REFERENCES municipality(code) ON UPDATE CASCADE ON DELETE RESTRICT ,
    PRIMARY KEY (municipality_code,shortname)
);

CREATE TABLE coalition (
    municipality_code INTEGER,
    shortname TEXT,
    name TEXT,
    FOREIGN KEY (municipality_code) REFERENCES municipality(code) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (municipality_code,shortname) 
);

CREATE TABLE coalition_member(
    municipality_code INTEGER,
    coalition_shortname TEXT,
    order_number INTEGER,
    party_id INTEGER,

    FOREIGN KEY (municipality_code) REFERENCES coalition(municipality_code) ON UPDATE CASCADE,
    FOREIGN KEY (coalition_shortname) REFERENCES coalition(shortname) ON UPDATE CASCADE,
    PRIMARY KEY (municipality_code, coalition_shortname,order_number)
);

CREATE TABLE party_votes (
    municipality_code INTEGER,
    party_id INTEGER,
    votes INTEGER,
    FOREIGN KEY (municipality_code) REFERENCES coalition(municipality_code),
    FOREIGN KEY (coalition_shortname) REFERENCES coalition(shortname),
    PRIMARY KEY (municipality_code,party_id)
);

CREATE TABLE coalition_votes (
    municipality_code INT, 
    coalition_shortname TEXT,
    votes INTEGER,
    FOREIGN KEY (municipality_code) REFERENCES coalition(municipality_code),
    FOREIGN KEY (coalition_shortname) REFERENCES coalition(shortname),
    PRIMARY KEY (municipality_code, coalition_shortname)
);

CREATE TABLE independent_votes(
    municipality_code INTEGER,
    independent_shortname TEXT,
    votes INTEGER CHECK (votes >= 0),
    FOREIGN KEY (municipality_code) REFERENCES independent(municipality_code),
    FOREIGN KEY (independent_shortname) REFERENCES independent(shortname),
    PRIMARY KEY (municipality_code, independent_shortname)
); 