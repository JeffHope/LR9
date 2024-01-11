CREATE TABLE Doctors (
    Fullname VARCHAR(255) PRIMARY KEY,
    Specialization VARCHAR(255) UNIQUE,
    ConsultationFee DECIMAL(10, 2),
    SalaryPercentage DECIMAL(5, 2)
);

-- Создание таблицы "Patients"
CREATE TABLE Patients (
    Fullname VARCHAR(255) PRIMARY KEY,
    DoctorSpecialization VARCHAR(255),
    BirthDate DATE,
    Address VARCHAR(255),
    FOREIGN KEY (DoctorSpecialization) REFERENCES Doctors (Specialization)
);

-- Создание таблицы "Appointments"
CREATE TABLE Appointments (
    AppointmentDate DATE,
    DoctorFullname VARCHAR(255),
    PatientFullname VARCHAR(255),
    PRIMARY KEY (AppointmentDate, DoctorFullname, PatientFullname),
    FOREIGN KEY (DoctorFullname) REFERENCES Doctors (Fullname),
    FOREIGN KEY (PatientFullname) REFERENCES Patients (Fullname)
);


INSERT INTO Doctors (Fullname, Specialization, ConsultationFee, SalaryPercentage) VALUES
    ('Dr. Adam Smith', 'Cardiology', 150.00, 10.00),
    ('Dr. Lisa Ray', 'Neurology', 200.00, 12.00),
    ('Dr. John Doe', 'Dermatology', 120.00, 9.00),
    ('Dr. Nancy Allen', 'Pediatrics', 100.00, 11.00),
    ('Dr. Steve Jobs', 'Orthopedics', 180.00, 15.00),
    ('Dr. Rachel Green', 'Ophthalmology', 140.00, 13.00),
    ('Dr. Monica Geller', 'Oncology', 220.00, 14.00),
    ('Dr. Ross Geller', 'Gastroenterology', 110.00, 8.00),
    ('Dr. Bruce Wayne', 'Psychiatry', 170.00, 16.00),
    ('Dr. Diana Prince', 'Endocrinology', 130.00, 7.00);

INSERT INTO Patients (Fullname, DoctorSpecialization, BirthDate, Address) VALUES
    ('Patient A1', 'Cardiology', '1975-05-01', 'Address 1'),
    ('Patient A2', 'Neurology', '1980-04-10', 'Address 2'),
    ('Patient A3', 'Dermatology', '1992-08-23', 'Address 3'),
    ('Patient A4', 'Pediatrics', '2001-07-16', 'Address 4'),
    ('Patient A5', 'Orthopedics', '1985-01-20', 'Address 5'),
    ('Patient A6', 'Ophthalmology', '1990-06-05', 'Address 6'),
    ('Patient A7', 'Oncology', '1978-09-12', 'Address 7'),
    ('Patient A8', 'Gastroenterology', '1982-11-18', 'Address 8'),
    ('Patient A9', 'Psychiatry', '1995-03-28', 'Address 9'),
    ('Patient A10', 'Endocrinology', '1988-02-14', 'Address 10'),
    ('Patient A11', 'Cardiology', '1977-07-02', 'Address 11'),
    ('Patient A12', 'Neurology', '1983-09-08', 'Address 12'),
    ('Patient A13', 'Dermatology', '1994-02-25', 'Address 13'),
    ('Patient A14', 'Pediatrics', '1986-12-14', 'Address 14'),
    ('Patient A15', 'Orthopedics', '1998-10-21', 'Address 15'),
    ('Patient A16', 'Ophthalmology', '1979-05-06', 'Address 16'),
    ('Patient A17', 'Oncology', '1991-08-03', 'Address 17'),
    ('Patient A18', 'Gastroenterology', '1984-01-17', 'Address 18'),
    ('Patient A19', 'Psychiatry', '1976-10-11', 'Address 19'),
    ('Patient A20', 'Endocrinology', '1989-03-26', 'Address 20');

INSERT INTO Appointments (AppointmentDate, DoctorFullname, PatientFullname) VALUES
    ('2023-12-01', 'Dr. Adam Smith', 'Patient A1'),
    ('2023-12-02', 'Dr. Lisa Ray', 'Patient A2'),
    ('2023-12-03', 'Dr. John Doe', 'Patient A3'),
    ('2023-12-04', 'Dr. Nancy Allen', 'Patient A4'),
    ('2023-12-05', 'Dr. Steve Jobs', 'Patient A5'),
    ('2023-12-06', 'Dr. Rachel Green', 'Patient A6'),
    ('2023-12-07', 'Dr. Monica Geller', 'Patient A7'),
    ('2023-12-08', 'Dr. Ross Geller', 'Patient A8'),
    ('2023-12-09', 'Dr. Bruce Wayne', 'Patient A9'),
    ('2023-12-10', 'Dr. Diana Prince', 'Patient A10'),
    ('2023-12-20', 'Dr. Lisa Ray', 'Patient A11'),
    ('2023-12-21', 'Dr. John Doe', 'Patient A12'),
    ('2023-12-22', 'Dr. Nancy Allen', 'Patient A13'),
    ('2023-12-23', 'Dr. Steve Jobs', 'Patient A14'),
    ('2023-12-24', 'Dr. Rachel Green', 'Patient A15'),
    ('2023-12-25', 'Dr. Monica Geller', 'Patient A16'),
    ('2023-12-26', 'Dr. Ross Geller', 'Patient A17'),
    ('2023-12-27', 'Dr. Bruce Wayne', 'Patient A18'),
    ('2023-12-28', 'Dr. Diana Prince', 'Patient A19'),
    ('2023-12-29', 'Dr. Adam Smith', 'Patient A20'),
    ('2023-12-30', 'Dr. Lisa Ray', 'Patient A2');