CREATE DATABASE DBOLYMPUS
USE DBOLYMPUS

CREATE TABLE Personas
(
	idpersona 	INT PRIMARY KEY AUTO_INCREMENT, 
	nombres		VARCHAR(30)		NOT NULL,
	apellidos	VARCHAR(30)		NOT NULL,
	sexo		CHAR(1)			NOT NULL, -- Masculino(M) - Femenino(F)
	telefono	VARCHAR(9) 		NOT NULL,
	correo		VARCHAR(30)		NOT NULL,
	direccion 	VARCHAR(30)		NOT NULL,
	fechaNac 	DATE 				NOT NULL,
	tipoDoc		VARCHAR(10)		NOT NULL,
	numDoc		VARCHAR(15)		NOT NULL,
	CONSTRAINT uk_numDoc UNIQUE (numDoc)
)ENGINE=INNODB;

ALTER TABLE Personas ADD CONSTRAINT uk_numDoc UNIQUE (numDoc);

SELECT * FROM Personas

CREATE TABLE Usuarios
(
	idusuario 		INT PRIMARY KEY AUTO_INCREMENT,
	idpersona 		INT 				NOT NULL,
	nombreusuario	VARCHAR(30) 	NOT NULL,
	claveacceso		VARCHAR(30)		NOT NULL,
	nivelacceso 	CHAR(1)			NOT NULL, -- Docente(D) - Administrador(A) - Estudiante(E)
	create_at		DATETIME 		NOT NULL DEFAULT NOW(),
	update_at 		DATETIME 		NULL,
	inactive_at 	DATETIME			NULL,
	CONSTRAINT fk_idpersona_usuarios FOREIGN KEY (idpersona) REFERENCES Personas (idpersona)
	
)ENGINE=INNODB;

CREATE TABLE Docentes 
(
	iddocente 		INT PRIMARY KEY AUTO_INCREMENT,
	idpersona		INT 				NOT NULL,
	especialidad	VARCHAR(30)		NOT NULL,
	cv 				VARCHAR(200)	NOT NULL,
	numEmergencia	VARCHAR(9)		NOT NULL,
	create_at		DATETIME 		NOT NULL DEFAULT NOW(),
	update_at 		DATETIME 		NULL,
	inactive_at 	DATETIME			NULL,
	CONSTRAINT fk_idpersona_docentes FOREIGN KEY (idpersona) REFERENCES Personas (idpersona)
	
)ENGINE=INNODB;

CREATE TABLE Matriculas
(
	idmatricula			INT PRIMARY KEY AUTO_INCREMENT,
	idalumno				INT NOT NULL,
	idapoderado			INT NOT NULL,
	iddetalletaller	INT NOT NULL,
	fechamatricula		DATETIME NOT NULL DEFAULT NOW(),
	precioacordado		DECIMAL(7,2)	NOT NULL,
	observacion			VARCHAR(500)		NOT NULL,
	CONSTRAINT fk_idalumno_matriculas FOREIGN KEY (idalumno) REFERENCES Personas (idpersona),
	CONSTRAINT fk_idapoderado_matriculas FOREIGN KEY (idapoderado)	REFERENCES Personas (idpersona),
	CONSTRAINT fk_iddetalletaller_matriculas FOREIGN KEY (iddetalletaller)	REFERENCES DetalleTaller (iddetalletaller)
)ENGINE=INNODB;


CREATE TABLE Pagos
(
	idpago 		INT PRIMARY KEY AUTO_INCREMENT,
	idtaller 	INT 				NOT NULL,
	idmatricula	INT 				NOT NULL,
	idformapago	INT 				NOT NULL,
	monto			DECIMAL(7,2)	NOT NULL,
	fechapago	DATETIME 		NOT NULL,
	CONSTRAINT fk_idtaller_pagos FOREIGN KEY (idtaller) REFERENCES Talleres (idtaller),
	CONSTRAINT fk_idmatricula_matriculas FOREIGN KEY (idmatricula)	REFERENCES Matriculas (idmatricula),
	CONSTRAINT fk_idformapago_pagos FOREIGN KEY (idformapago) REFERENCES Formaspago (idformapago)
)ENGINE=INNODB;

CREATE TABLE Formaspago
(
	idformapago 	INT PRIMARY KEY AUTO_INCREMENT,
	formapago		VARCHAR(30)		NOT NULL
)ENGINE= INNODB;

CREATE TABLE Talleres
(
	idtaller 			INT PRIMARY KEY AUTO_INCREMENT,
	idcurso				INT 				NOT NULL,
	tipotaller 			VARCHAR(30)		NOT NULL,
	nivel 				CHAR(1)			NULL,       -- Basico(B) - Intermedio(I) - Avanzado(A)
	precioregular 		DECIMAL(7,2)	NOT NULL,
	CONSTRAINT fk_idcurso_talleres FOREIGN KEY (idcurso) REFERENCES Cursos (idcurso)
)ENGINE=INNODB;

