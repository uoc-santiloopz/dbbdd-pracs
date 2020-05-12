# SQL Notes

### Table creation syntax
```
CREATE TABLE table_name
	( column_definition )
	<unique_constraint>
	<referential_constraint>
	<check_constraint>
	<extent_specs>
TABLESPACE table_space_name
```

### Oracle table creation example
```
	CREATE TABLE Employees (
	employeeId NUMBER(6) PRIMARY KEY,
	firstName VARCHAR2(20),
	lastName VARCHAR2(25),
	email VARCHAR2(25) NOT NULL,
	phoneNumber VARCHAR2(20),
	salary NUMBER(8,2) NOT NULL,
	commissionPct NUMBER(2,2),
	departmentId NUMBER(4),
	CONSTRAINT empSalaryMinDemo CHECK (salary > 0),
	CONSTRAINT empEmailUKDemo UNIQUE (email)
) TABLESPACE users_data;
```

### Oracle index creation example

```
CREATE [UNIQUE] INDEX index_name
ON table_name ( column [ ASC | DESC ] [ ,..n ])
[ CLUSTER cluster_name ]
[ < extent_specs > ]
[ TABLESPACE table_space_name ]
[ ...... ]
< extent_specs > ::=
[ PCTFREE nn ]
[ PCTUSED nn ]
[ INITRANSnn ]
[ MAXTRANSnn ]
[ STORAGE < storage_clause > ]

< storage_clause > ::=
INITIAL nn
[ NEXT nn ]
[ MINEXTENTS nn ]
[ MAXEXTENTS nn ]
[ PCTINCREASE nn ]
[ OPTIMAL nn ]
```

### Index creation example
```
CREATE INDEX indexDepName
ON Employees (departmentId) TABLESPACE users_ind;
```

### Restrictions

#### Check
```
CREATE TABLE Employees (
name VARCHAR2 (30),
salary NUMBER CHECK (salary> 0)
) TABLESPACE data_employees;
```

#### Not Null
```
CREATE TABLE Employees (
name VARCHAR2 (30) NOT NULL,
salary NUMBER
) TABLESPACE data_employees;
```

#### Unique
```
cas d’Espanya), que ha de ser únic per a cada persona.
CREATE TABLE Employees (
id VARCHAR2 (9) UNIQUE,
name VARCHAR2 (30) NOT NULL,
salary NUMBER
) TABLESPACE data_employees;
```

#### Foreign key
```
CREATE TABLE Department
( id NUMBER PRIMARY KEY
name VARCHAR2 (50)
) TABLESPACE data_departments;
CREATE TABLE Employees
( id VARCHAR2 (9) UNIQUE,
name VARCHAR2 (30) NOT NULL,
salary NUMBER,
departId NUMBER,
CONSTRAINT fkDep FOREIGN KEY (departId) REFERENCES Department (id)
) TABLESPACE data_employees;
```

### Virtual Space creation
In Oracle is named `tablespace`
```
CREATE TABLESPACE table_space_name
DATAFILE < filespec > [ ,...n ]
DEFAULT STORAGE < storage_clause >
< filespec > ::=
'file_name'
[ SIZE nn ]
< storage_clause > ::=
INITIAL nn
[ NEXT nn ]
[ MINEXTENTS nn ]
[ MAXEXTENTS nn ]
[ PCTINCREASE nn ]
[ OPTIMAL nn ]
[ ..... ]
```

### Create Database
```
CREATE DATABASE database_name
[ CONTROLFILE REUSE ]
[ LOGFILE < filespec > [ ,...n ] ]
[ MAXLOGFILES nn ]
[ MAXLOGMEMBERS nn ]
[ MAXLOGHISTORY nn ]
[ DATAFILE < filespec > [ ,...n ] ]
[ MAXDATAFILES nn ]
[ MAXINSTANCES nn ]
[ CHARACTER SET charset ]
```