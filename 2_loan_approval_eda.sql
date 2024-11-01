-- Use loan_approval_pred database --
USE loan_approval_pred;

-- Check the database
SELECT * FROM data_train LIMIT 10;

-- Check for any NULL value in the column --
SELECT *
FROM data_train
WHERE 
    id IS NULL OR
    person_age IS NULL OR
    person_income IS NULL OR
    person_home_ownership IS NULL OR
    person_emp_length IS NULL OR
    loan_intent IS NULL OR
    loan_grade IS NULL OR
    loan_amnt IS NULL OR
    loan_int_rate IS NULL OR
    loan_percent_income IS NULL OR
    cb_person_default_on_file IS NULL OR
    cb_person_cred_hist_length IS NULL OR
    loan_status IS NULL;

# no null value shown

-- Check any duplicate id --
SELECT id, COUNT(id) FROM data_train
GROUP BY id HAVING COUNT(id) > 1;

# no duplicate id

-- Check any loan status not equal to 0 or 1 --
SELECT id, loan_status FROM data_train
WHERE loan_status <> 0 AND loan_status <> 1;

# No loan status not equal to 0 or 1