CREATE TABLE Cursos
(
	idcurso 			INT PRIMARY KEY AUTO_INCREMENT,
	nombrecurso 	VARCHAR(30)		NOT NULL
)ENGINE=INNODB;

CREATE TABLE DetalleTaller
(
	iddetalletaller	INT PRIMARY KEY AUTO_INCREMENT,
	idtaller 			INT 				NOT NULL,
	iddocente 			INT 				NOT NULL,
	denominacion		VARCHAR(30)		NOT NULL,
	fechainicio			DATETIME			NOT NULL,
	fechafin				DATETIME			NOT NULL,
	precio 				DECIMAL(7,2)	NOT NULL,
	horainicio			TIME 				NOT NULL,
	horafin				TIME 	 			NOT NULL,			
CONSTRAINT fk_idtaller_detalletaller FOREIGN KEY (idtaller) REFERENCES Cursos (idcurso),
CONSTRAINT fk_iddocente_detalletaller FOREIGN KEY (iddocente) REFERENCES Docentes (iddocente)
	
)ENGINE=INNODB;

-- Procedimientos almacenados PERSONAS

-- Registrar
DELIMITER $$
CREATE PROCEDURE spu_registrar_personas
(
	IN _nombres		VARCHAR(30),
	IN _apellidos	VARCHAR(30),
	IN _sexo			CHAR(1),
	IN _telefono 	VARCHAR(9),
	IN _correo		VARCHAR(30),
	IN _direccion	VARCHAR(30),
	IN _fechaNac	DATE,
	IN _tipoDoc		VARCHAR(10),
	IN _numDoc		VARCHAR(15)
)
BEGIN 
	INSERT INTO Personas (nombres, apellidos, sexo, telefono, correo, direccion, fechaNac, tipoDoc, numDoc) VALUES 
	(_nombres, _apellidos, _sexo, _telefono, _correo, _direccion, _fechaNac, _tipoDoc, _numDoc);
END $$

CALL spu_registrar_personas('Lucio', 'Medina Llanos', 'M', '970664419', 'lucio7329@gmail.com', 'Jr. Alva Maurtua #249', '17-10-2003', 'DNI', '71522420')
CALL spu_registrar_personas('Juan', 'Perez Manrrique', 'M', '987898767', 'juan23@gmail.com', 'Av. Mariscal Castilla', '15-11-2002', 'DNI', '44796538')
CALL spu_registrar_personas('Pedro', 'Sanchez Quispe', 'M', '976675276', 'pedro123@gmail.com', 'Calle Grau #234', '20-12-2004', 'DNI', '87654892')
CALL spu_registrar_personas('Sofia', 'Salazar Ramos', 'F', '987676545', 'sofia321@gmail.com', 'Av. Union #256', '10-09-2003', 'DNI', '58965874')


-- listar
DELIMITER $$
CREATE PROCEDURE spu_listar_personas()
BEGIN 
	SELECT * FROM Personas ORDER BY idpersona DESC;
END $$

CALL spu_listar_personas()

DELETE FROM Cursos WHERE idcurso = '1'


-- eliminar
DELIMITER $$
CREATE PROCEDURE spu_eliminar_personas
(
	IN _idpersona INT
)
BEGIN
	DELETE FROM Personas WHERE idpersona = _idpersona;
END $$

CALL spu_eliminar_personas(4)


-- obtener
DELIMITER $$
CREATE PROCEDURE spu_personas_obtener
(
	IN _idpersona INT
)
BEGIN
	SELECT * FROM Personas WHERE idpersona = _idpersona;
END $$

-- actualizar
DELIMITER $$
CREATE PROCEDURE spu_personas_actualizar
(
	IN _idpersona	INT,
	IN _nombres	VARCHAR(30),
	IN _apellidos	VARCHAR(30),
	IN _sexo	CHAR(1),
	IN _telefono	VARCHAR(9),
	IN _correo	VARCHAR(30),
	IN _direccion	VARCHAR(30),
	IN _fechaNac	VARCHAR(30),
	IN _tipoDoc	VARCHAR(10),
	IN _numDoc	VARCHAR(15)
)
BEGIN
	UPDATE Personas SET
		nombres = _nombres,
		apellidos = _apellidos,
		sexo = _sexo,
		telefono = _telefono,
		correo = _correo,
		direccion = _direccion,
		fechaNac = _fechaNac,
		tipoDoc = _tipoDoc,
		numDoc = _numDoc
	WHERE idpersona = _idpersona;
END $$



