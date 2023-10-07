/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - dbolympus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbolympus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dbolympus`;

/*Table structure for table `cursos` */

DROP TABLE IF EXISTS `cursos`;

CREATE TABLE `cursos` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecurso` varchar(30) NOT NULL,
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cursos` */

/*Table structure for table `detalletaller` */

DROP TABLE IF EXISTS `detalletaller`;

CREATE TABLE `detalletaller` (
  `iddetalletaller` int(11) NOT NULL AUTO_INCREMENT,
  `idtaller` int(11) NOT NULL,
  `iddocente` int(11) NOT NULL,
  `denominacion` varchar(30) NOT NULL,
  `fechainicio` datetime NOT NULL,
  `fechafin` datetime NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `horainicio` time NOT NULL,
  `horafin` time NOT NULL,
  PRIMARY KEY (`iddetalletaller`),
  KEY `fk_idtaller_detalletaller` (`idtaller`),
  KEY `fk_iddocente_detalletaller` (`iddocente`),
  CONSTRAINT `fk_iddocente_detalletaller` FOREIGN KEY (`iddocente`) REFERENCES `docentes` (`iddocente`),
  CONSTRAINT `fk_idtaller_detalletaller` FOREIGN KEY (`idtaller`) REFERENCES `cursos` (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalletaller` */

/*Table structure for table `docentes` */

DROP TABLE IF EXISTS `docentes`;

CREATE TABLE `docentes` (
  `iddocente` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `especialidad` varchar(30) NOT NULL,
  `cv` varchar(200) NOT NULL,
  `numEmergencia` varchar(9) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`iddocente`),
  KEY `fk_idpersona_docentes` (`idpersona`),
  CONSTRAINT `fk_idpersona_docentes` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `docentes` */

/*Table structure for table `formaspago` */

DROP TABLE IF EXISTS `formaspago`;

CREATE TABLE `formaspago` (
  `idformapago` int(11) NOT NULL AUTO_INCREMENT,
  `formapago` varchar(30) NOT NULL,
  PRIMARY KEY (`idformapago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `formaspago` */

/*Table structure for table `matriculas` */

DROP TABLE IF EXISTS `matriculas`;

CREATE TABLE `matriculas` (
  `idmatricula` int(11) NOT NULL AUTO_INCREMENT,
  `idalumno` int(11) NOT NULL,
  `idapoderado` int(11) NOT NULL,
  `iddetalletaller` int(11) NOT NULL,
  `fechamatricula` datetime NOT NULL DEFAULT current_timestamp(),
  `precioacordado` decimal(7,2) NOT NULL,
  `observacion` varchar(500) NOT NULL,
  PRIMARY KEY (`idmatricula`),
  KEY `fk_idalumno_matriculas` (`idalumno`),
  KEY `fk_idapoderado_matriculas` (`idapoderado`),
  KEY `fk_iddetalletaller_matriculas` (`iddetalletaller`),
  CONSTRAINT `fk_idalumno_matriculas` FOREIGN KEY (`idalumno`) REFERENCES `personas` (`idpersona`),
  CONSTRAINT `fk_idapoderado_matriculas` FOREIGN KEY (`idapoderado`) REFERENCES `personas` (`idpersona`),
  CONSTRAINT `fk_iddetalletaller_matriculas` FOREIGN KEY (`iddetalletaller`) REFERENCES `detalletaller` (`iddetalletaller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `matriculas` */

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `idpago` int(11) NOT NULL AUTO_INCREMENT,
  `idtaller` int(11) NOT NULL,
  `idmatricula` int(11) NOT NULL,
  `idformapago` int(11) NOT NULL,
  `monto` decimal(7,2) NOT NULL,
  `fechapago` datetime NOT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_idtaller_pagos` (`idtaller`),
  KEY `fk_idmatricula_matriculas` (`idmatricula`),
  KEY `fk_idformapago_pagos` (`idformapago`),
  CONSTRAINT `fk_idformapago_pagos` FOREIGN KEY (`idformapago`) REFERENCES `formaspago` (`idformapago`),
  CONSTRAINT `fk_idmatricula_matriculas` FOREIGN KEY (`idmatricula`) REFERENCES `matriculas` (`idmatricula`),
  CONSTRAINT `fk_idtaller_pagos` FOREIGN KEY (`idtaller`) REFERENCES `talleres` (`idtaller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pagos` */

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `sexo` char(1) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `fechaNac` date NOT NULL,
  `tipoDoc` varchar(10) NOT NULL,
  `numDoc` varchar(15) NOT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `uk_numDoc` (`numDoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

/*Table structure for table `talleres` */

DROP TABLE IF EXISTS `talleres`;

CREATE TABLE `talleres` (
  `idtaller` int(11) NOT NULL AUTO_INCREMENT,
  `idcurso` int(11) NOT NULL,
  `tipotaller` varchar(30) NOT NULL,
  `nivel` char(1) DEFAULT NULL,
  `precioregular` decimal(7,2) NOT NULL,
  PRIMARY KEY (`idtaller`),
  KEY `fk_idcurso_talleres` (`idcurso`),
  CONSTRAINT `fk_idcurso_talleres` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `talleres` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `nombreusuario` varchar(30) NOT NULL,
  `claveacceso` varchar(30) NOT NULL,
  `nivelacceso` char(1) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_idpersona_usuarios` (`idpersona`),
  CONSTRAINT `fk_idpersona_usuarios` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
