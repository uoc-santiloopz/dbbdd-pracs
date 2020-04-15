CREATE TABLE Office (
    code INTEGER CONSTRAINT PK_Office PRIMARY KEY
    	CONSTRAINT CH_OfficeCode CHECK (code > 0),
    name VARCHAR2(22 CHAR)
        CONSTRAINT NN_OfficeName NOT NULL,
    address VARCHAR2(100 CHAR)
        CONSTRAINT NN_OfficeAddress NOT NULL
);

CREATE TABLE Client (
	NIF CHAR(10) CONSTRAINT PK_Client PRIMARY KEY,
	birthDate Date
		CONSTRAINT NN_ClientBirthDate NOT NULL,
	name VARCHAR2(33 CHAR)
		CONSTRAINT NN_ClientName NOT NULL,
	surname VARCHAR2(80 CHAR)
		CONSTRAINT NN_ClientSurnames NOT NULL,
	address VARCHAR2(100 CHAR)
		CONSTRAINT NN_ClientAddress NOT NULL,
	phone VARCHAR2(12 CHAR)
		CONSTRAINT NN_ClientPhone NOT NULL,
	eMail VARCHAR2(80 CHAR)
);

CREATE TABLE Account (
	officeCode INTEGER,
    "number" INTEGER,
    "type" VARCHAR2(9 CHAR)
    	CONSTRAINT CONST_Account_size CHECK ("type" IN ('Basic', 'Savings', 'Brokerage'))
        CONSTRAINT NN_AccountType NOT NULL,
    balance FLOAT
        CONSTRAINT NN_AccountBalance NOT NULL,
    	CONSTRAINT PK_Account PRIMARY KEY (officeCode, "number"),
    	CONSTRAINT FK_OfficeCode FOREIGN KEY (officeCode) REFERENCES Office(code)
);

CREATE TABLE Has (
	NIF CHAR(10),
	accountNumber INTEGER,
    accountOfficeCode INTEGER,
	CONSTRAINT PK_Has PRIMARY KEY (NIF, accountOfficeCode, accountNumber),
	CONSTRAINT FK_ClientHas FOREIGN KEY (NIF) REFERENCES Client(NIF),
	CONSTRAINT FK_AccountHas FOREIGN KEY (accountOfficeCode, accountNumber) REFERENCES Account(officeCode, "number")
);
