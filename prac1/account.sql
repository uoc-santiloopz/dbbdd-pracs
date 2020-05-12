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