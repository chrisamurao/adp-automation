BEGIN TRANSACTION;

-- Updates for Manual Process During ADP Production Run

INSERT INTO adp_batch_statuses
(adp_batch_id, adp_batch_status_type_id, adp_batch_status_details, status_date)
VALUES
(Hello, 12, 'Manually Inserted Status - Zipped on Jose Local', '2019-MM-DD _zip_start_time_'),
(Hello, 13, 'Manually Inserted Status - Zipped on Jose Local', '2019-MM-DD _zip_finish_time_'),
(Hello, 15, 'Manually Inserted Status - sFTP from Jose Local', '2019-MM-DD _sftp_start_time_'),
(Hello, 16, 'Manually Inserted Status - sFTP from Jose Local', '2019-MM-DD _sftp_finish_time_');

-- BATCH STATUSES
-- 12 - Zip Initiated
-- 13 - Zip Completed
-- 15 - SFTP Initiated
-- 16 - SFTP Completed

INSERT INTO check_statuses
(check_id, check_status_type_id, check_status_details, status_date)
SELECT
ch.check_id,
5,
'Manually Inserted Status - Sent to ADP manually using Jose Local',
'2019-MM-DD _sftp_finish_time_'
FROM checks ch
JOIN check_statuses cs ON cs.check_status_id = (SELECT * FROM adp_get_check_status_id(ch.check_id))
JOIN adp_check_status_types acst ON cs.check_status_type_id = acst.check_status_type_id
WHERE ch.adp_batch_id = Hello AND
acst.code IN ('FIX_FORMAT_SUCCESS');

-- CHECK STATUSES
-- 5 - In Process at ADP

--COMMIT
--ROLLBACK

-- Sample Date: 2017-03-10 10:30:16

-- Batch ID:
-- Zip Start Date:
-- Zip Finish Date:
-- SFTP Start Date:
-- SFTP Finish Date:
