-- Test_SQL_1
WITH consecutive_counts AS (
    SELECT
        num, id, ROW_NUMBER() OVER (ORDER BY id) - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS identifier
    FROM
        input_table
)

SELECT DISTINCT num
FROM consecutive_counts
GROUP BY num, identifier
HAVING COUNT(*) >= 3
ORDER BY num;
