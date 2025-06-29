CREATE TABLE SavingsAccounts (
    AccountID    NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    Balance      NUMBER(12,2)
);



INSERT INTO SavingsAccounts VALUES (1, 'Ravi Kumar', 12000);
INSERT INTO SavingsAccounts VALUES (2, 'Anita Shah', 9500);
INSERT INTO SavingsAccounts VALUES (3, 'Mohit Verma', 15000);
INSERT INTO SavingsAccounts VALUES (4, 'Sunita Rani', 8000);
INSERT INTO SavingsAccounts VALUES (5, 'Rakesh Babu', 11000);
INSERT INTO SavingsAccounts VALUES (6, 'Neha Singh', 7200);
INSERT INTO SavingsAccounts VALUES (7, 'Amit Joshi', 10500);
INSERT INTO SavingsAccounts VALUES (8, 'Deepika Rao', 9100);
INSERT INTO SavingsAccounts VALUES (9, 'Kiran Kumar', 12300);
INSERT INTO SavingsAccounts VALUES (10, 'Priya Mehta', 3000);
INSERT INTO SavingsAccounts VALUES (11, 'Vinod Reddy', 1500);
INSERT INTO SavingsAccounts VALUES (12, 'Rekha Das', 11500);
INSERT INTO SavingsAccounts VALUES (13, 'Arun Nair', 10200);
INSERT INTO SavingsAccounts VALUES (14, 'Meena Jain', 5000);
INSERT INTO SavingsAccounts VALUES (15, 'Vikas Sharma', 12500);
INSERT INTO SavingsAccounts VALUES (16, 'Sneha Gupta', 11000);
INSERT INTO SavingsAccounts VALUES (17, 'Rajeev Menon', 9700);
INSERT INTO SavingsAccounts VALUES (18, 'Komal Batra', 11200);
INSERT INTO SavingsAccounts VALUES (19, 'Sudhir Malhotra', 13500);
INSERT INTO SavingsAccounts VALUES (20, 'Anjali Mishra', 8900);

COMMIT;


SELECT * FROM SavingsAccounts;


CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  FOR rec IN (SELECT CustomerID, Balance FROM CustomerLoans) LOOP
    UPDATE CustomerLoans
    SET Balance = Balance + (rec.Balance * 0.01)
    WHERE CustomerID = rec.CustomerID;
  END LOOP;

  COMMIT;
END;
/


BEGIN
  ProcessMonthlyInterest;
END;
/

SELECT CustomerID, FullName, Balance FROM CustomerLoans ORDER BY CustomerID;




CREATE TABLE Employees (
    EmpID       NUMBER PRIMARY KEY,
    EmpName     VARCHAR2(100),
    Department  VARCHAR2(50),
    Salary      NUMBER(10,2)
);


INSERT INTO Employees VALUES (101, 'Suresh Rao', 'IT', 50000);
INSERT INTO Employees VALUES (102, 'Meena Iyer', 'HR', 42000);
INSERT INTO Employees VALUES (103, 'Vikram Nath', 'IT', 55000);
INSERT INTO Employees VALUES (104, 'Alka Gupta', 'Finance', 48000);
INSERT INTO Employees VALUES (105, 'Rajesh Sharma', 'HR', 41000);
INSERT INTO Employees VALUES (106, 'Deepak Joshi', 'Marketing', 47000);
INSERT INTO Employees VALUES (107, 'Sneha Patil', 'IT', 53000);
INSERT INTO Employees VALUES (108, 'Rahul Nair', 'Finance', 49500);
INSERT INTO Employees VALUES (109, 'Kavita Singh', 'HR', 43000);
INSERT INTO Employees VALUES (110, 'Anil Reddy', 'Marketing', 52000);
INSERT INTO Employees VALUES (111, 'Pooja Bansal', 'IT', 56000);
INSERT INTO Employees VALUES (112, 'Ramesh Verma', 'HR', 39000);
INSERT INTO Employees VALUES (113, 'Komal Thakur', 'Finance', 51000);
INSERT INTO Employees VALUES (114, 'Kiran Das', 'Marketing', 46000);
INSERT INTO Employees VALUES (115, 'Neha Sharma', 'IT', 60000);
INSERT INTO Employees VALUES (116, 'Varun Kapoor', 'Finance', 45000);
INSERT INTO Employees VALUES (117, 'Divya Mehta', 'HR', 40000);
INSERT INTO Employees VALUES (118, 'Amit Shah', 'IT', 62000);
INSERT INTO Employees VALUES (119, 'Ananya Rao', 'Marketing', 44000);
INSERT INTO Employees VALUES (120, 'Gaurav Jain', 'Finance', 47000);

