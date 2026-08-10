-- ON DELETE SET NULL
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);
-- what am saying here is if mgr_id in the emp_id get deleted am going to set the mgr_id = NULL

-- example, 
DELETE FROM employee
WHERE emp_id = 102;

SELECT * FROM branch;
SELECT * FROM employee;



-- ON DELETE CASCADE
CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- once the branch_id get delete, the entire role delete
-- example,
DELETE FROM branch
WHERE branch_id = 2;

SELECT * FROM branch_supplier;