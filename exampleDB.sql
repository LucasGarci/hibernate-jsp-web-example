drop database if exists academia;
CREATE DATABASE academia;
USE academia;

/* TABLA USER */

CREATE TABLE user(
  name varchar(30) NOT NULL,
  passw varchar(80) NOT NULL,
  role varchar(5) NOT NULL,
  PRIMARY KEY (name)
);

/* INSERT USER */

INSERT INTO user (name, passw, role) VALUES ('user','04F8996DA763B7A969B1028EE3007569EAF3A635486DDAB211D512C85B9DF8FB','user');
INSERT INTO user (name, passw, role) VALUES ('admin','8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918','admin');

/* TABLA GASTOS */

CREATE TABLE gastos(
  idGastos INT NOT NULL AUTO_INCREMENT,
  importe float (7,2) NOT NULL,
  fecha timestamp default localtime,
  concepto varchar(50) NOT NULL,
  descripcion varchar(200) default NULL,
  formapago varchar(20) default NULL,
  PRIMARY KEY (idGastos)
);

/* INSERT GASTOS */

INSERT INTO gastos (importe, concepto, descripcion, formapago) VALUES (115.95, '2 Mensualidades + Matricula', 'Se le ha rebajado un 15% por apuntarse con un amigo', 'Efectivo' );
UPDATE `academia`.`gastos` SET `concepto`='Fotocupiadora Nueva', `descripcion`='Comprada en Mediamark' WHERE `idGastos`='1';
INSERT INTO gastos (importe, concepto, descripcion, formapago) VALUES (22.95, 'Agua Enero', 'Emasesa', 'Domiciliado' );
INSERT INTO gastos (importe, concepto, descripcion, formapago) VALUES (77.15, 'Luz Enero', 'Endesa', 'Domiciliado' );
INSERT INTO gastos (importe, concepto, descripcion, formapago) VALUES (675.50, 'Nomina Diciembre Jose Luis', 'Incluidas las 4h extras ', 'Transferencia' );

/* TABLA CLASE */

CREATE TABLE clase(
  idClase INT NOT NULL AUTO_INCREMENT,
  capacidad INT default NULL,
  nombreclase varchar(30) default NULL,
  PRIMARY KEY (idClase)
);

/* INSERT CLASE */

INSERT INTO clase (capacidad, nombreclase) VALUES (12, 'Infantiles (Mobiliario Rojo)' );
INSERT INTO clase (capacidad, nombreclase) VALUES (15, 'P2 (Ordenadores)' );
INSERT INTO clase (capacidad, nombreclase) VALUES (15, 'P2 (Ordenadores Nueva)' );

/* TABLA PERSONAL */

CREATE TABLE personal(
  DNIPersonal varchar(9) NOT NULL unique,
  nombre varchar(40) NOT NULL,
  apellidos varchar(80) NOT NULL,
  fechnac timestamp NOT NULL,
  nacionalidad varchar(40) default NULL,
  email varchar(40) default NULL,
  direccion varchar(80) default NULL,
  codpostal INT(5) default NULL,
  telefonofijo INT(9) default NULL,
  telefonopersonal INT(9) NOT NULL,
  telefonofamiliar INT(9) default NULL,
  tipo varchar(30) default NULL,
  sueldo float (7,2) default NULL,
  cuentabancaria varchar(24) NOT NULL,
  PRIMARY KEY (DNIPersonal)
);

/* INSERT PERSONAL */

