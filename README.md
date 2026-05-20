# 🛒 E-Commerce Database — SQL Project

A relational database design for a full-featured e-commerce platform, built using **T-SQL (Microsoft SQL Server)**. The project covers schema creation, data insertion, and a variety of queries for real-world scenarios.

---

## 📌 Features

- Multi-role user system: **Customer**, **Seller**, **Admin**
- Product catalog with **categories** and **stock management**
- Shopping **cart** and **order** processing
- **Payment** tracking (Credit Card, Cash, Visa, PayPal)
- **Reviews** and **ratings** for products
- **Discount** system (Percentage & Fixed types)
- **Complaint** management handled by admins

---

## 🗂️ Database Tables

| Table | Description |
|-------|-------------|
| `User` | All system users with roles |
| `Customer` | Customer profiles and shipping preferences |
| `Seller` | Seller store info and bank account |
| `Admin` | Admin roles and positions |
| `Category` | Product categories |
| `Product` | Products linked to sellers and categories |
| `Cart` / `Cart_Item` | Shopping cart per customer |
| `Order` / `Order_Item` | Customer orders and items |
| `Payment` | Payment records per order |
| `Review` | Customer reviews and ratings |
| `Discount` | Product discounts with date ranges |
| `Complaint` | Customer complaints handled by admins |

---

## 🧪 SQL Operations Covered

- ✅ `CREATE TABLE` with primary and foreign keys
- ✅ `INSERT INTO` with sample data (10+ rows per table)
- ✅ `SELECT` with `WHERE`, `LIKE`, `ORDER BY`
- ✅ `UPDATE` and `DELETE`
- ✅ Aggregate functions: `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`
- ✅ Joins: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`

---

## 🚀 How to Run

1. Open **SQL Server Management Studio (SSMS)** or any T-SQL compatible tool
2. Create a new database
3. Open `final_sql.sql`
4. Run the full script

---

## 🛠️ Technologies

- Microsoft SQL Server (T-SQL)
- SQL Server Management Studio (SSMS)

---

## 👩‍💻 Author

> Built as a database design project covering core e-commerce workflows.