-- Procedimientos almacenados USUARIOS

DELIMITER $$
CREATE PROCEDURE spu_registrar_usuarios
(
	IN _idpersona 			INT,
	IN _nombreusuario 	VARCHAR(30),
	IN _claveacceso		VARCHAR(30),
	IN _nivelacceso		CHAR(1)
)
BEGIN 
	INSERT INTO Usuarios (idpersona, nombreusuario, claveacceso, nivelacceso) VALUES 
	(_idpersona, _nombreusuario, _claveacceso, _nivelacceso);
END $$

CALL spu_registrar_usuarios('3', 'Lucio Medina', 'lucio123', 'A')

SELECT * FROM Cursos WHERE estado = '1'

-- Procedimientos almacenados DOCENTES

INSERT INTO Docentes (idpersona, especialidad, cv, numEmergencia) VALUES ('5', 'Oratoria', 'https://sp-ao.shortpixel.ai/client/to_webp,q_lossy,ret_img,w_620,h_882/https://iculum.com/wp-content/uploads/2020/05/plantillas-de-curr%C3%ADculum-en-word-iCulum-6.jpg', '976767534')

INSERT INTO Cursos (nombrecurso) VALUES ('Oratoria')
INSERT INTO Cursos (nombrecurso) VALUES ('Matemática'), ('Liderazgo'), ('Reforzamiento escolar'), ('Dibujo')
SELECT * FROM Cursos
SELECT * FROM DetalleTaller
SELECT * FROM Talleres
SELECT * FROM Personas
SELECT * FROM Docentes
SELECT * FROM Matriculas


INSERT INTO Talleres (nombretaller, fechainicio, fechafin, precioregular) VALUES ('Reforzamiento escolar', '2024-01-01', '2024-03-31', 120.00)

DELETE FROM DetalleTaller WHERE iddetallemodulo = '1'

INSERT INTO Cursos (nombrecurso) VALUES ('Matemática'), ('Ciencias'), ('Letras y Humanidades'), ('Aptitud Académica')

INSERT INTO DetalleTaller (idtaller, idcurso, iddocente, dias, horainicio, horafin) VALUES ('4', '2', '1', 'Sábados', '08:00:00', '14:00:00')

INSERT INTO DetalleTaller (idtaller, idcurso, iddocente, dias, horainicio, horafin) VALUES ('4', '3', '2', 'Viernes y Sábados', '18:00:00', '20:00:00')

INSERT INTO Talleres (nombretaller, nivel, fechainicio, fechafin, precioregular) VALUES ('Oratoria y Liderazgo', 'I', '2024-01-01', '2024-01-01', 150.00)

INSERT INTO Docentes (idpersona, especialidad, cv, numEmergencia) VALUES ('4', 'Oratoria y Liderazgo', 'https://sp-ao.shortpixel.ai/client/to_webp,q_lossy,ret_img,w_621,h_868/https://iculum.com/wp-content/uploads/2020/05/plantillas-de-curr%C3%ADculum-en-word-iCulum-2.jpg', '906767345')

INSERT INTO Pagos (idtaller, idmatricula, idformapago, monto, fechapago) VALUES ()

INSERT INTO Formaspago (formapago) VALUES ('Yape')


-- Procedimientos almacenados MATRICULAS

-- REGISTRAR MATRICULAS

DELIMITER $$
CREATE PROCEDURE spu_registrar_matricula
(
	IN _idalumno 			INT,
	IN _idapoderado 		INT,
	IN _idtaller			INT,
	IN _precioacordado	DECIMAL(7,2),
	IN _observacion		VARCHAR(500)
)
BEGIN
	INSERT INTO Matriculas(idalumno, idapoderado, idtaller, precioacordado, observacion) VALUES (_idalumno, _idapoderado, _idtaller, _precioacordado, _observacion);
END $$

CALL spu_registrar_matricula(6, 4, 4, 120.00, 'Se necesita apoyo en tareas')

DELETE FROM matriculas WHERE idmatricula = 3

-- LISTAR MATRICULAS
DELIMITER $$
CREATE PROCEDURE spu_listar_matricula()
BEGIN
	SELECT
    M.idmatricula,
    A.nombres AS estudiante,
    P.nombres AS apoderado,
    T. AS taller
FROM
    Matriculas AS M
INNER JOIN
    Personas AS A ON M.idalumno = A.idpersona
INNER JOIN
    Personas AS P ON M.idapoderado = P.idpersona
INNER JOIN
	 detalletaller AS T ON M.iddetalletaller = T.;
	   
	   

-- Procedimientos almacenados MATRICULAS

DELIMITER $$
CREATE PROCEDURE spu_registrar_matriculas
(
	IN _
)

SELECT * FROM personas
