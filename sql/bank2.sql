USE dhiksha_bank;

SELECT d.Customername
FROM Depositer d
JOIN BankAccount b ON d.Accno = b.Accno
JOIN branch br ON b.Branch_name = br.Branch_name
WHERE br.Branch_city = 'Delhi'
GROUP BY d.Customername
HAVING COUNT(DISTINCT br.Branch_name) = (
    SELECT COUNT(*)
    FROM branch
    WHERE Branch_city = 'Delhi'
);

DELETE d
FROM Depositer d
JOIN BankAccount b ON d.Accno = b.Accno
JOIN branch br ON b.Branch_name = br.Branch_name
WHERE br.Branch_city = 'Bombay';
DELETE b
FROM BankAccount b
JOIN branch br ON b.Branch_name = br.Branch_name
WHERE br.Branch_city = 'Bombay';
SELECT * FROM LOAN ORDER BY AMOUNT DESC;

CREATE VIEW BRANCH_TOTAL_LOAN (BRANCH_NAME, TOTAL_LOAN) AS SELECT
BRANCH_NAME, SUM(AMOUNT) FROM LOAN GROUP BY BRANCH_NAME;
UPDATE ACCOUNT SET BALANCE=BALANCE *1.05;
