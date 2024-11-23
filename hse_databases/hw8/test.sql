-- 1b. Test NEW_JOB procedure
CALL NEW_JOB('SY_ANAL', 'System Analyst', 6000);
SELECT * FROM jobs WHERE job_id = 'SY_ANAL';

-- 2b. Test ADD_JOB_HIST procedure
CALL ADD_JOB_HIST(106, 'SY_ANAL');

-- 3b. Test UPD_JOBSAL procedure (should fail)
CALL UPD_JOBSAL('SY_ANAL', 7000, 140);

-- 3d. Test UPD_JOBSAL procedure (should succeed)
CALL UPD_JOBSAL('SY_ANAL', 7000, 14000);

SELECT * FROM jobs WHERE job_id = 'SY_ANAL';