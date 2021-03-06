--SQL tafla fyrir vemblu, refagagnagrunninn
--Gagnatöflur
CREATE DATABASE vembla;

CREATE TABLE SVEITARFELOG (
	SveitarfelagID	SERIAL PRIMARY KEY,
	Nafn			VARCHAR(50) UNIQUE NOT NULL,
	Kennitala		CHAR(10),
	Heimilisfang	VARCHAR(50),
	Postnumer		CHAR(3),
	Simi			CHAR(7),
	Netfang			VARCHAR(50),
	Heimasida		VARCHAR(50)
);

CREATE TABLE GRENI (
	Id   			SERIAL PRIMARY KEY,
	Nafn			VARCHAR(50),
	Stadsetning		POINT,
	SveitarfelagID	INTEGER REFERENCES SVEITARFELOG,
	Lysing			TEXT
);

CREATE TABLE AGN (
	Id		        SERIAL PRIMARY KEY,
	Stadsetning		POINT,
	SveitarfelagID	INTEGER REFERENCES SVEITARFELOG,
	Dagsetning		DATE,
	Lysing			TEXT,
	Skothus			BOOLEAN,
	Ljos			BOOLEAN
);

CREATE TABLE NOTENDUR (
	Kennitala		CHAR(10) PRIMARY KEY,
	Nafn			VARCHAR(50),
	Heimilisfang	VARCHAR(50),
	Póstnúmer		CHAR(3),
	SveitarfelagID	INTEGER REFERENCES SVEITARFELOG,
	Simi			CHAR(7),
	Tölvupóstur		VARCHAR(50)
);

CREATE TABLE VEIDIMENN (	
	Kennitala 		CHAR(10) PRIMARY KEY,
	Veidikortanumer CHAR(6),
	Skotvopnaleyfi	CHAR(14),
	FOREIGN KEY (Kennitala) REFERENCES NOTENDUR
);

CREATE TABLE VISINDAMENN (
	Kennitala 		CHAR(10) PRIMARY KEY,
	StofnunID 		CHAR(7) NOT NULL,
	FOREIGN KEY (Kennitala) REFERENCES NOTENDUR
);

CREATE TABLE GRENJASKYTTUR (
	Kennitala 		CHAR(10) NOT NULL,	
	SveitarfelagID	INTEGER NOT NULL,
	PRIMARY KEY (Kennitala, SveitarfelagID),
	FOREIGN KEY (Kennitala) REFERENCES VEIDIMENN,
	FOREIGN KEY (SveitarfelagID) REFERENCES SVEITARFELOG
);

CREATE TABLE KYN (
	KynID			INTEGER PRIMARY KEY,
	Kyn				VARCHAR(20)
);

INSERT INTO KYN VALUES
	('0', 'Ekki vitað');
INSERT INTO KYN VALUES
	('1', 'Steggur');
INSERT INTO KYN VALUES
	('2', 'Læða');
INSERT INTO KYN VALUES
	('4', 'Á ekki við');

CREATE TABLE LITIR (
	LiturID			INTEGER PRIMARY KEY,
	Nafn			VARCHAR(50) UNIQUE NOT NULL,
	Lysing			TEXT
);

INSERT INTO LITIR VALUES
	('0', 'Óvíst', 'Ekki vitað hvaða litur er á dýringu, t.d. snoðdýr');
INSERT INTO LITIR VALUES
	('1', 'Hvítt', 'Hvítur refur');
INSERT INTO LITIR VALUES
	('2', 'Mórautt', 'Mórauður refur');

CREATE TABLE REFIR (
	RefurID 		SERIAL PRIMARY KEY,
	Stadsetning		POINT,
	Skotinn			DATE,
	Timi			TIME,
	Aldur			INTEGER,
	KynID			INTEGER NOT NULL REFERENCES KYN,
	LiturID			INTEGER NOT NULL REFERENCES LITIR,
	Thyngd			REAL,
	Lysing			TEXT
);


CREATE TABLE SJUKDOMAR (
	SjukdomurID		SERIAL PRIMARY KEY,
	Nafn			VARCHAR(50) UNIQUE NOT NULL,
	Lysing			TEXT
);

--Tengitoflur

CREATE TABLE SYKTIRREFIR (
	RefurID			INTEGER NOT NULL,
	SjukdomurID		INTEGER NOT NULL,
	Lysing			TEXT,
	PRIMARY KEY (RefurID, SjukdomurID),
	FOREIGN KEY (RefurID) REFERENCES REFIR,
	FOREIGN KEY (SjukdomurID) REFERENCES SJUKDOMAR
);

CREATE TABLE VITJADGRENIS (
	Id				SERIAL PRIMARY KEY,
	GreniID			INTEGER NOT NULL,
	Kennitala		CHAR(10),
	Dagsetning		DATE NOT NULL,
	Virkt			BOOLEAN,
	Lysing			TEXT,
	FOREIGN KEY (GreniID) REFERENCES GRENI
);

CREATE TABLE AGRENI (
	Id				SERIAL PRIMARY KEY,
	GreniID			INTEGER NOT NULL,
	Dagsetning		DATE NOT NULL,
	TimiFra			TIME NOT NULL,
	TimiTil			TIME
);

CREATE TABLE SKYTTURAGRENI (
	Kennitala		CHAR(10) NOT NULL,
	AGreniID		INTEGER NOT NULL,
	PRIMARY KEY (Kennitala, AGreniID),
	FOREIGN KEY (Kennitala) REFERENCES VEIDIMENN,
	FOREIGN KEY (AGreniID) REFERENCES AGRENI (Id)
);

CREATE TABLE AAGNI (
	Id				SERIAL PRIMARY KEY,
	AgnID			INTEGER NOT NULL,
	Dagsetning		DATE NOT NULL,
	TimiFra			TIME NOT NULL,
	TimiTil			TIME
);

CREATE TABLE SKYTTURAAGNI (
	Kennitala		CHAR(10) NOT NULL,
	AAgniID			INTEGER NOT NULL,
	PRIMARY KEY (Kennitala, AAgniID),
	FOREIGN KEY (Kennitala) REFERENCES VEIDIMENN,
	FOREIGN KEY (AAgniID) REFERENCES AAGNI
);

CREATE TABLE REFURUNNINNGRENI (
	RefurID			INTEGER REFERENCES REFIR,
	AGreniID		INTEGER REFERENCES AGRENI (Id),
	Skytta			CHAR(10) REFERENCES VEIDIMENN (Kennitala),
	PRIMARY KEY (RefurID, AGreniID)
);

CREATE TABLE REFURUNNINNAGNI (
	RefurID			INTEGER REFERENCES REFIR (RefurID),
	AAgniID			INTEGER REFERENCES AAGNI (Id),
	Skytta			CHAR(10) REFERENCES VEIDIMENN (Kennitala),
	PRIMARY KEY (RefurID, AAgniID)
);

CREATE TABLE REFURUNNINN (
	Id				SERIAL PRIMARY KEY,
	RefurID			INTEGER REFERENCES REFIR,
	Skytta			CHAR(10) REFERENCES VEIDIMENN (Kennitala)
	--AdferdID		INTEGER REFERENCES ADFERDIR
	);
	

CREATE TABLE REFURSAST (
	Id				SERIAL PRIMARY KEY,
	Kennitala		CHAR(10),
	Stadsetning		POINT NOT NULL,
	Dagsetning		DATE NOT NULL,
	Timi			TIME NOT NULL,
	LiturID			INTEGER REFERENCES LITIR
);

-------------------------
