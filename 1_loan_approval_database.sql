-- Use database loan_approval_pred --
USE loan_approval_pred;

-- Show the first 10 rows to understand the data--
SELECT * from train LIMIT 10;

-- create a new table for data train --
DROP TABLE IF EXISTS data_train;
CREATE TABLE data_train (
	id INT NOT NULL,
    person_age INT,
    person_income INT,
    person_home_ownership TEXT,
    person_emp_length INT,
    loan_intent TEXT,
    loan_grade CHAR(1),
    loan_amnt INT,
    loan_int_rate DOUBLE,
    loan_percent_income DOUBLE,
    cb_person_default_on_file CHAR(1),
    cb_person_cred_hist_length INT,
    loan_status INT NOT NULL
);

INSERT INTO data_train (id, person_age, person_income, person_home_ownership, person_emp_length, loan_intent, loan_grade, loan_amnt, loan_int_rate, loan_percent_income, cb_person_default_on_file, cb_person_cred_hist_length, loan_status) 
SELECT id, person_age, person_income, person_home_ownership, person_emp_length, loan_intent, loan_grade, loan_amnt, loan_int_rate, loan_percent_income, cb_person_default_on_file, cb_person_cred_hist_length, loan_status
FROM train;

SELECT * FROM data_train;

# With new table 'data_train', we can ensure:
# 1. no NULL value in id
# 2. loan_grade only contain 1 CHARACTER as alphabets are used for grading system
# 3. cb_person_default_on_file only contain 1 CHARACTER as Y = Yes, N = No
# 4. no Null value in loan_status as we need the status for training

-- Check any mismatches between TABLE data_train and train --
SELECT
	tr.id AS mismatch_id
FROM
	train tr
JOIN
	data_train dt ON tr.id = dt.id
WHERE
	tr.person_age != dt.person_age
	OR tr.person_income != dt.person_income
    OR tr.person_home_ownership != dt.person_home_ownership
    OR tr.person_emp_length != dt.person_emp_length
    OR tr.loan_intent != dt.loan_intent
    OR tr.loan_grade != dt.loan_grade
    OR tr.loan_amnt != dt.loan_amnt
    OR tr.loan_int_rate != dt.loan_int_rate
    OR tr.loan_percent_income != dt.loan_percent_income
    OR tr.cb_person_default_on_file != dt.cb_person_default_on_file
    OR tr.cb_person_cred_hist_length != dt.cb_person_cred_hist_length
    OR tr.loan_status != dt.loan_status;

# No mismatch item is found

