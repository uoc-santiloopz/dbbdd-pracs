CREATE TABLE Account (
    "number" INTEGER CONSTRAINT PK_Account PRIMARY KEY,
    type VARCHAR2(9 CHAR) CONSTRAINT CONST_Account_size CHECK (size IN ("Basic", "Savings", "Brokerage"))
        CONSTRAINT NN_AccountType NOT NULL,
    balance FLOAT
        CONSTRAINT NN_AccountBalance NOT NULL
);