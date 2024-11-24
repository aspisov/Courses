-- 1b. Test NEW_JOB procedure
CALL NEW_JOB('SY_ANAL', 'System Analyst', 6000);
SELECT * FROM jobs WHERE job_id = 'SY_ANAL';

-- 2b. Test ADD_JOB_HIST procedure
CALL ADD_JOB_HIST(106, 'SY_ANAL');

-- 3b. Test UPD_JOBSAL procedure (should fail)
CALL UPD_JOBSAL('SY_ANAL', 7000, 140);

-- 3d. Test UPD_JOBSAL procedure (should succeed)
CALL UPD_JOBSAL('SY_ANAL', 7000, 14000);


-- 4b. Test GET_YEARS_SERVICE function
SELECT GET_YEARS_SERVICE(999);
SELECT GET_YEARS_SERVICE(106);

-- 5b. Test GET_JOB_COUNT function
SELECT GET_JOB_COUNT(176);

-- 6b. Test CHECK_SAL_RANGE trigger
-- First check current values
SELECT job_id, min_salary, max_salary FROM jobs WHERE job_id = 'SY_ANAL';
SELECT employee_id, last_name, salary FROM employees WHERE job_id = 'SY_ANAL';

-- Try to update salary range (should fail due to trigger)
UPDATE jobs SET min_salary = 5000, max_salary = 7000 WHERE job_id = 'SY_ANAL';

-- Try to update salary range (should succeed)
UPDATE jobs SET min_salary = 7000, max_salary = 18000 WHERE job_id = 'SY_ANAL';