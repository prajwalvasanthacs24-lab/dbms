  DROP DATABASE dhiksha_bank;
 CREATE DATABASE dhiksha_bank;
USE dhiksha_bank;

CREATE TABLE branch (
  Branch_name VARCHAR(30) PRIMARY KEY,
  Branch_city VARCHAR(25),
  assets INT
);

CREATE TABLE BankAccount (
  Accno INT PRIMARY KEY,
  Branch_name VARCHAR(30),
  Balance INT,
  FOREIGN KEY (Branch_name) REFERENCES branch(Branch_name)
);

CREATE TABLE BankCustomer (
  Customername VARCHAR(20) PRIMARY KEY,
  Customer_street VARCHAR(30),
  CustomerCity VARCHAR(35)
);

CREATE TABLE Depositer (
  Customername VARCHAR(20),
  Accno INT,
  PRIMARY KEY (Customername, Accno),
  FOREIGN KEY (Accno) REFERENCES BankAccount(Accno),
  FOREIGN KEY (Customername) REFERENCES BankCustomer(Customername)
);



CREATE TABLE Loan (
  Loan_number INT PRIMARY KEY,
  Branch_name VARCHAR(30),
  Amount INT,
  FOREIGN KEY (Branch_name) REFERENCES branch(Branch_name)
);

INSERT INTO branch VALUES ('SBI_Chamrajpet', 'Bangalore', 50000);
INSERT INTO branch VALUES ('SBI_ResidencyRoad', 'Bangalore', 10000);
INSERT INTO branch VALUES ('SBI_ShivajiRoad', 'Bombay', 20000);
INSERT INTO branch VALUES ('SBI_ParlimentRoad', 'Delhi', 10000);
INSERT INTO branch VALUES ('SBI_Jantarmantar', 'Delhi', 20000);

INSERT INTO BankAccount VALUES (1, 'SBI_Chamrajpet', 2000);
INSERT INTO BankAccount VALUES (2, 'SBI_ResidencyRoad', 5000);
INSERT INTO BankAccount VALUES (3, 'SBI_ShivajiRoad', 6000);
INSERT INTO BankAccount VALUES (4, 'SBI_ParlimentRoad', 9000);
INSERT INTO BankAccount VALUES (5, 'SBI_Jantarmantar', 8000);
INSERT INTO BankAccount VALUES (6, 'SBI_ShivajiRoad', 4000);
INSERT INTO BankAccount VALUES (8, 'SBI_ResidencyRoad', 4000);
INSERT INTO BankAccount VALUES (9, 'SBI_ParlimentRoad', 3000);
INSERT INTO BankAccount VALUES (10, 'SBI_ResidencyRoad', 5000);
INSERT INTO BankAccount VALUES (11, 'SBI_Jantarmantar', 2000);

INSERT INTO BankCustomer VALUES ('Avinash', 'Bull_Temple_Road', 'Bangalore');
INSERT INTO BankCustomer VALUES ('Dinesh', 'Bannergatta_Road', 'Bangalore');
INSERT INTO BankCustomer VALUES ('Mohan', 'NationalCollege_Road', 'Bangalore');
INSERT INTO BankCustomer VALUES ('Nikil', 'Akbar_Road', 'Delhi');
INSERT INTO BankCustomer VALUES ('Ravi', 'Prithviraj_Road', 'Delhi');

INSERT INTO Depositer VALUES ('Avinash', 1);
INSERT INTO Depositer VALUES ('Dinesh', 2);
INSERT INTO Depositer VALUES ('Nikil', 4);
INSERT INTO Depositer VALUES ('Ravi', 5);
INSERT INTO Depositer VALUES ('Avinash', 8);
INSERT INTO Depositer VALUES ('Nikil', 9);
INSERT INTO Depositer VALUES ('Dinesh', 10);
INSERT INTO Depositer VALUES ('Nikil', 11);

INSERT INTO Loan VALUES (1, 'SBI_Chamrajpet', 1000);
INSERT INTO Loan VALUES (2, 'SBI_ResidencyRoad', 2000);
INSERT INTO Loan VALUES (3, 'SBI_ShivajiRoad', 3000);
INSERT INTO Loan VALUES (4, 'SBI_ParlimentRoad', 4000);
INSERT INTO Loan VALUES (5, 'SBI_Jantarmantar', 5000);

SELECT * FROM branch;
SELECT * FROM BankAccount;
SELECT * FROM BankCustomer;
SELECT * FROM Depositer;
SELECT * FROM Loan;

SELECT Branch_name, CONCAT(assets / 100000, ' lakhs') AS assets_in_lakhs FROM branch;
SELECT d.Customername 
FROM Depositer d
JOIN BankAccount b ON d.Accno = b.Accno
WHERE b.Branch_name = 'SBI_ResidencyRoad'
GROUP BY d.Customername
HAVING COUNT(d.Accno) >= 2;
create view sum_of_loan
as select Branch_name, SUM(Balance)
from BankAccount
group by Branch_name;
select * from sum_of_loan;
select bc.Customername, CONCAT(Balance+1000," rupees")
UPDATED_BALANCE from BankAccount b, BankCustomer bc, Depositer d
where bc.Customername=d.Customername and b.Accno=d.Accno and
bc.Customercity="Bangalore";
 
