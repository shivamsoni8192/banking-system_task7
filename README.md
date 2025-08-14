# 💳 Banking & Finance SQL Project – Task 7 (Views)

This project is part of my *SQL Developer Internship (Task 7 – Creating Views)* under the Ministry of MSME.  
The focus of this task is to design and implement *SQL Views* for a *Banking & Finance domain, which are commonly used in **MNCs* for fraud detection, compliance, loan monitoring, and data privacy.

---

## 🎯 Objectives
- Learn how to *create SQL Views* to simplify complex queries.  
- Demonstrate *real-world banking scenarios* used by MNCs.  
- Apply *data abstraction, analytics, and security* concepts.  
- Show the difference between *updatable views and read-only views*.  

---

## 🛠 Database Schema
The project consists of four main tables:

1. *Customers* – Stores customer details.  
2. *Accounts* – Stores account details linked to customers.  
3. *Transactions* – Stores all transaction records.  
4. *Loans* – Stores loan repayment details.  

---

## 📦 Views Implemented

### 1. high_value_transactions
- Detects transactions above ₹1,00,000.  
- Used in *Fraud Detection & Anti-Money Laundering (AML)* systems.  

```sql
SELECT * FROM high_value_transactions;

2. inactive_accounts

Identifies accounts with no transactions in the last 1 year.

Used by banks to detect dormant accounts.


SELECT * FROM inactive_accounts;


---

3. loan_repayment_status

Displays loan status: On Time / Overdue / Upcoming.

Used for NPA (Non-Performing Asset) Monitoring and credit risk analysis.


SELECT * FROM loan_repayment_status;


---

4. customer_privacy_view

Shows masked email & phone number of Active Customers only.

Example of GDPR / DPDP compliance and data security.

Created using WITH CHECK OPTION.


SELECT * FROM customer_privacy_view;


---

✅ Key Learnings

Abstraction: Views simplify queries and improve readability.

Analytics: Help in generating insights (fraud detection, loan monitoring).

Security: Protect sensitive data by masking fields.

MNC Relevance: These views directly represent real-world banking use cases.

📂 Files

banking_system_task7 → SQL script (tables, sample data, views, test queries).

🚀 How to Run

1. Open MySQL Workbench (or any SQL client).

2. Run the SQL script:

SOURCE banking_system_task7


3. Test the views with the provided SELECT queries.

🔑 Example Output

High Value Transactions → Shows only transactions > ₹1 Lakh.

Inactive Accounts → Accounts inactive for more than 12 months.

Loan Repayment Status → Marks loan as Overdue if due date has passed and not paid.

Customer Privacy View → Shows masked email/phone for active customers.

🌟 Author

👤 Shivam Soni
📌 SQL Developer Internship – Elevate Labs
📍 Focus Area: Banking & Finance Analytics

link - https://github.com/shivamsoni8192/banking-system_task7

