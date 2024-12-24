
set names gbk;

create database db_test;

user db_test;

create table employees if not exists (
    employee_id int(11),
    employee_name varchar(50) not null,
    employee_sex varchar(10),
    employee_mgr int(11),
    employee_salary float,
    department_id int(11),
    foreign key(department_id),
    primary key(employee_id)
);

create table department if not exists(
    department_id int(11) primary key,
    department_name char(11)
);

insert into employees (employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('David Tian','男',10,72000,1);

insert into department (department_name) values ('组织部');

-- 将结束符改为$$
-- delimiter$$;





