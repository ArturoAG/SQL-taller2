/*
Navicat MySQL Data Transfer

Source Server         : sql
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : 300gym

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2016-11-30 12:48:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aparatos
-- ----------------------------
DROP TABLE IF EXISTS `aparatos`;
CREATE TABLE `aparatos` (
  `id_aparato` int(11) NOT NULL,
  `tipo_aparato` varchar(30) NOT NULL,
  `cantidad_aparato` int(6) NOT NULL,
  `precio_aparato` float NOT NULL,
  `nombre_aparato` varchar(40) NOT NULL,
  `proveedor_aparato` varchar(40) NOT NULL,
  `observaciones_aparato` varchar(300) NOT NULL,
  PRIMARY KEY (`id_aparato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `id_categoria` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for clasificacion
-- ----------------------------
DROP TABLE IF EXISTS `clasificacion`;
CREATE TABLE `clasificacion` (
  `id_clasificacion` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_clasificacion` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_clasificacion`),
  KEY `FK_CAT` (`id_categoria`),
  CONSTRAINT `FK_CAT` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for competencia
-- ----------------------------
DROP TABLE IF EXISTS `competencia`;
CREATE TABLE `competencia` (
  `id_Competencia` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre_competencia` varchar(100) NOT NULL,
  `nombre_sede_competencia` varchar(100) NOT NULL,
  `direccion_Sede` varchar(100) NOT NULL,
  `fecha_Inicio_Competencia` date NOT NULL,
  `fecha_Fin_Competencia` date NOT NULL,
  `costo_Inscripcion_competencia` float NOT NULL,
  PRIMARY KEY (`id_Competencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for competidor
-- ----------------------------
DROP TABLE IF EXISTS `competidor`;
CREATE TABLE `competidor` (
  `Id_Competidor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_competidor` varchar(100) NOT NULL,
  `fecha_nacimiento_competidor` date NOT NULL,
  `genero_Competidor` varchar(1) NOT NULL,
  `telefono_competidor` int(13) NOT NULL,
  `peso_competidor` float NOT NULL,
  `estatura_competidor` float NOT NULL,
  `email_competidor` varchar(100) NOT NULL,
  `id_Competencia` int(11) NOT NULL,
  `fkidCategoria` int(10) NOT NULL,
  `fkidClasificacion` int(10) NOT NULL,
  PRIMARY KEY (`Id_Competidor`),
  KEY `id_Competencia` (`id_Competencia`),
  KEY `categoria_fk` (`fkidCategoria`),
  KEY `clasificacion_fk` (`fkidClasificacion`),
  CONSTRAINT `clasificacion_fk` FOREIGN KEY (`fkidClasificacion`) REFERENCES `clasificacion` (`id_clasificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `categoria_fk` FOREIGN KEY (`fkidCategoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `competidor_ibfk_1` FOREIGN KEY (`id_Competencia`) REFERENCES `competencia` (`id_Competencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for contenido
-- ----------------------------
DROP TABLE IF EXISTS `contenido`;
CREATE TABLE `contenido` (
  `repeticiones` int(2) NOT NULL,
  `ID_Rutina` varchar(4) NOT NULL,
  `ID_Ejercicio` varchar(4) NOT NULL,
  `series` int(2) NOT NULL,
  KEY `ID_Rutina` (`ID_Rutina`),
  KEY `ID_Ejercicio` (`ID_Ejercicio`),
  CONSTRAINT `contenido_ibfk_1` FOREIGN KEY (`ID_Rutina`) REFERENCES `rutina` (`ID_Rutina`),
  CONSTRAINT `contenido_ibfk_2` FOREIGN KEY (`ID_Ejercicio`) REFERENCES `ejercicio` (`ID_Ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dietas
-- ----------------------------
DROP TABLE IF EXISTS `dietas`;
CREATE TABLE `dietas` (
  `ID_dieta` int(11) NOT NULL AUTO_INCREMENT,
  `peso_socio` float NOT NULL,
  `estatura_socio` float NOT NULL,
  `indice_Masa_Corporal_socio` float NOT NULL,
  `descripcion_dieta_socio` varchar(1000) NOT NULL,
  `actividad_Fisica_socio` varchar(15) NOT NULL,
  `fecha_Asignacion_dieta` date NOT NULL,
  PRIMARY KEY (`ID_dieta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ejercicio
-- ----------------------------
DROP TABLE IF EXISTS `ejercicio`;
CREATE TABLE `ejercicio` (
  `ID_Ejercicio` varchar(4) NOT NULL,
  `nombre_ejercicio` varchar(25) NOT NULL,
  PRIMARY KEY (`ID_Ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for entrenador
-- ----------------------------
DROP TABLE IF EXISTS `entrenador`;
CREATE TABLE `entrenador` (
  `id_Entrenador` int(2) NOT NULL,
  `Nombre_Entrenador` varchar(60) NOT NULL,
  `Fecha_nacimineto_entrenador` date NOT NULL,
  `Direccion_entrenador` varchar(100) NOT NULL,
  `Telefono_entrenador` varchar(13) NOT NULL,
  `sexo_entrenador` int(11) NOT NULL,
  `Experiencia_entrenador` varchar(1000) NOT NULL,
  `Certificaciones_entrenador` varchar(500) NOT NULL,
  `turno_entrenador` varchar(10) NOT NULL,
  `fecha_ingreso_entrenador` date NOT NULL,
  `Fotografia_entrenador` longblob NOT NULL,
  PRIMARY KEY (`id_Entrenador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for membresia
-- ----------------------------
DROP TABLE IF EXISTS `membresia`;
CREATE TABLE `membresia` (
  `id_membresia` int(10) NOT NULL,
  `tipo_disciplina` varchar(15) NOT NULL,
  `estado_membresia` varchar(8) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  PRIMARY KEY (`id_membresia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for pago_membresia
-- ----------------------------
DROP TABLE IF EXISTS `pago_membresia`;
CREATE TABLE `pago_membresia` (
  `folio_pago` int(5) NOT NULL,
  `ID_socio` varchar(9) NOT NULL,
  `fecha_pago` date NOT NULL,
  `tipo_unidades_pago` varchar(10) NOT NULL,
  `cantidad_unidades_pago` int(4) NOT NULL,
  `costo_unitario_pago` float NOT NULL,
  `importe_pago` float NOT NULL,
  PRIMARY KEY (`folio_pago`),
  KEY `ID_socio` (`ID_socio`),
  CONSTRAINT `pago_membresia_ibfk_1` FOREIGN KEY (`ID_socio`) REFERENCES `socio` (`ID_Socio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `Id_proveedor` int(6) NOT NULL,
  `nombre_Proveedor` varchar(30) NOT NULL,
  `Direccion_Proveedor` varchar(30) NOT NULL,
  `Sitio_Proveedor` varchar(60) NOT NULL,
  `Telefono_Proveedor` int(13) NOT NULL,
  PRIMARY KEY (`Id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for rutina
-- ----------------------------
DROP TABLE IF EXISTS `rutina`;
CREATE TABLE `rutina` (
  `ID_Rutina` varchar(4) NOT NULL,
  `Nombre_rutina` varchar(25) NOT NULL,
  `numero_sesiones_faltantes_rutina` int(12) NOT NULL,
  PRIMARY KEY (`ID_Rutina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for rutina_signada
-- ----------------------------
DROP TABLE IF EXISTS `rutina_signada`;
CREATE TABLE `rutina_signada` (
  `ID_Rutina` varchar(4) NOT NULL,
  `ID_socio` varchar(9) NOT NULL,
  KEY `FK_Rutina` (`ID_Rutina`),
  KEY `FK_Socio` (`ID_socio`),
  CONSTRAINT `FK_Rutina` FOREIGN KEY (`ID_Rutina`) REFERENCES `rutina` (`ID_Rutina`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Socio` FOREIGN KEY (`ID_socio`) REFERENCES `socio` (`ID_Socio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for socio
-- ----------------------------
DROP TABLE IF EXISTS `socio`;
CREATE TABLE `socio` (
  `ID_Socio` varchar(9) NOT NULL,
  `Nombre_Socio` varchar(60) NOT NULL,
  `Telefono_socio` varchar(13) NOT NULL,
  `Correo_socio` varchar(100) NOT NULL,
  `Genero_socio` varchar(1) NOT NULL,
  `Fecha_nacimiento_socio` date NOT NULL,
  `Estado_salud_socio` varchar(40) NOT NULL,
  `Notas_socio` varchar(40) NOT NULL,
  `Fecha_registro` date NOT NULL,
  PRIMARY KEY (`ID_Socio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for suplementos
-- ----------------------------
DROP TABLE IF EXISTS `suplementos`;
CREATE TABLE `suplementos` (
  `Id_suplemento` int(6) NOT NULL,
  `Nombre_Suplemento` varchar(15) NOT NULL,
  `Precio_Venta_suplemento` DOUBLE NOT NULL,
  `Precio_Compra_suplemento` DOUBLE NOT NULL,
  `Existencias_suplemento` int(3) NOT NULL,
  `Descripcion_suplemento` varchar(30) NOT NULL,
  `Id_Proveedor` int(11) NOT NULL,
  PRIMARY KEY (`Id_suplemento`),
  KEY `Id_Proveedor` (`Id_Proveedor`),
  CONSTRAINT `suplementos_ibfk_1` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedor` (`Id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `nivelusuario` int(11) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL,
  `contrasena_usuario` varchar(10) NOT NULL,
  PRIMARY KEY (`nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for venta
-- ----------------------------
DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta` (
  `id_venta` int(6) NOT NULL,
  `fecha_compra_suplemento` date NOT NULL,
  `cantidad_suplemento` int(5) NOT NULL,
  `importe_suplemento` DOUBLE NOT NULL,
  `Id_suplemento` int(6) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `Id_suplemento` (`Id_suplemento`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`Id_suplemento`) REFERENCES `suplementos` (`Id_suplemento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for visita
-- ----------------------------
DROP TABLE IF EXISTS `visita`;
CREATE TABLE `visita` (
  `id_visita` int(11) NOT NULL,
  `ID_Socio` varchar(9) NOT NULL,
  `fecha_visita` date NOT NULL,
  `Hora_Entrada_Visita` varchar(5) NOT NULL,
  PRIMARY KEY (`id_visita`),
  KEY `ID_Socio` (`ID_Socio`),
  CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`ID_Socio`) REFERENCES `socio` (`ID_Socio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
