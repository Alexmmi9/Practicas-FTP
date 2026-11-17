-- MIGRACION DE TABLAS RESTANTES DE MONALDB
-- Generado a partir del volcado SQL facilitado (17-11-2026).
--
-- INCLUYE: estructura, claves primarias, indices y AUTO_INCREMENT
-- de las 36 tablas que no se unificaron y no se excluyeron.
--
-- EXCLUIDAS expresamente:
--   cabeceras_acer, cabeceras_roturas, cabeceras_rma, cabecera_parcel
--   linea_test_productos, lineas_acer, lineas_rma, lineas_roturas
--   mercancia_no_seb, mercancia_parcel
--
-- IMPORTANTE SOBRE LOS DATOS:
-- Los archivos SQL facilitados no contienen INSERT INTO para estas 36 tablas.
-- Por tanto, este archivo crea sus estructuras, pero NO puede cargar registros
-- que no aparecen en los volcados recibidos.
--
-- Antes de ejecutar:
--   1. Crea/selecciona la base de datos de destino en MySQL Workbench.
--   2. Ejecuta este archivo sobre una base de datos donde estas tablas no existan.
--
-- No elimina ni modifica tablas existentes.
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET NAMES utf8mb4;

START TRANSACTION;

-- Estructura de cabecera_camion
CREATE TABLE IF NOT EXISTS `cabecera_camion` (
  `idCamion` int(11) NOT NULL,
  `NCamion` int(11) NOT NULL,
  `fechaEntrega` date NOT NULL,
  `idTransporte` int(11) NOT NULL,
  `bultosTotales` int(11) NOT NULL,
  `Validado` int(11) NOT NULL,
  `tipoCamion` varchar(50) NOT NULL,
  `numEntradas` int(11) NOT NULL,
  `nombreCamion` varchar(200) NOT NULL,
  `fechaCreacion` date DEFAULT NULL,
  `tipoEnvio` varchar(50) NOT NULL,
  `cerrado` varchar(2) NOT NULL,
  `fechaCierre` date DEFAULT NULL,
  `fechaSalida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de camion_pallet
CREATE TABLE IF NOT EXISTS `camion_pallet` (
  `idCamion_pallet` int(11) NOT NULL,
  `idCamion` int(11) NOT NULL,
  `idPallet` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `idCliente` int(11) NOT NULL,
  `referenciaCliente` varchar(100) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `idClienteGenerico` int(11) NOT NULL,
  `nombreGenerico` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de entradas
CREATE TABLE IF NOT EXISTS `entradas` (
  `idEntrada` int(11) NOT NULL,
  `rma` varchar(20) NOT NULL,
  `numEntrada` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `numCamion` varchar(20) NOT NULL,
  `informacion` varchar(100) NOT NULL,
  `fechaTest` date DEFAULT NULL,
  `numAbono` varchar(30) NOT NULL,
  `fechaAbono` date DEFAULT NULL,
  `observacionesAbono` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de entradas_personal
CREATE TABLE IF NOT EXISTS `entradas_personal` (
  `idRegistro` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horaEntrada` varchar(10) NOT NULL,
  `horaSalida` varchar(10) NOT NULL,
  `horaPrimerArticulo` varchar(10) NOT NULL,
  `observacionDia` varchar(500) NOT NULL,
  `explicacionFueraTiempo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de errores_test
CREATE TABLE IF NOT EXISTS `errores_test` (
  `idError` int(11) NOT NULL,
  `idArticulo` bigint(20) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaNotificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de familias
CREATE TABLE IF NOT EXISTS `familias` (
  `idFamilia` int(11) NOT NULL,
  `nombreFamilia` varchar(200) NOT NULL,
  `tiempoMedio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de gestion_adicional
CREATE TABLE IF NOT EXISTS `gestion_adicional` (
  `idGestion` int(11) NOT NULL,
  `gestion` varchar(200) NOT NULL,
  `tipoGestion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de gestion_adicional_datos
CREATE TABLE IF NOT EXISTS `gestion_adicional_datos` (
  `idGestionDatos` int(11) NOT NULL,
  `gestion` varchar(200) NOT NULL,
  `especificacion` varchar(100) NOT NULL,
  `rma` varchar(20) NOT NULL,
  `palletLimpieza` varchar(100) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `campana` varchar(2) NOT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `horaInicio` time NOT NULL,
  `horaFinal` time NOT NULL,
  `tiempoTotal` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de gseb_monal_familias
CREATE TABLE IF NOT EXISTS `gseb_monal_familias` (
  `idRelacion` int(11) NOT NULL,
  `familiaGseb` int(11) NOT NULL,
  `familiaMonal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de historial_articulos_hora
CREATE TABLE IF NOT EXISTS `historial_articulos_hora` (
  `idHistorico` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `CH` int(11) NOT NULL,
  `C` int(11) NOT NULL,
  `PNT` int(11) NOT NULL,
  `PBT` int(11) NOT NULL,
  `PA` int(11) NOT NULL,
  `PPA` int(11) NOT NULL,
  `ST` int(11) NOT NULL,
  `IST` int(11) NOT NULL,
  `PB` int(11) NOT NULL,
  `noSeb` int(11) NOT NULL,
  `reintegrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de historico_movimientos
CREATE TABLE IF NOT EXISTS `historico_movimientos` (
  `idMovimiento` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `movimiento` varchar(300) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de hoja_ruta_especiales
CREATE TABLE IF NOT EXISTS `hoja_ruta_especiales` (
  `idRegistro` int(11) NOT NULL,
  `identificador` varchar(200) NOT NULL,
  `rma` varchar(20) NOT NULL,
  `nNumDoc` varchar(20) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idCamion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de horas_aseo
CREATE TABLE IF NOT EXISTS `horas_aseo` (
  `idRegistro` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `horaSalida` varchar(10) NOT NULL,
  `horaEntrada` varchar(10) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de id_aux
CREATE TABLE IF NOT EXISTS `id_aux` (
  `idRegistro` int(11) NOT NULL,
  `idArticulo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de informes
CREATE TABLE IF NOT EXISTS `informes` (
  `idInforme` int(11) NOT NULL,
  `Informe` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de inventario_aux
CREATE TABLE IF NOT EXISTS `inventario_aux` (
  `idRegistro` int(11) NOT NULL,
  `cmmf` varchar(50) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  `unidades` int(11) NOT NULL,
  `unidadesTratadas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de linea_camion
CREATE TABLE IF NOT EXISTS `linea_camion` (
  `idLinea_camion` int(11) NOT NULL,
  `idCamion` int(11) NOT NULL,
  `rma` varchar(30) NOT NULL,
  `numBultos` int(11) NOT NULL,
  `numEntrada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de observaciones_acer
CREATE TABLE IF NOT EXISTS `observaciones_acer` (
  `idObservacion` int(11) NOT NULL,
  `rma` varchar(100) NOT NULL,
  `pallet` varchar(50) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  `observaciones` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de pallets
CREATE TABLE IF NOT EXISTS `pallets` (
  `idPallet` bigint(20) NOT NULL,
  `nombrePallet` varchar(50) NOT NULL,
  `nombrePalletAntiguo` varchar(50) NOT NULL,
  `localizacion` varchar(80) NOT NULL,
  `tipoPallet` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `cerrado` tinyint(1) NOT NULL,
  `gestionPN` int(11) NOT NULL DEFAULT 0,
  `udMax` int(11) NOT NULL,
  `limpieza` varchar(2) NOT NULL DEFAULT 'No',
  `fechaCerrado` date DEFAULT NULL,
  `fechaAbierto` date DEFAULT NULL,
  `fechaSalidaAsociacion` date DEFAULT NULL,
  `idCamionSalida` int(11) NOT NULL,
  `agenciaRecogida` varchar(100) NOT NULL,
  `fechaSalida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de pallet_acer
CREATE TABLE IF NOT EXISTS `pallet_acer` (
  `idRelacion` int(11) NOT NULL,
  `idLineasAcer` int(11) NOT NULL,
  `idPallet` bigint(20) NOT NULL,
  `unidades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de pallet_lote
CREATE TABLE IF NOT EXISTS `pallet_lote` (
  `id_pallet_lote` int(11) NOT NULL,
  `rma` varchar(30) NOT NULL,
  `idPallet` bigint(20) NOT NULL,
  `numero_pallet` varchar(10) NOT NULL,
  `bultos` varchar(100) NOT NULL,
  `Test` int(11) NOT NULL,
  `agencia` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de posibles_destinos_cmmf
CREATE TABLE IF NOT EXISTS `posibles_destinos_cmmf` (
  `idRegistro` int(11) NOT NULL,
  `cmmf` varchar(50) NOT NULL,
  `destino` varchar(20) NOT NULL,
  `fechaInsertado` date NOT NULL,
  `unicoDestino` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de preguntas_frecuentes
CREATE TABLE IF NOT EXISTS `preguntas_frecuentes` (
  `idPregunta` int(11) NOT NULL,
  `pregunta` varchar(200) NOT NULL,
  `respuesta` varchar(500) NOT NULL,
  `fecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de referencias_fuera_tiempo
CREATE TABLE IF NOT EXISTS `referencias_fuera_tiempo` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idProducto` varchar(20) NOT NULL,
  `referencia` varchar(250) NOT NULL,
  `tiempoMedio` time NOT NULL,
  `tiempoTardado` time NOT NULL,
  `tiempoExtra` time NOT NULL,
  `explicacion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de ref_cmmf_fam
CREATE TABLE IF NOT EXISTS `ref_cmmf_fam` (
  `idRef_cmmf` int(11) NOT NULL,
  `cmmf` varchar(25) NOT NULL,
  `referenciaProducto` varchar(25) NOT NULL,
  `codigoFamilia` int(11) NOT NULL,
  `codigoSubFamilia` int(11) NOT NULL,
  `familiaCorrecta` bit(1) NOT NULL,
  `estadoSAP` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de relacion_num_orden
CREATE TABLE IF NOT EXISTS `relacion_num_orden` (
  `idRelacion` int(11) NOT NULL,
  `idPallet` bigint(20) NOT NULL,
  `idArticulo` bigint(20) NOT NULL,
  `numOrden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de test_iris
CREATE TABLE IF NOT EXISTS `test_iris` (
  `idTest` int(11) NOT NULL,
  `idFamilia` int(11) NOT NULL,
  `numPregunta` int(11) NOT NULL,
  `textoIris` varchar(200) NOT NULL,
  `codigoIris` varchar(20) NOT NULL,
  `codigoIrisMal` varchar(20) NOT NULL,
  `posicionSiguiente` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de tiempos_medios_test
CREATE TABLE IF NOT EXISTS `tiempos_medios_test` (
  `id` int(11) NOT NULL,
  `proceso` varchar(50) NOT NULL,
  `inicioReferencia` varchar(10) NOT NULL,
  `tiempoMedio` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de tiempo_test_aux
CREATE TABLE IF NOT EXISTS `tiempo_test_aux` (
  `idArticulo` varchar(40) NOT NULL,
  `idFamilia` int(11) NOT NULL,
  `numPregunta` int(11) NOT NULL,
  `tiempoInicio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de tipos_camiones_salida
CREATE TABLE IF NOT EXISTS `tipos_camiones_salida` (
  `idRegistro` int(11) NOT NULL,
  `tipoEnvio` varchar(50) NOT NULL,
  `cantidadPallets` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de tipos_pallet_pn
CREATE TABLE IF NOT EXISTS `tipos_pallet_pn` (
  `idTipoPallet` int(11) NOT NULL,
  `tipoPallet` varchar(20) NOT NULL,
  `nombrePN` varchar(100) NOT NULL,
  `nombreEtiqueta` varchar(100) NOT NULL,
  `nombreEtiquetaTest` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de tipo_documentos
CREATE TABLE IF NOT EXISTS `tipo_documentos` (
  `idDocumento` int(11) NOT NULL,
  `nombreDocumento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de tipo_pallet
CREATE TABLE IF NOT EXISTS `tipo_pallet` (
  `idTipoPallet` int(11) NOT NULL,
  `nombrePallet` varchar(100) NOT NULL,
  `tipoPallet` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de transporte
CREATE TABLE IF NOT EXISTS `transporte` (
  `idTransporte` int(11) NOT NULL,
  `nombreEmpresa` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estructura de usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUser` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `privileges` tinyint(4) NOT NULL,
  `permisoAddMaestro` varchar(2) NOT NULL DEFAULT 'No',
  `permisoCambiarNombres` varchar(2) NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Claves e indices de cabecera_camion
ALTER TABLE `cabecera_camion`
  ADD PRIMARY KEY (`idCamion`),
  ADD KEY `Transporte` (`idTransporte`) USING BTREE;

-- Claves e indices de camion_pallet
ALTER TABLE `camion_pallet`
  ADD PRIMARY KEY (`idCamion_pallet`);

-- Claves e indices de clientes
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

-- Claves e indices de entradas
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`idEntrada`);

-- Claves e indices de entradas_personal
ALTER TABLE `entradas_personal`
  ADD PRIMARY KEY (`idRegistro`);

-- Claves e indices de errores_test
ALTER TABLE `errores_test`
  ADD PRIMARY KEY (`idError`);

-- Claves e indices de familias
ALTER TABLE `familias`
  ADD PRIMARY KEY (`idFamilia`);

-- Claves e indices de gestion_adicional
ALTER TABLE `gestion_adicional`
  ADD PRIMARY KEY (`idGestion`);

-- Claves e indices de gestion_adicional_datos
ALTER TABLE `gestion_adicional_datos`
  ADD PRIMARY KEY (`idGestionDatos`);

-- Claves e indices de gseb_monal_familias
ALTER TABLE `gseb_monal_familias`
  ADD PRIMARY KEY (`idRelacion`);

-- Claves e indices de historial_articulos_hora
ALTER TABLE `historial_articulos_hora`
  ADD PRIMARY KEY (`idHistorico`);

-- Claves e indices de historico_movimientos
ALTER TABLE `historico_movimientos`
  ADD PRIMARY KEY (`idMovimiento`);

-- Claves e indices de hoja_ruta_especiales
ALTER TABLE `hoja_ruta_especiales`
  ADD PRIMARY KEY (`idRegistro`);

-- Claves e indices de horas_aseo
ALTER TABLE `horas_aseo`
  ADD PRIMARY KEY (`idRegistro`);

-- Claves e indices de id_aux
ALTER TABLE `id_aux`
  ADD PRIMARY KEY (`idRegistro`);

-- Claves e indices de informes
ALTER TABLE `informes`
  ADD PRIMARY KEY (`idInforme`);

-- Claves e indices de inventario_aux
ALTER TABLE `inventario_aux`
  ADD PRIMARY KEY (`idRegistro`);

-- Claves e indices de linea_camion
ALTER TABLE `linea_camion`
  ADD PRIMARY KEY (`idLinea_camion`),
  ADD KEY `Pedido` (`rma`) USING BTREE;

-- Claves e indices de observaciones_acer
ALTER TABLE `observaciones_acer`
  ADD PRIMARY KEY (`idObservacion`);

-- Claves e indices de pallets
ALTER TABLE `pallets`
  ADD PRIMARY KEY (`idPallet`);

-- Claves e indices de pallet_acer
ALTER TABLE `pallet_acer`
  ADD PRIMARY KEY (`idRelacion`);

-- Claves e indices de pallet_lote
ALTER TABLE `pallet_lote`
  ADD PRIMARY KEY (`id_pallet_lote`);

-- Claves e indices de posibles_destinos_cmmf
ALTER TABLE `posibles_destinos_cmmf`
  ADD PRIMARY KEY (`idRegistro`);

-- Claves e indices de preguntas_frecuentes
ALTER TABLE `preguntas_frecuentes`
  ADD PRIMARY KEY (`idPregunta`);

-- Claves e indices de referencias_fuera_tiempo
ALTER TABLE `referencias_fuera_tiempo`
  ADD PRIMARY KEY (`id`);

-- Claves e indices de ref_cmmf_fam
ALTER TABLE `ref_cmmf_fam`
  ADD PRIMARY KEY (`idRef_cmmf`);

-- Claves e indices de relacion_num_orden
ALTER TABLE `relacion_num_orden`
  ADD PRIMARY KEY (`idRelacion`);

-- Claves e indices de test_iris
ALTER TABLE `test_iris`
  ADD PRIMARY KEY (`idTest`),
  ADD KEY `Familia` (`idFamilia`) USING BTREE;

-- Claves e indices de tiempos_medios_test
ALTER TABLE `tiempos_medios_test`
  ADD PRIMARY KEY (`id`);

-- Claves e indices de tiempo_test_aux
ALTER TABLE `tiempo_test_aux`
  ADD PRIMARY KEY (`idArticulo`);

-- Claves e indices de tipos_camiones_salida
ALTER TABLE `tipos_camiones_salida`
  ADD PRIMARY KEY (`idRegistro`);

-- Claves e indices de tipos_pallet_pn
ALTER TABLE `tipos_pallet_pn`
  ADD PRIMARY KEY (`idTipoPallet`);

-- Claves e indices de tipo_documentos
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`idDocumento`);

-- Claves e indices de tipo_pallet
ALTER TABLE `tipo_pallet`
  ADD PRIMARY KEY (`idTipoPallet`);

-- Claves e indices de transporte
ALTER TABLE `transporte`
  ADD PRIMARY KEY (`idTransporte`);

-- Claves e indices de usuarios
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUser`);

-- Claves e indices de cabecera_camion
ALTER TABLE `cabecera_camion`
  MODIFY `idCamion` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de camion_pallet
ALTER TABLE `camion_pallet`
  MODIFY `idCamion_pallet` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de clientes
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de entradas
ALTER TABLE `entradas`
  MODIFY `idEntrada` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de entradas_personal
ALTER TABLE `entradas_personal`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de errores_test
ALTER TABLE `errores_test`
  MODIFY `idError` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de familias
ALTER TABLE `familias`
  MODIFY `idFamilia` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de gestion_adicional
ALTER TABLE `gestion_adicional`
  MODIFY `idGestion` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de gestion_adicional_datos
ALTER TABLE `gestion_adicional_datos`
  MODIFY `idGestionDatos` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de gseb_monal_familias
ALTER TABLE `gseb_monal_familias`
  MODIFY `idRelacion` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de historial_articulos_hora
ALTER TABLE `historial_articulos_hora`
  MODIFY `idHistorico` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de historico_movimientos
ALTER TABLE `historico_movimientos`
  MODIFY `idMovimiento` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de hoja_ruta_especiales
ALTER TABLE `hoja_ruta_especiales`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de horas_aseo
ALTER TABLE `horas_aseo`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de id_aux
ALTER TABLE `id_aux`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de informes
ALTER TABLE `informes`
  MODIFY `idInforme` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de inventario_aux
ALTER TABLE `inventario_aux`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de linea_camion
ALTER TABLE `linea_camion`
  MODIFY `idLinea_camion` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de observaciones_acer
ALTER TABLE `observaciones_acer`
  MODIFY `idObservacion` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de pallet_acer
ALTER TABLE `pallet_acer`
  MODIFY `idRelacion` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de pallet_lote
ALTER TABLE `pallet_lote`
  MODIFY `id_pallet_lote` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de posibles_destinos_cmmf
ALTER TABLE `posibles_destinos_cmmf`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de preguntas_frecuentes
ALTER TABLE `preguntas_frecuentes`
  MODIFY `idPregunta` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de referencias_fuera_tiempo
ALTER TABLE `referencias_fuera_tiempo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de ref_cmmf_fam
ALTER TABLE `ref_cmmf_fam`
  MODIFY `idRef_cmmf` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de relacion_num_orden
ALTER TABLE `relacion_num_orden`
  MODIFY `idRelacion` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de test_iris
ALTER TABLE `test_iris`
  MODIFY `idTest` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de tiempos_medios_test
ALTER TABLE `tiempos_medios_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de tipos_camiones_salida
ALTER TABLE `tipos_camiones_salida`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de tipos_pallet_pn
ALTER TABLE `tipos_pallet_pn`
  MODIFY `idTipoPallet` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de tipo_documentos
ALTER TABLE `tipo_documentos`
  MODIFY `idDocumento` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de tipo_pallet
ALTER TABLE `tipo_pallet`
  MODIFY `idTipoPallet` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de transporte
ALTER TABLE `transporte`
  MODIFY `idTransporte` int(11) NOT NULL AUTO_INCREMENT;

-- Claves e indices de usuarios
ALTER TABLE `usuarios`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;

COMMIT;
