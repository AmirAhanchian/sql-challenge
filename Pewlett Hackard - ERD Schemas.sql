-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employee info" (
    "emp_no" integer   NOT NULL,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" varchar(5)   NOT NULL,
    "hire_date" Date   NOT NULL,
    CONSTRAINT "pk_Employee info" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Job Titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(25)   NOT NULL,
    CONSTRAINT "pk_Job Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Dept"." Manager" (
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" integer   NOT NULL,
    CONSTRAINT "pk_ Manager" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept"." Employees" (
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" integer   NOT NULL,
    CONSTRAINT "pk_ Employees" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

ALTER TABLE "Employee info" ADD CONSTRAINT "fk_Employee info_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Job Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee info" ("emp_no");

ALTER TABLE "Dept"." Manager" ADD CONSTRAINT "fk_ Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept"." Manager" ADD CONSTRAINT "fk_ Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee info" ("emp_no");

ALTER TABLE "Dept"." Employees" ADD CONSTRAINT "fk_ Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept"." Employees" ADD CONSTRAINT "fk_ Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee info" ("emp_no");

