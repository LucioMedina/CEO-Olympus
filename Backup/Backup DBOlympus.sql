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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cursos` */

insert  into `cursos`(`idcurso`,`nombrecurso`) values 
(2,'Matemática'),
(3,'Ciencias'),
(4,'Letras y Humanidades'),
(5,'Aptitud Académica');

/*Table structure for table `detalletaller` */

DROP TABLE IF EXISTS `detalletaller`;

CREATE TABLE `detalletaller` (
  `iddetalletaller` int(11) NOT NULL AUTO_INCREMENT,
  `idtaller` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `iddocente` int(11) NOT NULL,
  `dias` varchar(30) NOT NULL,
  `horainicio` time NOT NULL,
  `horafin` time NOT NULL,
  PRIMARY KEY (`iddetalletaller`),
  KEY `fk_idmodelo_detallemodulo` (`idtaller`),
  KEY `fk_idcurso_detallemodulo` (`idcurso`),
  KEY `fk_iddocente_detallemodulo` (`iddocente`),
  CONSTRAINT `fk_idcurso_detallemodulo` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`idcurso`),
  CONSTRAINT `fk_iddocente_detallemodulo` FOREIGN KEY (`iddocente`) REFERENCES `docentes` (`iddocente`),
  CONSTRAINT `fk_idmodelo_detallemodulo` FOREIGN KEY (`idtaller`) REFERENCES `talleres` (`idtaller`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalletaller` */

