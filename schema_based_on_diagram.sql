CREATE TABLE patients(
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
    id INTEGER NOT NULL,
    admitted_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    patient_id INTEGER NOT NULL,
    status VARCHAR(255) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT medical_histories_patient_id_foreign FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices(
    id INTEGER NOT NULL,
    total_amount DECIMAL(8, 2) NOT NULL,
    generated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    payed_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    medical_history_id INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT invoices_medical_history_id_foreign FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

