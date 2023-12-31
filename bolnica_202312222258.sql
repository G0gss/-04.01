﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.689.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 22.12.2023 22:58:17
-- Server version: 5.5.25
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE bolnica;

--
-- Drop table `rating_doctors`
--
DROP TABLE IF EXISTS rating_doctors;

--
-- Drop table `user`
--
DROP TABLE IF EXISTS user;

--
-- Drop table `medical_servise`
--
DROP TABLE IF EXISTS medical_servise;

--
-- Drop table `departaments`
--
DROP TABLE IF EXISTS departaments;

--
-- Drop table `medical_history`
--
DROP TABLE IF EXISTS medical_history;

--
-- Drop table `operation_history`
--
DROP TABLE IF EXISTS operation_history;

--
-- Drop table `operations`
--
DROP TABLE IF EXISTS operations;

--
-- Drop table `schedule_doctors`
--
DROP TABLE IF EXISTS schedule_doctors;

--
-- Drop table `treatment_sheet`
--
DROP TABLE IF EXISTS treatment_sheet;

--
-- Drop table `doctors`
--
DROP TABLE IF EXISTS doctors;

--
-- Drop table `patients`
--
DROP TABLE IF EXISTS patients;

--
-- Drop table `gender`
--
DROP TABLE IF EXISTS gender;

--
-- Set default database
--
USE bolnica;

