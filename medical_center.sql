DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    doctor_name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    patient_name TEXT NOT NULL,
    birthday TEXT,
    insurance TEXT NOT NULL
);

CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    doctor INT REFERENCES doctors(doctor_id),
    patient INT REFERENCES patients(patient_id),
    visit_date TEXT
);

CREATE TABLE diagnosis (
    diagnosis_id SERIAL,
    disease INT REFERENCES diseases(disease_id),
    visit INT REFERENCES visits(visit_id),
    notes TEXT
);

CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    disease_name TEXT UNIQUE,
    disease_description TEXT
)