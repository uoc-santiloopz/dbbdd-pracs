CREATE TABLE Has (
	NIF CHAR(10),
	accountNumber INTEGER,
    accountOfficeCode INTEGER,
	CONSTRAINT PK_Has PRIMARY KEY (NIF, accountOfficeCode, accountNumber),
	CONSTRAINT FK_ClientHas FOREIGN KEY (NIF) REFERENCES Client(NIF),
	CONSTRAINT FK_AccountHas FOREIGN KEY (accountOfficeCode, accountNumber) REFERENCES Account(officeCode, "number")
);