insert  into `detalletaller`(`iddetalletaller`,`idtaller`,`idcurso`,`iddocente`,`dias`,`horainicio`,`horafin`) values 
(2,4,2,1,'Sábados','08:00:00','14:00:00'),
(3,4,3,2,'Viernes y Sábados','18:00:00','20:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `docentes` */

insert  into `docentes`(`iddocente`,`idpersona`,`especialidad`,`cv`,`numEmergencia`,`create_at`,`update_at`,`inactive_at`) values 
(1,5,'Oratoria','https://sp-ao.shortpixel.ai/client/to_webp,q_lossy,ret_img,w_620,h_882/https://iculum.com/wp-content/uploads/2020/05/plantillas-de-curr%C3%ADculum-en-word-iCulum-6.jpg','976767534','2023-09-14 09:40:04',NULL,NULL),
(2,4,'Oratoria y Liderazgo','https://sp-ao.shortpixel.ai/client/to_webp,q_lossy,ret_img,w_621,h_868/https://iculum.com/wp-content/uploads/2020/05/plantillas-de-curr%C3%ADculum-en-word-iCulum-2.jpg','906767345','2023-09-14 15:18:21',NULL,NULL);

/*Table structure for table `formaspago` */

DROP TABLE IF EXISTS `formaspago`;

CREATE TABLE `formaspago` (
  `idformapago` int(11) NOT NULL AUTO_INCREMENT,
  `formapago` varchar(30) NOT NULL,
  PRIMARY KEY (`idformapago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `formaspago` */

/*Table structure for table `listaalumnos` */

DROP TABLE IF EXISTS `listaalumnos`;

CREATE TABLE `listaalumnos` (
  `idlistaalumno` int(11) NOT NULL AUTO_INCREMENT,
  `iddetallemodulo` int(11) NOT NULL,
  PRIMARY KEY (`idlistaalumno`),
  KEY `fk_iddetallemodulo_listaalumnos` (`iddetallemodulo`),
  CONSTRAINT `fk_iddetallemodulo_listaalumnos` FOREIGN KEY (`iddetallemodulo`) REFERENCES `detalletaller` (`iddetalletaller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `listaalumnos` */

/*Table structure for table `matriculas` */

DROP TABLE IF EXISTS `matriculas`;

CREATE TABLE `matriculas` (
  `idmatricula` int(11) NOT NULL AUTO_INCREMENT,
  `idalumno` int(11) NOT NULL,
  `idapoderado` int(11) NOT NULL,
  `idmodulo` int(11) NOT NULL,
  `fechamatricula` datetime NOT NULL DEFAULT current_timestamp(),
  `precioacordado` decimal(7,2) NOT NULL,
  `observacion` varchar(30) NOT NULL,
  PRIMARY KEY (`idmatricula`),
  KEY `fk_idalumno_matriculas` (`idalumno`),
  KEY `fk_idapoderado_matriculas` (`idapoderado`),
  KEY `fk_idmodulo_matriculas` (`idmodulo`),
  CONSTRAINT `fk_idalumno_matriculas` FOREIGN KEY (`idalumno`) REFERENCES `personas` (`idpersona`),
  CONSTRAINT `fk_idapoderado_matriculas` FOREIGN KEY (`idapoderado`) REFERENCES `personas` (`idpersona`),
  CONSTRAINT `fk_idmodulo_matriculas` FOREIGN KEY (`idmodulo`) REFERENCES `talleres` (`idtaller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `matriculas` */

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `idpago` int(11) NOT NULL AUTO_INCREMENT,
  `idmodulo` int(11) NOT NULL,
  `idmatricula` int(11) NOT NULL,
  `idformapago` int(11) NOT NULL,
  `monto` decimal(7,2) NOT NULL,
  `fechapago` datetime NOT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_idmodulo_pagos` (`idmodulo`),
  KEY `fk_idmatricula_pagos` (`idmatricula`),
  KEY `fk_idformapago_pagos` (`idformapago`),
  CONSTRAINT `fk_idformapago_pagos` FOREIGN KEY (`idformapago`) REFERENCES `formaspago` (`idformapago`),
  CONSTRAINT `fk_idmatricula_pagos` FOREIGN KEY (`idmatricula`) REFERENCES `matriculas` (`idmatricula`),
  CONSTRAINT `fk_idmodulo_pagos` FOREIGN KEY (`idmodulo`) REFERENCES `talleres` (`idtaller`)
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
  `fechaNac` varchar(30) NOT NULL,
  `tipoDoc` varchar(10) NOT NULL,
  `numDoc` varchar(15) NOT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`nombres`,`apellidos`,`sexo`,`telefono`,`correo`,`direccion`,`fechaNac`,`tipoDoc`,`numDoc`) values 
(3,'Lucio','Medina Llanos','M','970664419','lucio7329@gmail.com','Jr. Alva Maurtua #249','17-10-2003','DNI','71522420'),
(4,'Juan','Perez Manrrique','M','987898767','juan23@gmail.com','Av. Mariscal Castilla','15-11-2002','DNI','44796538'),
(5,'Pedro','Sanchez Quispe','M','976675276','pedro123@gmail.com','Calle Grau #234','20-12-2004','DNI','87654892'),
(6,'Sofia','Salazar Ramos','F','987676545','sofia321@gmail.com','Av. Union #256','10-09-2003','DNI','58965874');

/*Table structure for table `talleres` */

DROP TABLE IF EXISTS `talleres`;

CREATE TABLE `talleres` (
  `idtaller` int(11) NOT NULL AUTO_INCREMENT,
  `nombretaller` varchar(30) DEFAULT NULL,
  `nivel` char(1) DEFAULT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date NOT NULL,
  `precioregular` decimal(7,2) NOT NULL,
  `preciopromocional` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`idtaller`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `talleres` */

insert  into `talleres`(`idtaller`,`nombretaller`,`nivel`,`fechainicio`,`fechafin`,`precioregular`,`preciopromocional`) values 
(4,'Reforzamiento escolar',NULL,'2024-01-01','2024-03-31',120.00,NULL),
(5,'Oratoria y Liderazgo','B','2024-01-01','2024-01-01',130.00,NULL),
(6,'Oratoria y Liderazgo','I','2024-01-01','2024-01-01',150.00,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`nombreusuario`,`claveacceso`,`nivelacceso`,`create_at`,`update_at`,`inactive_at`) values 
(1,3,'Lucio Medina','lucio123','A','2023-09-14 09:38:35',NULL,NULL);

/* Procedure structure for procedure `spu_listar_personas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_personas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_personas`()
BEGIN 
	SELECT * FROM Personas order by idpersona desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_personas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_personas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_personas`(
	in _nombres		varchar(30),
	in _apellidos	varchar(30),
	in _sexo			char(1),
	in _telefono 	varchar(9),
	in _correo		varchar(30),
	in _direccion	varchar(30),
	in _fechaNac	varchar(30),
	in _tipoDoc		varchar(10),
	in _numDoc		varchar(15)
)
begin 
	insert into Personas (nombres, apellidos, sexo, telefono, correo, direccion, fechaNac, tipoDoc, numDoc) values 
	(_nombres, _apellidos, _sexo, _telefono, _correo, _direccion, _fechaNac, _tipoDoc, _numDoc);
end */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_usuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_usuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_usuarios`(
	in _idpersona 			int,
	in _nombreusuario 	varchar(30),
	in _claveacceso		varchar(30),
	in _nivelacceso		char(1)
)
begin 
	insert into Usuarios (idpersona, nombreusuario, claveacceso, nivelacceso) values 
	(_idpersona, _nombreusuario, _claveacceso, _nivelacceso);
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
