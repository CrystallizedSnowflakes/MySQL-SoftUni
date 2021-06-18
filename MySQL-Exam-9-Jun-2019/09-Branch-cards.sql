# Extract from the database, all branches with the count of their issued cards. 
# Order the results by the count of cards, then by branch name.

SELECT 
    b.name, 
    COUNT(ca.id) AS count_of_cards
FROM
    branches AS b
        LEFT JOIN
    employees AS e 
    ON b.id = e.branch_id
        LEFT JOIN
    employees_clients AS ec 
    ON e.id = ec.employee_id
        LEFT JOIN
    clients AS cl 
    ON cl.id = ec.client_id
        LEFT JOIN
    bank_accounts AS ba 
    ON cl.id = ba.client_id
        LEFT JOIN
    cards AS ca 
    ON ba.id = ca.bank_account_id
GROUP BY b.id
ORDER BY count_of_cards DESC , b.name;