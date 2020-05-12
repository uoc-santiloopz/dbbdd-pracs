CREATE TABLE Office (
    code INTEGER CONSTRAINT PK_Office PRIMARY KEY
    	CONSTRAINT CH_OfficeCode CHECK (code > 0),
    name VARCHAR2(22 CHAR)
        CONSTRAINT NN_OfficeName NOT NULL,
    address VARCHAR2(100 CHAR)
        CONSTRAINT NN_OfficeAddress NOT NULL
);