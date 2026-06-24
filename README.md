# BigRig Movers Database Project
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white)
![JSON](https://img.shields.io/badge/JSON-000000?style=for-the-badge&logo=json&logoColor=white)

## 📌 Executive Summary
This project involves the design, population, and manipulation of a comprehensive database system for **BigRig Movers (BRM)**, a logistics company managing a fleet of prime movers and trailers. 

The system transitions from a robust **Relational Database (Oracle RDBMS)** handling daily operational transactions to a **Non-Relational Database (MongoDB)** tailored for flexible data analytics and document storage.

## 🛠️ Key Technical Features
* **Database Design (DDL):** Architected scalable schemas with strict primary/foreign key constraints and custom check constraints to maintain data integrity.
* **Transactional Management (DML):** Implemented complex inserts, updates, and deletes utilizing Oracle sequences, ensuring ACID properties during booking and scheduling operations.
* **Advanced SQL Querying:** Engineered multi-table ANSI joins, correlated subqueries, and aggregate functions to extract key business metrics (e.g., vehicle utilization rates, revenue analytics).
* **NoSQL Migration & JSON:** Orchestrated the extraction of complex relational data into structured JSON format, subsequently deploying it into MongoDB for nested document querying.

## 📊 Entity-Relationship Diagram (ERD)


## 📁 Repository Structure
* `T1-brm-schema.sql` - DDL scripts for table creation and integrity constraints.
* `T2-brm-insert.sql` - Sample data population scripts establishing the initial database state.
* `T3-brm-dm.sql` - DML scripts demonstrating transactional operations and sequence generation.
* `T4-brm-mods.sql` - Live database structure modifications (`ALTER TABLE`).
* `T5-brm-select.sql` - Advanced business intelligence queries.
* `T6-brm-json.sql` - SQL scripts for JSON document generation.
* `T6-brm-mongo.mongodb.js` - MongoDB setup, insertion, and querying scripts.

## 👨‍💻 Author
**Tay Chee Hsian**
