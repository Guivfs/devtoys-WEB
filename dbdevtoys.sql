CREATE DATABASE dbdevtoys;
SHOW DATABASES;
USE dbdevtoys;
CREATE TABLE produtos(
	idprod INT PRIMARY KEY AUTO_INCREMENT,
	nomeprod VARCHAR(50) NOT NULL,
	precoprod FLOAT NOT NULL,
    categoriaprod VARCHAR(30) NOT NULL,
    descprod VARCHAR(250),
    imgprod VARCHAR(250)
);
SHOW TABLES;
DESCRIBE produtos; 

CREATE TABLE usuario(
	idusua INT PRIMARY KEY AUTO_INCREMENT,
    nomeusua VARCHAR(100) NOT NULL,
    senhausua VARCHAR(30) NOT NULL,
    emailusua VARCHAR(50) NOT NULL,
    permissao ENUM('Admin','Usuario') NOT NULL
    );
SHOW TABLES;
DESCRIBE usuario;