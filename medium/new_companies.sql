-- new companies

SELECT c.company_code, c.founder, COUNT(DISTINCT lm.lead_manager_code), COUNT(DISTINCT sm.senior_manager_code), COUNT(DISTINCT m.manager_code), COUNT(DISTINCT e.employee_code)
FROM Company c
JOIN Lead_Manager lm ON lm.company_code = c.company_code
JOIN Senior_Manager sm ON c.company_code = sm.company_code AND sm.lead_manager_code = lm.lead_manager_code
JOIN Manager m ON c.company_code = m.company_code AND sm.senior_manager_code = m.senior_manager_code AND m.lead_manager_code = sm.lead_manager_code
JOIN Employee e ON e.company_code = c.company_code AND e.manager_code = m.manager_code AND e.senior_manager_code = m.senior_manager_code AND e.lead_manager_code = m.lead_manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code

-- alternative 1
SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code),
    COUNT(DISTINCT sm.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM Company c
LEFT JOIN Lead_Manager lm
    ON lm.company_code = c.company_code
LEFT JOIN Senior_Manager sm
    ON sm.company_code = c.company_code
LEFT JOIN Manager m
    ON m.company_code = c.company_code
LEFT JOIN Employee e
    ON e.company_code = c.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;

-- alternative 2

SELECT
    c.company_code,
    c.founder,
    lm.total_lm,
    sm.total_sm,
    m.total_m,
    e.total_e
FROM Company c
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT lead_manager_code) AS total_lm
    FROM Lead_Manager
    GROUP BY company_code
) lm ON lm.company_code = c.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT senior_manager_code) AS total_sm
    FROM Senior_Manager
    GROUP BY company_code
) sm ON sm.company_code = c.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT manager_code) AS total_m
    FROM Manager
    GROUP BY company_code
) m ON m.company_code = c.company_code
LEFT JOIN (
    SELECT company_code, COUNT(DISTINCT employee_code) AS total_e
    FROM Employee
    GROUP BY company_code
) e ON e.company_code = c.company_code
ORDER BY c.company_code;
