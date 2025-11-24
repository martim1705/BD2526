/*PRAGMA FOREIGN_KEYS = ON;
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
INSERT INTO district (id, name) VALUES
(13, 'PORTO'); 
*/
-- D. 




UPDATE district set id = 13 where id = 14; 

/*CREATE TABLE party (
    id INTEGER PRIMARY KEY,
    shortname TEXT,
    name TEXT NOT NULL
);

CREATE TABLE independent (
    municipality_code INTEGER PRIMARY KEY, 
    shortname TEXT PRIMARY KEY,
    votes INTEGER,
    FOREIGN KEY votes REFERENCES municipality(code)
);

CREATE TABLE coalition (
    municipality_code INTEGER PRIMARY KEY,
    shortname TEXT PRIMARY KEY,
    name TEXT,
    FOREIGN KEY municipality_code REFERENCES municipality(code) 
);

CREATE TABLE coalition_member(
    municipality_code INTEGER PRIMARY KEY,
    coalition_shortname TEXT PRIMARY KEY,
    order_number INTEGER PRIMARY KEY,
    party_id INTEGER,

    FOREIGN KEY municipality_code REFERENCES coalition(municipality_code),
    FOREIGN KEY coalition_shortname REFERENCES coalition(shortname)
);

CREATE TABLE party_votes (
    municipality_code INTEGER PRIMARY KEY,
    party_id INTEGER PRIMARY KEY,
    votes INTEGER,
    FOREIGN KEY municipality_code REFERENCES coalition(municipality_code),
    FOREIGN KEY coalition_shortname REFERENCES coalition(shortname)
);

CREATE TABLE coalition_votes (
    municipality_code INT PRIMARY KEY, 
    coalition_shortname TEXT PRIMARY KEY,
    votes INTEGER,
    FOREIGN KEY municipality_code REFERENCES coalition(municipality_code),
    FOREIGN KEY coalition_shortname REFERENCES coalition(shortname)
);

CREATE TABLE independent_votes(
    municipality_code INT PRIMARY KEY,
    independent_shortname TEXT PRIMARY KEY,
    votes INTEGER,
    FOREIGN KEY municipality_code REFERENCES independent(municipality_code),
    FOREIGN KEY independent_shortname REFERENCES independent(shortname)
); */