--
-- Create table `gender`
--
CREATE TABLE gender (
  id int(11) NOT NULL AUTO_INCREMENT,
  text varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `patients`
--
CREATE TABLE patients (
  ID int(11) NOT NULL,
  Last_name varchar(255) DEFAULT NULL,
  First_name varchar(255) DEFAULT NULL,
  Patronymic varchar(255) DEFAULT NULL,
  Address varchar(255) DEFAULT NULL,
  Age int(11) DEFAULT NULL,
  Gender_ID int(11) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE patients
ADD CONSTRAINT FK_patients_Gender_ID FOREIGN KEY (Gender_ID)
REFERENCES gender (id) ON DELETE NO ACTION;

--
-- Create table `doctors`
--
CREATE TABLE doctors (
  ID int(11) NOT NULL,
  First_name varchar(255) DEFAULT NULL,
  Last_name varchar(255) DEFAULT NULL,
  Patronymic varchar(255) DEFAULT NULL,
  Age int(11) DEFAULT NULL,
  addres varchar(255) DEFAULT NULL,
  Gender_ID int(11) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE doctors
ADD CONSTRAINT FK_doctors_Gender_ID FOREIGN KEY (Gender_ID)
REFERENCES gender (id) ON DELETE NO ACTION;

--
-- Create table `treatment_sheet`
--
CREATE TABLE treatment_sheet (
  id int(11) NOT NULL AUTO_INCREMENT,
  doctor_id int(11) DEFAULT NULL,
  patient_id int(11) DEFAULT NULL,
  date_treatment date DEFAULT NULL,
  diagnosis varchar(255) DEFAULT NULL,
  temperature varchar(255) DEFAULT NULL,
  pressure varchar(255) DEFAULT NULL,
  `patient``s_condition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE treatment_sheet
ADD CONSTRAINT FK_treatment_sheet_doctor_id FOREIGN KEY (doctor_id)
REFERENCES doctors (ID) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE treatment_sheet
ADD CONSTRAINT FK_treatment_sheet_patient_id FOREIGN KEY (patient_id)
REFERENCES patients (ID) ON DELETE NO ACTION;

--
-- Create table `schedule_doctors`
--
CREATE TABLE schedule_doctors (
  id int(11) NOT NULL AUTO_INCREMENT,
  date_appointment date DEFAULT NULL,
  start time DEFAULT NULL,
  doctor_id int(11) DEFAULT NULL,
  patient_id int(11) DEFAULT NULL,
  discription_appointment varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE schedule_doctors
ADD CONSTRAINT FK_schedule_doctors_patient_id FOREIGN KEY (patient_id)
REFERENCES patients (ID) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE schedule_doctors
ADD CONSTRAINT FK_schedule_doctors_doctor_id FOREIGN KEY (doctor_id)
REFERENCES doctors (ID) ON DELETE NO ACTION;

--
-- Create table `operations`
--
CREATE TABLE operations (
  ID int(11) NOT NULL AUTO_INCREMENT,
  Doctor_id int(11) DEFAULT NULL,
  Patient_id int(11) DEFAULT NULL,
  Review_text varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE operations
ADD CONSTRAINT FK_operations_Patient_id FOREIGN KEY (Patient_id)
REFERENCES patients (ID) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE operations
ADD CONSTRAINT FK_operations_Doctor_id FOREIGN KEY (Doctor_id)
REFERENCES doctors (ID) ON DELETE NO ACTION;

--
-- Create table `operation_history`
--
CREATE TABLE operation_history (
  id int(11) NOT NULL AUTO_INCREMENT,
  operations_id int(11) DEFAULT NULL,
  doctor_id int(11) DEFAULT NULL,
  patient_id int(11) DEFAULT NULL,
  resuilat varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE operation_history
ADD CONSTRAINT FK_operation_history_patient_id FOREIGN KEY (patient_id)
REFERENCES patients (ID) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE operation_history
ADD CONSTRAINT FK_operation_history_doctor_id FOREIGN KEY (doctor_id)
REFERENCES doctors (ID) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE operation_history
ADD CONSTRAINT FK_operation_history_operations_id FOREIGN KEY (operations_id)
REFERENCES operations (ID) ON DELETE NO ACTION;

--
-- Create table `medical_history`
--
CREATE TABLE medical_history (
  ID int(11) NOT NULL AUTO_INCREMENT,
  patiend_id int(11) DEFAULT NULL,
  doctor_id int(11) DEFAULT NULL,
  diagnosis varchar(255) DEFAULT NULL,
  date_of_lineses date DEFAULT NULL,
  date_od_recovery date DEFAULT NULL,
  type_treatment varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE medical_history
ADD CONSTRAINT FK_medical_history_doctor_id FOREIGN KEY (doctor_id)
REFERENCES doctors (ID) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE medical_history
ADD CONSTRAINT FK_medical_history_patiend_id FOREIGN KEY (patiend_id)
REFERENCES patients (ID) ON DELETE NO ACTION;

--
-- Create table `departaments`
--
CREATE TABLE departaments (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  chif_physician int(11) DEFAULT NULL,
  address varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE departaments
ADD CONSTRAINT FK_departaments_chif_physician FOREIGN KEY (chif_physician)
REFERENCES doctors (ID) ON DELETE NO ACTION;

--
-- Create table `medical_servise`
--
CREATE TABLE medical_servise (
  ID int(11) NOT NULL,
  type_of_servise varchar(255) DEFAULT NULL,
  desciption varchar(255) DEFAULT NULL,
  cost int(11) DEFAULT NULL,
  departaments_id int(11) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE medical_servise
ADD CONSTRAINT FK_medical_servise_departaments_id2 FOREIGN KEY (departaments_id)
REFERENCES departaments (id) ON DELETE NO ACTION;

--
-- Create table `user`
--
CREATE TABLE user (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL DEFAULT '',
  password varchar(255) DEFAULT NULL,
  email varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `rating_doctors`
--
CREATE TABLE rating_doctors (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) DEFAULT NULL,
  doctor_id int(11) DEFAULT NULL,
  patient_id int(11) DEFAULT NULL,
  review_text varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create foreign key
--
ALTER TABLE rating_doctors
ADD CONSTRAINT FK_rating_doctors_doctor_id FOREIGN KEY (doctor_id)
REFERENCES doctors (ID) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE rating_doctors
ADD CONSTRAINT FK_rating_doctors_patient_id FOREIGN KEY (patient_id)
REFERENCES patients (ID) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE rating_doctors
ADD CONSTRAINT FK_rating_doctors_user_id FOREIGN KEY (user_id)
REFERENCES user (id) ON DELETE NO ACTION;

-- 
-- Dumping data for table gender
--
INSERT INTO gender VALUES
(1, 'male'),
(2, 'female');

-- 
-- Dumping data for table patients
--
INSERT INTO patients VALUES
(1, 'asdasdasd', 'xx', 'zz', 'cc', 27, 2),
(2, 'fgdhgf', 'ddsfgsg', 'hgjfsg', 'hgjfdfgh', 43, 1),
(3, 'yturu', 'nbvmvb', 'sfdbv', 'sdrtty', 24, 2);

-- 
-- Dumping data for table doctors
--
INSERT INTO doctors VALUES
(1, 'zz', 'xx', 'cc', 25, 'Улица Ленина, 10', 1),
(2, 'asdsad', 'asdsa', 'qweqe', 43, 'qweqwd', 2);

-- 
-- Dumping data for table user
--
INSERT INTO user VALUES
(1, 'awasd', 'sadasdadwqeq', 'asdadswdabgd'),
(3, 'pisdfsa', '123', 'asdadqfa');

-- 
-- Dumping data for table operations
--
INSERT INTO operations VALUES
(1, 1, 1, 'qweweqw');

-- 
-- Dumping data for table departaments
--
INSERT INTO departaments VALUES
(1, 'sadasd', 1, 'asdasasd');

-- 
-- Dumping data for table treatment_sheet
--
INSERT INTO treatment_sheet VALUES
(1, 1, 1, '2023-12-03', 'asdasd', '23', 'asdasda', 'sadada'),
(2, 2, 2, '2023-12-06', 'asdasd', '34', 'asdasd', 'safsaf');

-- 
-- Dumping data for table schedule_doctors
--
-- Table bolnica.schedule_doctors does not contain any data (it is empty)

-- 
-- Dumping data for table rating_doctors
--
INSERT INTO rating_doctors VALUES
(1, 1, 1, 1, 'gfdhsdfs');

-- 
-- Dumping data for table operation_history
--
INSERT INTO operation_history VALUES
(1, 1, 1, 1, 'asdasdad');

-- 
-- Dumping data for table medical_servise
--
INSERT INTO medical_servise VALUES
(1, 'asdsad', 'asdasd', 123213, 1);

-- 
-- Dumping data for table medical_history
--
INSERT INTO medical_history VALUES
(1, 1, 1, 'asdasd', '2019-12-31', '2023-12-06', 'asdsadasdas'),
(2, 2, 2, 'ыввыа', '2023-12-05', '2023-12-06', 'ываывриап'),
(3, 3, 1, 'паврвап', '2023-12-11', '2023-12-17', 'ываываыа');

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;