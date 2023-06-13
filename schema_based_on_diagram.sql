CREATE DATABASE clinicDB;

/* tables from the diagrams */

CREATE TABLE
    patients(
        id INT PRIMARY KEY,
        name VARCHAR(250),
        date_of_birth DATE
    );

CREATE TABLE
    treatment(
        id INT PRIMARY KEY,
        name VARCHAR(250),
    );

CREATE TABLE 
    medical_histories(
        id INT PRIMARY KEY,
        admitted_at DATE,
        FOREIGN KEY (patient_id) REFERENCES patients(id),
        status VARCHAR(250),
    );

CREATE TABLE
    invoice_items(
        id INT PRIMARY KEY,
        unit_price DECIMAL(10,2),
        quantity INT,
        FOREIGN KEY (invoice_id) REFERENCES patients(id),
        FOREIGN KEY (treatment_id) REFERENCES treatment(id),
    );

CREATE TABLE
    invoices(
        id INT PRIMARY KEY,
        total_amount DECIMAL(10,2),
        generated_at DATE,
        payed_at DATE,
        FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    );

/* tables that represent the Many to many relationships */

CREATE TABLE 
    patient_treatments (
        FOREIGN KEY (patient_id) REFERENCES patients(id),
        FOREIGN KEY (treatment_id) REFERENCES treatments(id)
    );

CREATE TABLE 
    invoice_medical_histories (
        FOREIGN KEY (invoice_id) REFERENCES invoices(id),
        FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
    );