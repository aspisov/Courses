-- 1. Create NEW_JOB procedure
CREATE OR REPLACE PROCEDURE NEW_JOB(
    p_job_id VARCHAR(10),
    p_job_title VARCHAR(35),
    p_min_salary INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
    VALUES (p_job_id, p_job_title, p_min_salary, p_min_salary * 2);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error occurred: %', SQLERRM;
        ROLLBACK;
END;
$$;

-- 2. Create Stored Procedure.
CREATE OR REPLACE PROCEDURE ADD_JOB_HIST(
    p_emp_id INTEGER,
    p_new_job_id VARCHAR(10)
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_hire_date DATE;
BEGIN
    -- Check if employee exists
    IF NOT EXISTS (SELECT 1 FROM employees WHERE employee_id = p_emp_id) THEN
        RAISE EXCEPTION 'Employee ID % does not exist', p_emp_id;
    END IF;

    -- Get current hire date
    SELECT hire_date INTO v_hire_date
    FROM employees
    WHERE employee_id = p_emp_id;

    -- Insert into job history
    INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
    SELECT
        employee_id,
        hire_date,
        CURRENT_DATE,
        job_id,
        department_id
    FROM employees
    WHERE employee_id = p_emp_id;

    -- Update employee record
    UPDATE employees
    SET hire_date = CURRENT_DATE,
        job_id = p_new_job_id,
        salary = (SELECT min_salary + 500 FROM jobs WHERE job_id = p_new_job_id)
    WHERE employee_id = p_emp_id;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error occurred: %', SQLERRM;
        ROLLBACK;
END;
$$;

-- 3. Create Stored Procedure.
CREATE OR REPLACE PROCEDURE UPD_JOBSAL(
    p_job_id VARCHAR(10),
    p_min_salary NUMERIC,
    p_max_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if job exists
    IF NOT EXISTS (SELECT 1 FROM jobs WHERE job_id = p_job_id) THEN
        RAISE EXCEPTION 'Job ID % does not exist', p_job_id;
    END IF;

    -- Check if max salary is less than min salary
    IF p_max_salary < p_min_salary THEN
        RAISE EXCEPTION 'Maximum salary cannot be less than minimum salary';
    END IF;

    UPDATE jobs
    SET min_salary = p_min_salary,
        max_salary = p_max_salary
    WHERE job_id = p_job_id;

    COMMIT;
EXCEPTION
    WHEN lock_not_available THEN
        RAISE NOTICE 'The job record is currently locked. Please try again later.';
        ROLLBACK;
    WHEN OTHERS THEN
        RAISE NOTICE 'Error occurred: %', SQLERRM;
        ROLLBACK;
END;
$$;