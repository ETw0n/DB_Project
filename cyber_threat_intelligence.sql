-- SQL script for Cyber Threat Intelligence database

-- Table: Threat
CREATE TABLE Threat (
    Threat_ID INT PRIMARY KEY,
    Threat_name VARCHAR(255) NOT NULL,
    Description TEXT,
    Attack_Pattern TEXT
);

-- Table: Threat Actor
CREATE TABLE Threat_Actor (
    Actor_ID INT PRIMARY KEY,
    Actor_Name VARCHAR(255) NOT NULL,
    Origin VARCHAR(255),
    Motive TEXT
);

-- Table: Mitigation
CREATE TABLE Mitigation (
    Mitigation_ID INT PRIMARY KEY,
    Mitigation_Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Threat_ID INT,
    FOREIGN KEY (Threat_ID) REFERENCES Threat(Threat_ID)
);

-- Table: Affected System
CREATE TABLE Affected_System (
    System_ID INT PRIMARY KEY,
    System_Name VARCHAR(255) NOT NULL,
    System_Type VARCHAR(255),
    Threat_Type VARCHAR(255)
);

-- Table: Threat Actor Relationship (Many-to-Many relationship between Threat and Threat Actor)
CREATE TABLE Threat_Actor_Relationship (
    Relationship_ID INT PRIMARY KEY,
    Threat_ID INT,
    Actor_ID INT,
    FOREIGN KEY (Threat_ID) REFERENCES Threat(Threat_ID),
    FOREIGN KEY (Actor_ID) REFERENCES Threat_Actor(Actor_ID)
);
