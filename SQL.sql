-- Test_SQL_1
SELECT DISTINCT num
FROM (
    SELECT
        num, id, ROW_NUMBER() OVER (ORDER BY id) - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS identifier
    FROM
        input_table
) consecutive_counts
GROUP BY num, identifier
HAVING COUNT(*) >= 3
ORDER BY num;

-- Test_SQL_2
SELECT DISTINCT email
FROM email_list
GROUP BY email
HAVING COUNT(*) > 1;
