DROP DATABASE IF EXISTS `mysystem`;
CREATE DATABASE `mysystem`;
USE `mysystem`;

-- Table level
/*
Creating Config tables
*/



/*
Creating reception and registry tables
*/
-- Person table
CREATE TABLE `mysystem`.`patient` (
   `ptid`    INT NOT NULL AUTO_INCREMENT,
   `psc_number` VARCHAR(50),
   `Fname`        VARCHAR(50)  NOT NULL,
   `Mname`        VARCHAR(50) ,
   `Lname`        VARCHAR(50) ,
   `contact`  VARCHAR(50),
   `gender` ENUM('Male', 'Female'),
   `Dob` DATE,
   `timeStamp` TIMESTAMP NOT NULL,
   `sentflag` ENUM('0','1') DEFAULT '0',
   CONSTRAINT `patientPk` PRIMARY KEY  (`ptid`),
   INDEX (`psc_number`),
   INDEX (`Fname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 


CREATE TABLE `emr`.`appointment` (
   `appid`    INT NOT NULL AUTO_INCREMENT,
   `ptid`    INT NOT NULL REFERENCES patient(ptid),
   `appdate` DATE,
   `timeStamp` TIMESTAMP NOT NULL,
   CONSTRAINT `appPk` PRIMARY KEY  (`appid`),
   INDEX (`appdate`),
   INDEX (`ptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 




/*
Creating data tables
*/

select psc_number, Fname, Mname, Lname, contact, gender, Dob, appdate 
from `emr`.`patient` 
join `emr`.`appointment`
on `patient`. `ptid`= `appointment`.`ptid`
where  `sentflag`='0'

