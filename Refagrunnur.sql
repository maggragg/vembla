--SQL tafla fyrir vemblu, refagagnagrunninn
--Gagnatöflur

CREATE TABLE GRENI (
	int   			CHAR(7) NOT NULL,
	Stadsetning		POINT,
	SveitarfelagID	CHAR(7),
	Lysing			TEXT,
	PRIMARY KEY (Id)
)

CREATE TABLE UTBURDUR (
	Id		        CHAR(7) NOT NULL,
	Stadsetning		POINT,
	SveitarfelagID	CHAR(7)
	Dagsetning		DATE,
	Lysing			TEXT,
	Skothus			BOOLEAN,
	Ljos			BOOLEAN,
	PRIMARY KEY (Id)
)

CREATE TABLE NOTANDI (
	Kennitala		CHAR(10) NOT NULL,
	Nafn			VARCHAR(50),
	Heimilisfang	VARCHAR(50),
	Póstnúmer		CHAR(3),
	SveitarfelagID	CHAR(7),
	Simi			CHAR(7),
	Tölvupóstur		VARCHAR(50),
	PRIMARY KEY (Kennitala)
)

CREATE TABLE VEIDIMENN (	
	Kennitala 		CHAR(10) NOT NULL,
	Veidikortanumer CHAR(6),
	Skotvopnaleyfi	CHAR(14),
	PRIMARY KEY (Kennitala)
)

CREATE TABLE VISINDAMENN (
	Kennitala 		CHAR(10) NOT NULL,
	StofnunID 		CHAR(7) NOT NULL
)

CREATE TABLE GRENJASKYTTUR (
	Kennitala 		CHAR(10) NOT NULL,	
	SveitarfelagID	CHAR(7) NOT NULL,
	PRIMARY KEY (Kennitala, SveitarfelagID)
)

CREATE TABLE REFIR (
	RefurID 		CHAR(7) NOT NULL,
	Aldur			INT,
	Kyn				CHAR(7),
	Lysing			TEXT,
	PRIMARY KEY (RefurID)
)

CREATE TABLE SJUKDOMAR (
	SjukdomurID		CHAR(7) NOT NULL,
	Nafn			VARCHAR(50),
	Lysing			TEXT,
	PRIMARY KEY (SjukdomurID)
)

CREATE TABLE LITIR (
	LiturID			CHAR(7) NOT NULL,
	Nafn			VARCHAR(50),
	Lysing			TEXT,
	PRIMARY KEY (LiturID)
)

--Tengitoflur

CREATE TABLE SYKTIRREFIR (
	RefurID			CHAR(7) NOT NULL,
	SjukdomurID		CHAR(7) NOT NULL,
	Lysing			TEXT,
	PRIMARY KEY (RefurID, SjukdomurID),
	FOREIGN KEY RefurID REFERENCES REFIR,
	FOREIGN KEY SjukdomurID REFERECES SJUKDOMAR
)

CREATE TABLE VITJADGRENIS (
	Id				CHAR(7) NOT NULL,
	GreniID			CHAR(7) NOT NULL,
	Kennitala		CHAR(10),
	Dagsetning		DATE,
	Virkt			BOOLEAN,
	PRIMARY KEY (Id)
)

CREATE TABLE AGRENI (
	Id				CHAR(7) NOT NULL,
	GreniID			CHAR(7),
	Dagsetning		DATE,
	TimiFra			TIME,
	TimiTil			TIME,
	PRIMARY KEY (Id)
)

CREATE TABLE SKYTTURAGRENI (
	Kennitala		CHAR(10) NOT NULL,
	AGreniID		CHA(7) NOT NULL,
	PRIMARY KEY (Kennitala, AGreniID),
	FOREIGN KEY (Kennitala) REFERENCES GRENJASKYTTUR,
	FOREIGN KEY (AGreniID) REFERENCES AGreni (Id)
)

CREATE TABLE AUTBURDI (
	Id				CHAR(7) NOT NULL,
	UtburdurID		CHAR(7),
	Dagsetning		DATE,
	TimiFra			TIME,
	TimiTil			TIME
	PRIMARY KEY (Id)
)

CREATE TABLE SKYTTURAUTBURDI (
	Kennitala		CHAR(10) NOT NULL,
	AUtburdiID		CHA(7) NOT NULL,
	PRIMARY KEY (Kennitala, AUtburdiID),
	FOREIGN KEY (Kennitala) REFERENCES VEIDIMENN,
	FOREIGN KEY (AUtburdurID) REFERENCES AUTBURDI (Id)
)

-------------------------
