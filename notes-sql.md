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
