# Database-Design

# Bookstore Database Project
Project Overview
The bookstore database is designed to support the operations of Real Books, an online bookstore that sells books internationally. This database facilitates essential functionalities such as managing customer details, books inventory, shopping carts, orders, payments, and shipping information. The structure is normalized to minimize data redundancy and improve data quality and consistency.

# This project is divided into several parts:

Class Diagram - Defines the logical structure and interactions between classes for the bookstore.
Entity Relationship Diagram (ERD) - Translates the class structure into a relational database design.
Database Schema - Implements the database design in MySQL.
SQL Dump - Provides a script to recreate the database structure.
Contents
bookstore_schema_dump.sql: An SQL dump file containing the schema definition for the bookstore database. This file includes all CREATE TABLE statements required to set up the database with tables for Customer, Book, Cart, CartItem, OrderTable, OrderItem, Payment, and Shipping.
Database Structure
The database consists of the following tables:

Customer: Stores customer details.
Book: Stores book information, including title, author, genre, and stock quantity.
Cart: Represents a shopping cart associated with a customer.
CartItem: Holds items added to the cart, including quantity.
OrderTable: Stores order details and maintains the order status.
OrderItem: Represents items within an order.
Payment: Manages payment transactions for each order.
Shipping: Tracks shipping information for orders.

# Table Relationships
Customer ↔ Cart: Each customer has a unique shopping cart.
Cart ↔ CartItem: A cart contains multiple items, each represented by a CartItem.
Customer ↔ OrderTable: Each order is associated with a customer.
OrderTable ↔ OrderItem: Each order contains multiple items, each represented by an OrderItem.
OrderTable ↔ Payment: Each order has an associated payment record.
OrderTable ↔ Shipping: Each order has associated shipping information.
Setup Instructions
To set up the database on your local MySQL server, follow these steps:

Clone or download the project files to your local machine.
Log in to MySQL via the command line or MySQL Workbench.
Create the bookstore database by running the SQL dump file provided.

# Command Line Instructions:

mysql -u your_username -p < bookstore_schema_dump.sql
Replace your_username with your actual MySQL username.
This command will prompt you for your MySQL password.
Verify the Database: Once the command completes, check that the tables are created by using:

# sql
USE bookstore;
SHOW TABLES;
Optional - Insert Sample Data: If you’d like to test the database, you may insert sample data into each table manually or via a script.

Data Quality and Normalization
The database schema is designed to ensure data quality and normalization:

Primary Keys: Each table has a unique primary key.
Foreign Keys: Relationships are maintained through foreign keys with ON DELETE CASCADE to ensure data integrity.
Constraints: CHECK constraints are added on specific columns (e.g., status, paymentMethod, shippingStatus) to restrict values and maintain consistency.

# Usage
This database is designed for use in an application that supports:
Customer search for books and shopping cart management.
Order processing, payment, and tracking.
Inventory management by store staff.
The schema and design can be extended to include more features as required.
