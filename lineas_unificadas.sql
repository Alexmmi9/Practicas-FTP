-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla prueba.lineas_unificadas
CREATE TABLE IF NOT EXISTS `lineas_unificadas` (
  `idLineaUnificada` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipoOrigen` varchar(50) NOT NULL,
  `idOrigen` bigint(20) NOT NULL,
  `idLineas_rma` bigint(20) DEFAULT NULL,
  `NPedido` int(11) DEFAULT NULL,
  `rma` varchar(100) DEFAULT NULL,
  `CMMF` varchar(100) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `woPortugal` varchar(50) DEFAULT NULL,
  `mr` varchar(5) DEFAULT NULL,
  `alarma` varchar(100) DEFAULT NULL,
  `facturado` varchar(20) DEFAULT NULL,
  `motivoRechazo` varchar(200) DEFAULT NULL,
  `udPedido` int(11) DEFAULT NULL,
  `udAnuladas` int(11) DEFAULT NULL,
  `udAlbaran` int(11) DEFAULT NULL,
  `codFamilia` int(11) DEFAULT NULL,
  `subCodFamilia` varchar(8) DEFAULT NULL,
  `descripcionMarca` varchar(100) DEFAULT NULL,
  `llegada` varchar(10) DEFAULT NULL,
  `codBarrasSeb` varchar(15) DEFAULT NULL,
  `noAbono` varchar(50) DEFAULT NULL,
  `movChManual` varchar(100) DEFAULT NULL,
  `fechaMovChManual` date DEFAULT NULL,
  `idLineasAcer` bigint(20) DEFAULT NULL,
  `productBrand` varchar(100) DEFAULT NULL,
  `productModel` varchar(200) DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL,
  `unidadesPunteadas` int(11) DEFAULT NULL,
  `pallet` varchar(50) DEFAULT NULL,
  `palletDestino` bigint(20) DEFAULT NULL,
  `palletDestinoAnterior` bigint(20) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `punteado` int(11) DEFAULT NULL,
  `diaTest` varchar(20) DEFAULT NULL,
  `idLineasRoturas` bigint(20) DEFAULT NULL,
  `nombrePallet` varchar(100) DEFAULT NULL,
  `tiempoTardado` varchar(30) DEFAULT NULL,
  `horaInicioTest` time DEFAULT NULL,
  `horaTest` time DEFAULT NULL,
  `codigoIris` varchar(20) DEFAULT NULL,
  `conclusion` varchar(4) DEFAULT NULL,
  `observaciones` varchar(300) DEFAULT NULL,
  `numOrden` int(11) DEFAULT NULL,
  `destinoLimpieza` varchar(5) DEFAULT NULL,
  `idUserLimpieza` int(11) DEFAULT NULL,
  `fechaLimpieza` date DEFAULT NULL,
  `horaInicioLimpieza` time DEFAULT NULL,
  `horaFinLimpieza` time DEFAULT NULL,
  `tiempoTardadoLimpieza` time DEFAULT NULL,
  `observacionesLimpieza` varchar(300) DEFAULT NULL,
  `estado` varchar(200) DEFAULT NULL,
  `idTest_linea` bigint(20) DEFAULT NULL,
  `referenciaProductoTest` varchar(40) DEFAULT NULL,
  `idFamilia` int(11) DEFAULT NULL,
  `fechaCompra` varchar(10) DEFAULT NULL,
  `fechaFabricacion` varchar(10) DEFAULT NULL,
  `garantia` varchar(20) DEFAULT NULL,
  `conclusionFinal` varchar(50) DEFAULT NULL,
  `idPallet` bigint(20) DEFAULT NULL,
  `idPalletPNT` bigint(20) DEFAULT NULL,
  `fechaTest` date DEFAULT NULL,
  `numEntrada` int(11) DEFAULT NULL,
  `tipoEnvio` varchar(1) DEFAULT NULL,
  `agora` varchar(1) DEFAULT NULL,
  `idMercancia` int(11) DEFAULT NULL,
  `idLineaTest` bigint(20) DEFAULT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `cliente` varchar(200) DEFAULT NULL,
  `mercancia` varchar(300) DEFAULT NULL,
  `bultos` varchar(50) DEFAULT NULL,
  `fechaNotificacionSeb` varchar(20) DEFAULT NULL,
  `fechaResolucionSeb` varchar(20) DEFAULT NULL,
  `resolucion` varchar(100) DEFAULT NULL,
  `fechaInstruccionAlmacen` varchar(20) DEFAULT NULL,
  `fechaTratadoAlmacen` date DEFAULT NULL,
  `informacionFinal` varchar(300) DEFAULT NULL,
  `idPalletCh` bigint(20) DEFAULT NULL,
  `tratado` varchar(100) DEFAULT NULL,
  `idProducto` bigint(20) DEFAULT NULL,
  `cajaOriginal` varchar(20) DEFAULT NULL,
  `accesorio` varchar(2) DEFAULT NULL,
  `destino` varchar(20) DEFAULT NULL,
  `destinoFInal` varchar(20) DEFAULT NULL,
  `fechaRevision` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idLineaUnificada`),
  UNIQUE KEY `uq_linea_origen` (`tipoOrigen`,`idOrigen`),
  KEY `idx_rma` (`rma`)
) ENGINE=InnoDB AUTO_INCREMENT=84989 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
