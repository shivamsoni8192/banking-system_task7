CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    account_status VARCHAR(20)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(12,2),
    transaction_date DATE,
    transaction_type VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(50),
    emi_amount DECIMAL(12,2),
    due_date DATE,
    status VARCHAR(20), -- Paid / Pending
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers VALUES
(1, 'Amit Sharma', 'amit@example.com', '9876543210', 'Active'),
(2, 'Riya Verma', 'riya@example.com', '9988776655', 'Active'),
(3, 'John Doe', 'john@example.com', '9123456780', 'Inactive'),
(4, 'Sneha Gupta', 'sneha@example.com', '9786541230', 'Active');

INSERT INTO Accounts VALUES
(101, 1, 'Savings', 250000.00),
(102, 2, 'Current', 80000.00),
(103, 3, 'Savings', 15000.00),
(104, 4, 'Savings', 500000.00);

INSERT INTO Transactions VALUES
(1001, 101, 200000.00, '2025-08-01', 'NEFT'),
(1002, 102, 5000.00, '2024-06-15', 'UPI'),
(1003, 103, 12000.00, '2023-05-20', 'Cash'),
(1004, 104, 250000.00, '2025-08-10', 'RTGS');

INSERT INTO Loans VALUES
(201, 1, 'Home Loan', 25000.00, '2025-08-05', 'Paid'),
(202, 2, 'Car Loan', 15000.00, '2025-07-30', 'Pending'),
(203, 3, 'Personal Loan', 10000.00, '2024-08-01', 'Pending'),
(204, 4, 'Education Loan', 8000.00, '2025-08-20', 'Upcoming');

CREATE VIEW high_value_transactions AS
SELECT 
    t.transaction_id,
    t.account_id,
    c.customer_name,
    t.amount,
    t.transaction_date,
    t.transaction_type
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE t.amount > 100000;

CREATE VIEW inactive_accounts AS
SELECT 
    a.account_id,
    c.customer_name,
    a.account_type,
    MAX(t.transaction_date) AS last_transaction_date
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id
LEFT JOIN Transactions t ON a.account_id = t.account_id
GROUP BY a.account_id, c.customer_name, a.account_type
HAVING MAX(t.transaction_date) < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

CREATE VIEW loan_repayment_status AS
SELECT 
    l.loan_id,
    c.customer_name,
    l.loan_type,
    l.due_date,
    l.emi_amount,
    CASE 
        WHEN l.due_date < CURDATE() AND l.status = 'Pending' THEN 'Overdue'
        WHEN l.status = 'Paid' THEN 'On Time'
        ELSE 'Upcoming'
    END AS repayment_status
FROM Loans l
JOIN Customers c ON l.customer_id = c.customer_id;

CREATE VIEW customer_privacy_view AS
SELECT 
    customer_id,
    customer_name,
    CONCAT(LEFT(email,3), '*@*.com') AS masked_email,
    CONCAT('XXXXXXX', RIGHT(phone,3)) AS masked_phone,
    account_status
FROM Customers
WHERE account_status = 'Active'
WITH CHECK OPTION;


SELECT * FROM high_value_transactions;
SELECT * FROM inactive_accounts;
SELECT * FROM loan_repayment_status;
SELECT * FROM customer_privacy_view;