
CREATE TABLE CustomerLoans (
    CustomerID      NUMBER PRIMARY KEY,
    FullName        VARCHAR2(100),
    DateOfBirth     DATE,
    Balance         NUMBER(12,2),
    IsVIP           CHAR(1) DEFAULT 'N',
    InterestRate    NUMBER(5,2),
    LoanDueDate     DATE
);

INSERT INTO CustomerLoans VALUES (1, 'Ravi Kumar', DATE '1950-04-23', 12000, 'N', 8.5, SYSDATE + 15);
INSERT INTO CustomerLoans VALUES (2, 'Anita Shah', DATE '1985-12-10', 9500, 'N', 9.0, SYSDATE + 40);
INSERT INTO CustomerLoans VALUES (3, 'Mohit Verma', DATE '1960-05-15', 15000, 'N', 8.2, SYSDATE + 10);
INSERT INTO CustomerLoans VALUES (4, 'Sunita Rani', DATE '1995-07-20', 8000, 'N', 9.1, SYSDATE + 5);
INSERT INTO CustomerLoans VALUES (5, 'Rakesh Babu', DATE '1948-09-05', 11000, 'N', 7.9, SYSDATE + 25);
INSERT INTO CustomerLoans VALUES (6, 'Neha Singh', DATE '2000-02-14', 7200, 'N', 9.5, SYSDATE + 60);
INSERT INTO CustomerLoans VALUES (7, 'Amit Joshi', DATE '1963-11-22', 10500, 'N', 8.8, SYSDATE + 12);
INSERT INTO CustomerLoans VALUES (8, 'Deepika Rao', DATE '1972-06-11', 9100, 'N', 8.9, SYSDATE + 90);
INSERT INTO CustomerLoans VALUES (9, 'Kiran Kumar', DATE '1955-03-18', 12300, 'N', 8.0, SYSDATE + 8);
INSERT INTO CustomerLoans VALUES (10, 'Priya Mehta', DATE '1988-10-10', 3000, 'N', 9.4, SYSDATE + 35);
INSERT INTO CustomerLoans VALUES (11, 'Vinod Reddy', DATE '1990-01-01', 1500, 'N', 10.0, SYSDATE + 20);
INSERT INTO CustomerLoans VALUES (12, 'Rekha Das', DATE '1975-12-12', 11500, 'N', 7.8, SYSDATE + 17);
INSERT INTO CustomerLoans VALUES (13, 'Arun Nair', DATE '1952-05-30', 10200, 'N', 8.1, SYSDATE + 9);
INSERT INTO CustomerLoans VALUES (14, 'Meena Jain', DATE '1999-11-11', 5000, 'N', 9.3, SYSDATE + 27);
INSERT INTO CustomerLoans VALUES (15, 'Vikas Sharma', DATE '1968-08-21', 12500, 'N', 7.7, SYSDATE + 14);
INSERT INTO CustomerLoans VALUES (16, 'Sneha Gupta', DATE '2002-09-09', 11000, 'N', 8.6, SYSDATE + 2);
INSERT INTO CustomerLoans VALUES (17, 'Rajeev Menon', DATE '1959-06-15', 9700, 'N', 8.4, SYSDATE + 28);
INSERT INTO CustomerLoans VALUES (18, 'Komal Batra', DATE '1983-03-03', 11200, 'N', 8.9, SYSDATE + 45);
INSERT INTO CustomerLoans VALUES (19, 'Sudhir Malhotra', DATE '1945-12-01', 13500, 'N', 7.5, SYSDATE + 18);
INSERT INTO CustomerLoans VALUES (20, 'Anjali Mishra', DATE '1979-05-05', 8900, 'N', 8.7, SYSDATE + 31);

COMMIT;



SELECT * FROM CUSTOMERLOANS;


BEGIN
  FOR rec IN (
    SELECT CustomerID, DateOfBirth 
    FROM CustomerLoans
  ) LOOP
    IF MONTHS_BETWEEN(SYSDATE, rec.DateOfBirth) / 12 > 60 THEN
      UPDATE CustomerLoans
      SET InterestRate = InterestRate - 1
      WHERE CustomerID = rec.CustomerID;
    END IF;
  END LOOP;
  
  COMMIT;
END;
/

SELECT CustomerID, FullName, DateOfBirth, 
       ROUND(MONTHS_BETWEEN(SYSDATE, DateOfBirth)/12) AS Age,
       InterestRate
FROM CustomerLoans
ORDER BY CustomerID;


BEGIN
  FOR rec IN (
    SELECT CustomerID, Balance 
    FROM CustomerLoans
  ) LOOP
    IF rec.Balance > 10000 THEN
      UPDATE CustomerLoans
      SET IsVIP = 'Y'
      WHERE CustomerID = rec.CustomerID;
    END IF;
  END LOOP;

  COMMIT;
END;
/


SELECT * FROM CustomerLoans
ORDER BY CustomerID;



BEGIN
  FOR rec IN (
    SELECT FullName, LoanDueDate 
    FROM CustomerLoans
    WHERE LoanDueDate BETWEEN SYSDATE AND SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan for ' || rec.FullName || 
                         ' is due on ' || TO_CHAR(rec.LoanDueDate, 'DD-Mon-YYYY'));
  END LOOP;
END;
/