INSERT INTO personal (DNIPersonal, nombre, apellidos, fechnac, nacionalidad,email,direccion,codpostal,telefonofijo,telefonopersonal,telefonofamiliar,tipo,sueldo,cuentabancaria) VALUES ('11112222h', 'Jose Luis', 'Sanchez', '1990-02-19 21:30:50', 'Spain','emple@hotmail.com','C/Buenasvista 12',41015,955665544,666555444,666333111,'Profesor', 1090.50,'123asd123asd123asd123asd' );
INSERT INTO personal (DNIPersonal, nombre, apellidos, fechnac, nacionalidad,email,direccion,codpostal,telefonofijo,telefonopersonal,telefonofamiliar,tipo,sueldo,cuentabancaria) VALUES ('22223333k', 'Jose Antonio', 'Perez', '1991-03-22 21:30:50', 'Spain','emple2@hotmail.com','C/Salvador 16',41015,955668899,666555444,666555444,'Profesor', 1040.50,'234lkj234lkj234lkj234lkj' );
INSERT INTO personal (DNIPersonal, nombre, apellidos, fechnac, nacionalidad,email,direccion,codpostal,telefonofijo,telefonopersonal,telefonofamiliar,tipo,sueldo,cuentabancaria) VALUES ('33334444h', 'Miguel', 'Rodriguez', '1988-04-11 21:30:50', 'Spain','emple3@hotmail.com','C/Santa Maria 66',41500,999555666,666000111,666000111,'Limpiador', 1190.50,'555iii555iii555iii555iii' );

/* TABLA GRUPO */

CREATE TABLE grupo (
  idGrupo INT NOT NULL AUTO_INCREMENT,
  IDClase INT NOT NULL,
  IDProfesor varchar(9) NOT NULL,
  nombre varchar(40) NOT NULL,
  nivel varchar(40) NOT NULL,
  PRIMARY KEY (idGrupo),
  FOREIGN KEY (IDClase) REFERENCES clase (idClase) ,
  FOREIGN KEY (IDProfesor) REFERENCES personal (DNIPersonal)
);

/* INSERT GRUPO */

INSERT INTO grupo (IDClase, IDProfesor,nombre,nivel) VALUES ( 1,'11112222h', 'Grupo de niños', 'B1 Inglés' );
INSERT INTO grupo (IDClase, IDProfesor,nombre,nivel) VALUES ( 2,'22223333k', 'Grupo de mayores', 'B2 Inglés' );
INSERT INTO grupo (IDClase, IDProfesor,nombre,nivel) VALUES ( 1,'22223333k', 'Grupo de Salesianas', 'B2 Inglés' );
INSERT INTO grupo (IDClase, IDProfesor,nombre,nivel) VALUES ( 2,'11112222h', 'Grupo de Speakin', 'B2 Francés' );

/* TABLA ALUMNO */

CREATE TABLE alumno (
  DNIAlumno varchar(9) NOT NULL,
  IDGrupo INT NOT NULL,
  nombre varchar(40) NOT NULL,
  apellidos varchar(80) NOT NULL,
  fechnac timestamp NOT NULL,
  nacionalidad varchar(40) default NULL,
  email varchar(40) default NULL,
  fechaingreso timestamp default localtime,
  telefonopersonal INT(9) NOT NULL,
  direccion varchar(80) default NULL,
  codpostal INT(5) default NULL,
  telefonofijo INT(9) NOT NULL,
  nombrefamiliar varchar(40) default NULL,
  apellidofamiliar varchar(80) default NULL,
  telefonofamiliar INT(9) default NULL,
  emailfamiliar varchar(40) default NULL,
  PRIMARY KEY (DNIAlumno),
  FOREIGN KEY (IDGrupo) REFERENCES grupo (idGrupo)
);

/* INSERT ALUMNO */

