-- dropping tables incase of previous generation of the same table, mostly used druing coding to avoid errors
DROP Table if exists "Job Titles" CASCADE;
DROP Table if exists "Employee info" CASCADE;
DROP Table if exists "Salaries" ;
DROP Table if exists "Departments" CASCADE; 
DROP Table if exists "Dept_Manager";
DROP Table if exists "Dept_Employees";

-- creating all tables required for pgadmin to be able to import the CSV files into
CREATE TABLE "Job Titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(25)   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE "Employee info" (
    "emp_no" int NOT NULL,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" varchar(5)   NOT NULL,
    "hire_date" Date   NOT NULL,
    PRIMARY KEY ("emp_no"),
	FOREIGN KEY("emp_title_id") REFERENCES "Job Titles"("title_id")
);

CREATE TABLE "Salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
    FOREIGN KEY("emp_no") REFERENCES "Employee info" ("emp_no")
);

CREATE TABLE "Departments" (
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(25)   NOT NULL,
    PRIMARY KEY ("dept_no")
);

CREATE TABLE "Dept_Manager" (
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" integer   NOT NULL,
	FOREIGN KEY("dept_no") REFERENCES "Departments" ("dept_no"),
	FOREIGN KEY("emp_no")REFERENCES "Employee info" ("emp_no")
);

CREATE TABLE "Dept_Employees" (
    "emp_no" integer   NOT NULL,
	"dept_no" varchar(10)   NOT NULL,
    FOREIGN KEY("dept_no") REFERENCES "Departments" ("dept_no"),
	FOREIGN KEY("emp_no")REFERENCES "Employee info" ("emp_no")
);