COMMIT;

SELECT * FROM EMPLOYEES;



CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
  deptName IN VARCHAR2,
  bonusPercent IN NUMBER
) IS
BEGIN
  UPDATE Employees
  SET Salary = Salary + (Salary * bonusPercent / 100)
  WHERE Department = deptName;

  COMMIT;
END;
/


BEGIN
  UpdateEmployeeBonus('HR', 10);
END;
/

SELECT * FROM Employees;


CREATE TABLE BankAccounts (
    AccountID   NUMBER PRIMARY KEY,
    AccountHolder VARCHAR2(100),
    Balance     NUMBER(12,2)
);

INSERT INTO BankAccounts VALUES (201, 'Manoj Krishna', 10000);
INSERT INTO BankAccounts VALUES (202, 'Anita Shah', 5000);
INSERT INTO BankAccounts VALUES (203, 'Mohit Verma', 3000);
INSERT INTO BankAccounts VALUES (204, 'Sunita Rani', 7000);
INSERT INTO BankAccounts VALUES (205, 'Rakesh Babu', 9500);
INSERT INTO BankAccounts VALUES (206, 'Neha Singh', 4000);
INSERT INTO BankAccounts VALUES (207, 'Amit Joshi', 11000);
INSERT INTO BankAccounts VALUES (208, 'Deepika Rao', 8800);
INSERT INTO BankAccounts VALUES (209, 'Kiran Kumar', 12300);
INSERT INTO BankAccounts VALUES (210, 'Priya Mehta', 3000);
INSERT INTO BankAccounts VALUES (211, 'Vinod Reddy', 2500);
INSERT INTO BankAccounts VALUES (212, 'Rekha Das', 10000);
INSERT INTO BankAccounts VALUES (213, 'Arun Nair', 15000);
INSERT INTO BankAccounts VALUES (214, 'Meena Jain', 7500);
INSERT INTO BankAccounts VALUES (215, 'Vikas Sharma', 6400);
INSERT INTO BankAccounts VALUES (216, 'Sneha Gupta', 9900);
INSERT INTO BankAccounts VALUES (217, 'Rajeev Menon', 4000);
INSERT INTO BankAccounts VALUES (218, 'Komal Batra', 11500);
INSERT INTO BankAccounts VALUES (219, 'Sudhir Malhotra', 13500);
INSERT INTO BankAccounts VALUES (220, 'Anjali Mishra', 8900);

COMMIT;

SELECT * FROM BANKACCOUNTS;

CREATE OR REPLACE PROCEDURE TransferFunds(
  fromAccountID IN NUMBER,
  toAccountID   IN NUMBER,
  amount        IN NUMBER
) IS
  insufficient_balance EXCEPTION;
  fromBalance NUMBER;
BEGIN
  SELECT Balance INTO fromBalance FROM BankAccounts WHERE AccountID = fromAccountID;

  IF fromBalance < amount THEN
    RAISE insufficient_balance;
  END IF;

  UPDATE BankAccounts
  SET Balance = Balance - amount
  WHERE AccountID = fromAccountID;

  UPDATE BankAccounts
  SET Balance = Balance + amount
  WHERE AccountID = toAccountID;

  COMMIT;
EXCEPTION
  WHEN insufficient_balance THEN
    DBMS_OUTPUT.PUT_LINE('Transfer failed: Insufficient balance.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


BEGIN
  TransferFunds(201, 202, 2000); -- ₹2000 from Manoj to Anita
END;
/

SELECT * FROM BankAccounts;