INSERT INTO alumno (DNIAlumno, IDGrupo, nombre, apellidos, fechnac, nacionalidad, email, telefonopersonal, direccion, codpostal, telefonofijo, nombrefamiliar, apellidofamiliar,telefonofamiliar, emailfamiliar)
VALUES ( '11112222a', 1,'Antonio', 'Fernandez Valle', '1990-02-19 21:30:50', 'Spain','miemail@gmail.com', 666444555,'C/ Cristaleros', 41015, 955862159, 'Jose Manuel', 'Barbosa Espinosa', 661547854, 'barbosaesponjosa@outlook.es' );
INSERT INTO alumno (DNIAlumno, IDGrupo, nombre, apellidos, fechnac, nacionalidad, email, telefonopersonal, direccion, codpostal, telefonofijo, nombrefamiliar, apellidofamiliar,telefonofamiliar, emailfamiliar)
VALUES ( '00001111p', 2,'Miguel', 'Guzman Angelo', '1995-09-22 21:30:50', 'Spain','miguelon@gmail.com', 666555999,'C/ Buenasvista Dos Hermanas', 41015, 955862159, 'Andrea', 'Apellido Apellido', 666000111, 'micorreo2@outlook.es' );
INSERT INTO alumno (DNIAlumno, IDGrupo, nombre, apellidos, fechnac, nacionalidad, email, telefonopersonal, direccion, codpostal, telefonofijo, nombrefamiliar, apellidofamiliar,telefonofamiliar, emailfamiliar)
VALUES ( '00002222p', 2,'Maria', 'Guzman Angelo', '1995-09-22 21:30:50', 'Spain','mariana@gmail.com', 777555999,'C/ Buenasvista Dos Hermanas', 41015, 955862159, 'Andrea', 'Apellido Apellido', 666000111, 'micorreo2@outlook.es' );
INSERT INTO alumno (DNIAlumno, IDGrupo, nombre, apellidos, fechnac, nacionalidad, email, telefonopersonal, direccion, codpostal, telefonofijo, nombrefamiliar, apellidofamiliar,telefonofamiliar, emailfamiliar)
VALUES ( '33332222i', 1,'Luis', 'Sanchez Castillo', '1993-11-21 21:30:50', 'Spain','Luisan@gmail.com', 777555999,'C/ Buenasvista Dos Hermanas', 41015, 955862159, 'Andrea', 'AndresCastillo', 666000111, 'micorreo2@outlook.com' );

/* TABLA MATRICULA */

CREATE TABLE matricula (
  idMatricula INT NOT NULL AUTO_INCREMENT,
  DNIalumno varchar(9) NOT NULL,
  fechmatriculacion timestamp default localtime,
  precio float (5,2) NOT NULL,
  PRIMARY KEY  (idMatricula),
  FOREIGN KEY (DNIalumno) REFERENCES alumno (DNIAlumno) ON DELETE CASCADE
);

/* INSERT MATRICULA */

INSERT INTO matricula (DNIalumno, precio) VALUES ( '11112222a',50);
INSERT INTO matricula (DNIalumno, precio) VALUES ( '11112222a',25);
INSERT INTO matricula (DNIalumno, precio) VALUES ( '00002222p',50);

/* TABLA INGRESOS */

CREATE TABLE ingresos(
  idIngresos INT NOT NULL AUTO_INCREMENT,
  importe float (7,2) NOT NULL,
  concepto varchar(60) NOT NULL,
  fecha timestamp default localtime,
  descripcion varchar(200) default NULL,
  formapago varchar(20) default NULL,
  PRIMARY KEY (idIngresos)
);

/* INSERT INGRESOS */

INSERT INTO ingresos (importe, concepto, descripcion, formapago) VALUES ( 50,'Pago Matricula','Pago de la matricula','Efectivo');
INSERT INTO ingresos (importe, concepto, descripcion, formapago) VALUES ( 25,'Pago Matricula','Pago de la matricula','Efectivo');
INSERT INTO ingresos (importe, concepto, descripcion, formapago) VALUES ( 50,'Pago Matricula','Pago de la matricula','Tarjeta');

/* TABLA MATRICULAS ANTIGUAS */

CREATE TABLE matriculasantiguas (
  idMatricula INT NOT NULL,
  DNIalumno varchar(9) NOT NULL,
  fechmatriculacion timestamp,
  precio float (5,2) NOT NULL,
  PRIMARY KEY  (idMatricula),
  FOREIGN KEY (DNIalumno) REFERENCES alumno (DNIAlumno) ON DELETE CASCADE
);

/* FUNCION MOVER MATRICULAS ANTIGUAS */

