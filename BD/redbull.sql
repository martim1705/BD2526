PRAGMA FOREIGN_KEYS = ON; 
CREATE TABLE Team (
    name TEXT PRIMARY KEY, 
    country TEXT NOT NULL
);

CREATE TABLE Aircraft (
    model TEXT PRIMARY KEY, 
    horsepower INTEGER,
    topspeed INTEGER,
    width REAL,
    height REAL,
    weight INTEGER 
);

CREATE TABLE Pilot (
    num INTEGER PRIMARY KEY,
    firstname TEXT NOT NULL,
    surname TEXT NOT NULL, 
    nationality TEXT NOT NULL, 
    birthday DATE,
    team TEXT,
    aircraft TEXT,
    FOREIGN KEY (team) REFERENCES Team(name),
    FOREIGN KEY (aircraft) REFERENCES Aircraft(model)
);