DELIMITER $$
CREATE EVENT IF NOT EXISTS guardarmatriculas
ON SCHEDULE EVERY 1 YEAR
STARTS "2018-09-01" ENABLE
DO
BEGIN
INSERT INTO matriculasantiguas
SELECT * FROM matricula;
DELETE FROM matricula;
END; $$

/* FUNCION ELIMINAR MATRICULAS ANTERIORES A 4 AÑOS */

DELIMITER $$
CREATE EVENT IF NOT EXISTS eliminarmatriculasantiguas
ON SCHEDULE EVERY 7 DAY
DO
BEGIN
DELETE FROM matriculasantiguas
WHERE matriculasantiguas.fechmatriculacion < DATE_SUB(NOW(), INTERVAL 4 YEAR);
END; $$

/* TABLA DE INGRESOS ANTIGUOS */

CREATE TABLE ingresosAntiguos(
  idIngresos INT NOT NULL ,
  importe float (7,2) NOT NULL,
  concepto varchar(60) NOT NULL,
  fecha timestamp default localtime,
  descripcion varchar(200) default NULL,
  formapago varchar(20) default NULL,
  PRIMARY KEY (idIngresos)
);

/* EVENTO guardarIngresos NOS GUARDA LOS INGRESOS DEL MES PASADO*/

DELIMITER $$
CREATE EVENT IF NOT EXISTS guardarIngresos
ON SCHEDULE EVERY 1 MONTH
STARTS "2018-02-02" ENABLE
DO
BEGIN
INSERT INTO ingresosAntiguos
SELECT * FROM ingresos
WHERE ingresos.fecha < DATE_SUB(NOW(), INTERVAL 1 DAY);
DELETE FROM ingresos
WHERE ingresos.fecha < DATE_SUB(NOW(), INTERVAL 1 DAY);
END; $$

/* FUNCION ELIMINAR INGRESOS ANTERIORES A 4 AÑOS */

DELIMITER $$
CREATE EVENT IF NOT EXISTS eliminarIngresosAntiguos
ON SCHEDULE EVERY 7 DAY
DO
BEGIN
DELETE FROM ingresosAntiguos
WHERE ingresosAntiguos.fecha < DATE_SUB(NOW(), INTERVAL 4 YEAR);
END; $$


/* TABLA DE GASTOS ANTIGUOS */

CREATE TABLE gastosAntiguos(
  idGastos INT NOT NULL ,
  importe float (7,2) NOT NULL,
  fecha timestamp default localtime,
  concepto varchar(50) NOT NULL,
  descripcion varchar(200) default NULL,
  formapago varchar(20) default NULL,
  PRIMARY KEY (idGastos)
);

/* EVENTO guardarGastos NOS GUARDA LOS GASTOS DEL MES PASADO*/

DELIMITER $$
CREATE EVENT IF NOT EXISTS guardarGastos
ON SCHEDULE EVERY 1 MONTH
STARTS "2018-02-02" ENABLE
DO
BEGIN
INSERT INTO gastosAntiguos
SELECT * FROM gastos
WHERE gastos.fecha < DATE_SUB(NOW(), INTERVAL 1 DAY);
DELETE FROM gastos
WHERE gastos.fecha < DATE_SUB(NOW(), INTERVAL 1 DAY);
END; $$

/* FUNCION ELIMINAR GASTOS ANTERIORES A 4 AÑOS */

DELIMITER $$
CREATE EVENT IF NOT EXISTS eliminarGastosAntiguos
ON SCHEDULE EVERY 7 DAY
DO
BEGIN
DELETE FROM gastosAntiguos
WHERE gastosAntiguos.fecha < DATE_SUB(NOW(), INTERVAL 4 YEAR);
END; $$

/* QHQL QUERYS */

/* select sum(g.importe) from Gastos g*/
/* select avg(g.importe) from Gastos g */
/* select sum(i.importe) from Ingresos i*/
/* select avg(i.importe) from Ingresos i*/
