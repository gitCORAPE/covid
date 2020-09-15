-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-08-2019 a las 15:07:24
-- Versión del servidor: 5.7.27
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `corapeor_repositorio`
--
CREATE DATABASE IF NOT EXISTS `corapeor_repositorio` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `corapeor_repositorio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_nivel1`
--

CREATE TABLE `c_nivel1` (
  `nivel1_id` int(11) NOT NULL,
  `nivel1_nombre` varchar(30) DEFAULT NULL,
  `nivel1_tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c_nivel1`
--

INSERT INTO `c_nivel1` (`nivel1_id`, `nivel1_nombre`, `nivel1_tipo`) VALUES
(1, 'Awá', 'Nacionalidad'),
(2, 'Chachi', 'Nacionalidad'),
(3, 'Épera', 'Nacionalidad'),
(4, 'Tsa´chila', 'Nacionalidad'),
(5, 'Achuar', 'Nacionalidad'),
(6, 'Andoa', 'Nacionalidad'),
(7, 'Cofán', 'Nacionalidad'),
(8, 'Sapara', 'Nacionalidad'),
(9, 'Sekoya', 'Nacionalidad'),
(10, 'Shiwiar', 'Nacionalidad'),
(11, 'Shuar', 'Nacionalidad'),
(12, 'Siona', 'Nacionalidad'),
(13, 'Waorani', 'Nacionalidad'),
(14, 'Kichwa', 'Nacionalidad'),
(15, '	Afroecuatoriano	', 'Pueblo'),
(16, '	Montuvios	', 'Pueblo'),
(17, '	Huancavilca 	', 'Pueblo'),
(18, '	Manta	', 'Pueblo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_nivel2`
--

CREATE TABLE `c_nivel2` (
  `nivel2_id` int(11) NOT NULL,
  `nivel2_nombre` varchar(30) DEFAULT NULL,
  `nivel2_tipo` varchar(30) DEFAULT NULL,
  `nivel1_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `c_nivel2`
--

INSERT INTO `c_nivel2` (`nivel2_id`, `nivel2_nombre`, `nivel2_tipo`, `nivel1_id`) VALUES
(1, 'Chibuleo', 'Pueblo', 14),
(2, 'Kañari', 'Pueblo', 14),
(3, 'Karanki', 'Pueblo', 14),
(4, 'Kayambi', 'Pueblo', 14),
(5, 'Kisapincha', 'Pueblo', 14),
(6, 'Kitu Kara', 'Pueblo', 14),
(7, 'Natabuela', 'Pueblo', 14),
(8, 'Otavalo', 'Pueblo', 14),
(9, 'Panzaleo', 'Pueblo', 14),
(10, 'Puruwá', 'Pueblo', 14),
(11, 'Salasaka', 'Pueblo', 14),
(12, 'Saraguro', 'Pueblo', 14),
(13, 'Tomabela', 'Pueblo', 14),
(14, 'Waranka', 'Pueblo', 14),
(15, 'Pasto', 'Pueblo', 14),
(16, 'Palta', 'Pueblo', 14),
(17, 'Kichwa de Amazonia', 'Pueblo', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_ciudad`
--

CREATE TABLE `x_ciudad` (
  `ciudad_id` decimal(10,0) NOT NULL,
  `ciudad_nombre` varchar(50) DEFAULT NULL,
  `provincia_id` decimal(10,0) DEFAULT NULL,
  `ciudad_usuario_crea` varchar(20) DEFAULT NULL,
  `ciudad_usuario_actualiza` varchar(20) DEFAULT NULL,
  `ciudad_fecha_creacion` datetime DEFAULT NULL,
  `ciudad_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_ciudad`
--

INSERT INTO `x_ciudad` (`ciudad_id`, `ciudad_nombre`, `provincia_id`, `ciudad_usuario_crea`, `ciudad_usuario_actualiza`, `ciudad_fecha_creacion`, `ciudad_fecha_actualizacion`) VALUES
(1, 'Quito', 17, 'admin', 'admin', '2015-08-03 12:52:01', '2015-09-23 23:06:35'),
(2, 'Cayambe', 17, 'admin', 'admin', '2015-08-03 12:56:24', '2015-09-23 23:06:41'),
(5, 'Guayaquil', 9, 'admin', 'admin', '2015-08-03 13:01:28', '2015-09-23 23:06:50'),
(7, 'Milagro', 9, 'admin', 'admin', '2015-08-03 13:02:50', '2015-09-23 23:06:58'),
(9, 'Ambato', 18, 'admin', 'admin', '2015-08-03 13:05:31', '2015-09-23 23:08:07'),
(13, 'Cuenca', 1, 'admin', 'admin', '2015-08-03 13:09:14', '2015-09-23 23:08:00'),
(15, 'Santo Domingo', 23, 'admin', 'admin', '2015-08-03 13:10:46', '2015-09-23 23:07:53'),
(16, 'Loja', 11, 'admin', 'admin', '2015-08-03 13:11:40', '2015-09-23 23:07:45'),
(18, 'Ibarra', 10, 'admin', 'admin', '2015-08-03 13:12:46', '2015-09-23 23:07:39'),
(20, 'Otavalo', 10, 'admin', 'admin', '2015-08-03 13:13:31', '2015-09-23 23:07:32'),
(22, 'Machala', 7, 'admin', 'admin', '2015-08-03 13:14:32', '2015-09-23 23:07:26'),
(25, 'Manta', 13, 'admin', 'admin', '2015-08-03 13:16:37', '2015-09-23 23:07:13'),
(26, 'Portoviejo', 13, 'admin', 'admin', '2015-08-03 13:16:53', '2015-09-23 23:07:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_codigos`
--

CREATE TABLE `x_codigos` (
  `codigo_id` varchar(5) NOT NULL,
  `codigo_grupo_id` decimal(10,0) NOT NULL,
  `codigo_descripcion` varchar(50) DEFAULT NULL,
  `codigo_id2` varchar(5) DEFAULT NULL,
  `codigo_id3` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_codigos`
--

INSERT INTO `x_codigos` (`codigo_id`, `codigo_grupo_id`, `codigo_descripcion`, `codigo_id2`, `codigo_id3`) VALUES
('1', 1, 'SI', '', ''),
('1', 3, 'USD', 'USD', '$'),
('1', 5, 'Persona Natural', '', ''),
('1', 7, 'Unidad', '1', ''),
('1', 8, 'Confirmado', '', ''),
('1', 9, 'Entregado', '', ''),
('1', 13, 'Creative Commons - BY-NC-ND 3.0 EC', '1', ''),
('1', 14, 'Arte: pintura, cine, literatura, música, danza', '', ''),
('1', 15, 'Diccionario Intercultural', '', ''),
('2', 1, 'NO', '', ''),
('2', 3, 'EURO', 'EU', '€'),
('2', 5, 'Persona Jurídica', '', ''),
('2', 7, 'Paquete', '1', ''),
('2', 8, 'Sin confirmación', '', ''),
('2', 9, 'En proceso de entrega', '', ''),
('2', 13, 'Creative Commons - BY 3.0 EC', '', ''),
('2', 14, 'Costumbres y tradiciones: vestimenta, gastronomía', '', ''),
('3', 8, 'Anulado', '', ''),
('3', 9, 'Devuelto', '', ''),
('3', 13, 'Creative Commons - BY-NC 3.0 EC', '', ''),
('3', 14, 'Ancestralidad: cosmovisiones, mitos, medicina', '', ''),
('4', 9, 'Perdido', '', ''),
('4', 13, 'Creative Commons - BY-NC-SA 3.0 EC', '', ''),
('4', 14, 'Economía: agricultura, turismo', '', ''),
('5', 13, 'Creative Commons - BY-SA 3.0 EC', '', ''),
('5', 14, 'Medio Ambiente', '', ''),
('6', 13, 'Creative Commons - BY-ND 3.0 EC	', '', ''),
('6', 14, 'Educación: conocimientos y saberes, universidad', '', ''),
('7', 13, 'Dominio Público', '', ''),
('7', 14, 'Historia y Geografía', '', ''),
('8', 13, 'Licencia entre Pares - BY-SA-NC', '', ''),
('8', 14, 'Política y Justicia: sociedad, organización, líder', '', ''),
('AD', 4, 'Andorra', '020', 'AND'),
('AE', 4, 'Emiratos Árabes Unidos', '784', 'ARE'),
('AF', 4, 'Afganistán', '004', 'AFG'),
('AG', 4, 'Antigua y Barbuda', '028', 'ATG'),
('AI', 4, 'Anguila', '660', 'AIA'),
('AL', 4, 'Albania', '008', 'ALB'),
('AM', 4, 'Armenia', '051', 'ARM'),
('AN', 4, 'Antillas Neerlandesas', '530', 'ANT'),
('AO', 4, 'Angola', '024', 'AGO'),
('AQ', 4, 'Antártida', '010', 'ATA'),
('AR', 4, 'Argentina', '032', 'ARG'),
('AS', 4, 'Samoa Americana', '016', 'ASM'),
('AT', 4, 'Austria', '040', 'AUT'),
('AU', 4, 'Australia', '036', 'AUS'),
('audio', 10, 'Audio', '', ''),
('AW', 4, 'Aruba', '533', 'ABW'),
('AX', 4, 'Åland', '248', 'ALA'),
('AZ', 4, 'Azerbaiyán', '031', 'AZE'),
('BA', 4, 'Bosnia y Herzegovina', '070', 'BIH'),
('BB', 4, 'Barbados', '052', 'BRB'),
('BD', 4, 'Bangladesh', '050', 'BGD'),
('BE', 4, 'Belgium  Bélgica', '056', 'BEL'),
('BF', 4, 'Burkina Faso', '854', 'BFA'),
('BG', 4, 'Bulgaria', '100', 'BGR'),
('BH', 4, 'Bahréin', '048', 'BHR'),
('BI', 4, 'Burundi', '108', 'BDI'),
('BJ', 4, 'Benín', '204', 'BEN'),
('BM', 4, 'Bermudas', '060', 'BMU'),
('BN', 4, 'Brunéi', '096', 'BRN'),
('BO', 4, 'Bolivia', '068', 'BOL'),
('BR', 4, 'Brasil', '076', 'BRA'),
('BS', 4, 'Bahamas', '044', 'BHS'),
('BT', 4, 'Bután', '064', 'BTN'),
('BV', 4, 'Isla Bouvet', '074', 'BVT'),
('BW', 4, 'Botsuana', '072', 'BWA'),
('BY', 4, 'Bielorrusia', '112', 'BLR'),
('BZ', 4, 'Belice', '084', 'BLZ'),
('C', 6, 'CEDULA', '', ''),
('CA', 4, 'Canadá', '124', 'CAN'),
('CC', 4, 'Islas Cocos', '166', 'CCK'),
('CD', 4, 'República Democrática del Congo', '180', 'COD'),
('CF', 4, 'República Centroafricana', '140', 'CAF'),
('CG', 4, 'República del Congo', '178', 'COG'),
('CH', 4, 'Switzerland  Suiza', '756', 'CHE'),
('CI', 4, 'Costa de Marfil', '384', 'CIV'),
('CK', 4, 'Islas Cook', '184', 'COK'),
('CL', 4, 'Chile', '152', 'CHL'),
('CM', 4, 'Camerún', '120', 'CMR'),
('CN', 4, 'China', '156', 'CHN'),
('CO', 4, 'Colombia', '170', 'COL'),
('CR', 4, 'Costa Rica', '188', 'CRI'),
('CU', 4, 'Cuba', '192', 'CUB'),
('CV', 4, 'Cabo Verde', '132', 'CPV'),
('CX', 4, 'Isla de Navidad', '162', 'CXR'),
('CY', 4, 'Chipre', '196', 'CYP'),
('CZ', 4, 'República Checa', '203', 'CZE'),
('DE', 4, 'Alemania', '276', 'DEU'),
('DJ', 4, 'Yibuti', '262', 'DJI'),
('DK', 4, 'Dinamarca', '208', 'DNK'),
('DM', 4, 'Dominica', '212', 'DMA'),
('DO', 4, 'República Dominicana', '214', 'DOM'),
('DZ', 4, 'Argelia', '012', 'DZA'),
('EA', 4, 'España ,(Ceuta y Melilla),', '724', 'ESP'),
('EC', 4, 'Ecuador', '218', 'ECU'),
('EE', 4, 'Estonia', '233', 'EST'),
('EG', 4, 'Egipto', '818', 'EGY'),
('EH', 4, 'Sahara Occidental', '732', 'ESH'),
('en', 2, 'Inglés', '', ''),
('ER', 4, 'Eritrea', '232', 'ERI'),
('es', 2, 'Español', '', ''),
('ES', 4, 'España', '724', 'ESP'),
('ET', 4, 'Etiopía', '231', 'ETH'),
('FI', 4, 'Finlandia', '246', 'FIN'),
('FJ', 4, 'Fiyi', '242', 'FJI'),
('FK', 4, 'Islas Malvinas', '238', 'FLK'),
('FM', 4, 'Micronesia', '583', 'FSM'),
('FO', 4, 'Islas Feroe', '234', 'FRO'),
('FR', 4, 'Francia', '250', 'FRA'),
('GA', 4, 'Gabón', '266', 'GAB'),
('GB', 4, 'Reino Unido', '826', 'GBR'),
('GD', 4, 'Granada', '308', 'GRD'),
('GE', 4, 'Georgia', '268', 'GEO'),
('GF', 4, 'Guayana Francesa', '254', 'GUF'),
('GG', 4, 'Guernsey', '831', 'GGY'),
('GH', 4, 'Ghana', '288', 'GHA'),
('GI', 4, 'Gibraltar', '292', 'GIB'),
('GL', 4, 'Groenlandia', '304', 'GRL'),
('GM', 4, 'Gambia', '270', 'GMB'),
('GN', 4, 'Guinea', '324', 'GIN'),
('GP', 4, 'Guadalupe', '312', 'GLP'),
('GQ', 4, 'Guinea Ecuatorial', '226', 'GNQ'),
('GR', 4, 'Grecia', '300', 'GRC'),
('GS', 4, 'Islas Georgias del Sur y Sandwich del S', '239', 'SGS'),
('GT', 4, 'Guatemala', '320', 'GTM'),
('GU', 4, 'Guam', '316', 'GUM'),
('GW', 4, 'Guinea-Bissau', '624', 'GNB'),
('GY', 4, 'Guyana', '328', 'GUY'),
('HK', 4, 'Hong Kong', '344', 'HKG'),
('HM', 4, 'Islas Heard y McDonald', '334', 'HMD'),
('HN', 4, 'Honduras', '340', 'HND'),
('HR', 4, 'Croacia', '191', 'HRV'),
('HT', 4, 'Haití', '332', 'HTI'),
('HU', 4, 'Hungría', '348', 'HUN'),
('ID', 4, 'Indonesia', '360', 'IDN'),
('IE', 4, 'Irlanda', '372', 'IRL'),
('IL', 4, 'Israel', '376', 'ISR'),
('IM', 4, 'Isla de Man', '833', 'IMN'),
('img', 10, 'Imagen / Foto', '', ''),
('IN', 4, 'India', '356', 'IND'),
('IO', 4, 'Territorio Británico del Océano Índico', '086', 'IOT'),
('IQ', 4, 'Iraq', '368', 'IRQ'),
('IR', 4, 'Irán', '364', 'IRN'),
('IS', 4, 'Islandia', '352', 'ISL'),
('IT', 4, 'Italia', '380', 'ITA'),
('JE', 4, 'Jersey', '832', 'JEY'),
('JM', 4, 'Jamaica', '388', 'JAM'),
('JO', 4, 'Jordania', '400', 'JOR'),
('JP', 4, 'Japón', '392', 'JPN'),
('KE', 4, 'Kenia', '404', 'KEN'),
('KG', 4, 'Kirguistán', '417', 'KGZ'),
('KH', 4, 'Camboya', '116', 'KHM'),
('KI', 4, 'Kiribati', '296', 'KIR'),
('KM', 4, 'Comoras', '174', 'COM'),
('KN', 4, 'San Cristóbal y Nieves', '659', 'KNA'),
('KP', 4, 'Corea del Norte', '408', 'PRK'),
('KR', 4, 'Corea del Sur', '410', 'KOR'),
('KW', 4, 'Kuwait', '414', 'KWT'),
('KY', 4, 'Islas Caimán', '136', 'CYM'),
('KZ', 4, 'Kazajistán', '398', 'KAZ'),
('LA', 4, 'Laos', '418', 'LAO'),
('LB', 4, 'Líbano', '422', 'LBN'),
('LC', 4, 'Santa Lucía', '662', 'LCA'),
('LI', 4, 'Liechtenstein', '438', 'LIE'),
('LK', 4, 'Sri Lanka', '144', 'LKA'),
('LR', 4, 'Liberia', '430', 'LBR'),
('LS', 4, 'Lesoto', '426', 'LSO'),
('LT', 4, 'Lituania', '440', 'LTU'),
('LU', 4, 'Luxemburgo', '442', 'LUX'),
('LV', 4, 'Letonia', '428', 'LVA'),
('LY', 4, 'Libia', '434', 'LBY'),
('MA', 4, 'Marruecos', '504', 'MAR'),
('MC', 4, 'Mónaco', '492', 'MCO'),
('MD', 4, 'Moldavia', '498', 'MDA'),
('ME', 4, 'Montenegro', '499', 'MNE'),
('MG', 4, 'Madagascar', '450', 'MDG'),
('MH', 4, 'Islas Marshall', '584', 'MHL'),
('MK', 4, 'ARY Macedonia', '807', 'MKD'),
('ML', 4, 'Malí', '466', 'MLI'),
('MM', 4, 'Myanmar', '104', 'MMR'),
('MN', 4, 'Mongolia', '496', 'MNG'),
('MO', 4, 'Macao', '446', 'MAC'),
('MP', 4, 'Islas Marianas del Norte', '580', 'MNP'),
('MQ', 4, 'Martinica', '474', 'MTQ'),
('MR', 4, 'Mauritania', '478', 'MRT'),
('MS', 4, 'Montserrat', '500', 'MSR'),
('MT', 4, 'Malta', '470', 'MLT'),
('MU', 4, 'Mauricio', '480', 'MUS'),
('MV', 4, 'Maldivas', '462', 'MDV'),
('MW', 4, 'Malawi', '454', 'MWI'),
('MX', 4, 'México', '484', 'MEX'),
('MY', 4, 'Malasia', '458', 'MYS'),
('MZ', 4, 'Mozambique', '508', 'MOZ'),
('NA', 4, 'Namibia', '516', 'NAM'),
('NC', 4, 'Nueva Caledonia', '540', 'NCL'),
('NE', 4, 'Niger  Níger', '562', 'NER'),
('NF', 4, 'Norfolk', '574', 'NFK'),
('NG', 4, 'Nigeria', '566', 'NGA'),
('NI', 4, 'Nicaragua', '558', 'NIC'),
('NL', 4, 'Países Bajos', '528', 'NLD'),
('NO', 4, 'Noruega', '578', 'NOR'),
('NP', 4, 'Nepal', '524', 'NPL'),
('NR', 4, 'Nauru', '520', 'NRU'),
('NU', 4, 'Niue', '570', 'NIU'),
('NZ', 4, 'Nueva Zelanda', '554', 'NZL'),
('OM', 4, 'Omán', '512', 'OMN'),
('P', 6, 'Pasaporte', '', ''),
('PA', 4, 'Panamá', '591', 'PAN'),
('pdf', 10, 'Texto', '', ''),
('PE', 4, 'Perú', '604', 'PER'),
('PF', 4, 'Polinesia Francesa', '258', 'PYF'),
('PG', 4, 'Papúa Nueva Guinea', '598', 'PNG'),
('PH', 4, 'Filipinas', '608', 'PHL'),
('PK', 4, 'Pakistán', '586', 'PAK'),
('PL', 4, 'Polonia', '616', 'POL'),
('PM', 4, 'San Pedro y Miquelón', '666', 'SPM'),
('PN', 4, 'Islas Pitcairn', '612', 'PCN'),
('PR', 4, 'Puerto Rico', '630', 'PRI'),
('PS', 4, 'Palestina ,(ANP),', '275', 'PSE'),
('PT', 4, 'Portugal', '620', 'PRT'),
('PW', 4, 'Palaos', '585', 'PLW'),
('PY', 4, 'Paraguay', '600', 'PRY'),
('QA', 4, 'Qatar', '634', 'QAT'),
('R', 6, 'RUC', '', ''),
('RE', 4, 'Reunión', '638', 'REU'),
('RO', 4, 'Rumania', '642', 'ROU'),
('RS', 4, 'Serbia', '688', 'SRB'),
('RU', 4, 'Rusia', '643', 'RUS'),
('RW', 4, 'Ruanda', '646', 'RWA'),
('SA', 4, 'Arabia Saudita', '682', 'SAU'),
('SB', 4, 'Islas Salomón', '090', 'SLB'),
('SC', 4, 'Seychelles', '690', 'SYC'),
('SD', 4, 'Sudán', '736', 'SDN'),
('SE', 4, 'Suecia', '752', 'SWE'),
('SG', 4, 'Singapur', '702', 'SGP'),
('SH', 4, 'Santa Helena', '654', 'SHN'),
('SI', 4, 'Eslovenia', '705', 'SVN'),
('SJ', 4, 'Svalbard y Jan Mayen', '744', 'SJM'),
('SK', 4, 'Eslovaquia', '703', 'SVK'),
('SL', 4, 'Sierra Leona', '694', 'SLE'),
('SM', 4, 'San Marino', '674', 'SMR'),
('SN', 4, 'Senegal', '686', 'SEN'),
('SO', 4, 'Somalia', '706', 'SOM'),
('SR', 4, 'Surinam', '740', 'SUR'),
('ST', 4, 'Santo Tomé y Príncipe', '678', 'STP'),
('SV', 4, 'El Salvador', '222', 'SLV'),
('SY', 4, 'Siria', '760', 'SYR'),
('SZ', 4, 'Suazilandia', '748', 'SWZ'),
('TC', 4, 'Islas Turcas y Caicos', '796', 'TCA'),
('TD', 4, 'Chad', '148', 'TCD'),
('TF', 4, 'Territorios Australes Franceses', '260', 'ATF'),
('TG', 4, 'Togo', '768', 'TGO'),
('TH', 4, 'Tailandia', '764', 'THA'),
('TJ', 4, 'Tayikistán', '762', 'TJK'),
('TK', 4, 'Tokelau', '772', 'TKL'),
('TL', 4, 'Timor Oriental', '626', 'TLS'),
('TM', 4, 'Turkmenistán', '795', 'TKM'),
('TN', 4, 'Túnez', '788', 'TUN'),
('TO', 4, 'Tonga', '776', 'TON'),
('TR', 4, 'Turquía', '792', 'TUR'),
('TT', 4, 'Trinidad y Tobago', '780', 'TTO'),
('TV', 4, 'Tuvalu', '798', 'TUV'),
('TW', 4, 'Taiwán', '158', 'TWN'),
('TZ', 4, 'Tanzania', '834', 'TZA'),
('UA', 4, 'Ucrania', '804', 'UKR'),
('UG', 4, 'Uganda', '800', 'UGA'),
('UM', 4, 'Islas ultramarinas de Estados Unidos', '581', 'UMI'),
('url', 10, 'Url / Repositorios', '', ''),
('US', 4, 'Estados Unidos', '840', 'USA'),
('UY', 4, 'Uruguay', '858', 'URY'),
('UZ', 4, 'Uzbekistán', '860', 'UZB'),
('VA', 4, 'the Vatican City  Ciudad del Vaticano', '336', 'VAT'),
('VC', 4, 'San Vicente y las Granadinas', '670', 'VCT'),
('VE', 4, 'Venezuela', '862', 'VEN'),
('VG', 4, 'Islas Vírgenes Británicas', '092', 'VGB'),
('VI', 4, 'Islas Vírgenes Estadounidenses', '850', 'VIR'),
('video', 10, 'Video', '', ''),
('VN', 4, 'Vietnam', '704', 'VNM'),
('VU', 4, 'Vanuatu', '548', 'VUT'),
('WF', 4, 'Wallis y Futuna', '876', 'WLF'),
('WS', 4, 'Samoa', '882', 'WSM'),
('YE', 4, 'Yemen', '887', 'YEM'),
('YT', 4, 'Mayotte', '175', 'MYT'),
('ZA', 4, 'Sudáfrica', '710', 'ZAF'),
('ZM', 4, 'Zambia', '894', 'ZMB'),
('ZW', 4, 'Zimbabue', '716', 'ZWE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_contenido`
--

CREATE TABLE `x_contenido` (
  `contenido_id` decimal(10,0) NOT NULL,
  `contenido_categoria_id` decimal(10,0) DEFAULT NULL,
  `contenido_titulo` varchar(250) DEFAULT NULL,
  `contenido_alias` varchar(250) DEFAULT NULL,
  `contenido_titulo_h` varchar(5) DEFAULT NULL,
  `contenido_detalle` text,
  `contenido_lenguaje` varchar(5) DEFAULT NULL,
  `contenido_publicado` varchar(5) DEFAULT NULL,
  `contenido_frontpage` varchar(5) DEFAULT NULL,
  `contenido_visitas` int(11) DEFAULT NULL,
  `contenido_grupo_usuario_todos` varchar(5) DEFAULT NULL,
  `contenido_solo_registrados` varchar(5) DEFAULT NULL,
  `contenido_usuario_crea` varchar(20) DEFAULT NULL,
  `contenido_usuario_actualiza` varchar(20) DEFAULT NULL,
  `contenido_fecha_creacion` datetime DEFAULT NULL,
  `contenido_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_contenido`
--

INSERT INTO `x_contenido` (`contenido_id`, `contenido_categoria_id`, `contenido_titulo`, `contenido_alias`, `contenido_titulo_h`, `contenido_detalle`, `contenido_lenguaje`, `contenido_publicado`, `contenido_frontpage`, `contenido_visitas`, `contenido_grupo_usuario_todos`, `contenido_solo_registrados`, `contenido_usuario_crea`, `contenido_usuario_actualiza`, `contenido_fecha_creacion`, `contenido_fecha_actualizacion`) VALUES
(1, 1, 'Presentación1', 'presentacion1', '1', '<p class=\"xs_resaltar light fuente16 italic wow fadeInUp\" data-wow-delay=\"0.5s\" style=\"text-align: center;\">La Coordinadora de Medios Comunitarios, Populares y Educativos de Ecuador, CORAPE, con el apoyo de La Deutsche Welle Akademie ejecuta el proyecto &ldquo;Inclusi&oacute;n de la Cosmovisi&oacute;n de los Pueblos Originarios en Wikipedia &ndash; Desoccidentalizando la Wiki&rdquo;.</p>\r\n\r\n<p class=\"xs_resaltar light fuente16 italic wow fadeInUp\" data-wow-delay=\"0.5s\" style=\"text-align: center;\">Con el prop&oacute;sito es incluir la visi&oacute;n de los pueblos originarios a los art&iacute;culos en espa&ntilde;ol que ya existen en Wikipedia.</p>\r\n', 'es', '2', '2', 227, '2', '2', 'admin', 'admin', '2019-01-14 16:34:08', '2019-07-01 15:39:56'),
(2, 1, 'Centro de Documentación', 'centro-de-documentacion', '1', '<h3 style=\"text-align: justify;\">&iquest;Qu&eacute; es el centro de Documentaci&oacute;n?</h3>\r\n\r\n<p style=\"text-align: justify;\">Este centro de documentaci&oacute;n es una iniciativa de la Coordinara de Radios Populares y Educativas del Ecuador. Ha&nbsp;sido creado para difundir, preservar y visibilizar las producciones acad&eacute;micas, audiovisuales, fotogr&aacute;ficas y orales producidos por diferentes instituciones p&uacute;blica y privadas, organizaciones sociales, medios de comunicaci&oacute;n comunitarios y organizaciones ind&iacute;genas&nbsp;que buscan fortalecer la presencia de los Pueblos y Nacionalidades en el Ecuador.</p>\r\n\r\n<p style=\"text-align: justify;\">El centro de documentaci&oacute;n se establece como un servicio en l&iacute;nea, de acceso libre y gratuito.</p>\r\n\r\n<h4 style=\"text-align: justify;\">&iquest;Para qu&eacute; sirve?</h4>\r\n\r\n<p style=\"text-align: justify;\">Esta iniciativa busca concentrar los diversos productos que hacen referencia a Pueblos y Nacionalidades del Ecuador con el objetivo de visibilizar desde la producci&oacute;n de conocimientos y sabidur&iacute;as a los pueblos originarios.&nbsp;</p>\r\n\r\n<h4 style=\"text-align: justify;\">&iquest;Qui&eacute;nes colaboran?</h4>\r\n\r\n<p style=\"text-align: justify;\">En principios colaboran los medios de comunicaci&oacute;n y centro de producci&oacute;n comunitarios directamente vinculados a procesos de desarrollo social con sus radios afiliadas y otras organizaciones de comunicaci&oacute;n afines, as&iacute; como organizaciones regionales de Pueblos y Nacionalidades del pa&iacute;s. &nbsp;</p>\r\n\r\n<h4 style=\"text-align: justify;\">&iquest;Qu&eacute; documentos contiene?</h4>\r\n\r\n<p style=\"text-align: justify;\">El centro de documentaci&oacute;n est&aacute; integrado por tres sitios:</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 col-md-2 col-lg-2\">\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"media/pictures/web/centro_documento/uno.png\" /></p>\r\n</div>\r\n\r\n<div class=\"col-sm-12 col-md-4 col-lg-10\">\r\n<p style=\"text-align: justify;\">Multimedia dedicada a recopilar la informaci&oacute;n generada por los medios de comunicaci&oacute;n y comunicadores comunitarios y recoge audios, fotograf&iacute;as y producci&oacute;n audiovisual.</p>\r\n</div>\r\n</div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 col-md-2 col-lg-2\">\r\n<p style=\"text-align: center;\"><img alt=\"Corape\" src=\"media/pictures/web/centro_documento/dos.png\" /></p>\r\n</div>\r\n\r\n<div class=\"col-sm-12 col-md-4 col-lg-10\">\r\n<p style=\"text-align: justify;\">Biblioteca que paulatinamente contendr&aacute; informaci&oacute;n de los 18 pueblos y 14 nacionalidades ind&iacute;genas, as&iacute; como del pueblo afro y montubio, que recoge las producciones generadas con sentido acad&eacute;mico, incluye la informaci&oacute;n general de cada Pueblo y Nacionalidad y publicaciones como textos, revistas y tesis.</p>\r\n</div>\r\n</div>\r\n\r\n<div class=\"row\">\r\n<div class=\"col-sm-12 col-md-2 col-lg-2\">\r\n<p style=\"text-align: center;\"><img alt=\"Corape\" src=\"media/pictures/web/centro_documento/tres.png\" /></p>\r\n</div>\r\n\r\n<div class=\"col-sm-12 col-md-4 col-lg-10\">\r\n<p>Otros repositorios y organizaciones que contiene los links a otros repositorios acad&eacute;micos y a organizaciones que producen contenido que fortalece la presencia de pueblos y nacionalidades en el pa&iacute;s.</p>\r\n</div>\r\n</div>\r\n', 'es', '1', '2', 436, '2', '2', 'admin', 'dmuenala', '2019-01-14 16:41:00', '2019-07-03 11:33:10'),
(3, 1, 'Derechos', 'derechos', '2', '<p>Es material de acceso libre los contenidos que se encuentran el en el presente Repositorio</p>\r\n', 'es', '1', '2', 171, '2', '2', 'admin', 'admin', '2019-01-14 17:32:56', '2019-01-14 17:38:11'),
(4, 1, 'Términos y Condiciones', 'terminos-y-condiciones', '1', '<p>El Centro de Documentaci&oacute;n es un portal que permite resguardar, centralizar y visibilizar las producciones audios visuales, fotogr&aacute;ficas generadas a favor de los pueblos y nacionalidades del Ecuador. Es importante que lea y acepte estas directrices que permiten el correcto funcionamiento del sitio.</p>\r\n\r\n<p>&iquest;Qui&eacute;nes son responsables de los que se publica?<br />\r\nEl Centro de documentaci&oacute;n es un centro que ayuda al alojamiento de las producciones por lo tanto no necesariamente compartimos y nos adherimos a los contenidos publicados, siendo &eacute;stos de absoluta responsabilidad de los usuarias y usuarias.</p>\r\n\r\n<h3>&iquest;Qu&eacute; normas deben cumplir los documentos que se publican en el Centro de Documentaci&oacute;n?</h3>\r\n\r\n<ul>\r\n	<li>Los contenidos no pueden irrespetar los Derechos Humanos, la Diversidad Cultural, la Cultura de Paz ni los Derechos de los Animales y la Naturaleza. No pueden ser documentos que discriminen o promuevan el racismo, el sexismo, la homofobia, que ofendan o insulten abiertamente a alg&uacute;n sector de la ciudadan&iacute;a, hagan apolog&iacute;a de la violencia o el delito en cualquiera de sus formas o incurran en ilegalidades.</li>\r\n	<li>No pueden hacer propaganda pol&iacute;tica partidaria ni proselitismo religioso.</li>\r\n	<li>No se permite publicar publicidad con fines comerciales no autorizados (spam).</li>\r\n	<li>Deben ser documentos en caso de los audios y videos que cumplan con un m&iacute;nimo de calidad.&nbsp;</li>\r\n	<li>Todos los autores son responsables de que los recursos que utilicen en las producciones publicadas en el Centro de Documentaci&oacute;n no vulneren derechos de autor de terceros.</li>\r\n	<li>Las producciones que vulneren cualquiera de esas condiciones ser&aacute;n retiradas del Centro de Documentaci&oacute;n con el correspondiente aviso a los autores.</li>\r\n</ul>\r\n\r\n<h3>&iquest;C&oacute;mo se licencian los audios que se publican en el Centro de Documentaci&oacute;n?</h3>\r\n\r\n<p>Las personas o instituciones que publican contenidos en el Centro de Documentaci&oacute;n son las propietarias de dichos contenidos. En ning&uacute;n momento el Centro de Documentaci&oacute;n pasa a ser propietaria de dichos contenidos.</p>\r\n\r\n<p>El Centro de Documentaci&oacute;n responde a las licencias Creative Commons (CC) que tienen como funci&oacute;n compartir y reutilizar las obras de creaci&oacute;n bajo ciertas condiciones, con estas licencias el autor autoriza el uso de obra, pero &eacute;sta contin&uacute;a siendo protegida, es decir, mantiene algunos derechos reservados. &nbsp;Al subir las producciones generadas por los colaboradores no se renuncia a los derechos de autor. La cesi&oacute;n responde a la entrega de derechos de publicaci&oacute;n. Los usuarios del Centro de Documentaci&oacute;n pueden descargar (si as&iacute; el autor lo permite) los materiales, difundirlos, o transmitirlos por sus medios siempre y cuando:</p>\r\n\r\n<ul>\r\n	<li>Reconozcan los cr&eacute;ditos de la obra de la manera especificada por el autor, cit&aacute;ndole y atribuy&eacute;ndole la autor&iacute;a.</li>\r\n	<li>Si altera o transforma esa obra, o genera una obra derivada (traducciones, que toman una parte de &eacute;ste&hellip;), s&oacute;lo se podr&aacute; distribuir la nueva obra generada bajo una licencia id&eacute;ntica a &eacute;sta.</li>\r\n</ul>\r\n\r\n<p>El Centro de Documentaci&oacute;n no proveer&aacute; defensa legal en caso de que alg&uacute;n autor emprenda acciones legales sobre sus derechos en casos de denuncias relacionadas con Propiedad Intelectual.</p>\r\n\r\n<h3>&iquest;Qu&eacute; sucede con los datos que proporcion&oacute; al Centro de Documentaci&oacute;n en mi registro?</h3>\r\n\r\n<p>Los datos que facilitas no ser&aacute;n nunca compartidos ni vendidos a terceros ni usados para otros fines que los estrictamente relacionados con este sitio web.</p>\r\n\r\n<h3>&iquest;Puedo usar el logo de Centro de Documentaci&oacute;n en mi sitio web, blog o red social?</h3>\r\n\r\n<p>Por supuesto. Los logos del Centro de Documentaci&oacute;n son de la comunidad y est&aacute;n bajo licencia Creative Commons. Por lo tanto, puedes usar el logo en tu sitio, difundirlo, transformarlo y adaptarlo a tus necesidades.</p>\r\n\r\n<h3>&iquest;Estos t&eacute;rminos y condiciones pueden variar?</h3>\r\n\r\n<p>Es posible. El Centro de Documentaci&oacute;n podr&aacute; modificar en el futuro las pol&iacute;ticas del sitio siempre que sea necesario. En ese caso, avisar&aacute; a todos sus usuarios y usuarias para se informen y acepten dichos cambios.<br />\r\n&nbsp;</p>\r\n', 'es', '2', '2', NULL, '2', '2', 'admin', 'dmuenala', '2019-03-13 10:04:46', '2019-07-23 15:28:38'),
(5, 1, 'Hackatón', 'hackaton', '1', '<h2 style=\"text-align: center;\"><img alt=\"\" height=\"362\" src=\"https://ciespal.org/wp-content/uploads/2019/05/Conecta-Culturas1.jpg\" width=\"630\" /></h2>\r\n\r\n<h2 style=\"text-align: center;\">&nbsp;</h2>\r\n\r\n<h2 style=\"text-align: center;\">&iquest;Qu&eacute; es el Hackat&oacute;n?</h2>\r\n\r\n<p style=\"text-align: center;\">Un Hackathon es un encuentro en el que diferentes personas de distintos perfiles, trabajan de forma intensiva en equipos para crear una soluci&oacute;n/desarrollo/prototipo que d&eacute; respuesta a una necesidad espec&iacute;fica; el objetivo de este tipo de eventos es desarrollar aplicaciones de forma colaborativa en un lapso corto de tiempo.</p>\r\n\r\n<p style=\"text-align: justify;\">2019 es el A&ntilde;o Internacional de las Lenguas Ind&iacute;genas, proclamado por la Asamblea General de las Naciones Unidas y coordinado por la UNESCO. El A&ntilde;o Internacional de las Lenguas Ind&iacute;genas es un importante mecanismo de cooperaci&oacute;n destinado a concienciar y a movilizar a diferentes interesados para llevar a cabo una labor coordinada en todo el mundo en torno a la sensibilizaci&oacute;n acerca de los riesgos que enfrentan las lenguas ancestrales a lo largo y ancho del mundo, as&iacute; como de su valor como veh&iacute;culos de culturas, de modos de vida y sistemas de conocimiento singulares. La Coordinadora de Medios Comunitarios Populares y Educativos de Ecuador, CORAPE, y Deutsche Welle Akademie emprendieron desde septiembre de 2018 el proyecto piloto &ldquo;Nos Tomamos la Wiki&rdquo; para el &ldquo;Fortalecimiento de la Cosmovisi&oacute;n de los Pueblos y Nacionalidades del Ecuador&rdquo; con el fin de sensibilizar a la opini&oacute;n p&uacute;blica sobre los riesgos que enfrentan las lenguas -y las tradiciones, pr&aacute;cticas y saberes que se comparten y transmiten a trav&eacute;s de ellas-, as&iacute; como su valor como veh&iacute;culos de la interculturalidad y el desarrollo sostenible.</p>\r\n\r\n<p style=\"text-align: justify;\">El objetivo del proyecto fue visibilizar la cultura, identidad, historia, gastronom&iacute;a, m&uacute;sica de los pueblos y nacionalidades por medio del &ldquo;Centro de Documentaci&oacute;n Virtual&rdquo;, una plataforma digital. &ldquo;Nos Tomamos la Wiki&rdquo; inici&oacute; el trabajo con la edici&oacute;n de art&iacute;culos en la enciclopedia colaborativa Wikipedia.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" height=\"220\" src=\"http://ciespal.org/wp-content/uploads/2019/05/Conecta-Culturas2.jpg\" width=\"331\" /></p>\r\n\r\n<p style=\"text-align: justify;\">El resultado de este proyecto es el Centro de Documentaci&oacute;n Virtual de los Pueblos y Nacionalidades del Ecuador, que sirve como punto de encuentro de material investigativo ya existente, de diversas fuentes e instituciones, como enlace a bibliotecas virtuales de temas afines y para publicar aquellas investigaciones que no se ha digitalizado y las nuevas producciones narradas desde las voces de los propios representantes de las culturas ind&iacute;genas. En este momento, el Centro de documentaci&oacute;n cuenta con informaci&oacute;n que fue resultado de talleres de manejo de wikis fundamentalmente.</p>\r\n\r\n<p style=\"text-align: justify;\">El Centro de Documentaci&oacute;n Virtual de los Pueblos y Nacionalidades del Ecuador es un proyecto vivo que requiere la conexi&oacute;n entre el portal y el conocimiento de los pueblos y nacionalidades, que muchas veces no cuentan con conectividad o con herramientas que permitan compartirlo. En este punto, se ha pensado en el desarrollo de una aplicaci&oacute;n m&oacute;vil que permita el intercambio de conocimientos desde diversos puntos y realidades culturales del pa&iacute;s.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<h2 style=\"text-align: center;\"><strong>&iquest;Por qu&eacute; desarrollar un app m&oacute;vil?</strong></h2>\r\n\r\n<p style=\"text-align: justify;\">Se ha elegido la metodolog&iacute;a del hackat&oacute;n, con la finalidad de generar nuevos lazos con la comunidad de desarrolladores, activistas culturales o tecnol&oacute;gicos y de otras &aacute;reas de conocimientos comprometidos con el pa&iacute;s, las nacionalidades y el di&aacute;logo intercultural.&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">Vale a&ntilde;adir, que el hackat&oacute;n es el primer paso para identificar de las propuestas y prototipos, una con la finalidad de que concluya su desarrollo durante cuatro meses. Este proceso ser&aacute; descrito m&aacute;s adelante.</p>\r\n\r\n<h2 style=\"text-align: center;\">&nbsp;</h2>\r\n\r\n<h2 style=\"text-align: center;\"><strong>El Reto</strong></h2>\r\n\r\n<p style=\"text-align: justify;\">Un hackat&oacute;n es la invitaci&oacute;n a resolver un reto colaborativamente y en corto tiempo. En este sentido, es necesario iniciar el desarrollo&nbsp;<b><i>una aplicaci&oacute;n m&oacute;vil para gestionar diversos contenidos generados en diversas localidades del pa&iacute;s &nbsp;y que se conecte a la web del centro de documentaci&oacute;n</i></b>, as&iacute; &nbsp;incentivar la participaci&oacute;n de nuevas &nbsp;producciones interculturales peri&oacute;dicamente y desde diversas cosmovisiones &nbsp;de los pueblos y nacionalidades.</p>\r\n\r\n<p style=\"text-align: justify;\">Aspectos que pueden ser m&aacute;s valorados en la selecci&oacute;n de prototipos:</p>\r\n\r\n<ul>\r\n	<li>Usabilidad.</li>\r\n	<li>Accesibilidad.</li>\r\n	<li>Geolocalizaci&oacute;n.</li>\r\n	<li>Edici&oacute;n multimedia de fotos o v&iacute;deos</li>\r\n	<li>Correcci&oacute;n ortogr&aacute;fica</li>\r\n	<li>Desarrollo Offline first.</li>\r\n	<li>Equipos conformados con equidad de g&eacute;nero.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2 style=\"text-align: center;\"><strong>Perfil de participantes</strong></h2>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" height=\"182\" src=\"http://ciespal.org/wp-content/uploads/2019/05/Conecta-Culturas11.jpg\" width=\"480\" /></p>\r\n\r\n<p style=\"text-align: center;\">Desarrolladores/as de software profesionales</p>\r\n\r\n<p style=\"text-align: center;\">Universitarios/as, estudiantes de institutos y conservatorios de carreras: Inform&aacute;ticas, dise&ntilde;o gr&aacute;fico, comunicaci&oacute;n, cine y m&uacute;sica</p>\r\n\r\n<p style=\"text-align: center;\">Universitarios/as y estudiantes de institutos de carreras: antropolog&iacute;a, sociolog&iacute;a, turismo, gesti&oacute;n cultural y arte</p>\r\n\r\n<p style=\"text-align: center;\">Docentes y profesionales interesados/as en el tema</p>\r\n\r\n<p>Requisitos:</p>\r\n\r\n<ul>\r\n	<li>Ser Mayor de 18 a&ntilde;os.</li>\r\n	<li>Ser ecuatorianos o extranjeros con residencia.</li>\r\n	<li>Inscribirse al equipo en l&iacute;nea hasta el 24 de julio en<br />\r\n	<a href=\"https://docs.google.com/forms/d/e/1FAIpQLScHE7w419BvcFjaT43CGnx9N8yRbnSkj7OAh2fb1OdhOLwR2w/viewform?usp=pp_url\">https://docs.google.com/forms/d/e/1FAIpQLScHE7w419BvcFjaT43CGnx9N8yRbnSkj7OAh2fb1OdhOLwR2w/viewform?usp=pp_url</a></li>\r\n	<li>Ser parte de un equipo que puede ser compuesto de entre 2 a 5 personas.</li>\r\n	<li>Todos los participantes deber&aacute;n aceptar el acuerdo de convivencia y competencia &eacute;tica, no discriminaci&oacute;n y respeto a la diversidad.</li>\r\n	<li>Utilizaci&oacute;n de herramientas de Software Libre y/o de C&oacute;digo Abierto.</li>\r\n	<li>Desarrollo de la aplicaci&oacute;n bajo licencias libres y/o de c&oacute;digo abierto.</li>\r\n	<li>Traer vajilla propia para evitar usar desechables.</li>\r\n	<li>Cubrir el costo de inscripci&oacute;n por participante ser&aacute; de $5, que se pagar&aacute;n el d&iacute;a del hackat&oacute;n.</li>\r\n</ul>\r\n\r\n<h2 style=\"text-align: justify;\">&nbsp;</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2 style=\"text-align: center;\"><strong>Tecnolog&iacute;a a usar en los equipos</strong></h2>\r\n\r\n<ul>\r\n	<li style=\"text-align: justify;\">Las herramientas utilizadas para el desarrollo de la aplicaci&oacute;n deben ser de Software Libre o C&oacute;digo Abierto.</li>\r\n	<li style=\"text-align: justify;\">Todas las aplicaciones y/o soluciones deber&aacute;n ser desarrolladas bajo alg&uacute;n tipo de licencias Libres y/o de C&oacute;digo Abierto. En caso de reutilizaci&oacute;n de componentes open source, todas las obligaciones legales de la licencia deber&aacute;n ser cumplidas. La documentaci&oacute;n t&eacute;cnica debe ser liberada bajo licencia Creative Commons v.4.</li>\r\n	<li style=\"text-align: justify;\">Reutilizar frameworks o c&oacute;digo existente ser&aacute; v&aacute;lido, siempre que se cumplan las obligaciones de las licencias y sean estos libres u open source.</li>\r\n</ul>\r\n\r\n<h2 style=\"text-align: center;\">&nbsp;</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2 style=\"text-align: center;\"><strong>Tiempo de duraci&oacute;n del Hackat&oacute;n</strong></h2>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" height=\"87\" src=\"http://ciespal.org/wp-content/uploads/2019/05/Conecta-Culturas12.jpg\" width=\"470\" /></p>\r\n\r\n<p>Durante las horas del hackat&oacute;n los equipos participar&aacute;n en las fases:</p>\r\n\r\n<ol>\r\n	<li>Apertura del hackat&oacute;n.</li>\r\n	<li>Organizaci&oacute;n y trabajo de los equipos.</li>\r\n	<li>Charlas con de parte de potenciales usuarios de la aplicaci&oacute;n y desarrolladores del portal &ldquo;Centro de Documentaci&oacute;n Virtual de los Pueblos y Nacionalidades del Ecuador&rdquo;.</li>\r\n	<li>Presentaci&oacute;n de los prototipos.</li>\r\n	<li>Selecci&oacute;n del prototipo ganador por el jurado.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2 style=\"text-align: center;\"><strong>Mesa de Jurados</strong></h2>\r\n\r\n<p>Miembros de la organizaciones que organizan el hackat&oacute;n: CORAPE, DW Akademie, la Oficina de la UNESCO en Quito, Medialab CIESPAL, Xperto Solutions, y dos expertos independientes.</p>\r\n\r\n<h2 style=\"text-align: center;\">&nbsp;</h2>\r\n\r\n<h2 style=\"text-align: center;\"><strong>&iquest;Qu&eacute; pasar&aacute; despu&eacute;s del Hackat&oacute;n?</strong></h2>\r\n\r\n<ol>\r\n	<li>Acuerdos con el equipo seleccionado.</li>\r\n	<li>Asesor&iacute;a al equipo seleccionado por 4 meses para el desarrollo de la aplicaci&oacute;n.</li>\r\n	<li>Reuniones de seguimiento.</li>\r\n	<li>Entrega de la aplicaci&oacute;n final.</li>\r\n	<li>Puesta en producci&oacute;n de la aplicaci&oacute;n.</li>\r\n	<li>Difusi&oacute;n de los aprendizajes.</li>\r\n</ol>\r\n\r\n<h2 style=\"text-align: center;\">&nbsp;</h2>\r\n\r\n<h2 style=\"text-align: center;\"><strong>Premio al equipo ganador</strong></h2>\r\n\r\n<p style=\"text-align: justify;\">El equipo que obtenga el mayor puntaje en la ronda de presentaci&oacute;n de prototipos al jurado ser&aacute; declarado ganador del Hackat&oacute;n.&nbsp;<strong>Solo existir&aacute; un premio en efectivo al primer lugar, que corresponde a un contrato por $3000 (tres mil) d&oacute;lares incluido IVA, con UNESCO por concepto del desarrollo total de la aplicaci&oacute;n m&oacute;vil, que deber&aacute; ser concluido en un periodo de 4 meses desde la firma del contrato.</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Los pagos por el desarrollo ser&aacute;n entregados en una distribuci&oacute;n de 30/30/40 previo desarrollo de un plan de trabajo e informes de satisfacci&oacute;n por parte de la entidad de acompa&ntilde;amiento.</p>\r\n\r\n<p style=\"text-align: justify;\">El premio solo puede ser efectivo si es que uno de los miembros del equipo ganador cuenta con n&uacute;mero de RUC y cuenta bancaria. Caso contrario de no contar con estos requisitos hasta un plazo de 4 d&iacute;as desde la finalizaci&oacute;n del hackat&oacute;n, el premio se entregar&aacute; al segundo lugar.</p>\r\n\r\n<h2 style=\"text-align: center;\">&nbsp;</h2>\r\n\r\n<h2 style=\"text-align: center;\"><strong>Direcci&oacute;n del concurso</strong></h2>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://ciespal.org/wp-content/uploads/2019/05/Conecta-Culturas-direcci%C3%B3n.jpg\" /></p>\r\n\r\n<h2 style=\"text-align: center;\">&nbsp;</h2>\r\n\r\n<h2 style=\"text-align: center;\"><strong>Agenda</strong></h2>\r\n\r\n<p><b>Viernes 26 de julio</b></p>\r\n\r\n<p>17:00: Registro de participantes.</p>\r\n\r\n<p>17h30: Evento inaugural</p>\r\n\r\n<p>18h00: Panel sobre el&nbsp;<b>Centro de Documentaci&oacute;n de Pueblos y Nacionalidades del Ecuador</b></p>\r\n\r\n<p>19h00: Bases y anuncios para la participaci&oacute;n,</p>\r\n\r\n<p>19h30: Conformaci&oacute;n de equipos si no est&aacute;n conformados a&uacute;n</p>\r\n\r\n<p>20h00: Cierre primera jornada</p>\r\n\r\n<p><b>S&aacute;bado 27 de julio</b></p>\r\n\r\n<p>07h30: Re-Inicio del Hackat&oacute;n</p>\r\n\r\n<p>8h30: Desayuno</p>\r\n\r\n<p>09:00: &nbsp;Charlas breves acerca de las necesidades de usuarios y acerca del desarrollo del portal (API)</p>\r\n\r\n<p>13h30: Almuerzo</p>\r\n\r\n<p>14h30: Reinicio de jornada</p>\r\n\r\n<p>15h00: Charla sobre c&oacute;mo hacer un buen pitch (opcional)</p>\r\n\r\n<p>19h00: Reuniones de confraternizaci&oacute;n y cena</p>\r\n\r\n<p>20h00: Cierre de puertas</p>\r\n\r\n<p><b>Domingo 28 de julio</b></p>\r\n\r\n<p>7h30: Apertura de puertas para la gente que sali&oacute; de las instalaciones</p>\r\n\r\n<p>8h30: Desayuno</p>\r\n\r\n<p>13h00: Almuerzo</p>\r\n\r\n<p>15h00: Presentaci&oacute;n de pitches a los jurados y p&uacute;blico en general</p>\r\n\r\n<p>16h00: Selecci&oacute;n del jurado</p>\r\n\r\n<p>17h00: Premiaci&oacute;n</p>\r\n\r\n<h2 style=\"text-align: center;\">&nbsp;</h2>\r\n\r\n<h2 style=\"text-align: center;\"><strong>Entidades organizadoras</strong></h2>\r\n\r\n<h2 style=\"text-align: center;\"><b><img alt=\"\" src=\"http://ciespal.org/wp-content/uploads/2019/05/bandalogos2.jpg\" /></b></h2>\r\n\r\n<h2 style=\"text-align: justify;\"><b>CORAPE</b></h2>\r\n\r\n<p style=\"text-align: justify;\">La Coordinadora de Medios Comunitarios Populares y Educativos del Ecuador CORAPE, es una organizaci&oacute;n sin fines de lucro, constituida jur&iacute;dicamente el 4 de mayo de 1992, por lo tanto, cuenta con 29 a&ntilde;os de experiencia en la construcci&oacute;n y el fortalecimiento de medios de comunicaci&oacute;n alternativos, populares, ciudadanos, comunitarios a trav&eacute;s de un eje estrat&eacute;gico el trabajo en Red, que le permite fortalecer la diversidad en la unidad, trabaja programas educativos, informativos, sociales y creativos que le permite llegar a la comunidad de una manera cotidiana, familiar y con gran credibilidad, al priorizar temas de inter&eacute;s para la ciudadan&iacute;a. Utiliza todas las herramientas, g&eacute;neros y formatos comunicacionales en diversos idiomas entre ellos espa&ntilde;ol, kichwa y shuar. Adem&aacute;s ha realizado cu&ntilde;as, jingles, micro programas, radio novelas, entre otros.</p>\r\n\r\n<h2 style=\"text-align: justify;\"><b>DW Akademie LA</b></h2>\r\n\r\n<p style=\"text-align: justify;\">Deutsche Welle Akademie es la principal organizaci&oacute;n de Desarrollo de Medios (Media Development) de Alemania. La misi&oacute;n de DW Akademie es fomentar y fortalecer el Derecho Humano a la Libertad de Expresi&oacute;n y el Acceso a la Informaci&oacute;n (Art. 19 de la Declaraci&oacute;n Universal de los DD.HH. de la ONU). En Ecuador, DW Akademie, en conjunto con la Coordinadora de Medios Comunitarios Populares y Educativos &ndash; CORAPE, impulsa un proyecto de apoyo a los medios comunitarios, para su consolidaci&oacute;n y fortalecimiento en t&eacute;rminos de profesionalizaci&oacute;n, pero tambi&eacute;n de sostenibilidad financiera.</p>\r\n\r\n<h2 style=\"text-align: justify;\"><b>La Oficina de la UNESCO en Quito y Representaci&oacute;n para Bolivia, Colombia, Ecuador y Venezuela</b></h2>\r\n\r\n<p style=\"text-align: justify;\">La Oficina de la UNESCO en Quito y Representaci&oacute;n para Bolivia, Colombia, Ecuador y Venezuela, en cumplimiento a sus mandatos en los &aacute;mbitos de Educaci&oacute;n, Ciencias Exactas y Naturales, Cultura y &nbsp;Comunicaci&oacute;n e Informaci&oacute;n, contribuye a la formaci&oacute;n de competencias, el fortalecimiento de capacidades instaladas y la orientaci&oacute;n de las pol&iacute;ticas p&uacute;blicas en los Estados Miembros que hacen parte de la Representaci&oacute;n de esta Oficina de la UNESCO, a los fines de la consecuci&oacute;n de los Objetivos de Desarrollo Sostenible (ODS) de la Agenda 2030 para el Desarrollo Sostenible, la agenda civilizatoria acordada por el concierto de los Estados Miembros que hacen parte de Naciones Unidas.</p>\r\n\r\n<p style=\"text-align: justify;\">Se trata de un esfuerzo multidimensional que -partiendo del principio de la complementariedad y del respeto y la consideraci&oacute;n por las especificidades de desarrollo socioecon&oacute;mico, ambiental y cultural de cada uno de los pa&iacute;ses que conforman el cl&uacute;ster- se propone el alcance en un contexto dial&oacute;gico y cooperativo de los ODS, a trav&eacute;s del aprovechamiento de las oportunidades y escenarios de cooperaci&oacute;n e incidencia que la UNESCO ha identificado como pertinentes en aras de generar un impacto positivo en t&eacute;rminos de construcci&oacute;n de una paz duradera y un desarrollo sostenible erigido sobre los principios de equidad, igualdad, justicia social, di&aacute;logo intercultural, respeto mutuo, inclusi&oacute;n y aprecio por la diversidad.</p>\r\n\r\n<p style=\"text-align: justify;\">Desde que se adoptara la Agenda 2030 en el a&ntilde;o 2015, los ODS son la piedra angular que sostiene y gu&iacute;a el accionar de esta Oficina; asimismo, entendemos que ese horizonte que marca el cumplimiento de los ODS demanda procesos sustentados en el enfoque de Derechos Humanos y la incorporaci&oacute;n transversal de la igualdad de g&eacute;nero.</p>\r\n\r\n<h2 style=\"text-align: justify;\"><b>Medialab CIESPAL</b></h2>\r\n\r\n<p style=\"text-align: justify;\">Es un proyecto de CIESPAL, &ldquo;que tiene como objetivo institucional y &aacute;mbito de acci&oacute;n promover la producci&oacute;n de tecnolog&iacute;a, emprendimientos y de proyectos comunicacionales y art&iacute;sticos mediante el uso de tecnolog&iacute;as contempor&aacute;neas y de conocimientos ancestrales para el bien com&uacute;n, con una pedagog&iacute;a que incluye conocimientos acad&eacute;micos y experiencias populares; bajo una concepci&oacute;n de creaci&oacute;n innovadora, colaborativa, comunitaria y libre&rdquo;.</p>\r\n\r\n<p style=\"text-align: justify;\">Nuestra meta es impulsar una comunidad de gestores, investigadores, activistas, y emprendedores ciudadanos. En este sentido el Medialab CIESPAL lleva adelante diversas estrategias con la finalidad de dinamizar redes y alianzas, una de ellas es el dise&ntilde;o y desarrollo de hackatones.</p>\r\n\r\n<p style=\"text-align: justify;\">Hackatones organizados por Medialab CIESPAL hasta el presente:</p>\r\n\r\n<ul>\r\n	<li style=\"text-align: justify;\">#Hack153 en 2016</li>\r\n	<li style=\"text-align: justify;\">Hackat&oacute;n Social Tech en la UPS en 2016</li>\r\n	<li style=\"text-align: justify;\">SpaceAppChallenge 2017</li>\r\n	<li style=\"text-align: justify;\">Global Game Jam 2017</li>\r\n	<li style=\"text-align: justify;\">Global Game Jam 2018</li>\r\n	<li style=\"text-align: justify;\">RutaHack, hackat&oacute;n de videojuegos y turismo, 2019</li>\r\n	<li style=\"text-align: justify;\">Global Game JAm 2019</li>\r\n	<li style=\"text-align: justify;\">Hackat&oacute;n de navegaci&oacute;n segura internet 2019</li>\r\n	<li style=\"text-align: justify;\">Hackat&oacute;n para igualdad de g&eacute;nero 2019</li>\r\n</ul>\r\n\r\n<h2 style=\"text-align: justify;\"><b>Xperto Solutions</b></h2>\r\n\r\n<p style=\"text-align: justify;\">Asesoramos y apoyamos a las empresas, industrias, negocios, organizaciones y&nbsp;gobiernos del Ecuador para lograr su transformaci&oacute;n digital a trav&eacute;s de nuestra&nbsp;creatividad, productos y servicios digitales contribuyendo con el talento de nuestro&nbsp;equipo de personal profesional y aprendizaje continuo.</p>\r\n', 'es', '1', '2', 1830, '2', '2', 'dmuenala', 'dmuenala', '2019-06-20 10:28:31', '2019-08-01 12:33:30'),
(6, 1, 'presentación', 'presentacion', '2', '', 'es', '1', '2', 96, '2', '2', 'admin', NULL, '2019-07-01 15:51:43', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_contenido_categoria`
--

CREATE TABLE `x_contenido_categoria` (
  `contenido_categoria_id` decimal(10,0) NOT NULL,
  `contenido_categoria_nombre` varchar(250) DEFAULT NULL,
  `contenido_categoria_alias` varchar(250) DEFAULT NULL,
  `contenido_categoria_detalle` text,
  `contenido_categoria_nombre_mostrar` varchar(5) DEFAULT NULL,
  `contenido_categoria_lenguaje` varchar(5) DEFAULT NULL,
  `contenido_categoria_publicado` varchar(5) DEFAULT NULL,
  `contenido_categoria_padre_id` decimal(10,0) DEFAULT NULL,
  `contenido_categoria_usuario_crea` varchar(20) DEFAULT NULL,
  `contenido_categoria_usuario_actualiza` varchar(20) DEFAULT NULL,
  `contenido_categoria_fecha_creacion` datetime DEFAULT NULL,
  `contenido_categoria_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_contenido_categoria`
--

INSERT INTO `x_contenido_categoria` (`contenido_categoria_id`, `contenido_categoria_nombre`, `contenido_categoria_alias`, `contenido_categoria_detalle`, `contenido_categoria_nombre_mostrar`, `contenido_categoria_lenguaje`, `contenido_categoria_publicado`, `contenido_categoria_padre_id`, `contenido_categoria_usuario_crea`, `contenido_categoria_usuario_actualiza`, `contenido_categoria_fecha_creacion`, `contenido_categoria_fecha_actualizacion`) VALUES
(1, 'Corape Biblioteca', 'corape-biblioteca', '', '1', 'es', '1', NULL, 'admin', NULL, '2019-01-14 16:32:42', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_cupon`
--

CREATE TABLE `x_cupon` (
  `cupon_id` decimal(11,0) NOT NULL,
  `cupon_key` varchar(250) DEFAULT NULL,
  `cupon_descuento` decimal(10,2) DEFAULT NULL,
  `cupon_activo` varchar(5) DEFAULT NULL,
  `cupon_fecha_uso` datetime DEFAULT NULL,
  `cupon_usuario_crea` varchar(20) DEFAULT NULL,
  `cupon_usuario_actualiza` varchar(20) DEFAULT NULL,
  `cupon_fecha_creacion` datetime DEFAULT NULL,
  `cupon_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_documento`
--

CREATE TABLE `x_documento` (
  `documento_id` decimal(10,0) NOT NULL,
  `documento_categoria_id` decimal(10,0) NOT NULL,
  `documento_nombre` varchar(200) DEFAULT NULL,
  `documento_alias` varchar(250) DEFAULT NULL,
  `documento_descripcion` text,
  `documento_habilitado` varchar(5) DEFAULT NULL,
  `documento_url` varchar(250) DEFAULT NULL,
  `documento_lenguaje` varchar(5) DEFAULT NULL,
  `documento_visitas` int(11) DEFAULT NULL,
  `documento_descargas` int(11) DEFAULT NULL,
  `documento_nacionalidad` varchar(5) DEFAULT NULL,
  `documento_autor` varchar(250) DEFAULT NULL,
  `documento_productor` varchar(250) DEFAULT NULL,
  `documento_director` varchar(250) DEFAULT NULL,
  `documento_agrupacion` varchar(250) DEFAULT NULL,
  `documento_anio` int(4) DEFAULT NULL,
  `documento_tags` text,
  `documento_formato` varchar(5) DEFAULT NULL,
  `documento_tipo` varchar(5) DEFAULT NULL,
  `documento_licencia` varchar(5) DEFAULT NULL,
  `documento_grupo_usuario_todos` varchar(5) DEFAULT NULL,
  `documento_acepto` varchar(5) DEFAULT NULL,
  `documento_usuario_crea` varchar(20) DEFAULT NULL,
  `documento_usuario_actualiza` varchar(20) DEFAULT NULL,
  `documento_fecha_creacion` datetime DEFAULT NULL,
  `documento_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_documento`
--

INSERT INTO `x_documento` (`documento_id`, `documento_categoria_id`, `documento_nombre`, `documento_alias`, `documento_descripcion`, `documento_habilitado`, `documento_url`, `documento_lenguaje`, `documento_visitas`, `documento_descargas`, `documento_nacionalidad`, `documento_autor`, `documento_productor`, `documento_director`, `documento_agrupacion`, `documento_anio`, `documento_tags`, `documento_formato`, `documento_tipo`, `documento_licencia`, `documento_grupo_usuario_todos`, `documento_acepto`, `documento_usuario_crea`, `documento_usuario_actualiza`, `documento_fecha_creacion`, `documento_fecha_actualizacion`) VALUES
(1, 43, 'Yamor', 'yamor', '<p>Yamor, Sanjuanito Tradicional.</p>\r\n\r\n<p>El Yamor es la fiesta del intercambio cultural, la cohesi&oacute;n social y la participaci&oacute;n de la igualdad en diversidad. Es la fiesta del reencuentro de los otavale&ntilde;os y otavale&ntilde;as ind&iacute;genas, mestizos, afros, mujeres y hombres, que llevan en su coraz&oacute;n, el amor m&aacute;s profundo por su Valle del Amanecer.</p>\r\n', '1', 'documento-1-produccion-de-panela.mp3', 'es', 191, 76, NULL, 'Eduardo Pérez', 'Jaime Vargas', 'Eduardo Pérez', 'Wankara', 2010, 'otavalo,yamor,ibarra,fiesta del yamor,musica tradicional ecuatoriana', NULL, 'audio', NULL, '2', 'true', 'admin', 'santiago', '2019-01-14 23:07:20', '2019-07-24 23:27:40'),
(4, 25, 'Hola (Kichwa - Shuar)', 'diccionario-intercultural-hola', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-4-diccionario-intercultural-hola.mp3', 'es', 126, 78, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2018, 'diccionario,intercultural,hola,Kichwa,Shuar', NULL, 'audio', NULL, '2', 'true', 'admin', 'dmuenala', '2019-01-15 17:09:53', '2019-06-14 12:03:58'),
(5, 25, 'Chao (Kichwa - Shuar)', 'diccionario-intercultural-chao', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-5-diccionario-intercultural-chao.mp3', 'es', 132, 79, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2018, 'Diccionario,Kichwa,Shuar,Chao', NULL, 'audio', NULL, '2', 'true', 'admin', 'dmuenala', '2019-01-15 17:35:01', '2019-06-14 12:03:56'),
(6, 14, 'Cestos', 'cestos', '<p style=\"text-align: justify;\">Fotograf&iacute;a de mujer &Eacute;pera ense&ntilde;ando sus artesan&iacute;as. &nbsp;</p>\r\n', '1', 'documento-6-cestos.jpg', 'es', 119, 75, NULL, NULL, 'CORAPE', 'Rocío Gomez', NULL, 2016, 'cestos,nacionalidad,mujer,Épera', NULL, 'img', NULL, '2', 'true', 'admin', 'santiago', '2019-01-15 17:38:33', '2019-07-24 18:33:17'),
(7, 14, 'Mujer Artesana', 'mujer-artesana', '<p style=\"text-align: justify;\">Fotograf&iacute;a de mujeres &Eacute;pera&nbsp;trabajando. &nbsp;&nbsp;</p>\r\n', '1', 'documento-7-mujer-artesana.jpg', 'es', 108, 76, NULL, NULL, 'CORAPE', NULL, NULL, 2015, 'mujer,artesana,epera,trabajo', NULL, 'img', NULL, '2', 'true', 'admin', 'santiago', '2019-01-15 17:43:47', '2019-07-24 18:33:11'),
(8, 13, 'Traje Sapara', 'sapara', '<p>Los Saparos se est&aacute;n asentando cerca de los r&iacute;os Curacay y Napo y en el fondo de Aguaric. Son altos y robustos, bultos ligeros, nariz prominente y, a veces, incluso ojos azules. La ropa de los hombres consist&iacute;a en un manto parecido a una t&uacute;nica, y las mujeres utilizan sostenes cruzados de ramas secas. Sus casas estaban cubiertas de techos sin paredes. Usaron armas como flechas, y piedras. Cazaron, cultivaron y&nbsp; recolectaron o cosecharon varios tipos de alimentos, entre ellos las batatas y pl&aacute;tanos.</p>\r\n', '1', 'documento-8-sapara.jpg', 'es', 160, 75, NULL, 'Lenin Yanda Montaguano ', NULL, NULL, NULL, 2018, 'mujer,trabajo,artesano,sápara', NULL, 'img', NULL, '2', 'true', 'admin', 'santiago', '2019-01-15 17:45:51', '2019-07-24 18:33:49'),
(9, 13, 'Hombre Saparo', 'hombre-saparo', '<p>El nombre Sapara&nbsp;proviene de la canasta hecha de bejuco lianas divididas en dos y dos veces trenzadas, entre las cuales se colocan hojas impermeables, y una cubierta trabajada de la misma manera, que los Z&aacute;para usan para poner sus ropas y otros productos. Se estiman&nbsp; que hay m&aacute;s de doscientas (200) personas en Ecuador y cien (100) en Per&uacute;. En Ecuador, est&aacute;n reconocidos de manera constitucional como una de las trece nacionalidades ind&iacute;genas.&nbsp;</p>\r\n', '1', 'documento-9-hombre-saparo.jpg', 'es', 168, 78, NULL, 'Lenin Montaguano', NULL, NULL, NULL, 2018, 'hombre,artesano,trabajo,saparo', NULL, 'img', NULL, '2', 'true', 'admin', 'santiago', '2019-01-15 17:47:38', '2019-07-24 18:33:43'),
(10, 14, 'Mujeres Artesanas Épera', 'mujer-artesana-epera', '<p style=\"text-align: justify;\">Fotograf&iacute;a de mujeres &Eacute;pera realizando un cesto.</p>\r\n', '1', 'documento-10-mujer-artesana-epera.jpg', 'es', 185, 79, NULL, NULL, 'CORAPE', NULL, NULL, 2018, 'Mujer,artesana,Épera,nacionalidad,trabajo', NULL, 'img', NULL, '2', 'true', 'admin', 'santiago', '2019-01-15 18:13:31', '2019-07-24 18:33:06'),
(14, 28, 'Receta Salsa de Ají (Pepa de Zambo)', 'receta-salsa-de-aji-de-pepa-de-zambo', '<p>La entrevista se realiz&oacute; a Ruth Angamarca que nos habl&oacute; sobre la Salsa de Aj&iacute; de pepa de Zambo tambi&eacute;n conocido como Pichacho en la provincia de Loja.</p>\r\n', '1', 'documento-14-receta-salsa-de-aji-de-pepa-de-zambo.mp3', 'es', 200, 81, '2', 'Ruth Angamarca', 'CORAPE', NULL, NULL, 2019, 'Ají,Zambo,Receta,Salsa de Ají', NULL, 'audio', NULL, '2', 'true', 'Ruth Angamarca A', 'santiago', '2019-01-19 11:38:37', '2019-07-25 10:30:38'),
(15, 40, 'Reportaje Coplas del Carnaval de Simiatug', 'reportaje-coplas-del-carnaval-de-simiatug', '<p>El concurso de coplas del carnaval de la parroquia de Simiatug es una tradici&oacute;n in&eacute;dita que se mantiene desde los a&ntilde;os 70. En reportaje contamos sobres esta tradici&oacute;n.&nbsp;</p>\r\n', '1', 'documento-15-reportaje-coplas-del-carnaval-de-simiatug.mp3', 'es', 173, 77, NULL, 'Orlando Caiza', 'Orlando Caiza', NULL, NULL, 2019, NULL, NULL, 'audio', NULL, '2', 'true', 'runawiki2018', 'santiago', '2019-01-19 11:38:50', '2019-07-24 23:26:24'),
(16, 44, 'Encocado de Camarón', 'entrevista-sobre-el-encocao-de-camaron', '<p>Una deliciosa entrevista sobre el <strong>Encocado de Camar&oacute;n, </strong>un plato t&iacute;pico de la gastronom&iacute;a afroesmerlade&ntilde;a<strong>, </strong>conoce su preparaci&oacute;n y su forma de servir.&nbsp;</p>\r\n', '1', 'documento-16-entrevista-sobre-el-encocao-de-camaron.mp3', 'es', 132, 76, NULL, 'Bélgica Calderón', 'CORAPE', 'CORAPE', 'CORAPE', 2019, 'gastronomia,afroecuatoriana,esmeraldas,Encocado de Camarón', NULL, 'audio', NULL, '2', 'true', 'Bélgica Calderón', 'santiago', '2019-01-19 11:49:16', '2019-07-24 23:24:53'),
(17, 40, 'Arroz de Cebada con Leche', 'arroz-de-cebada-con-leche', '<p>Entrevista a Luis Naula sobre la preparaci&oacute;n de&nbsp;arroz de cebada con leche valor nutritivo de los pueblos kiwas.&nbsp;</p>\r\n', '1', 'documento-17-arroz-de-cebada-con-leche.mp3', 'es', 120, 79, NULL, 'Luis Naula', 'Luis Naula  de Radio Guamote', NULL, 'Wikipedia  Pueblos y Nacionalidades ', 2019, 'Arroz de cebada,Leche,Cebada', NULL, 'audio', NULL, '2', 'true', 'mashi Luis', 'santiago', '2019-01-19 11:50:54', '2019-07-24 23:23:54'),
(18, 40, 'Caldo de Mondongo', 'entrevista-de-caldo-de-mondongo', '<p>Entrevista sobre la preparaci&oacute;n del <strong>Caldo de Mondongo</strong> y su importancia nutritiva para el ser humano.</p>\r\n', '1', 'documento-18-entrevista-de-caldo-de-mondongo.mp3', 'es', 124, 78, NULL, 'Eduardo Aucansela', 'CORAPE', 'Jorge Guachamín', 'Kipedia Pueblos y Nacionalidades', 2019, 'borrego,caldo de mondongo,Receta', NULL, 'audio', '1', '2', 'true', 'chushik61', 'santiago', '2019-01-19 11:52:41', '2019-07-24 23:23:47'),
(19, 35, 'Papas con Cuy', 'papas-con-cuy', '<p style=\"text-align: justify;\">En la gastronom&iacute;a del&nbsp;pueblo kichwa Puruw&aacute; uno de los platos exquisitos es papas con cuy acompa&ntilde;ado con man&iacute; y aj&iacute; preparado en piedra. El cuy posee gran cantidad de col&aacute;geno, vitaminas y minerales por lo cual ayuda a prevenir m&uacute;ltiples enfermedades como:&nbsp;</p>\r\n\r\n<ul>\r\n	<li>La Diabetes</li>\r\n	<li>C&aacute;ncer</li>\r\n	<li>Enfermedades de coraz&oacute;n</li>\r\n	<li>Artrosis y artritis</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', '1', 'documento-19-papas-con-cuy.mp3', 'es', 165, 80, NULL, 'Sisa Pacari Chicaiza Tenesaca', 'CORAPE ', 'Sisa Pacari Chicaiza', 'Puruwá', 2019, 'Papas con cuy,cuy,Papas', NULL, 'audio', NULL, '2', 'true', 'Sisapak', 'santiago', '2019-01-19 11:53:24', '2019-07-24 23:23:08'),
(20, 17, 'Maito de Chonta Curo / Pincho ', 'maito-de-chontacuro', '<p>Entrevista sobre Maito de Chonta Curo o Pincho de Chonta Curo.</p>\r\n\r\n<p>Chonta curo se habla en kichwa o en otras lenguas de las nacionalidades&nbsp;se conoce como &quot;Tuku&quot; o &quot;Mukint&quot; en Castellano se dice&nbsp;&ldquo;Gusano de Chonta o Mayon&quot; son parte de plato diario de la familia kichwa o Ind&iacute;genas de la Amazonia.</p>\r\n', '1', 'documento-20-maito-de-chontacuro.mp3', 'es', 162, 81, NULL, 'Wayra Samuel Shiguango', 'CORAPE', NULL, 'Wayra PKR-CTI', 2019, 'Chonta curo,Pincho,Maito', NULL, 'audio', NULL, '2', 'true', 'Wayrashigua', 'santiago', '2019-01-19 11:54:00', '2019-07-24 23:23:02'),
(21, 41, 'Marcha 1990', 'marcha-1990', '<p>Marcha de las nacionalidades de Pastaza, 1990.</p>\r\n', '1', 'documento-21-marcha-1990.jpg', 'es', 120, 74, NULL, 'CONFENIAE', 'CONFENIAE', 'CONFENIAE', NULL, 1990, 'marcha,nacionalidades,pastaza,CONFENIAE', NULL, 'img', NULL, '2', 'true', 'Ipiamat Tapuy', 'santiago', '2019-01-19 11:55:18', '2019-07-24 18:38:51'),
(22, 13, 'Maito de Rana (Kuwa)', 'maito-de-rana-kuwa', '<p style=\"text-align: justify;\">El maito de rana (<em>kuwa</em>&nbsp;en quechua) es un plato t&iacute;pico de la regi&oacute;n Amaz&oacute;nica del Ecuador que se puede preparar solo en &eacute;pocas de lluvias.&nbsp;Forma parte de la gastronom&iacute;a S&aacute;para.</p>\r\n', '1', 'documento-22-maito-de-rana-kuwa.mp3', 'es', 131, 78, NULL, 'Yanda', 'CORAPE', 'Santiago ', NULL, 2019, 'Gastronomía Sapara rana,Maito,Rana', NULL, 'audio', NULL, '2', 'true', 'yandainayuk', 'santiago', '2019-01-19 12:00:39', '2019-07-24 23:22:51'),
(23, 41, 'CONFENIAE', 'confeniae', '<p>La sede de la Confederaci&oacute;n de Nacionalidades Ind&iacute;genas de la Amazonia Ecuatoriana <strong><em>(CONFENIAE)</em></strong> se encuentra en la provincia de Pastaza. Su&nbsp;cabecera cantonal&nbsp;es la ciudad del&nbsp;Puyo, lugar donde se agrupa gran parte de su poblaci&oacute;n total. En ella aglutina a siete nacionalidades:</p>\r\n\r\n<ul>\r\n	<li>Shuar</li>\r\n	<li>Achuar</li>\r\n	<li>Shiwiar</li>\r\n	<li>Kichwa</li>\r\n	<li>Andwa</li>\r\n	<li>Sapara</li>\r\n	<li>Waodani</li>\r\n</ul>\r\n', '1', 'documento-23-confeniae.jpg', 'es', 112, 77, NULL, 'CONFENIAE', 'CONFENIAE', 'CONFENIAE', NULL, 1990, 'Nacionalidades,Proceso,Organizativo,CONFENIAE', NULL, 'img', NULL, '2', 'true', 'Ipiamat Tapuy', 'santiago', '2019-01-19 12:07:15', '2019-07-24 18:38:37'),
(24, 41, 'Marcha - CONFENIAE', 'confeniae-1547917825', '<p style=\"text-align: justify;\">Marcha de nacionalidades en el levantamiento del Movimiento Ind&iacute;gena en 1990.</p>\r\n', '1', 'documento-24-confeniae-1547917825.jpg', 'es', 131, 75, NULL, 'CONFENIAE', 'CONFENIAE', 'CONFENIAE', NULL, 1990, 'Pastaza,marcha,CONFENAIE', NULL, 'img', NULL, '2', 'true', 'Ipiamat Tapuy', 'santiago', '2019-01-19 12:10:25', '2019-07-24 18:38:22'),
(25, 40, 'Dulce de Cebada Pelada', 'dulce-de-cebada-pelada', '<p style=\"text-align: justify;\">El Dulce de Cebada Pelada tradicionamente se cocina durante los carnavales que se celebra entre el mes de febrero o marzo. La cebada o el trigo es un cereal que se cultiva en las comunidades de la zona alta de la provincia de Bol&iacute;var.</p>\r\n', '1', 'documento-25-dulce-de-cebada-pelada.mp3', 'es', 127, 80, NULL, 'Orlando Caiza', 'Orlando Caiza', NULL, NULL, 2019, 'Dulce de cebada,Cebada,Dulce', NULL, 'audio', NULL, '2', 'true', 'runawiki2018', 'santiago', '2019-01-19 14:43:07', '2019-07-24 23:22:38'),
(26, 40, 'Chicha de Jora ', 'chicha-de-jora-', '<p>La Chicha de Jora&nbsp;considerada como nuestra bebida ancestral, ha sido elaborada particularmente por los&nbsp;ind&iacute;genas de la sierra ecuatoriana&nbsp;pero que por sus or&iacute;genes tambi&eacute;n forma parte de Per&uacute; y Bolivia.</p>\r\n', '1', 'documento-26-chicha-de-jora.mp3', 'es', 162, 80, NULL, 'Rocío Gómez ', 'CORAPE', 'Rocío Gómez', NULL, 2018, 'Chicha de jora,bebida ancestral,asua', NULL, 'audio', NULL, '2', 'true', 'rocio', 'santiago', '2019-01-19 16:25:39', '2019-07-24 23:22:29'),
(27, 40, 'Quinua con Leche', 'quinua-con-leche', '<p>Entrevista de c&ograve;mo elaborar la Quinua con Leche, bebida tradicional de las comunidades kichwa de la provincia de Imbabura (Ecuador)</p>\r\n', '1', 'documento-27-quinua-con-leche.mp3', 'es', 141, 78, NULL, 'David Muenala', 'CORAPE', 'David Muenala', NULL, 2019, 'Comida Otavalo,Quinua con Lecha,Comida sierra', NULL, 'audio', NULL, '2', 'true', 'David Muenala', 'santiago', '2019-01-19 17:33:36', '2019-07-24 23:22:19'),
(28, 40, 'Linea de tiempo de proceso organizativo de PKR.', 'linea-de-tiempo-de-proceso-organizativo-de-pkr', '<p>Esta&nbsp;l&iacute;nea de tiempo describe los hitos m&aacute;s importantes del proceso organizativo del Pueblo Kichwa de Rukullakta entre los a&ntilde;os de 1968 y 2018.</p>\r\n', '1', 'documento-28-linea-de-tiempo-de-proceso-organizativo-de-pkr.jpg', 'es', 115, 78, NULL, 'Medardo Shiguango', 'Medardo Shiguango', NULL, 'Pueblo Kichwa de Rukullakta', 2018, 'PKR,CTI,Proceso Organizativo', NULL, 'img', NULL, '2', 'true', 'Wayrashigua', 'santiago', '2019-01-20 10:38:50', '2019-07-24 18:37:44'),
(29, 35, 'Carnaval de Guamote ', 'carnaval-de-guamote-', '<p>Narraci&oacute;n sobre el carnaval de Guamote por el se&ntilde;or &Aacute;ngel Leonardo Illapa.</p>\r\n\r\n<p>Tradiciones y costumbres de Guamote.&nbsp;</p>\r\n', '1', 'documento-29-carnaval-de-guamote.pdf', 'es', 123, 102, NULL, 'Radio La Voz de Guamote', 'Luis Naula ', NULL, NULL, 2019, 'Carnaval de Guamote,tradicion,costumbres', NULL, 'pdf', NULL, '2', 'true', 'mashi Luis', 'santiago', '2019-01-20 10:47:30', '2019-07-24 23:41:37'),
(30, 17, 'Wangana Katu (Mazamorra de Sajino)', 'mazamorra-de-sajino', '<p><strong>MAZAMORRA DE SAJINO</strong></p>\r\n\r\n<p style=\"text-align: justify;\">La preparaci&oacute;n de este plato ex&oacute;tico es diversa, cada nacionalidad ind&iacute;gena tiene su forma de preparar, para la nacionalidad kichwa amaz&oacute;nico en la provincia de Sucumbios tiene su propia caracteristica. La preparaci&oacute;n tienen los siguientes ingredientes:</p>\r\n\r\n<ul>\r\n	<li>Pl&aacute;tano</li>\r\n	<li>Agua</li>\r\n	<li>Sal</li>\r\n	<li>Carne de Sajino</li>\r\n	<li>Yuca</li>\r\n	<li>Aj&iacute; (Uchu Manga)</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', '1', 'documento-30-mazamorra-de-sajino.mp3', 'es', 131, 79, NULL, 'Tonny Che', 'CORAPE', 'Tonny Che', NULL, 2019, 'Mazamorra de Sajino,Katu de Wangana', NULL, 'audio', NULL, '2', 'true', 'Tonny Che', 'santiago', '2019-01-26 11:03:22', '2019-07-24 23:22:11'),
(31, 43, 'La Chuchuka', 'la-chuchuka', '<p>Se trata sobre uno de los platos tradicionales del pueblo kichwa Otavalo preparada en base del ma&iacute;z y es parte de la soberan&iacute;a alimentaria de este pueblo.&nbsp;Tambi&eacute;n es popular por su valor nutricional, porque contiene vitaminas y minerales que favorecen al metabolismo.</p>\r\n', '1', 'documento-31-la-chuchuka.mp3', 'es', 126, 76, NULL, 'Narcizo Conejo', 'CORAPE', 'Narcizo Conejo', NULL, 2019, 'kichwa otavalo,Comida tradicional,Chuchuka', NULL, 'audio', NULL, '2', 'true', 'Narcizo Conejo', 'santiago', '2019-01-26 11:04:52', '2019-07-24 23:21:28'),
(32, 14, 'Asado de Guatusa', 'asado-de-guatuso', '<p>Es&nbsp;un&nbsp;plato fuerte de la Nacionalidad Eper&atilde;ra Siapidaar&atilde; (Costa - Esmeraldas).</p>\r\n', '1', 'documento-32-asado-de-guatuso.mp3', 'es', 111, 78, NULL, 'Oscar Miguel Chiripua Mejia ', 'CORAPE', 'Oscar Miguel Chiripua Mejia ', NULL, 2019, 'Asado,Guatusa,Plato Tradicional', NULL, 'audio', NULL, '2', 'true', 'chiripua', 'santiago', '2019-01-26 11:09:50', '2019-07-24 23:21:13'),
(33, 21, 'Guanta Ahumada', 'guanta-ahumada', '<p style=\"text-align: justify;\">Guanta ahumada es una comida t&iacute;pica de la Nacionalidad Chachi.</p>\r\n', '1', 'documento-33-guanta-ahumada.mp3', 'es', 148, 79, NULL, 'Tomás De la Cruz', 'CORAPE', 'Tomás De la Cruz', NULL, 2019, 'Guanta ahumada,comida típica,Chachi', NULL, 'audio', NULL, '2', 'true', 'Chachi Tomas', 'santiago', '2019-01-26 11:10:34', '2019-07-24 23:21:58'),
(34, 43, 'Chochos con Tostado', 'samia-maldonado', '<p>Los pueblos de la serran&iacute;a norte del Ecuador tienen en su dieta diaria el ma&iacute;z y los chochos. Una combinaci&oacute;n sana nutritiva y ancestral que en la&nbsp;actualidad se considera un super alimento, por los componentes que tiene el chocho, entre los que constan: 38% de prote&iacute;nas, 24% carbo hidratos, 24% fibra, 6% grasas insaturadas y 7.5% de minerales como: hierro, calcio, magnesio, f&oacute;sforo y zinc, adem&aacute;s vitamina B12 y amino&aacute;cidos. <img alt=\"\" height=\"376\" src=\"https://upload.wikimedia.org/wikipedia/commons/7/7a/Lupinus_albus.JPG\" width=\"503\" /></p>\r\n\r\n<p>Foto: Calapito/wikimediacommons</p>\r\n', '1', 'documento-34-samia-maldonado.mp3', 'es', 165, 77, NULL, 'Samia Maldonado', 'Samia Maldonado', 'Samia Maldonado', NULL, 2019, 'tawri,tarwi,chochos,tostado', NULL, 'audio', NULL, '2', 'true', 'samiamaldonador', 'santiago', '2019-01-26 11:11:40', '2019-07-24 23:21:04'),
(35, 10, 'Guaña Asada', 'guana-asada', '<p>Plato tradicional de la nacionalidad Aw&aacute;, que se come&nbsp;durante todo el a&ntilde;o.</p>\r\n', '1', 'documento-35-guana-asada.mp3', 'es', 134, 78, NULL, 'Yicela Guanga', 'CORAPE', NULL, NULL, 2019, 'comida,tradicional,Awá,Guaña', NULL, 'audio', '1', '2', 'true', 'su-palapcha', 'santiago', '2019-01-26 11:12:32', '2019-07-24 23:19:56'),
(36, 21, 'Mojarra Asada', 'mojarra-asada', '<p style=\"text-align: justify;\">La&nbsp;mojarra asada&nbsp;es un plato t&iacute;pico ancestral de la&nbsp;nacionalidad Chachi, poblaci&oacute;n ubicada en tres zonas de la&nbsp;provincia de Esmeraldas&nbsp;en&nbsp;Ecuador. Se prepara con un pescado end&eacute;mico denominado&nbsp;mojarra&nbsp;que en idioma cha&rsquo;palaa se denomina&nbsp;chinbuya.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n', '1', 'documento-36-mojarra-asada.mp3', 'es', 131, 78, NULL, NULL, 'CORAPE', NULL, NULL, NULL, 'Mojarra Asada,Asada,Mojarra', NULL, 'audio', NULL, '2', 'true', 'chachi manuel añapa', 'santiago', '2019-01-26 11:14:38', '2019-07-24 23:19:51'),
(37, 10, 'Armadillo Asado', 'armadillo-asado', '<p style=\"text-align: justify;\">Este plato t&iacute;pico es una de las cuantas variedades de platos que posee la&nbsp;gastronom&iacute;a de la nacionalidad Aw&aacute;.</p>\r\n', '1', 'documento-37-armadillo-asado.mp3', 'es', 131, 75, NULL, 'Byron Cantincuz', 'CORAPE', NULL, NULL, 2019, 'Armadillo,gastronomia Awá,plato tipico Awá', NULL, 'audio', NULL, '2', 'true', 'Byroncr', 'santiago', '2019-01-26 11:16:08', '2019-07-24 23:19:43'),
(38, 17, 'Caldo de Carachama', 'caldo-de-carachama', '<p style=\"text-align: justify;\">El plato t&iacute;pico de Pastaza con sabor exquisito y presentaci&oacute;n ex&oacute;tica es el caldo de carachama, pez que se pega a las piedras con su boca de ventosa, acompa&ntilde;ada de fresca y deliciosa yuca.</p>\r\n', '1', 'documento-38-caldo-de-carachama.mp3', 'es', 116, 82, NULL, 'Eslendy Grefa', 'Lanceros Digitales', NULL, NULL, NULL, 'Gastronomia kichwa,caldo,delicias', NULL, 'audio', NULL, '2', 'true', 'Eslenmunayri', 'santiago', '2019-01-26 11:17:12', '2019-07-24 23:19:36'),
(39, 40, 'Catzos con Tostado', 'catzos-con-tostado', '<p>Comida tradicional&nbsp;del norte de la sierra ecuatoriana.</p>\r\n', '1', 'documento-39-catzos-con-tostado.mp3', 'es', 169, 77, NULL, 'Rocío Gómez ', 'CORAPE', 'Rocío Gómez', NULL, 2019, 'Catzos,Comida Tradicional,Catzos con tostado', NULL, 'audio', NULL, '2', 'true', 'rocio', 'santiago', '2019-01-26 11:26:04', '2019-07-24 23:19:24'),
(40, 10, 'Guaña Asada', 'yicela-guanga', '<p style=\"text-align: justify;\">Gua&ntilde;a asada, plato tradicional de la nacionalidad Aw&aacute; que se come en las provincias de Esmeraldas, Carchi.</p>\r\n', '1', 'documento-40-yicela-guanga.jpg', 'es', 148, 75, NULL, 'Yicela Guanga', 'Yicela Guanga', NULL, NULL, 2019, 'guaña,comida,Asada', NULL, 'img', NULL, '2', 'true', 'su-palapcha', 'santiago', '2019-01-26 11:36:55', '2019-07-24 18:22:58'),
(42, 21, 'Música Chachi con Marimba (San Salvador)', 'musica-chachi-san-salvador', '<p>Musica&nbsp;tipica chachi entonado con marimba, bombo y conuno - San Salvador</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><iframe allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\" frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/f31w2QkDm0Q\" width=\"560\"></iframe></p>\r\n', '1', '', 'es', 179, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'marimba,música tradicional,chachi', NULL, 'video', NULL, '2', 'true', 'Chachi Tomas', 'santiago', '2019-01-26 11:40:41', '2019-07-24 23:16:50'),
(43, 40, 'Asua (Chicha de Yuca)', 'asua-chicha-de-yuca', '<p><iframe allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\" frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/OwEKk8YrYac\" width=\"560\"></iframe></p>\r\n', '1', '', 'es', 151, NULL, NULL, 'Tonny Che', 'CORAPE', 'Tonny Che', NULL, 2019, 'Yuca,Asua,Chicha', NULL, 'url', NULL, '2', 'true', 'Tonny Che', 'santiago', '2019-01-26 12:21:10', '2019-07-24 23:16:43'),
(44, 14, 'Imaginario Niños Eperara', 'imaginario-ninos-eperara', '<p><iframe allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\" frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/j_Z_9yOPhww\" width=\"560\"></iframe></p>\r\n', '1', '', 'es', 130, NULL, NULL, 'Nacionalidad Eperara', 'Red nnace', NULL, NULL, 2010, 'niños eperara,nacionalidad eperara', NULL, 'url', NULL, '2', 'true', 'chiripua', 'santiago', '2019-01-26 12:35:59', '2019-07-24 23:16:13'),
(47, 21, 'Artesanía Chachi', 'artesania-chachi', '<p style=\"text-align: justify;\">Si quiere saber m&aacute;s sobre&nbsp;la artesan&iacute;a de la Nacionalidad Chachi, comun&iacute;quese con el Centro Chachi San Salvador al n&uacute;mero (593) 063038611.</p>\r\n', '1', 'documento-47-artesania-chachi.jpg', 'es', 200, 78, '5', 'Rocío Gómez ', 'CORAPE', NULL, NULL, 2019, NULL, '2', 'img', '1', '2', 'true', 'rocio', 'dmuenala', '2019-02-25 16:21:28', '2019-07-04 10:50:04'),
(48, 10, 'Artesanía Awá', 'artesania-awa', '<p>Si quiere saber m&aacute;s sobre&nbsp;la artesan&iacute;a de la nacionalidad Aw&aacute;, comun&iacute;quece al:</p>\r\n\r\n<p><strong>Filomena Rosero:</strong> 0985641376.</p>\r\n', '1', 'documento-48-artesania-awa.jpg', 'es', 365, 81, '10', 'Rocío Gómez', 'CORAPE', NULL, NULL, 2019, 'Artesanía,Awa,Armadillo,Tallado de madera', NULL, 'img', '1', '2', 'true', 'rocio', 'santiago', '2019-02-25 16:42:37', '2019-07-24 18:22:51'),
(49, 10, 'Mensaje en lengua Awapit', 'awapit', '', '1', 'documento-49-awapit.mp4', 'es', 140, 83, NULL, NULL, NULL, NULL, NULL, NULL, 'Awapit,Awa', NULL, 'video', NULL, '2', 'true', 'corape', 'santiago', '2019-02-27 15:36:27', '2019-07-24 23:16:02'),
(50, 25, 'Cascada (Kichwa - Shuar)', 'diccionario-intercultural-cascada', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-50-diccionario-intercultural-cascada.mp3', 'es', 118, 77, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'Diccionario,Kichwa,Shuar,Cascada', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-01 16:56:58', '2019-06-14 12:03:52'),
(51, 25, 'Muchas Gracias (Kichwa - Shuar)', 'diccionario-intercultural-muchas-gracias', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-51-diccionario-intercultural-muchas-gracias.mp3', 'es', 109, 76, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'diccionario,kichwa,shuar,Muchas gracias', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 12:27:35', '2019-06-14 12:03:51'),
(52, 25, 'Cómo estas (Kichwa - Shuar)', 'diccionario-intercultural-como-estas', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-52-diccionario-intercultural-como-estas.mp3', 'es', 121, 78, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Cómo estas', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 12:38:33', '2019-06-14 11:59:50'),
(53, 25, 'Como te llamas (Kichwa - Shuar)', 'diccionario-intercultural-como-te-llamas', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-53-diccionario-intercultural-como-te-llamas.mp3', 'es', 166, 79, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Como te llamas', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 12:58:01', '2019-06-14 11:59:25'),
(54, 25, 'Buenos Días (Kichwa - Shuar)', 'diccionario-intercultural-buenos-dias-', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-54-diccionario-intercultural-buenos-dias.mp3', 'es', 208, 81, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Buenos días', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 13:00:42', '2019-06-14 11:59:01'),
(55, 25, 'Buenas Noches (Kichwa - Shuar)', 'diccionario-intercultural-buenas-tardes', '<p>Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-55-diccionario-intercultural-buenas-tardes.mp3', 'es', 102, 80, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'Diccionario,Kichwa,Shuar,Buenas noches', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 13:09:44', '2019-06-14 11:58:39'),
(56, 25, 'Buenas Tardes (Kichwa - Shuar)', 'diccionario-intercultural-buenas-tardes-', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-56-diccionario-intercultural-buenas-tardes.mp3', 'es', 124, 79, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Buenas tardes', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 13:15:11', '2019-06-14 11:58:11'),
(57, 25, 'Compañero (Kichwa - Shuar)', 'diccionario-intercultural-companero', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-57-diccionario-intercultural-companero.mp3', 'es', 117, 80, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Compañero', NULL, 'audio', NULL, '2', 'true', 'corape', 'dmuenala', '2019-03-06 13:21:14', '2019-06-14 11:57:49'),
(58, 25, 'Amigo (Kichwa - Shuar)', 'diccionario-intercultural-amigo', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-58-diccionario-intercultural-amigo.mp3', 'es', 120, 79, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'Diccionario,Kichwa,Shuar,Amigo', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 13:22:51', '2019-06-14 11:57:28'),
(59, 25, 'Te Quiero (Kichwa - Shuar)', 'diccionario-intercultural-te-quiero-', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-59-diccionario-intercultural-te-quiero.mp3', 'es', 122, 80, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'Diccionario,Kichwa,Shuar,Te quiero', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 13:24:12', '2019-06-14 11:57:04'),
(60, 25, 'Bueno (Kichwa - Shuar)', 'diccionario-intercultural-bueno-', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-60-diccionario-intercultural-bueno.mp3', 'es', 102, 77, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'Diccionario,Kichwa,Shuar,Bueno', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 13:26:12', '2019-06-14 11:56:34'),
(61, 25, 'Mujer (Kichwa - Shuar)', 'diccionario-intercultural-mujer', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-61-diccionario-intercultural-mujer.mp3', 'es', 105, 77, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Mujer', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 13:27:59', '2019-06-14 11:55:40'),
(62, 25, 'Hombre (Kichwa - Shuar)', 'diccionario-intercultural-hombre', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-62-diccionario-intercultural-hombre.mp3', 'es', 136, 80, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Hombre', NULL, 'audio', NULL, '2', 'true', 'corape', 'dmuenala', '2019-03-06 13:30:48', '2019-06-14 11:55:14'),
(63, 25, 'Espíritu (Kichwa - Shuar)', 'diccionario-intercultural-espiritu-', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-63-diccionario-intercultural-espiritu.mp3', 'es', 112, 76, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Espíritu', NULL, 'audio', NULL, '2', 'true', 'corape', 'dmuenala', '2019-03-06 13:33:33', '2019-06-14 11:54:50'),
(64, 25, 'Tierra (Kichwa - Shuar)', 'diccionario-intercultural-tierra-', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-64-diccionario-intercultural-tierra.mp3', 'es', 94, 76, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Tierra', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 16:43:39', '2019-06-14 11:54:16'),
(65, 25, 'Selva (Kichwa - Shuar)', 'diccionario-intercultural-selva', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-65-diccionario-intercultural-selva.mp3', 'es', 103, 77, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'Diccionario,Kichwa,Shuar,Selva', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 16:46:02', '2019-06-14 11:56:07'),
(66, 25, 'Piedra (Kichwa - Shuar)', 'diccionario-intercultural-piedra', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-66-diccionario-intercultural-piedra.mp3', 'es', 101, 77, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Piedra', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 16:48:20', '2019-06-14 11:55:59'),
(67, 25, 'Agua (Kichwa - Shuar)', 'diccionario-intercultural-agua', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-67-diccionario-intercultural-agua.mp3', 'es', 120, 82, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Agua', NULL, 'audio', NULL, '2', 'true', 'corape', 'dmuenala', '2019-03-06 16:49:57', '2019-06-14 11:55:52'),
(68, 25, 'Bien (Kichwa - Shuar)', 'diccionario-intercultural-bien', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-68-diccionario-intercultural-bien.mp3', 'es', 105, 71, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Bien', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 16:54:32', '2019-06-14 11:53:05'),
(69, 25, 'Venga (Kichwa - Shuar)', 'diccionario-intercultural-venga-', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-69-diccionario-intercultural-venga.mp3', 'es', 112, 75, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Venga', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 16:57:57', '2019-06-14 11:52:45'),
(70, 25, 'Vaya (Kichwa - Shuar)', 'diccionario-intercultural-vaya', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-70-diccionario-intercultural-vaya.mp3', 'es', 94, 71, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Vaya', NULL, 'audio', NULL, '2', 'true', 'corape', 'dmuenala', '2019-03-06 16:59:34', '2019-06-14 11:52:37'),
(71, 25, 'Comida (Kichwa - Shuar)', 'diccionario-intercultural-comida', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-71-diccionario-intercultural-comida.mp3', 'es', 97, 72, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Shuar,Kichwa,Comida', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:03:05', '2019-06-14 11:49:08'),
(72, 25, 'Sucio (Kichwa - Shuar)', 'diccionario-intercultural-sucio', '<p>Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-72-diccionario-intercultural-sucio.mp3', 'es', 122, 79, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'Shuar,Diccionario,Kichwa,Sucio', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:13:09', '2019-06-14 11:30:31'),
(73, 25, 'Gracias (Kichwa - Shuar)', 'diccionario-intercultural-gracias', '<p>Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '1', 'documento-73-diccionario-intercultural-gracias.mp3', 'es', 103, 72, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Shuar,Kichwa,Gracias', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:16:14', '2019-06-14 11:45:48'),
(74, 25, 'Palo (Kichwa - Shuar)', 'diccionario-intercultural-palo', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '1', 'documento-74-diccionario-intercultural-palo.mp3', 'es', 112, 73, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Palo', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:20:19', '2019-06-14 11:46:08'),
(75, 25, 'Mal (Kichwa - Shuar)', 'diccionario-intercultural-mal-', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n', '1', 'documento-75-diccionario-intercultural-mal.mp3', 'es', 100, 72, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Mal', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:21:44', '2019-06-14 11:46:24'),
(76, 25, 'Cabello (Kichwa - Shuar)', 'diccionario-intercultural-cabello-', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '1', 'documento-76-diccionario-intercultural-cabello.mp3', 'es', 106, 72, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,SHUAR,kichwa,cabello', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:25:56', '2019-06-14 11:46:38'),
(77, 25, 'Cabeza (Kichwa - Shuar)', 'diccionario-intercultural-cabeza', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '1', 'documento-77-diccionario-intercultural-cabeza.mp3', 'es', 103, 71, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,kichwa,shuar,cabeza', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:27:51', '2019-06-14 11:46:49'),
(78, 25, 'Pie (Kichwa - Shuar)', 'diccionario-intercultural-pie', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n', '1', 'documento-78-diccionario-intercultural-pie.mp3', 'es', 101, 70, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Shuar,Kichwa,Pie', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:29:33', '2019-06-14 11:47:08'),
(79, 25, ' (Kichwa - Shuar)', 'diccionario-intercultural-hueso', '<p>Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n', '1', 'documento-79-diccionario-intercultural-hueso.mp3', 'es', 96, 71, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Shuar,Kichwa,Hueso', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:31:19', '2019-06-14 11:47:16'),
(80, 25, 'Casa (Kichwa - Shuar)', 'diccionario-intercultural-casa', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n', '1', 'documento-80-diccionario-intercultural-casa.mp3', 'es', 108, 72, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Shuar,Kichwa,Casa', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:32:48', '2019-06-14 11:47:25'),
(81, 25, 'Grande (Kichwa - Shuar)', 'diccionario-intercultural-grande', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n', '1', 'documento-81-diccionario-intercultural-grande.mp3', 'es', 108, 70, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Shuar,Kichwa,Grande', NULL, 'audio', NULL, '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:34:54', '2019-06-14 11:47:32'),
(82, 25, 'Ladrón (Kichwa - Shuar)', 'diccionario-intercultural-ladron', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-82-diccionario-intercultural-ladron.mp3', 'es', 103, 71, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Shuar,Kichwa,Ladrón', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:36:36', '2019-06-14 11:37:17'),
(83, 25, 'Pequeño (Kichwa - Shuar)', 'diccionario-intercultural-pequeno', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-83-diccionario-intercultural-pequeno.mp3', 'es', 140, 71, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'DiccionariO,Shuar,Kichwa,Pequeño', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:38:12', '2019-06-14 11:37:28'),
(84, 25, 'Noche (Kichwa - Shuar)', 'diccionario-intercultural-noche', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-84-diccionario-intercultural-noche.mp3', 'es', 99, 69, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Shuar,Kichwa,Noche', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:44:26', '2019-06-14 11:37:59'),
(85, 25, 'Semana (Kichwa - Shuar)', 'diccionario-intercultural-semana', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-85-diccionario-intercultural-semana.mp3', 'es', 100, 71, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Shuar,Kichwa,Semana', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:45:30', '2019-06-14 11:38:32'),
(86, 25, 'Día (Kichwa - Shuar)', 'diccionario-intercultural-dia', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-86-diccionario-intercultural-dia.mp3', 'es', 95, 70, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Shuar,Kichwa,Día', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:46:37', '2019-06-14 11:41:41'),
(87, 25, 'Luna (Kichwa - Shuar)', 'diccionario-intercultural-luna', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-87-diccionario-intercultural-luna.mp3', 'es', 97, 75, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Shuar,Kichwa,Luna', NULL, 'audio', NULL, '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:47:51', '2019-06-14 11:42:46'),
(88, 25, 'Sol (Kichwa - Shuar)', 'diccionario-intercultural-sol', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-88-diccionario-intercultural-sol.mp3', 'es', 99, 71, NULL, 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Sol', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:49:08', '2019-06-14 11:42:19'),
(89, 25, 'LLuvia (Kichwa - Shuar)', 'diccionario-intercultural-lluvia', '<p>Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-89-diccionario-intercultural-lluvia.mp3', 'es', 116, 70, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'Diccionario,Shuar,Kichwa,Lluvia', NULL, 'audio', '1', '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:50:08', '2019-06-14 11:35:39'),
(90, 25, 'Perro (Kichwa - Shuar)', 'diccionario-intercultural-perro', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-90-diccionario-intercultural-perro.mp3', 'es', 108, 72, NULL, 'CORAPE', 'CORAPE', NULL, NULL, NULL, 'Diccionario,Shuar,Kichwa,Perro', NULL, 'audio', NULL, '2', 'true', 'corape', 'dmuenala', '2019-03-06 17:51:11', '2019-06-14 11:34:44'),
(91, 41, 'Pollo (Kichwa - Shuar)', 'diccionario-intercultural-pollo', '<p style=\"text-align: justify;\">Diccionario Intercultural, un momento de integraci&oacute;n y de convivencia entre nuestras culturas.</p>\r\n', '1', 'documento-91-diccionario-intercultural-pollo.mp3', 'es', 119, 76, '6', 'CORAPE', 'CORAPE', NULL, NULL, 2013, 'Diccionario,Kichwa,Shuar,Pollo', '1', 'audio', '1', '2', 'true', 'corape', 'santiago', '2019-03-06 17:52:08', '2019-07-25 11:04:06'),
(92, 21, 'Mujeres Artesanas Chachi ', 'artesania-chachi-1552581558', '<p>Si quiere saber m&aacute;s sobre&nbsp;la artesan&iacute;a de la Nacionalidad Chachi, comun&iacute;quese con el Centro Chachi San Salvador al n&uacute;mero (593) 063038611.</p>\r\n', '1', 'documento-92-artesania-chachi-1552581558.jpg', 'es', 147, 72, '5', 'Rocío Gómez S.', 'CORAPE', NULL, NULL, NULL, 'Chachi,Mujer tejiendo,Artesanía', NULL, 'img', '1', '2', 'true', 'corape ', 'dmuenala', '2019-03-14 11:39:18', '2019-06-19 10:26:41'),
(93, 40, 'Justicia Indígena en Guamote 1', 'justicia-indigena-en-guamote-1', '<p align=\"center\"><strong>&nbsp;RADIO &ldquo;LA VOZ DE GUAMOTE&rdquo;</strong></p>\r\n\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p align=\"center\"><strong>PROGRAMAS DE DERECHO INDIGENA O JUSTICIA INDIGENA</strong></p>\r\n\r\n<p align=\"center\"><strong>PRIMER PROGRAMA:</strong></p>\r\n\r\n<p align=\"center\"><strong>SOBRE EL DERECHO IND&Iacute;GENA&nbsp; Y&nbsp;&nbsp;LA COMUNIDAD (I)</strong></p>\r\n', '1', 'documento-93-justicia-indigena-en-guamote-1.mp3', 'es', 119, 74, NULL, 'Radio La voz de Guamote', 'Radio La voz de Guamote', NULL, NULL, 2015, 'Justicia,Justicia Indígena,Guamote,Radio Guamote', NULL, 'audio', '1', '2', 'true', 'corape', 'santiago', '2019-03-15 10:24:05', '2019-07-24 23:26:14'),
(95, 40, 'Justicia Indígena en Guamote', 'justicia-indigena-en-guamote-1552663708', '<p align=\"center\"><strong>RADIO &ldquo;LA VOZ DE GUAMOTE&rdquo;</strong></p>\r\n\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p align=\"center\"><strong>PROGRAMAS DE DERECHO INDIGENA O JUSTICIA INDIGENA</strong></p>\r\n\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p align=\"center\"><strong>SEGUNDO PROGRAMA:</strong></p>\r\n\r\n<p align=\"center\"><strong>SOBRE LA COMUNIDAD (II)</strong></p>\r\n\r\n<p align=\"center\">&nbsp;</p>\r\n\r\n<p align=\"center\">&nbsp;</p>\r\n', '1', 'documento-95-justicia-indigena-en-guamote-1552663708.mp3', 'es', 107, 76, NULL, 'Radio \"La voz de Guamote\"', 'Radio \"La voz de Guamote\"', NULL, NULL, 2012, 'Justicia Indígena,Justicia en Guamote,Radio \"La voz de Guamote\"', NULL, 'audio', '1', '2', 'true', 'corape', 'santiago', '2019-03-15 10:28:28', '2019-07-24 23:25:50'),
(96, 10, 'Guatín de Balsa', 'artesania-del-guatin-de-balsa', '<p>Esta es una artesan&iacute;a de la nacionalidad Aw&aacute;. El guat&iacute;n tallado en balsa&nbsp;es una especie de &aacute;rbol desarrollado por la se&ntilde;ora Filomena Rosero miembro de la comunidad de Ojala.</p>\r\n\r\n<p><b>Filomena Rosero:</b> 0985641376.</p>\r\n', '1', 'documento-96-artesania-del-guatin-de-balsa.jpg', 'es', 153, 78, '10', 'Nacionalidad Awá', 'CORAPE', NULL, NULL, 2019, 'guatin,artesanía awa,guatin tallado en balsa', NULL, 'img', '1', '1', 'true', 'Byroncr', 'santiago', '2019-03-16 12:24:57', '2019-07-24 18:22:44'),
(98, 28, 'Tendido, collar tradicional de Saraguro', 'tendido-collar-tradicional-de-sarguro', '<p>Los tendidos son collares tradicionales que se ponen las mujeres del pueblo indigena.</p>\r\n\r\n<p>Estos son creados artesanalmente</p>\r\n', '1', 'documento-98-tendido-collar-tradicional-de-sarguro.jpg', 'es', 159, 75, '1', 'Ruth Angamarca', NULL, NULL, NULL, 2014, 'Saraguro,artesanias,tradicional,tipico,pueblo saraguro,Ecuador', '2', 'img', '1', '2', 'true', 'Ruth Angamarca A', 'Ruth Angamarca A', '2019-03-16 12:46:36', '2019-03-16 12:59:08'),
(99, 10, 'Río de la Comunidad la Guaña - Awá', 'rio-de-la-comunidad-la-guana-awa', '<p style=\"text-align: justify;\">Este r&iacute;o est&aacute; ubicado en la Provincia del Carchi, parroquia El Chical, comunidad La gua&ntilde;a el nombre de gua&ntilde;a lleva este r&iacute;o porque&nbsp;existe un pez con el nombre de gua&ntilde;a y a orillas del r&iacute;o est&aacute; asentada la comunidad.</p>\r\n', '1', 'documento-99-rio-de-la-comunidad-la-guana-awa.jpg', 'es', 172, 74, '10', 'Byron Cantincuz', 'Byron Cantincuz', NULL, NULL, 2019, 'Comunidad la Guaña rio,rio awa guaña,rio la guaña', NULL, 'img', '1', '1', 'true', 'Byroncr', 'santiago', '2019-03-16 12:55:21', '2019-07-24 18:22:39'),
(100, 40, 'Especial de Carnaval (Guamote)', 'especial-de-carnaval-2019', '<p>Este material fue realizado por medios de comunicacion,&nbsp; Dirigentes de barrio San Juan,&nbsp; Ministerio de Cultura y el Rey del Carnaval.</p>\r\n', '1', 'documento-100-especial-de-carnaval-2019.mp4', 'es', 130, 76, NULL, 'Josmar Vimos Ruiz', NULL, NULL, NULL, 2019, 'CARNAVAL,GUAMOTE', NULL, 'video', NULL, '2', 'true', 'mashi luis', 'santiago', '2019-03-16 12:56:28', '2019-07-24 23:15:52'),
(101, 40, 'Caminata Cultural de Pueblo Kichwa de Rukullakta', 'caminata-cultural-de-pueblo-kichwa-de-rukullakta', '<p style=\"text-align: justify;\">Pueblo Kichwa de Rukullakta conmemoro sus 50 A&ntilde;os de Vida y lucha de Proceso Organizativa en Canton Archidona, en Homenaje de sus Bodas de Oro se realiz&oacute; la Caminata de Cultural con los Pueblos y Nacionalidades de la Amazonia.</p>\r\n', '1', 'documento-101-caminata-cultural-de-pueblo-kichwa-de-rukullakta.jpg', 'es', 128, 72, '1', 'Wayra Samuel Shiguango', 'Wayra Samuel Shiguango', NULL, NULL, 2018, '50 Años de PKR-CTI,Bodas de Oro,Caminata,Pueblo Kichwa,Rukullakta', NULL, 'img', '1', '2', 'true', 'wayrashigua', 'santiago', '2019-03-16 12:58:29', '2019-07-24 18:37:07'),
(103, 28, 'Cántaro tradicional de Saraguro', 'cantaro-tradicional-de-saraguro', '<p>Los c&aacute;ntaros eran usados para la fermentacion de la chicha</p>\r\n', '1', 'documento-103-cantaro-tradicional-de-saraguro.jpg', 'es', 251, 73, '1', 'Ruth Angamarca', NULL, NULL, NULL, 2014, 'Cántaro tradicional de Saraguro,Saraguro,pueblo,tipico', '2', 'img', '1', '2', 'true', 'Ruth Angamarca A', NULL, '2019-03-16 13:04:02', NULL),
(104, 28, 'Vestimenta del pueblo Saraguro', 'vestimenta-del-pueblo-saraguro', '', '1', 'documento-104-vestimenta-del-pueblo-saraguro.jpg', 'es', 251, 78, '1', 'Ruth Angamarca', NULL, NULL, NULL, 2014, 'vestimenta,tipica,saraguro,pueblo saraguro', '2', 'img', '1', '2', 'true', 'Ruth Angamarca A', NULL, '2019-03-16 13:06:59', NULL),
(105, 10, 'Armadillo Asado', 'comidad-tradicional-armadillo-asado', '<p style=\"text-align: justify;\">El armadillo asado es un plato tradicional de los Aw&aacute;. El armadillo vive dentro de la tierra o cuevas y se lo caza en la selva o terrenos llanos.</p>\r\n', '1', 'documento-105-comidad-tradicional-armadillo-asado.jpg', 'es', 163, 74, '10', 'Byron Cantincuz', 'Byron Cantincuz', NULL, NULL, 2019, 'armadillo asado,comunidad tradiconal awa,plato tradiconal awa,gastronomia awa', NULL, 'img', '1', '1', 'true', 'Byroncr', 'santiago', '2019-03-16 13:09:21', '2019-07-24 18:22:30'),
(106, 10, 'Kuguin - tipo de hormiga', 'kuguin-tipo-de-hormiga', '<p>Kuguin, especie de hormiga,&nbsp;comida tradicional de los Awa que se prepara regularmente en semana Santa.</p>\r\n', '1', 'documento-106-kuguin-tipo-de-hormiga.jpg', 'es', 105, 74, NULL, 'Yicela Guanga', 'Yicela Guanga', NULL, NULL, 2019, 'kuguin,hormiga,comida Awa', NULL, 'pdf', '1', '1', 'true', 'su-palapcha', 'santiago', '2019-03-16 13:12:04', '2019-07-24 23:13:49'),
(107, 21, 'Gobernador de San Salvador', 'gobernador-de-san-salvador', '<p>Benito Tapuyo, Gobernador Chachi de San Salvador.</p>\r\n', '1', 'documento-107-gobernador-de-san-salvador.jpg', 'es', 121, 71, '5', 'Comunidad San Salvador', 'CORAPE', NULL, NULL, 2019, 'Comunidad San Salvador,Gobernador Chachi,San Salvador', '2', 'img', '1', '2', 'true', 'Julio', 'dmuenala', '2019-03-16 13:30:20', '2019-06-19 10:29:24'),
(108, 10, 'Entrevista Organizativa Awá', 'entrevista-organizativa-awa', '<p style=\"text-align: justify;\">Entrevista a Raulio Cantincuz, miembro de la comunidad Guare sobre el &aacute;rea organizativa&nbsp;de la FCAE (Federaci&oacute;n de Centros Aw&aacute;&nbsp;del Ecuador).</p>\r\n', '1', 'documento-108-entrevista-organizativa-awa.mp3', 'es', 207, 76, '10', 'Nacionalidad Awa', 'CORAPE', NULL, NULL, 2019, 'entrevista organizativa,Raulio Cantincuz,Awa vida organizativa', NULL, 'audio', '1', '1', 'true', 'su-palapcha', 'santiago', '2019-03-16 13:32:42', '2019-07-24 18:41:20'),
(109, 35, 'Indumentarias del Pueblo Puruhá', 'indumentarias-del-pueblo-puruha', '<p style=\"text-align: justify;\">El testimonio de las indumentarias del pueblo puruh&aacute;, fue realizado en base a las investigaciones realizadas a trav&eacute;s de la memoria oral a diferentes comunidades tales como Cacha, Flores, Licto, Colta, Guamote, as&iacute; mismos documentos obtenidos de diferentes Iglesias Cat&oacute;licas e Instituciones Educativas como Pacha Yachachik de la ciudad de Riobamba.</p>\r\n\r\n<p style=\"text-align: justify;\">Existen documentos decodificados de los dise&ntilde;os, bordados, tejidos y colores de distintitos pueblos kichwas para los mismos puede contactar con:</p>\r\n\r\n<ul>\r\n	<li style=\"text-align: justify;\">Colectivo Muyu.</li>\r\n	<li style=\"text-align: justify;\">Correo: <a href=\"mailto:muyu.colectivo@gmail.com\">muyu.colectivo@gmail.com</a></li>\r\n</ul>\r\n\r\n<p style=\"text-align: justify;\">Sisa Chicaiza.</p>\r\n\r\n<ul>\r\n	<li style=\"text-align: justify;\">Cel: 0990921155</li>\r\n	<li style=\"text-align: justify;\">Correo: <a href=\"mailto:sisapak@gmail.com\">sisapak@gmail.com</a></li>\r\n</ul>\r\n\r\n<p><o:p></o:p></p>\r\n', '1', 'documento-109-indumentarias-del-pueblo-puruha.mp3', 'es', 131, 76, '1', 'Sisa Pacari Chicaiza', 'Ángel Criollo', 'Colectivo MUYU', NULL, 2019, 'Pueblo Puruhá,Pichunchis,blusas,anacos,ponchos,wallkas,mama chimpi,kawiña,indumentarias,tejidos,bordados', NULL, 'audio', '1', '2', 'true', 'Sisapak', 'santiago', '2019-03-16 13:32:48', '2019-07-24 18:39:53'),
(110, 10, 'Pita - Fibra', 'pita-fibra-hilo-natural-', '<p style=\"text-align: justify;\">Pita, es una&nbsp;fibra&nbsp;vegetal conocida por su resistencia que se utiliza como materia prima para realizar artesan&iacute;as.</p>\r\n', '1', 'documento-110-pita-fibra-hilo-natural.jpg', 'es', 117, 71, NULL, 'Yicela Guanga', 'Yicela Guanga', NULL, NULL, 2019, 'Pita,hilo natural Awa,fibra', NULL, 'img', '1', '1', 'true', 'su-palapcha', 'santiago', '2019-03-16 13:44:17', '2019-07-24 18:22:24'),
(111, 40, 'Nueva Kuraka - Rukullakta', 'cambio-de-mando-a-nuevo-kuraka-de-pueblo-kichwa-de-rukullakta', '<p style=\"text-align: justify;\">En este A&ntilde;o Pueblo Kichwa de Rukullakta eligi&oacute; a un nuevo consejo de Gobierno de PKR para el periodo de 2019 - 2021, en donde fue elegida como presidenta o como kuraka a la Lcda. Gladis Shiguango, por primera vez en la historia de Pueblo de Kichwa de Rukullakta despu&eacute;s de 51 a&ntilde;os de Proceso de lucha organizativa tiene a una Mujer como presidenta/kuraka.</p>\r\n', '1', 'documento-111-cambio-de-mando-a-nuevo-kuraka-de-pueblo-kichwa-de-rukullakta.jpg', 'es', 101, 70, '1', 'Wayra Samuel Shiguango', 'Wayra Shiguango', NULL, NULL, 2019, 'Cambio de Mando PKR 2019,MUJER KICHWA DE PKR,Mujer Kickwa,PKR,Nueva Kuraka', NULL, 'img', '1', '2', 'true', 'wayrashigua', 'santiago', '2019-03-16 14:35:34', '2019-07-24 18:36:53'),
(112, 10, 'Jigra Artesanía Awá', 'jigra-artesania-awa', '<p>Jigra, bolso tradicional de la nacionalidad Aw&aacute;.&nbsp;Elaborado de Pita, para adquirirlo comunicarse al:</p>\r\n\r\n<p><strong>Filomena Rosero:</strong> 0985641376.</p>\r\n', '1', 'documento-112-jigra-artesania-awa.jpg', 'es', 151, 75, '10', 'Archico FCAE', NULL, NULL, NULL, 2006, 'Jigra,artesania Awa,bolso', NULL, 'img', '1', '1', 'true', 'su-palapcha', 'santiago', '2019-03-16 14:35:58', '2019-07-24 18:21:51'),
(113, 40, 'Asamblea Suprema Pueblo Kichwa - Rukullakta', 'asamblea-suprema-de-pueblo-kichwa-de-rukullakta-', '<p style=\"text-align: justify;\">El 07 de febrero de 2019 se realiz&oacute; la Gran Asamblea Suprema de Pueblo Kichwa de Rukullakta CTI, para elegir al Nuevo Consejo de Gobierno de periodo 2019-2021 donde la poblaci&oacute;n de las 17 comunidades asisti&oacute; a la gran convocatoria&nbsp;que se realiza de acuerdo al Estatuto vigente. Cerca de 3,000 Socios/as de las 17 comunidades participaron en este proceso Organizativo.</p>\r\n', '1', 'documento-113-asamblea-suprema-de-pueblo-kichwa-de-rukullakta.jpg', 'es', 138, 75, '1', 'Wayra Samuel Shiguango', 'Wayra Shiguango', NULL, NULL, 2019, 'Asamblea Suprema,PKR-CTI,Rukullakta,Nuevo consejo,Proceso Organizativo', NULL, 'img', '1', '2', 'true', 'wayrashigua', 'santiago', '2019-03-16 14:44:21', '2019-07-24 18:36:32'),
(114, 21, 'Comunidad San Salvador', 'comunidad-san-salvador', '<p style=\"text-align: justify;\">Fotograf&iacute;a de la comunidad San Salvador.</p>\r\n', '1', 'documento-114-comunidad-san-salvador.jpg', 'es', 118, 72, '5', 'Comunidad San Salvador', 'CORAPE', NULL, NULL, 2019, 'Comunidad San Savador,Centro poblado,Vivienda', '2', 'img', '1', '2', 'true', 'Julio', 'dmuenala', '2019-03-16 14:49:15', '2019-06-19 10:33:29'),
(116, 40, 'Puruhá Runakunapak Churaykuna', 'puruha-runakunapak-churaykuna', '<p style=\"text-align: justify;\">El video de las indumentarias del pueblo kichwa puruh&aacute;, fue realizada en el proceso de investigaci&oacute;n a las comunidades ind&iacute;genas del pueblo Puruh&aacute;. El minuto 1.25 &ndash; 1.28 y 1.32 fue tomada del Documental de Fernando Daquilema.</p>\r\n\r\n<p style=\"text-align: justify;\">Para m&aacute;s informaci&oacute;n sobre la investigaci&oacute;n puede contactar con la autora, Sisa Chicaiza 0990921155 sisapak@gmail.com</p>\r\n\r\n<p><o:p></o:p></p>\r\n', '1', 'documento-116-puruha-runakunapak-churaykuna.wmv', 'es', 356, 97, NULL, 'Sisa Pacari Chicaiza', 'Ángel Criollo', 'Colectivo MUYU', NULL, 2018, 'Tejidos,Vestimenta,Fajas,Nuestra cultura', NULL, 'video', '1', '2', 'true', 'Sisapak', 'santiago', '2019-03-16 15:15:24', '2019-07-24 23:12:07'),
(117, 28, 'Mote con habas, papas, mellocos y queso', 'mote-con-habas-papas-mellocos-y-queso', '', '1', 'documento-117-mote-con-habas-papas-mellocos-y-queso.jpg', 'es', 256, 74, '1', 'Ruth Angamarca', NULL, NULL, NULL, 2016, 'comida,tipica,saarguro,mote,habas,papas,queso', '2', 'img', '1', '2', 'true', 'Ruth Angamarca A', NULL, '2019-03-16 15:21:15', NULL),
(118, 21, 'Mujer Chachi', 'comunidad-san-salvador-1552767709', '<p style=\"text-align: justify;\">Mujer Chachi utilizando traje t&iacute;pico o traje tradicional para la celebraci&oacute;n de su boda.</p>\r\n', '1', 'documento-118-comunidad-san-salvador-1552767709.jpg', 'es', 102, 78, NULL, 'Comunidad San Salvador', 'CORAPE', NULL, NULL, 2019, 'Mujer Chachi,Boda,Traje típico', NULL, 'img', NULL, '2', 'true', 'Julio', 'dmuenala', '2019-03-16 15:21:49', '2019-06-19 10:42:00'),
(119, 35, 'Vestimenta Pueblo Puruwá- Guamote', 'vestimenta-pueblo-puruha-guamote', '', '1', 'documento-119-vestimenta-pueblo-puruha-guamote.jpg', 'es', 201, 85, '1', 'Nelly Chicaiza', NULL, NULL, NULL, 2019, 'Mujer kichwa puruhá,Guamote', NULL, 'img', '1', '2', 'true', 'Sisapak', 'dmuenala', '2019-03-16 15:24:59', '2019-07-04 11:03:31'),
(120, 14, 'Reunión Eperãra', 'reunion-de-los-eperara', '<p>Los&nbsp;<strong>Eper&atilde;ra Siapidaar&atilde;</strong>&nbsp;son una nacionalidad ind&iacute;gena que habitan en&nbsp;Ecuador,&nbsp;Colombia&nbsp;y&nbsp;Panam&aacute;. Anteriormente se les conoc&iacute;a como &Eacute;pera en Ecuador, pero en la actualidad se definen como Eper&atilde;ra Siapidaar&atilde;.</p>\r\n\r\n<p>En el Ecuador, se ubican en la&nbsp;Provincia de Esmeraldas, en el&nbsp;Cant&oacute;n Eloy Alfaro&nbsp;Parroquia Borb&oacute;n, en las comunidades Santa Rosa, Bella Aurora y la Cayapa.</p>\r\n', '1', 'documento-120-reunion-de-los-eperara.jpg', 'es', 96, 76, '6', 'Oscar Chiripua', 'Oscar Chiripua', NULL, NULL, 2019, 'la reunion se dio en la casa cultural,reunion radio', NULL, 'img', '1', '2', 'true', 'chiripua', 'santiago', '2019-03-16 15:36:33', '2019-07-24 18:32:53'),
(121, 21, 'Rampira (palmera)', 'comunidad-san-salvador-1552768780', '<p>Mujeres de San Salvador de la Nacinalidad Chachi, elaborando artesan&iacute;a con materia prima (rampira) extraido de la monta&ntilde;a.</p>\r\n', '1', 'documento-121-comunidad-san-salvador-1552768780.jpg', 'es', 155, 75, '5', NULL, NULL, NULL, NULL, 2019, 'Mujeres Chachi,Materia prima,Artesania en elaboracion', '2', 'img', '1', '2', 'true', 'Julio', 'Julio', '2019-03-16 15:39:40', '2019-03-16 16:48:57'),
(122, 37, 'Entrevista Angel Awak', 'entrevista-angel-awak', '<p>Esta entrevista fue realizada en la provincia de Zamora Chinchipe en el cant&oacute;n Guayzimi, comunidad Shaymi, a un l&iacute;der ind&iacute;gena Shuar del Ecuador.&nbsp;</p>\r\n', '1', 'documento-122-entrevista-angel-awak.mp3', 'es', 117, 79, '2', 'Eslendy Grefa', 'Lancera Digital', NULL, NULL, 2019, 'lider indigena shuar,identidad cultural shuar,Angel Awak', NULL, 'audio', '1', '2', 'true', 'Eslenmunayri', 'santiago', '2019-03-16 16:51:04', '2019-07-24 18:41:12'),
(123, 21, 'Guanta Ahumada', 'guanta-ahumada-1552774025', '<p style=\"text-align: justify;\">Guanta ahumada es una comida t&iacute;pica de la Nacionalidad Chachi.</p>\r\n', '1', 'documento-123-guanta-ahumada-1552774025.jpg', 'es', 133, 69, '5', 'Tomás De la Cruz', 'Tomás De la Cruz', NULL, NULL, 2019, 'Gastronomía típica Chachi,Guanta ahumada', '2', 'img', '1', '2', 'true', 'Chachi Tomas', 'dmuenala', '2019-03-16 17:07:05', '2019-07-01 10:21:43'),
(124, 3, 'Biblioteca FLACSO', 'biblioteca', '<p><a href=\"https://www.flacso.edu.ec/biblio/opac/\">https://www.flacso.edu.ec/biblio/opac/</a></p>\r\n', '1', 'documento-124-biblioteca.png', 'es', 147, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'url', NULL, '2', 'true', 'corape', 'admin', '2019-03-16 17:55:01', '2019-07-24 11:36:56'),
(126, 42, 'Tapiz - Danzante', 'danzante-1553790578', '', '1', 'documento-126-danzante-1553790578.jpg', 'es', 102, 66, NULL, NULL, NULL, NULL, NULL, 2019, 'Danzante Salasaca,Tapiz', NULL, 'img', NULL, '2', 'true', 'rocio', 'santiago', '2019-03-28 11:29:38', '2019-07-24 18:32:02'),
(127, 43, 'Mujer Yachak (sabia) kichwa Otavalo', 'mujer-yachak-sabia-kichwa-otavalo', '<p>Fotograf&iacute;a de un ritual de purificaci&oacute;n dirigida por una mujer yachak del pueblo kichwa Otavalo.</p>\r\n', '1', 'documento-127-mujer-yachak-sabia-kichwa-otavalo.jpg', 'es', 53, 33, NULL, 'CORAPE', 'CORAPE', 'CORAPE', NULL, 2016, 'Kichwa,Yachak', NULL, 'img', '1', '1', 'true', 'dmuenala', 'santiago', '2019-06-11 16:59:31', '2019-07-24 23:26:32'),
(128, 40, 'Altar de Ritual Andino', 'altar-de-ritual-andino', '<p>Altar de ceremonia y ritual Andino&nbsp;</p>\r\n', '1', 'documento-128-altar-de-ritual-andino.jpg', 'es', 82, 33, NULL, 'CORAPE', 'CORAPE', 'CORAPE', NULL, 2016, 'Altar,ceremonia,ritual', NULL, 'img', '1', '2', 'true', 'dmuenala', 'santiago', '2019-06-13 11:42:56', '2019-07-24 23:13:41'),
(129, 40, 'Churo, Instrumento de convocatorias Andinas', 'churo-instrumento-de-convocatorias-andinas', '<p>Churo, instrumento utilizad para el llamado de fiesta andinas, cosecha, ceremonias, mingas, reuniones en&nbsp;las comunas.</p>\r\n', '1', 'documento-129-churo-instrumento-de-convocatorias-andinas.jpg', 'es', 45, 31, NULL, 'CORAPE', 'CORAPE', 'CORAPE', NULL, 2016, 'Churo,Caracol,Instrumento', NULL, 'img', '1', '2', 'true', 'dmuenala', 'santiago', '2019-06-13 11:49:19', '2019-07-24 23:13:34'),
(130, 36, 'Monumento a líder mitológico (Aya Huma)', 'monumento-a-lider-mitologico-aya-huma', '<p>Monumento de lider mitologico en el parque central de Cayambe, conocido como diablumma o aya huma.</p>\r\n', '1', 'documento-130-monumento-a-lider-mitologico-aya-huma.jpg', 'es', 53, 33, '1', 'Mishell Reinoso', 'Mishell Reinoso', 'Mishell Reinoso', NULL, 2015, 'Monumento,Diabluma', NULL, 'img', '1', '2', 'true', 'dmuenala', 'dmuenala', '2019-06-13 11:55:27', '2019-07-04 11:31:57'),
(131, 36, 'Vestimenta Típica de la mujer Kayambi.', 'vestimenta-tipica-de-la-mujer-kayambi', '<p>Vestimenta tipica de la mujer Kayambi,</p>\r\n', '1', 'documento-131-vestimenta-tipica-de-la-mujer-kayambi.jpg', 'es', 55, 32, '1', 'Mishell Reinoso', 'Mishell Reinoso', 'Mishell Reinoso', NULL, 2015, 'Vestimenta,Mujer,Kayambi', NULL, 'img', '1', '2', 'true', 'dmuenala', 'dmuenala', '2019-06-13 11:58:31', '2019-07-04 11:31:29'),
(132, 36, 'Niña Kayambi', 'nina-kayambi', '<p>Vestimenta tipica de la ni&ntilde;a kayambi</p>\r\n', '1', 'documento-132-nina-kayambi.jpg', 'es', 59, 33, '1', 'Mishell Reinoso', 'Mishell Reinoso', 'Mishell Reinoso', NULL, 2015, 'Vestimenta,niña,tradicional', NULL, 'img', '1', '2', 'true', 'dmuenala', 'dmuenala', '2019-06-13 12:01:04', '2019-07-04 11:31:13'),
(133, 36, 'Hornado típico de Cayambe', 'hornado-tipico-de-cayambe', '<p>Hornado, comida tipica de la ciudad de Cayambe.</p>\r\n', '1', 'documento-133-hornado-tipico-de-cayambe.jpg', 'es', 48, 36, '1', 'Mishell Reinoso', 'Mishell Reinoso', 'Mishell Reinoso', NULL, 2015, 'Comida,Cayambe', NULL, 'img', '1', '2', 'true', 'dmuenala', 'dmuenala', '2019-06-13 12:09:18', '2019-07-04 11:32:11'),
(134, 35, 'Vestimenta mujer Puruwá', 'vestimenta-mujer-puruwa', '<p>Vestimenta tradicional de la mujer puruha.</p>\r\n', '1', 'documento-134-vestimenta-mujer-puruwa.jpg', 'es', 67, 37, '1', 'CORAPE', 'CORAPE', 'CORAPE', 'CORAPE', 2016, 'Puruhua,mujer,vestimenta', NULL, 'img', '1', '2', 'true', 'dmuenala', 'dmuenala', '2019-06-17 11:01:46', '2019-07-04 11:03:15'),
(135, 35, 'Danza Tradicional Puruwá', 'danza-tradicional-puruwa', '<p>Danza tradicional del pueblo puruhua</p>\r\n', '1', 'documento-135-danza-tradicional-puruwa.jpg', 'es', 58, 33, '1', 'CORAPE', 'CORAPE', 'CORAPE', 'CORAPE', 2016, 'Danza,Tradicional', NULL, 'img', '1', '2', 'true', 'dmuenala', 'dmuenala', '2019-06-17 11:05:19', '2019-07-04 11:03:55'),
(136, 37, 'Vestimenta tradicional mujer Shuar', 'vestimenta-tradicional-mujer-shuar', '<p>baile y vestimenta tradicional del pueblo shuar</p>\r\n', '1', 'documento-136-vestimenta-tradicional-mujer-shuar.jpg', 'es', 51, 31, '2', 'CORAPE', 'CORAPE', 'CORAPE', 'CORAPE', 2016, 'shuar,vestimenta,mujer', NULL, 'img', '1', '2', 'true', 'dmuenala', 'dmuenala', '2019-06-17 11:08:03', '2019-07-04 11:35:54'),
(137, 37, 'Vestimenta tradicional hombre Shuar', 'vestimenta-tradicional-hombre-shuar', '<p>danza y vestimenta tradicional del hombre shuar</p>\r\n', '1', 'documento-137-vestimenta-tradicional-hombre-shuar.jpg', 'es', 44, 34, '2', 'CORAPE', 'CORAPE', 'CORAPE', 'CORAPE', 2016, 'Hombre,Costumbres', NULL, 'img', '1', '2', 'true', 'dmuenala', 'dmuenala', '2019-06-17 11:13:25', '2019-07-04 11:35:41'),
(138, 38, 'Hilado Tradicional de Panzaleo', 'hilado-tradicional-de-panzaleo', '<p>Hilado tradicional con la na de oveja en el pueblo de Panzaleo Cotopaxi</p>\r\n', '1', 'documento-138-hilado-tradicional-de-panzaleo.jpg', 'es', 86, 33, '1', 'CORAPE', 'CORAPE', 'CORAPE', 'CORAPE', 2016, 'hilado,panzaleo,cotopaxi', NULL, 'img', '1', '2', 'true', 'dmuenala', 'dmuenala', '2019-06-17 11:15:59', '2019-07-04 11:33:24'),
(139, 38, 'Julian Tucumbi, Músico Tradicional de Panzaleo', 'julian-tucumbi-musico-tradicional-de-panzaleo', '<p>Julian Tucumbi musico tradicional del puebo de Panzaleo Cotopaxi</p>\r\n', '1', 'documento-139-julian-tucumbi-musico-tradicional-de-panzaleo.jpg', 'es', 54, 32, '1', 'CORAPE', 'CORAPE', 'CORAPE', 'CORAPE', 2016, 'musico,Julian,Tucumbi', NULL, 'img', '1', '2', 'true', 'dmuenala', 'dmuenala', '2019-06-17 11:18:17', '2019-07-04 11:33:40'),
(140, 40, 'Fiesta San Juan de Cayambe', 'fiesta-san-juan-de-cayambe', '<p>Fiestas de San Juan/Sn Pedro Caymbde 2018</p>\r\n', '1', 'documento-140-fiesta-san-juan-de-cayambe.mp3', 'es', 46, 29, NULL, 'CORAPE', 'CORAPE', 'CORAPE', 'CORAPE', 2018, 'San Juan,San Pedro,Cayambe', NULL, 'audio', '1', '2', 'true', 'dmuenala', 'santiago', '2019-06-17 11:45:10', '2019-07-24 23:27:28'),
(141, 40, 'Inti Raymi Cayambe', 'inti-raymi-cayambe', '<p>Programa fiestas inti raymi de Cayambe</p>\r\n', '1', 'documento-141-inti-raymi-cayambe.mp3', 'es', 42, 30, NULL, 'CORAPE', 'CORAPE', 'CORAPE', 'CORAPE', 2018, 'Inti Raymi,Cayambe,Fiestas', NULL, 'audio', '1', '2', 'true', 'dmuenala', 'santiago', '2019-06-17 11:49:31', '2019-07-24 23:25:36'),
(142, 40, 'Pueblo Sarayaku', 'pueblo-sarayaku', '<p>Programa culturala sobre el pueblo Sarayaku&nbsp;y sus tradiciones en base a la Pachamama.</p>\r\n', '1', 'documento-142-pueblo-sarayaku.mp3', 'es', 15, 14, '1', 'CORAPE', 'CORAPE', 'CORAPE', 'CORAPE', 2018, 'kichwa,sarayaku,pachamama', NULL, 'audio', '1', '2', 'true', 'dmuenala', 'santiago', '2019-06-24 10:01:12', '2019-07-24 18:42:30'),
(144, 3, 'MuNa', 'muna', '<p><a href=\"http://muna.culturaypatrimonio.gob.ec/\">http://muna.culturaypatrimonio.gob.ec/</a></p>\r\n\r\n<p><img alt=\"\" src=\"media/pictures/web/otros/logo_muna-c64832f6.png\" style=\"width: 284px; height: 199px;\" /></p>\r\n', '1', 'documento-144-muna.png', 'es', 35, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'url', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-03 11:58:04', '2019-07-03 12:05:22'),
(145, 3, 'Biblioteca UCE', 'biblioteca-uce', '<p><a href=\"http://www.uce.edu.ec/web/sib\">http://www.uce.edu.ec/web/sib</a></p>\r\n\r\n<p><img alt=\"\" src=\"media/pictures/web/otros/SIB.png\" style=\"width: 225px; height: 154px;\" /></p>\r\n', '1', 'documento-145-biblioteca-uce.png', 'es', 27, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'url', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-03 11:59:55', '2019-07-03 12:06:24'),
(147, 3, 'Biblioteca UASB', 'biblioteca-uasb', '<p><a href=\"http://biblioteca.uasb.edu.ec/catalogo/libre.htm\">http://biblioteca.uasb.edu.ec/catalogo/libre.htm</a></p>\r\n', '1', 'documento-147-biblioteca-uasb.png', 'es', 23, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'url', NULL, '2', 'true', 'dmuenala', NULL, '2019-07-03 12:09:24', NULL),
(148, 10, 'Una mirada desde la Educación', 'una-mirada-desde-la-educacion', '<p>Nacionalidades indigenas de la costa ecuatoriana</p>\r\n', '1', 'documento-148-una-mirada-desde-la-educacion.pdf', 'es', 15, 10, '6', 'Unicef', 'Unicef', 'Unicef', 'Unicef', 2004, 'Educacion', NULL, 'pdf', '1', '2', 'true', 'dmuenala', 'santiago', '2019-07-04 11:48:25', '2019-07-24 23:31:36'),
(149, 14, 'Retomemos nuestro camino', 'retomemos-nuestro-camino', '<p>Nacionalidad eperara de la regi&oacute;n Costa Ecuatoriana.</p>\r\n', '1', 'documento-149-retomemos-nuestro-camino.pdf', 'es', 27, 14, '6', 'Tachi Ode T´tadama', 'Tachi Ode T´tadama', 'Tachi Ode T´tadama', 'Tachi Ode T´tadama', 2005, 'epera', NULL, 'pdf', '1', '2', 'true', 'dmuenala', NULL, '2019-07-04 11:55:01', NULL),
(150, 17, 'Sabiduría Amazónica', 'sabiduria-amazonica', '<p>Nacionalidad Kichwa de la Amazonia en Ecuador</p>\r\n', '1', 'documento-150-sabiduria-amazonica.pdf', 'es', 25, 16, '1', 'Varios', 'Varios', 'Varios', 'Varios', 2012, 'kichwa,amazonia', NULL, 'pdf', '1', '2', 'true', 'dmuenala', NULL, '2019-07-04 11:59:24', NULL),
(151, 13, 'El sueño de los Záparas', 'el-sueno-de-los-zaparas', '<p>El sue&ntilde;o dde la nacionalidad zapara.</p>\r\n', '1', 'documento-151-el-sueno-de-los-zaparas.pdf', 'es', 14, 11, '12', 'Anne-Gaël BILHAUT', 'Anne-Gaël BILHAUT', 'Anne-Gaël BILHAUT', 'Anne-Gaël BILHAUT', 2011, 'Zapara', NULL, 'pdf', '1', '2', 'true', 'dmuenala', NULL, '2019-07-04 12:02:40', NULL),
(152, 15, 'El corazonar Kitu Kara', 'el-corazonar-kitu-kara', '<p>Nacionalidad Kitu Kara</p>\r\n', '1', 'documento-152-el-corazonar-kitu-kara.pdf', 'es', 26, 24, '1', 'Edgar Ushiña', 'Edgar Ushiña', 'Edgar Ushiña', 'Edgar Ushiña', 2014, 'kitu kara', NULL, 'pdf', '1', '2', 'true', 'dmuenala', NULL, '2019-07-04 12:07:04', NULL),
(153, 35, 'Indumentaria del pueblo étnico Puruwá', 'indumentaria-del-pueblo-etnico-puruwa', '', '1', '', 'es', 4, NULL, '1', 'Diana Mendez', 'Diana Mendez', 'Diana Mendez', 'Diana Mendez', 2014, 'Puruwá,Pueblo', NULL, 'pdf', '1', '2', 'true', 'dmuenala', 'santiago', '2019-07-04 12:14:02', '2019-07-24 23:42:06'),
(154, 39, 'Jornadas 1', 'jornadas-1', '', '1', 'documento-154-jornadas-1.jpeg', 'es', 37, 12, NULL, 'Carlos Ramirez', 'Carlos Ramirez', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 15:31:50', '2019-07-24 11:43:46'),
(155, 39, 'Jornadas 2', 'jornadas-2', '', '1', 'documento-155-jornadas-2.jpg', 'es', 16, 11, NULL, 'Carlos Ramirez', 'CORAPE', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 15:35:44', '2019-07-24 11:43:40'),
(156, 39, 'Jornadas 3', 'jornada-3', '', '1', 'documento-156-jornada-3.jpeg', 'es', 16, 10, NULL, 'Carlos Ramirez', 'CORAPE', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 15:38:43', '2019-07-24 11:43:32'),
(157, 39, 'Jornadas 4', 'jornada-4', '', '1', 'documento-157-jornada-4.jpeg', 'es', 28, 10, NULL, 'Carlos Ramirez', 'CORAPE', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 15:44:56', '2019-07-24 11:43:22'),
(158, 39, 'Jornadas 5', 'jornada-5', '', '1', 'documento-158-jornada-5.jpeg', 'es', 14, 12, NULL, 'Mishell Reinoso', 'CORAPE', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 15:45:36', '2019-07-24 11:43:15'),
(159, 39, 'Jornadas 6', 'jornada-6', '', '1', 'documento-159-jornada-6.jpeg', 'es', 14, 13, NULL, 'Mishell Reinoso', 'CORAPE', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 15:46:25', '2019-07-24 11:43:01'),
(160, 39, 'Jornadas 7', 'jornada-7', '', '1', 'documento-160-jornada-7.jpeg', 'es', 31, 9, NULL, 'Carlos Ramirez', 'CORAPE', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 15:51:58', '2019-07-24 11:43:09'),
(161, 39, 'Jornadas 8', 'jornada-8', '', '1', 'documento-161-jornada-8.jpeg', 'es', 16, 11, NULL, 'Carlos Ramirez', 'CORAPE', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 15:58:55', '2019-07-24 11:41:25'),
(162, 39, 'Jornadas 9', 'jornada-9', '', '1', 'documento-162-jornada-9.jpeg', 'es', 16, 13, NULL, 'Bryan Charro', 'CORAPE', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 16:01:11', '2019-07-04 16:48:57'),
(163, 39, 'Jornadas 10', 'jornada-10', '', '1', 'documento-163-jornada-10.jpeg', 'es', 15, 12, NULL, 'Mishell Reinoso', 'CORAPE', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 16:09:30', '2019-07-24 11:42:11'),
(164, 39, 'Jornadas 11', 'jornadas-11', '', '1', 'documento-164-jornadas-11.jpeg', 'es', 14, 9, NULL, 'Mishell Reinoso', 'CORAPE', NULL, NULL, 2019, NULL, NULL, 'img', NULL, '2', 'true', 'dmuenala', 'dmuenala', '2019-07-04 16:13:30', '2019-07-24 11:42:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_documento_categoria`
--

CREATE TABLE `x_documento_categoria` (
  `documento_categoria_id` decimal(10,0) NOT NULL,
  `documento_categoria_nombre` varchar(150) DEFAULT NULL,
  `documento_categoria_alias` varchar(250) DEFAULT NULL,
  `documento_categoria_descripcion` text,
  `documento_categoria_habilitado` varchar(5) DEFAULT NULL,
  `documento_categoria_lenguaje` varchar(5) DEFAULT NULL,
  `documento_categoria_padre_id` decimal(10,0) DEFAULT NULL,
  `documento_categoria_grupo_usuario_todos` varchar(5) DEFAULT NULL,
  `documento_categoria_usuario_crea` varchar(20) DEFAULT NULL,
  `documento_categoria_usuario_actualiza` varchar(20) DEFAULT NULL,
  `documento_categoria_fecha_creacion` datetime DEFAULT NULL,
  `documento_categoria_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_documento_categoria`
--

INSERT INTO `x_documento_categoria` (`documento_categoria_id`, `documento_categoria_nombre`, `documento_categoria_alias`, `documento_categoria_descripcion`, `documento_categoria_habilitado`, `documento_categoria_lenguaje`, `documento_categoria_padre_id`, `documento_categoria_grupo_usuario_todos`, `documento_categoria_usuario_crea`, `documento_categoria_usuario_actualiza`, `documento_categoria_fecha_creacion`, `documento_categoria_fecha_actualizacion`) VALUES
(3, 'Otros Repositorios', 'otros-repositorios', '<p><img alt=\"\" src=\"media/Apak.png\" /></p>\r\n', '1', 'es', NULL, '2', 'admin', 'dmuenala', '2019-01-14 17:26:40', '2019-07-26 14:52:52'),
(10, 'Nacionalidad Awá', 'nacionalidad-awa', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/awa.jpg\" /></p>\r\n\r\n<p>Informaci&oacute;n General</p>\r\n', '1', 'es', NULL, '2', 'admin', 'dmuenala', '2019-01-16 09:31:32', '2019-07-26 11:25:32'),
(13, 'Nacionalidad Sápara', 'nacionalidad-sapara', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/saparo1.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'rocio', 'dmuenala', '2019-01-16 11:28:20', '2019-07-26 11:39:53'),
(14, 'Nacionalidad Éperara Siapidara', 'nacionalidad-eperara-siapidara', '<p><img alt=\"\" src=\"media/Artesana-epera.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'rocio', 'dmuenala', '2019-01-16 11:29:27', '2019-07-26 14:49:05'),
(15, 'Pueblo Kitu Kara', 'pueblo-kitu-kara', '<p><img alt=\"Mujer Kitu Kara. Fotografía Corp. Kinde\" src=\"media/pictures/web/slideshow/kitukara.jpg\" style=\"width: 960px; height: 540px;\" /></p>\r\n', '1', 'es', 9, '2', 'rocio', 'corape', '2019-01-16 11:38:56', '2019-03-01 12:39:39'),
(17, 'Pueblo Kichwa Amazonía', 'kichwa-de-la-amazonia', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/amazonico.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'corape', 'dmuenala', '2019-02-28 10:17:44', '2019-07-26 12:28:26'),
(21, 'Nacionalidad Chachi', 'nacionalidad-chachi', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/chachi.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'corape', 'dmuenala', '2019-02-28 11:20:27', '2019-07-26 11:35:22'),
(25, 'Diccionario Intercultural', 'diccionario-intercultural', '<p><img alt=\"\" src=\"media/pictures/web/slideshow/0K5A1650.jpg\" /></p>\r\n', '1', 'es', 4, '2', 'corape', 'corape', '2019-02-28 11:28:34', '2019-02-28 14:52:36'),
(28, 'Pueblo Saraguro', 'saraguro', '<p><img alt=\"\" src=\"media/pictures/20170519040000_los-atuendos-en-los-saraguros.jpg\" /><img alt=\"\" src=\"documento-98-tendido-collar-tradicional-de-sarguro.jpg	\" /><img alt=\"\" src=\"dia/pictures/20170519040000_los-atuendos-en-los-saraguros.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'corape', 'santiago', '2019-03-16 12:36:02', '2019-07-24 18:19:52'),
(35, 'Pueblo Puruwá', 'puruwa', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/puruwa.jpg\" /><img alt=\"\" src=\"documento-119-vestimenta-pueblo-puruha-guamote.jpg	\" /><img alt=\"\" src=\"documento-119-vestimenta-pueblo-puruha-guamote.jpg	\" /></p>\r\n', '1', 'es', 40, '2', 'dmuenala', 'dmuenala', '2019-07-04 11:00:42', '2019-07-26 12:38:20'),
(36, 'Pueblo Kayambi', 'kayambi', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/kayambi.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'dmuenala', 'dmuenala', '2019-07-04 11:30:19', '2019-07-26 12:38:01'),
(37, 'Nacionalidad Shuar', 'nacionalidad-shuar', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/shuar.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'dmuenala', 'dmuenala', '2019-07-04 11:32:49', '2019-07-26 11:22:38'),
(38, 'Pueblo Panzaleo', 'panzaleo', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/Panzaleo-11.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'dmuenala', 'dmuenala', '2019-07-04 11:33:04', '2019-07-26 12:37:31'),
(39, 'IV JORNADAS DE COMUNICACIÓN COMUNITARIA', 'iv-jornadas-de-comunicacion-comunitaria', '<p><img alt=\"\" src=\"media/pictures/JORANADAS/noticia-foto-1075-boletin-iv-jornadas-de-comunicacion-comunitaria-de-corape.png\" /></p>\r\n', '1', 'es', 5, '2', 'dmuenala', NULL, '2019-07-04 15:25:49', NULL),
(40, 'Nacionalidad Kichwa', 'nacionalidad-kichwa', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Kichwa.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 18:16:14', '2019-07-26 11:16:34'),
(41, 'Nacionalidades y Pueblos - General', 'nacionalidades-y-pueblos', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/GENERAL.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 18:30:35', '2019-07-26 11:16:16'),
(42, 'Pueblo Salasaka', 'pueblo-salasaka', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/salasaka.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 18:31:53', '2019-07-26 12:27:54'),
(43, 'Pueblo Otavalo', 'pueblo-otavalo', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/otavalo.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 23:20:33', '2019-07-26 12:27:37'),
(44, 'Pueblo Afroecuatoriano', 'pueblo-afroecuatoriano', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/afro-1.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:24:34', '2019-07-26 11:15:19'),
(45, 'Nacionalidad Tsáchila', 'nacionalidad-tsachila', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/tsachila.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:36:21', '2019-07-26 11:15:54'),
(46, 'Nacionalidad Achuar', 'nacionalidad-achuar', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Achuar1-1.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:36:43', '2019-07-26 11:18:36'),
(47, 'Nacionalidad Andoa', 'nacionalidad-andoa', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/andoa.jpg\" style=\"width: 800px; height: 600px;\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:37:16', '2019-07-26 11:17:48'),
(48, 'Nacionalidad Cofán', 'nacionalidad-cofan', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/COFAN.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:37:32', '2019-07-26 11:14:15'),
(49, 'Nacionalidad Sekoya', 'nacionalidad-sekoya', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/secoya.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:37:52', '2019-07-26 11:13:55'),
(50, 'Nacionalidad Shiwiar', 'nacionalidad-shiwiar', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/shiwiar.jpg\" style=\"width: 800px; height: 600px;\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:38:06', '2019-07-26 11:13:37'),
(51, 'Nacionalidad Siona', 'nacionalidad-siona', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/siona.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:38:19', '2019-07-26 11:12:57'),
(52, 'Nacionalidad Waorani', 'nacionalidad-waorani', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/waorani1.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:38:34', '2019-07-26 11:12:41'),
(53, 'Pueblo Chibuleo', 'pueblo-chibuleo', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/chibuleo.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 23:43:40', '2019-07-26 12:27:17'),
(54, 'Pueblo Kañari', 'pueblo-kanari', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/canari.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 23:43:57', '2019-07-26 12:27:04'),
(55, 'Pueblo Karanki', 'pueblo-karanki', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/Caranquis.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 23:44:15', '2019-07-26 12:26:39'),
(56, 'Pueblo Kisapincha', 'pueblo-kisapincha', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/kisapincha.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 23:44:29', '2019-07-26 12:24:30'),
(57, 'Pueblo Natabuela', 'pueblo-natabuela', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/natabuela.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 23:44:44', '2019-07-26 12:24:16'),
(58, 'Pueblo Tomabela', 'pueblo-tomabela', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/tomabela.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 23:44:56', '2019-07-26 12:24:00'),
(59, 'Pueblo Waranka', 'pueblo-waranka', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/waranka.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 23:45:10', '2019-07-26 12:23:46'),
(60, 'Pueblo Pasto', 'pueblo-pasto', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/PASTO.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 23:45:24', '2019-07-26 12:23:27'),
(61, 'Pueblo Palta', 'pueblo-palta', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/Nacionalidadkichwa/palta.jpg\" /></p>\r\n', '1', 'es', 40, '2', 'santiago', 'dmuenala', '2019-07-24 23:45:35', '2019-07-26 12:40:25'),
(62, 'Pueblo Montuvios', 'pueblo-montuvios', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/montubio.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:45:47', '2019-07-26 11:12:14'),
(63, 'Pueblo Huancavilca', 'pueblo-huancavilca', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/manta.jpg\" style=\"width: 800px; height: 600px;\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:46:01', '2019-07-26 12:02:03'),
(64, 'Pueblo Manta', 'pueblo-manta', '<p><img alt=\"\" src=\"media/pictures/Nacionalidades/MANTA1-1.jpg\" /></p>\r\n', '1', 'es', NULL, '2', 'santiago', 'dmuenala', '2019-07-24 23:46:11', '2019-07-26 12:01:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_documento_categoria_grupo_usuario`
--

CREATE TABLE `x_documento_categoria_grupo_usuario` (
  `documento_categoria_id` decimal(10,0) NOT NULL DEFAULT '0',
  `grupo_usuario_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_documento_grupo_usuario`
--

CREATE TABLE `x_documento_grupo_usuario` (
  `documento_id` decimal(10,0) NOT NULL DEFAULT '0',
  `grupo_usuario_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_epago`
--

CREATE TABLE `x_epago` (
  `epago_id` decimal(10,0) NOT NULL,
  `epago_usuario` varchar(20) NOT NULL,
  `epago_estado` varchar(5) DEFAULT NULL,
  `epago_mensaje` text,
  `epago_total_envio_precio` decimal(10,2) DEFAULT NULL,
  `epago_total_descuento_precio` decimal(10,2) DEFAULT NULL,
  `epago_cupon_key` varchar(250) DEFAULT NULL,
  `epago_cupon_descuento` decimal(10,2) DEFAULT NULL,
  `epago_subtotal` decimal(10,2) DEFAULT NULL,
  `epago_iva_valor` decimal(10,2) DEFAULT NULL,
  `epago_iva_total` decimal(10,2) DEFAULT NULL,
  `epago_total` decimal(10,2) DEFAULT NULL,
  `forma_pago_id` decimal(10,0) DEFAULT NULL,
  `epago_fecha_pago` date DEFAULT NULL,
  `epago_pago_comprobante_url` varchar(250) DEFAULT NULL,
  `epago_comprador_nombre` varchar(50) DEFAULT NULL,
  `epago_comprador_apellido` varchar(50) DEFAULT NULL,
  `epago_comprador_email` varchar(50) DEFAULT NULL,
  `epago_comprador_direccion_calle_principal` varchar(250) DEFAULT NULL,
  `epago_comprador_direccion_calle_secundaria` varchar(250) DEFAULT NULL,
  `epago_comprador_direccion_numeracion` varchar(50) DEFAULT NULL,
  `epago_comprador_pais` varchar(5) DEFAULT NULL,
  `epago_comprador_localidad` varchar(50) DEFAULT NULL,
  `epago_comprador_telefono` varchar(30) DEFAULT NULL,
  `epago_comprador_movil` varchar(30) DEFAULT NULL,
  `epago_estado_entrega` varchar(5) DEFAULT NULL,
  `epago_fecha_entrega` date DEFAULT NULL,
  `epago_entrega_comprobante` varchar(20) DEFAULT NULL,
  `epago_entrega_direccion_calle_principal` varchar(250) DEFAULT NULL,
  `epago_entrega_direccion_calle_secundaria` varchar(250) DEFAULT NULL,
  `epago_entrega_direccion_numeracion` varchar(50) DEFAULT NULL,
  `epago_entrega_pais` varchar(5) DEFAULT NULL,
  `epago_entrega_localidad` varchar(50) DEFAULT NULL,
  `epago_entrega_receptor_nombre` varchar(50) DEFAULT NULL,
  `epago_entrega_receptor_apellido` varchar(50) DEFAULT NULL,
  `epago_entrega_telefono` varchar(30) DEFAULT NULL,
  `epago_entrega_movil` varchar(30) DEFAULT NULL,
  `epago_fecha_creacion` datetime DEFAULT NULL,
  `epago_fecha_actualizacion` datetime DEFAULT NULL,
  `epago_usuario_crea` varchar(20) DEFAULT NULL,
  `epago_usuario_actualiza` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_epago_item`
--

CREATE TABLE `x_epago_item` (
  `epago_id` decimal(10,0) NOT NULL,
  `producto_id` decimal(10,0) DEFAULT NULL,
  `epago_item_nombre` varchar(250) DEFAULT NULL,
  `epago_item_detalle` text,
  `epago_item_cantidad` decimal(10,2) DEFAULT NULL,
  `epago_item_unidad` varchar(5) DEFAULT NULL,
  `epago_item_vunitario` decimal(10,2) DEFAULT NULL,
  `epago_item_vtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_forma_pago`
--

CREATE TABLE `x_forma_pago` (
  `forma_pago_id` decimal(10,0) NOT NULL,
  `forma_pago_nombre` varchar(100) DEFAULT NULL,
  `forma_pago_alias` varchar(250) DEFAULT NULL,
  `forma_pago_habilitado` varchar(5) DEFAULT NULL,
  `forma_pago_descripcion` text,
  `forma_pago_modo_prueba` varchar(5) DEFAULT NULL,
  `forma_pago_id_comercio` varchar(200) DEFAULT NULL,
  `forma_pago_url_test` varchar(250) DEFAULT NULL,
  `forma_pago_url_produccion` varchar(250) DEFAULT NULL,
  `forma_pago_url_confirmacion` varchar(250) DEFAULT NULL,
  `forma_pago_url_cancelacion` varchar(250) DEFAULT NULL,
  `forma_pago_url_notificacion` varchar(250) DEFAULT NULL,
  `forma_pago_lenguaje` varchar(5) DEFAULT NULL,
  `forma_pago_orden` int(11) DEFAULT NULL,
  `forma_pago_usuario_crea` varchar(20) DEFAULT NULL,
  `forma_pago_usuario_actualiza` varchar(20) DEFAULT NULL,
  `forma_pago_fecha_creacion` datetime DEFAULT NULL,
  `forma_pago_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_formulario`
--

CREATE TABLE `x_formulario` (
  `formulario_id` decimal(10,0) NOT NULL,
  `formulario_nombre` varchar(100) DEFAULT NULL,
  `formulario_alias` varchar(250) DEFAULT NULL,
  `formulario_nombre_mostrar` varchar(5) DEFAULT NULL,
  `formulario_habilitado` varchar(5) DEFAULT NULL,
  `formulario_captcha` varchar(5) DEFAULT NULL,
  `formulario_vista` varchar(60) DEFAULT NULL,
  `formulario_accion` varchar(60) DEFAULT NULL,
  `formulario_email_asunto` varchar(150) DEFAULT NULL,
  `formulario_email_cuerpo` text,
  `formulario_email_destinatario` varchar(250) DEFAULT NULL,
  `formulario_email_destinatario_copia` varchar(250) DEFAULT NULL,
  `formulario_email_remitente` varchar(250) DEFAULT NULL,
  `formulario_email_remitente_nombre` varchar(250) DEFAULT NULL,
  `formulario_lenguaje` varchar(5) DEFAULT NULL,
  `formulario_visitas` int(11) DEFAULT NULL,
  `formulario_envios` int(11) DEFAULT NULL,
  `formulario_orden` int(11) DEFAULT NULL,
  `formulario_usuario_crea` varchar(20) DEFAULT NULL,
  `formulario_usuario_actualiza` varchar(20) DEFAULT NULL,
  `formulario_fecha_creacion` datetime DEFAULT NULL,
  `formulario_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_formulario`
--

INSERT INTO `x_formulario` (`formulario_id`, `formulario_nombre`, `formulario_alias`, `formulario_nombre_mostrar`, `formulario_habilitado`, `formulario_captcha`, `formulario_vista`, `formulario_accion`, `formulario_email_asunto`, `formulario_email_cuerpo`, `formulario_email_destinatario`, `formulario_email_destinatario_copia`, `formulario_email_remitente`, `formulario_email_remitente_nombre`, `formulario_lenguaje`, `formulario_visitas`, `formulario_envios`, `formulario_orden`, `formulario_usuario_crea`, `formulario_usuario_actualiza`, `formulario_fecha_creacion`, `formulario_fecha_actualizacion`) VALUES
(1, 'Contacto', 'contacto', '1', '1', '1', 'contacto', 'formulario_contacto_submit', 'Nuevo mensaje de Contacto: {formulario_contacto_asunto}', '<p>Estimado administrador usted ha recibido un nuevo mensaje de contacto con los siguientes datos:</p>\r\n\r\n<p>{xperto_data}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Por favor atender inmediatamente.</p>\r\n\r\n<p><em>CORAPE</em></p>\r\n', 'david@corape.org.ec', 'contacto@corape.org.ec', 'corape@corape.org.ec', 'CORAPE', 'es', 197, 2, NULL, 'admin', 'dmuenala', '2019-01-15 18:15:25', '2019-07-01 16:25:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_formulario_contacto`
--

CREATE TABLE `x_formulario_contacto` (
  `formulario_contacto_id` decimal(10,0) NOT NULL,
  `formulario_contacto_nombre` varchar(250) DEFAULT NULL,
  `formulario_contacto_telefono` varchar(50) DEFAULT NULL,
  `formulario_contacto_movil` varchar(50) DEFAULT NULL,
  `formulario_contacto_email` varchar(50) DEFAULT NULL,
  `formulario_contacto_ciudad` varchar(50) DEFAULT NULL,
  `formulario_contacto_empresa` varchar(50) DEFAULT NULL,
  `formulario_contacto_asunto` varchar(200) DEFAULT NULL,
  `formulario_contacto_mensaje` text,
  `formulario_contacto_fecha_creacion` datetime DEFAULT NULL,
  `formulario_contacto_fecha_actualizacion` datetime DEFAULT NULL,
  `formulario_contacto_usuario_crea` varchar(20) DEFAULT NULL,
  `formulario_contacto_usuario_actualiza` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_formulario_contacto`
--

INSERT INTO `x_formulario_contacto` (`formulario_contacto_id`, `formulario_contacto_nombre`, `formulario_contacto_telefono`, `formulario_contacto_movil`, `formulario_contacto_email`, `formulario_contacto_ciudad`, `formulario_contacto_empresa`, `formulario_contacto_asunto`, `formulario_contacto_mensaje`, `formulario_contacto_fecha_creacion`, `formulario_contacto_fecha_actualizacion`, `formulario_contacto_usuario_crea`, `formulario_contacto_usuario_actualiza`) VALUES
(1, 'David Muenala', '062690826', NULL, 'david@corape.org.ec', 'Otavalo', NULL, 'Consulta', 'Consulta sobre manuales para subir información', '2019-06-27 12:42:19', NULL, 'guess', NULL),
(2, 'Daniel Vera', '2596660', '0960077791', 'danielvera64@gmail.com', 'Quito', NULL, 'Hackaton Comecta Culturas', 'Buenas noches, \r\n\r\nLes escribo acerca del hackaton Conecta Culturas. Yo soy un desarrollador móvil de varios años de experiencia y tengo unas dudas acerca de las bases del concurso. Primero para poder subir aplicaciones a la tienda de aplicaciones de Apple para iPhones se necesita obligatoriamente de un programa llamado Xcode el cual es gratuito pero no es ni código abierto ni software libre. Va a ser esto un problema?. Segundo para poder tener aplicaciones en las tiendas de Apple y Android se debe pagar un valor anual. Este costo por quién va a ser cubierto? \r\n\r\nMuchas gracias espero que me puedan ayudar con estás dudas\r\n\r\nAtentamente,\r\nDaniel Vera', '2019-07-03 20:42:45', NULL, 'guess', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_formulario_cotizacion`
--

CREATE TABLE `x_formulario_cotizacion` (
  `formulario_cotizacion_id` decimal(10,0) NOT NULL,
  `formulario_cotizacion_nombre` varchar(250) DEFAULT NULL,
  `formulario_cotizacion_telefono` varchar(50) DEFAULT NULL,
  `formulario_cotizacion_movil` varchar(50) DEFAULT NULL,
  `formulario_cotizacion_email` varchar(50) DEFAULT NULL,
  `formulario_cotizacion_ciudad` varchar(50) DEFAULT NULL,
  `formulario_cotizacion_empresa` varchar(50) DEFAULT NULL,
  `formulario_cotizacion_asunto` varchar(200) DEFAULT NULL,
  `formulario_cotizacion_mensaje` text,
  `formulario_cotizacion_fecha_creacion` datetime DEFAULT NULL,
  `formulario_cotizacion_fecha_actualizacion` datetime DEFAULT NULL,
  `formulario_cotizacion_usuario_crea` varchar(20) DEFAULT NULL,
  `formulario_cotizacion_usuario_actualiza` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_formulario_reserva`
--

CREATE TABLE `x_formulario_reserva` (
  `formulario_reserva_id` decimal(10,0) NOT NULL,
  `formulario_reserva_nombre` varchar(250) DEFAULT NULL,
  `formulario_reserva_telefono` varchar(50) DEFAULT NULL,
  `formulario_reserva_movil` varchar(50) DEFAULT NULL,
  `formulario_reserva_email` varchar(50) DEFAULT NULL,
  `formulario_reserva_ciudad` varchar(50) DEFAULT NULL,
  `formulario_reserva_desde` date DEFAULT NULL,
  `formulario_reserva_hasta` date DEFAULT NULL,
  `formulario_reserva_adultos` int(3) DEFAULT NULL,
  `formulario_reserva_ninios` int(3) DEFAULT NULL,
  `formulario_reserva_fecha_creacion` datetime DEFAULT NULL,
  `formulario_reserva_fecha_actualizacion` datetime DEFAULT NULL,
  `formulario_reserva_usuario_crea` varchar(20) DEFAULT NULL,
  `formulario_reserva_usuario_actualiza` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_formulario_soporte`
--

CREATE TABLE `x_formulario_soporte` (
  `formulario_soporte_id` decimal(10,0) NOT NULL,
  `formulario_soporte_nombre` varchar(250) DEFAULT NULL,
  `formulario_soporte_telefono` varchar(50) DEFAULT NULL,
  `formulario_soporte_movil` varchar(50) DEFAULT NULL,
  `formulario_soporte_email` varchar(50) DEFAULT NULL,
  `formulario_soporte_ciudad` varchar(50) DEFAULT NULL,
  `formulario_soporte_empresa` varchar(50) DEFAULT NULL,
  `formulario_soporte_asunto` varchar(200) DEFAULT NULL,
  `formulario_soporte_mensaje` text,
  `formulario_soporte_fecha_creacion` datetime DEFAULT NULL,
  `formulario_soporte_fecha_actualizacion` datetime DEFAULT NULL,
  `formulario_soporte_usuario_crea` varchar(20) DEFAULT NULL,
  `formulario_soporte_usuario_actualiza` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_galeria`
--

CREATE TABLE `x_galeria` (
  `galeria_id` decimal(10,0) NOT NULL,
  `galeria_nombre` varchar(100) DEFAULT NULL,
  `galeria_descripcion` text,
  `galeria_url` varchar(250) DEFAULT NULL,
  `galeria_habilitado` varchar(5) DEFAULT NULL,
  `galeria_orden` int(11) DEFAULT NULL,
  `galeria_visitas` decimal(10,0) DEFAULT NULL,
  `galeria_lenguaje` varchar(5) DEFAULT NULL,
  `galeria_categoria_id` decimal(10,0) DEFAULT NULL,
  `galeria_usuario_crea` varchar(20) DEFAULT NULL,
  `galeria_usuario_actualiza` varchar(20) DEFAULT NULL,
  `galeria_fecha_creacion` datetime DEFAULT NULL,
  `galeria_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_galeria_categoria`
--

CREATE TABLE `x_galeria_categoria` (
  `galeria_categoria_id` decimal(10,0) NOT NULL,
  `galeria_categoria_nombre` varchar(100) DEFAULT NULL,
  `galeria_categoria_alias` varchar(250) DEFAULT NULL,
  `galeria_categoria_nombre_mostrar` varchar(5) DEFAULT NULL,
  `galeria_categoria_descripcion` text,
  `galeria_categoria_habilitado` varchar(5) DEFAULT NULL,
  `galeria_categoria_lenguaje` varchar(5) DEFAULT NULL,
  `galeria_categoria_usuario_crea` varchar(20) DEFAULT NULL,
  `galeria_categoria_usuario_actualiza` varchar(20) DEFAULT NULL,
  `galeria_categoria_fecha_creacion` datetime DEFAULT NULL,
  `galeria_categoria_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_grupo_codigos`
--

CREATE TABLE `x_grupo_codigos` (
  `grupo_id` decimal(10,0) NOT NULL,
  `grupo_descripcion` varchar(50) DEFAULT NULL,
  `grupo_alias` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_grupo_codigos`
--

INSERT INTO `x_grupo_codigos` (`grupo_id`, `grupo_descripcion`, `grupo_alias`) VALUES
(1, 'SINO', 'tabla_sino'),
(2, 'LENGUAJES', 'tabla_lenguaje'),
(3, 'MONEDA', 'tabla_moneda'),
(4, 'PAISES', 'tabla_pais'),
(5, 'TIPO DE PERSONERÍA JURÍDICA', 'tabla_personeria'),
(6, 'DOCUMENTO DE IDENTIFICACIÓN', 'tabla_identificacion'),
(7, 'Unidades Productos', 'tabla_unidades'),
(8, 'Estado de pedido', 'tabla_estado_pedido'),
(9, 'Estado de Entrega', 'tabla_estado_entrega'),
(10, 'Tipo Documento', 'tabla_tipo_documento'),
(13, 'Licencias', 'tabla_licencia'),
(14, 'Temas', 'tabla_nacionalidad-1565710496'),
(15, 'Series', 'tabla_formato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_grupo_usuario`
--

CREATE TABLE `x_grupo_usuario` (
  `grupo_usuario_id` int(11) NOT NULL,
  `grupo_usuario_descripcion` varchar(50) DEFAULT NULL,
  `grupo_usuario_observacion` varchar(50) DEFAULT NULL,
  `grupo_usuario_usuario_crea` varchar(20) DEFAULT NULL,
  `grupo_usuario_usuario_actualiza` varchar(20) DEFAULT NULL,
  `grupo_usuario_fecha_creacion` datetime DEFAULT NULL,
  `grupo_usuario_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_grupo_usuario`
--

INSERT INTO `x_grupo_usuario` (`grupo_usuario_id`, `grupo_usuario_descripcion`, `grupo_usuario_observacion`, `grupo_usuario_usuario_crea`, `grupo_usuario_usuario_actualiza`, `grupo_usuario_fecha_creacion`, `grupo_usuario_fecha_actualizacion`) VALUES
(1, 'Super Administradores', 'Super Administradores del sistema', 'admin', 'admin', '2014-07-30 10:00:00', '2015-01-22 21:57:24'),
(2, 'Administradores de Aplicación', 'Acceso a administración con permisos especiales', 'admin', 'admin', '2014-07-30 10:00:00', '2015-01-22 21:57:39'),
(3, 'Usuarios Web Clientes', 'Usuarios del Portal Web', 'admin', 'admin', '2016-11-07 18:14:16', '2016-11-22 11:14:59'),
(4, 'Colaborador', 'Usuario colaborador', 'rocio', 'rocio', '2019-01-16 10:59:30', '2019-01-23 09:30:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_mapa`
--

CREATE TABLE `x_mapa` (
  `mapa_id` decimal(10,0) NOT NULL,
  `mapa_nombre` varchar(200) DEFAULT NULL,
  `mapa_alias` varchar(250) DEFAULT NULL,
  `mapa_habilitado` varchar(5) DEFAULT NULL,
  `mapa_lenguaje` varchar(5) DEFAULT NULL,
  `mapa_latitud` varchar(50) DEFAULT NULL,
  `mapa_longitud` varchar(50) DEFAULT NULL,
  `mapa_zoom` int(4) DEFAULT NULL,
  `mapa_nombre_mostrar` varchar(5) DEFAULT NULL,
  `mapa_ancho` varchar(10) DEFAULT NULL,
  `mapa_alto` varchar(10) DEFAULT NULL,
  `mapa_icono` varchar(250) DEFAULT NULL,
  `mapa_usuario_crea` varchar(20) DEFAULT NULL,
  `mapa_usuario_actualiza` varchar(20) DEFAULT NULL,
  `mapa_fecha_creacion` datetime DEFAULT NULL,
  `mapa_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_marca`
--

CREATE TABLE `x_marca` (
  `marca_id` decimal(10,0) NOT NULL,
  `marca_nombre` varchar(50) DEFAULT NULL,
  `marca_alias` varchar(250) DEFAULT NULL,
  `marca_nombre_mostrar` varchar(5) DEFAULT NULL,
  `marca_descripcion` text,
  `marca_habilitado` varchar(5) DEFAULT NULL,
  `marca_imagen` varchar(50) DEFAULT NULL,
  `marca_lenguaje` varchar(5) DEFAULT NULL,
  `marca_usuario_crea` varchar(20) DEFAULT NULL,
  `marca_usuario_actualiza` varchar(20) DEFAULT NULL,
  `marca_fecha_creacion` datetime DEFAULT NULL,
  `marca_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_menu`
--

CREATE TABLE `x_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_nombre` varchar(200) DEFAULT NULL,
  `menu_url` varchar(250) DEFAULT NULL,
  `menu_posicion` varchar(30) DEFAULT NULL,
  `menu_publicado` varchar(5) DEFAULT NULL,
  `menu_lenguaje` varchar(5) DEFAULT NULL,
  `menu_orden` int(11) DEFAULT NULL,
  `menu_padre_id` int(11) DEFAULT NULL,
  `menu_alias` varchar(250) DEFAULT NULL,
  `menu_target` varchar(30) DEFAULT NULL,
  `menu_usuario_crea` varchar(20) DEFAULT NULL,
  `menu_usuario_actualiza` varchar(20) DEFAULT NULL,
  `menu_fecha_creacion` datetime DEFAULT NULL,
  `menu_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_menu`
--

INSERT INTO `x_menu` (`menu_id`, `menu_nombre`, `menu_url`, `menu_posicion`, `menu_publicado`, `menu_lenguaje`, `menu_orden`, `menu_padre_id`, `menu_alias`, `menu_target`, `menu_usuario_crea`, `menu_usuario_actualiza`, `menu_fecha_creacion`, `menu_fecha_actualizacion`) VALUES
(1, 'Inicio', 'inicio', 'xs_navbar', '1', 'es', 1, NULL, 'inicio', NULL, 'admin', NULL, '2019-01-14 13:54:40', NULL),
(2, 'Presentación', 'contenido/item/presentacion', 'xs_navbar', '1', 'es', 2, NULL, 'presentacion', NULL, 'admin', 'admin', '2019-01-14 13:55:20', '2019-07-01 16:00:44'),
(3, 'Centro de Documentación', 'contenido/item/centro-de-documentacion', 'xs_navbar', '1', 'es', 3, NULL, 'centro-de-documentacion', NULL, 'admin', NULL, '2019-01-14 13:56:01', NULL),
(4, 'Multimedia', 'documento/categoria/multimedia', 'xs_navbar', '1', 'es', 4, NULL, 'multimedia', NULL, 'admin', 'admin', '2019-01-14 13:56:27', '2019-01-14 17:41:36'),
(5, 'Biblioteca', 'documento/categoria/biblioteca', 'xs_navbar', '1', 'es', 5, NULL, 'biblioteca', NULL, 'admin', 'admin', '2019-01-14 13:57:36', '2019-01-14 17:41:48'),
(6, 'Otros Repositorios', 'documento/categoria/otros-repositorios', 'xs_navbar', '1', 'es', 6, NULL, 'otros-repositorios', NULL, 'admin', 'admin', '2019-01-14 13:58:04', '2019-01-14 17:42:03'),
(7, 'Hackatón', 'contenido/item/hackaton', 'xs_navbar', '1', 'es', 7, NULL, 'hackaton', NULL, 'dmuenala', 'dmuenala', '2019-06-20 10:29:41', '2019-06-20 10:30:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_menu_seccion`
--

CREATE TABLE `x_menu_seccion` (
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `seccion_id` decimal(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_menu_seccion`
--

INSERT INTO `x_menu_seccion` (`menu_id`, `seccion_id`) VALUES
(1, 9),
(2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_modulo`
--

CREATE TABLE `x_modulo` (
  `modulo_id` varchar(30) NOT NULL,
  `modulo_descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_modulo`
--

INSERT INTO `x_modulo` (`modulo_id`, `modulo_descripcion`) VALUES
('mod_ciudad', 'Administración de Ciudades'),
('mod_codigos', 'Códigos'),
('mod_contenido', 'Artículos de Contenidos'),
('mod_contenido_categoria', 'Categorías de Contenidos'),
('mod_documento', 'Administracion de Documentos'),
('mod_documento_categoria', 'Categoria de Documentos'),
('mod_epago', 'Carrito de Compras'),
('mod_file', 'Administrador de Archivos'),
('mod_forma_pago', 'Formas de Pago'),
('mod_formulario', 'Formularios Ruteados'),
('mod_formulario_contacto', 'Lista de contactos'),
('mod_formulario_cotizacion', 'Solicitudes de Cotización'),
('mod_galeria', 'Administración de Galería de Fotos'),
('mod_galeria_categoria', 'Categoría de Galería de Fotos'),
('mod_grupo_codigos', 'Adm. de Grupo de códigos'),
('mod_grupo_usuario', 'Grupos de usuarios'),
('mod_mapa', 'Mapas de Google'),
('mod_marca', 'Administración de Marcas de Productos'),
('mod_menu', 'Administración de Menús'),
('mod_modulo', 'Administración de módulos'),
('mod_noticia', 'Noticias'),
('mod_noticia_tag', 'Tags de Noticias'),
('mod_parametros', 'Parametros generales del sistema'),
('mod_permiso_grupo', 'Administración de permisos de grupo'),
('mod_permiso_usuario', 'Administración de permisos de usuario'),
('mod_peso_envio', 'Peso de Envío'),
('mod_portafolio', 'Portafolio'),
('mod_portafolio_categoria', 'Categoría de Portafolios'),
('mod_producto', 'Productos'),
('mod_producto_categoria', 'Categoría de Productos'),
('mod_provincia', 'Provincias'),
('mod_punto', 'Puntos de Google Maps'),
('mod_punto_categoria', 'Categoría de Puntos Mapa'),
('mod_seccion', 'Secciones del sitio web'),
('mod_slideshow', 'Slideshow'),
('mod_slideshow_categoria', 'Categorías de Slideshow'),
('mod_usuario', 'Administración de Usuarios'),
('mod_zona_envio', 'Zonas de Envío');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_noticia`
--

CREATE TABLE `x_noticia` (
  `noticia_id` decimal(10,0) NOT NULL,
  `noticia_titulo` varchar(250) DEFAULT NULL,
  `noticia_alias` varchar(250) DEFAULT NULL,
  `noticia_titulo_h` varchar(5) DEFAULT NULL,
  `noticia_detalle` text,
  `noticia_lenguaje` varchar(5) DEFAULT NULL,
  `noticia_publicado` varchar(5) DEFAULT NULL,
  `noticia_visitas` int(11) DEFAULT NULL,
  `noticia_fecha_creacion` datetime DEFAULT NULL,
  `noticia_fecha_actualizacion` datetime DEFAULT NULL,
  `noticia_usuario_crea` varchar(20) DEFAULT NULL,
  `noticia_usuario_actualiza` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_noticia_tag`
--

CREATE TABLE `x_noticia_tag` (
  `noticia_tag_id` decimal(10,0) NOT NULL,
  `noticia_tag_nombre` varchar(250) DEFAULT NULL,
  `noticia_tag_alias` varchar(250) DEFAULT NULL,
  `noticia_tag_nombre_mostrar` varchar(5) DEFAULT NULL,
  `noticia_tag_bgcolor` varchar(30) DEFAULT NULL,
  `noticia_tag_nombre_color` varchar(30) DEFAULT NULL,
  `noticia_tag_lenguaje` varchar(5) DEFAULT NULL,
  `noticia_tag_publicado` varchar(5) DEFAULT NULL,
  `noticia_tag_usuario_crea` varchar(20) DEFAULT NULL,
  `noticia_tag_usuario_actualiza` varchar(20) DEFAULT NULL,
  `noticia_tag_fecha_creacion` datetime DEFAULT NULL,
  `noticia_tag_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_noticia_tag_noticia`
--

CREATE TABLE `x_noticia_tag_noticia` (
  `noticia_tag_id` decimal(10,0) NOT NULL,
  `noticia_id` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_parametros`
--

CREATE TABLE `x_parametros` (
  `parametros_id` varchar(40) NOT NULL,
  `parametros_detalle` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_parametros`
--

INSERT INTO `x_parametros` (`parametros_id`, `parametros_detalle`) VALUES
('mod_contenido', '{\"contenido_fecha_creacion_mostrar\":\"2\",\"contenido_fecha_actualizacion_mostrar\":\"2\",\"contenido_usuario_crea_mostrar\":\"2\",\"contenido_usuario_actualiza_mostrar\":\"2\",\"contenido_categoria_mostrar\":\"2\",\"contenido_palabras_introduccion\":\"10\"}'),
('mod_epago', '{\"epago_imagen_dir\":\"_epago\",\"epago_carrito_activo\":\"1\",\"epago_carrito_invitado\":\"1\",\"epago_iva_modo\":\"2\",\"epago_iva\":\"12\",\"epago_carrito_url_seguir_comprando\":\".\\/producto\",\"epago_carrito_moneda\":\"USD\",\"epago_stock_activo\":\"2\",\"epago_forma_pago\":\"2\",\"epago_envio\":\"2\",\"epago_envio_peso\":\"1\",\"epago_envio_zona\":\"1\",\"epago_descuento_activo\":\"1\",\"epago_descuento_tipo\":\"1\",\"epago_descuento_longitud\":\"4\"}'),
('mod_galeria', '{\"galeria_imagen_dir\":\"_galeria\"}'),
('mod_mapa', '{\"mapa_key\":\"AIzaSyB-5ShPLlvhVGC4QL7j543hKkaHS2Xg9nU\",\"mapa_icon\":\"media\\/pictures\\/web\\/mapa\\/map_marker_yellow.png\"}'),
('mod_noticia', '{\"noticia_fecha_creacion_mostrar\":\"1\",\"noticia_fecha_actualizacion_mostrar\":\"2\",\"noticia_usuario_crea_mostrar\":\"2\",\"noticia_usuario_actualiza_mostrar\":\"2\",\"noticia_categoria_mostrar\":\"2\",\"noticia_palabras_introduccion\":\"20\",\"noticia_palabras_mas_introduccion\":\"0\",\"noticia_palabras_carousel_introduccion\":\"0\"}'),
('mod_portafolio', '{\"portafolio_imagen_dir\":\"_portafolio\"}'),
('mod_producto', '{\"producto_imagen_dir\":\"_producto\",\"producto_mostrar_descarga\":\"2\",\"producto_mostrar_categoria_raiz\":\"1\",\"producto_mostrar_categoria\":\"1\",\"producto_mostrar_buscador\":\"2\",\"producto_mostrar_marca\":\"1\",\"producto_mostrar_codigo\":\"2\",\"producto_mostrar_boton_carrito\":\"1\",\"producto_mostrar_formulario_solicitalo\":\"2\",\"producto_palabras_introduccion\":\"0\",\"producto_mostrar_precios\":\"2\",\"producto_moneda\":\"USD\",\"producto_mostrar_paginador\":\"2\",\"producto_buscar_categorias\":\"1\",\"producto_buscar_marcas\":\"2\",\"producto_buscar_nombre\":\"1\",\"producto_buscar_codigo\":\"1\",\"producto_ordenar_por\":\"producto_id\",\"producto_orden\":\"asc\",\"producto_mostrar_unidad\":\"2\",\"producto_mostrar_peso\":\"2\"}'),
('mod_servicio', '{\"servicio_imagen_dir\":\"_servicios\"}'),
('mod_usuario', '{\"usuario_mail_enviar\":\"1\",\"usuario_mail_metodo\":\"smtp\",\"usuario_mail_smpt_seguridad\":\"\",\"usuario_mail_smpt_servidor\":\"mail.minayon.com\",\"usuario_mail_smpt_puerto\":\"26\",\"usuario_mail_smpt_usuario\":\"webmaster@minayon.com\",\"usuario_mail_smpt_clave\":\"webmasternayon01\",\"usuario_mail_admin_remitente_email\":\"webmaster@minayon.com\",\"usuario_mail_admin_remitente_nombre\":\"XpertoSolutions\",\"usuario_mail_admin_destinatario_email\":\"informacion@xpertosolutions.com\",\"usuario_usuario_grupo\":\"3\",\"usuario_mail_usuario_titulo\":\"Detalles del registro de usuario\",\"usuario_mail_usuario_cuerpo\":\"<p>Bienvenido(a) a {x_app_name}, para completar el registro por favor haga clic en el siguiente link:<\\/p>\\r\\n\\r\\n<p>{usuario_confirmacion_link}<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><strong>Detalles de su cuenta:<\\/strong><\\/p>\\r\\n\\r\\n<p>{xperto_data}<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><b>MINAYON.COM<\\/b><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\",\"usuario_mail_admin_titulo\":\"Nuevo registro de usuario \",\"usuario_mail_admin_cuerpo\":\"<p>Estimado(a) administrador(a), usted ha recibido un nuevo email de registro con los siguientes datos:<\\/p>\\r\\n\\r\\n<p><strong>Detalles de usuario:<\\/strong><\\/p>\\r\\n\\r\\n<p>{xperto_data}<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><b>MINAYON.COM<\\/b><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\",\"usuario_empresa_nombre\":\"Construcoociv Cia. Ltda.\",\"usuario_empresa_email\":\"\",\"usuario_empresa_direccion\":\"\",\"usuario_empresa_telefono\":\"\",\"usuario_empresa_movil\":\"\",\"usuario_empresa_ruc\":\"\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_permiso_grupo`
--

CREATE TABLE `x_permiso_grupo` (
  `modulo_id` varchar(30) DEFAULT NULL,
  `grupo_usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_permiso_grupo`
--

INSERT INTO `x_permiso_grupo` (`modulo_id`, `grupo_usuario_id`) VALUES
('mod_ciudad', 1),
('mod_codigos', 1),
('mod_contenido', 1),
('mod_contenido_categoria', 1),
('mod_documento', 1),
('mod_documento_categoria', 1),
('mod_file', 1),
('mod_formulario', 1),
('mod_formulario_contacto', 1),
('mod_formulario_cotizacion', 1),
('mod_galeria', 1),
('mod_galeria_categoria', 1),
('mod_grupo_codigos', 1),
('mod_grupo_usuario', 1),
('mod_mapa', 1),
('mod_menu', 1),
('mod_modulo', 1),
('mod_noticia', 1),
('mod_noticia_tag', 1),
('mod_parametros', 1),
('mod_permiso_grupo', 1),
('mod_permiso_usuario', 1),
('mod_portafolio', 1),
('mod_portafolio_categoria', 1),
('mod_punto', 1),
('mod_punto_categoria', 1),
('mod_seccion', 1),
('mod_slideshow', 1),
('mod_slideshow_categoria', 1),
('mod_usuario', 1),
('mod_ciudad', 2),
('mod_codigos', 2),
('mod_contenido', 2),
('mod_contenido_categoria', 2),
('mod_documento', 2),
('mod_documento_categoria', 2),
('mod_file', 2),
('mod_formulario', 2),
('mod_formulario_contacto', 2),
('mod_galeria', 2),
('mod_galeria_categoria', 2),
('mod_grupo_codigos', 2),
('mod_grupo_usuario', 2),
('mod_mapa', 2),
('mod_menu', 2),
('mod_modulo', 2),
('mod_noticia', 2),
('mod_noticia_tag', 2),
('mod_parametros', 2),
('mod_permiso_grupo', 2),
('mod_permiso_usuario', 2),
('mod_peso_envio', 2),
('mod_portafolio', 2),
('mod_portafolio_categoria', 2),
('mod_punto', 2),
('mod_punto_categoria', 2),
('mod_seccion', 2),
('mod_slideshow', 2),
('mod_slideshow_categoria', 2),
('mod_usuario', 2),
('mod_zona_envio', 2),
('mod_documento', 3),
('mod_documento', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_peso_envio`
--

CREATE TABLE `x_peso_envio` (
  `peso_envio_id` decimal(10,0) NOT NULL,
  `peso_envio_desde` decimal(10,2) DEFAULT NULL,
  `peso_envio_hasta` decimal(10,2) DEFAULT NULL,
  `peso_envio_precio` decimal(10,2) DEFAULT NULL,
  `peso_envio_lenguaje` varchar(5) DEFAULT NULL,
  `peso_envio_publicado` varchar(5) DEFAULT NULL,
  `peso_envio_usuario_crea` varchar(20) DEFAULT NULL,
  `peso_envio_usuario_actualiza` varchar(20) DEFAULT NULL,
  `peso_envio_fecha_creacion` datetime DEFAULT NULL,
  `peso_envio_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_portafolio`
--

CREATE TABLE `x_portafolio` (
  `portafolio_id` decimal(10,0) NOT NULL,
  `portafolio_nombre` varchar(100) DEFAULT NULL,
  `portafolio_alias` varchar(250) DEFAULT NULL,
  `portafolio_descripcion` text,
  `portafolio_habilitado` varchar(5) DEFAULT NULL,
  `portafolio_imagenes` text,
  `portafolio_categoria_id` decimal(10,0) DEFAULT NULL,
  `portafolio_lenguaje` varchar(5) DEFAULT NULL,
  `portafolio_destacado` varchar(5) DEFAULT NULL,
  `portafolio_visitas` int(11) DEFAULT NULL,
  `portafolio_usuario_crea` varchar(20) DEFAULT NULL,
  `portafolio_usuario_actualiza` varchar(20) DEFAULT NULL,
  `portafolio_fecha_creacion` datetime DEFAULT NULL,
  `portafolio_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_portafolio_categoria`
--

CREATE TABLE `x_portafolio_categoria` (
  `portafolio_categoria_id` decimal(10,0) NOT NULL,
  `portafolio_categoria_nombre` varchar(100) DEFAULT NULL,
  `portafolio_categoria_alias` varchar(250) DEFAULT NULL,
  `portafolio_categoria_descripcion` text,
  `portafolio_categoria_habilitado` varchar(5) DEFAULT NULL,
  `portafolio_categoria_lenguaje` varchar(5) DEFAULT NULL,
  `portafolio_categoria_usuario_crea` varchar(20) DEFAULT NULL,
  `portafolio_categoria_usuario_actualiza` varchar(20) DEFAULT NULL,
  `portafolio_categoria_fecha_creacion` datetime DEFAULT NULL,
  `portafolio_categoria_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_producto`
--

CREATE TABLE `x_producto` (
  `producto_id` decimal(10,0) NOT NULL,
  `producto_codigo` varchar(50) DEFAULT NULL,
  `producto_nombre` varchar(100) DEFAULT NULL,
  `producto_alias` varchar(250) DEFAULT NULL,
  `producto_descripcion` text,
  `producto_caracteristicas` text,
  `producto_habilitado` varchar(5) DEFAULT NULL,
  `producto_imagenes` text,
  `marca_id` decimal(10,0) DEFAULT NULL,
  `producto_categoria_id` decimal(10,0) DEFAULT NULL,
  `producto_lenguaje` varchar(5) DEFAULT NULL,
  `producto_destacado` varchar(5) DEFAULT NULL,
  `producto_promocion` varchar(5) DEFAULT NULL,
  `producto_visitas` int(11) DEFAULT NULL,
  `producto_orden` int(11) DEFAULT NULL,
  `producto_url` varchar(250) DEFAULT NULL,
  `producto_precio_normal` decimal(10,2) DEFAULT NULL,
  `producto_precio_viejo` decimal(10,2) DEFAULT NULL,
  `producto_existencia` int(11) DEFAULT '0',
  `producto_unidad` varchar(5) DEFAULT NULL,
  `producto_peso` decimal(10,2) DEFAULT NULL,
  `producto_usuario_crea` varchar(20) DEFAULT NULL,
  `producto_usuario_actualiza` varchar(20) DEFAULT NULL,
  `producto_fecha_creacion` datetime DEFAULT NULL,
  `producto_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_producto_categoria`
--

CREATE TABLE `x_producto_categoria` (
  `producto_categoria_id` decimal(10,0) NOT NULL,
  `producto_categoria_nombre` varchar(100) DEFAULT NULL,
  `producto_categoria_alias` varchar(250) DEFAULT NULL,
  `producto_categoria_nombre_mostrar` varchar(5) DEFAULT NULL,
  `producto_categoria_descripcion` text,
  `producto_categoria_habilitado` varchar(5) DEFAULT NULL,
  `producto_categoria_padre_id` decimal(10,0) DEFAULT NULL,
  `producto_categoria_lenguaje` varchar(5) DEFAULT NULL,
  `producto_categoria_orden` int(11) DEFAULT NULL,
  `producto_categoria_usuario_crea` varchar(20) DEFAULT NULL,
  `producto_categoria_usuario_actualiza` varchar(20) DEFAULT NULL,
  `producto_categoria_fecha_creacion` datetime DEFAULT NULL,
  `producto_categoria_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_provincia`
--

CREATE TABLE `x_provincia` (
  `provincia_id` decimal(10,0) NOT NULL,
  `provincia_nombre` varchar(50) DEFAULT NULL,
  `provincia_codigo` decimal(4,0) DEFAULT NULL,
  `provincia_usuario_crea` varchar(20) DEFAULT NULL,
  `provincia_usuario_actualiza` varchar(20) DEFAULT NULL,
  `provincia_fecha_creacion` datetime DEFAULT NULL,
  `provincia_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_provincia`
--

INSERT INTO `x_provincia` (`provincia_id`, `provincia_nombre`, `provincia_codigo`, `provincia_usuario_crea`, `provincia_usuario_actualiza`, `provincia_fecha_creacion`, `provincia_fecha_actualizacion`) VALUES
(1, 'Azuay', 1, 'admin', NULL, '2015-08-03 12:24:39', NULL),
(2, 'Bolivar', 2, 'admin', NULL, '2015-08-03 12:24:57', NULL),
(3, 'Cañar', 3, 'admin', NULL, '2015-08-03 12:30:23', NULL),
(4, 'Carchi', 4, 'admin', NULL, '2015-08-03 12:30:45', NULL),
(5, 'Cotopaxi', 5, 'admin', NULL, '2015-08-03 12:31:33', NULL),
(6, 'Chimbozaro', 6, 'admin', NULL, '2015-08-03 12:32:23', NULL),
(7, 'El Oro', 7, 'admin', NULL, '2015-08-03 12:32:39', NULL),
(8, 'Esmeraldas', 8, 'admin', NULL, '2015-08-03 12:32:48', NULL),
(9, 'Guayas', 9, 'admin', NULL, '2015-08-03 12:33:03', NULL),
(10, 'Imbabura', 10, 'admin', NULL, '2015-08-03 12:33:21', NULL),
(11, 'Loja', 11, 'admin', NULL, '2015-08-03 12:33:36', NULL),
(12, 'Los Rios', 12, 'admin', NULL, '2015-08-03 12:33:41', NULL),
(13, 'Manabí', 13, 'admin', NULL, '2015-08-03 12:34:02', NULL),
(14, 'Morona Santiago', 14, 'admin', NULL, '2015-08-03 12:34:19', NULL),
(15, 'Napo', 15, 'admin', NULL, '2015-08-03 12:34:31', NULL),
(16, 'Pastaza', 16, 'admin', NULL, '2015-08-03 12:34:43', NULL),
(17, 'Pichincha', 17, 'admin', NULL, '2015-08-03 12:35:06', NULL),
(18, 'Tungurahua', 18, 'admin', NULL, '2015-08-03 12:35:17', NULL),
(19, 'Zamora Chinchipe', 19, 'admin', NULL, '2015-08-03 12:35:36', NULL),
(20, 'Galapagos', 20, 'admin', NULL, '2015-08-03 12:36:09', NULL),
(21, 'Sucumbios', 21, 'admin', NULL, '2015-08-03 12:36:14', NULL),
(22, 'Orellana', 22, 'admin', NULL, '2015-08-03 12:37:11', NULL),
(23, 'Santo Domingo de los Tsáchilas', 23, 'admin', NULL, '2015-08-03 12:37:34', NULL),
(24, 'Santa Elena', 24, 'admin', NULL, '2015-08-03 12:37:57', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_punto`
--

CREATE TABLE `x_punto` (
  `punto_id` decimal(10,0) NOT NULL,
  `punto_nombre` varchar(200) DEFAULT NULL,
  `punto_alias` varchar(250) DEFAULT NULL,
  `punto_descripcion` text,
  `punto_habilitado` varchar(5) DEFAULT NULL,
  `punto_lenguaje` varchar(5) DEFAULT NULL,
  `punto_latitud` varchar(50) DEFAULT NULL,
  `punto_longitud` varchar(50) DEFAULT NULL,
  `punto_zoom` int(4) DEFAULT NULL,
  `punto_categoria_id` decimal(10,0) DEFAULT NULL,
  `punto_usuario_crea` varchar(20) DEFAULT NULL,
  `punto_usuario_actualiza` varchar(20) DEFAULT NULL,
  `punto_fecha_creacion` datetime DEFAULT NULL,
  `punto_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_punto_categoria`
--

CREATE TABLE `x_punto_categoria` (
  `punto_categoria_id` decimal(10,0) NOT NULL,
  `punto_categoria_nombre` varchar(200) DEFAULT NULL,
  `punto_categoria_alias` varchar(250) DEFAULT NULL,
  `punto_categoria_descripcion` text,
  `punto_categoria_habilitado` varchar(5) DEFAULT NULL,
  `punto_categoria_lenguaje` varchar(5) DEFAULT NULL,
  `punto_categoria_orden` int(11) DEFAULT NULL,
  `punto_categoria_usuario_crea` varchar(20) DEFAULT NULL,
  `punto_categoria_usuario_actualiza` varchar(20) DEFAULT NULL,
  `punto_categoria_fecha_creacion` datetime DEFAULT NULL,
  `punto_categoria_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_punto_mapa`
--

CREATE TABLE `x_punto_mapa` (
  `mapa_id` decimal(10,0) NOT NULL DEFAULT '0',
  `punto_id` decimal(10,0) NOT NULL DEFAULT '0',
  `punto_mapa_orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_seccion`
--

CREATE TABLE `x_seccion` (
  `seccion_id` decimal(10,0) NOT NULL,
  `seccion_titulo` varchar(250) DEFAULT NULL,
  `seccion_titulo_h` varchar(5) DEFAULT NULL,
  `seccion_detalle` text,
  `seccion_lenguaje` varchar(5) DEFAULT NULL,
  `seccion_publicado` varchar(5) DEFAULT NULL,
  `seccion_fecha_publicacion` date DEFAULT NULL,
  `seccion_usuario` varchar(20) DEFAULT NULL,
  `seccion_posicion` varchar(30) DEFAULT NULL,
  `seccion_orden` int(11) DEFAULT NULL,
  `seccion_moduloapp` varchar(30) DEFAULT NULL,
  `seccion_accionapp` varchar(50) DEFAULT NULL,
  `seccion_menu_todos` varchar(5) DEFAULT NULL,
  `seccion_grupo_usuario_todos` varchar(5) DEFAULT NULL,
  `seccion_solo_registrados` varchar(5) DEFAULT NULL,
  `seccion_usuario_crea` varchar(20) DEFAULT NULL,
  `seccion_usuario_actualiza` varchar(20) DEFAULT NULL,
  `seccion_fecha_creacion` datetime DEFAULT NULL,
  `seccion_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_seccion`
--

INSERT INTO `x_seccion` (`seccion_id`, `seccion_titulo`, `seccion_titulo_h`, `seccion_detalle`, `seccion_lenguaje`, `seccion_publicado`, `seccion_fecha_publicacion`, `seccion_usuario`, `seccion_posicion`, `seccion_orden`, `seccion_moduloapp`, `seccion_accionapp`, `seccion_menu_todos`, `seccion_grupo_usuario_todos`, `seccion_solo_registrados`, `seccion_usuario_crea`, `seccion_usuario_actualiza`, `seccion_fecha_creacion`, `seccion_fecha_actualizacion`) VALUES
(1, 'Menú Principal', '2', '<p>menu_posicion=xs_navbar</p>\r\n', 'es', '1', '2019-01-14', 'admin', 'xs_navbar', 1, 'menu', 'show_navmenu', '1', '2', '2', 'admin', 'admin', '2019-01-14 13:45:39', '2019-01-14 13:47:10'),
(2, 'Logotipo', '2', '<p><a href=\"./inicio\"><img alt=\"\" class=\"margin_top_small\" src=\"media/pictures/web/inicio/xs_logo.png?xs=1234\" /></a></p>\r\n', 'es', '1', '2019-01-14', 'admin', 'xs_logo', 1, '', '', '1', '2', '2', 'admin', 'admin', '2019-01-14 13:46:37', '2019-01-28 18:18:24'),
(3, 'slogan', '2', '<div class=\"xs_resaltar cerrar\">\r\n<div class=\"xs_resaltar abrir\">\r\n<p class=\"xs_resaltar light fuente14 italic wow fadeInUp\" data-wow-delay=\"0.5s\" style=\"text-align: center;\">El Centro de Documentaci&oacute;n busca preservar, visibilizar y difundir&nbsp;las producciones acad&eacute;micas, audiovisuales, fotogr&aacute;ficas y orales de los Pueblos y Nacionalidades del Ecuador.</p>\r\n</div>\r\n</div>\r\n', 'es', '1', '2019-01-14', 'admin', 'xs_important4_bg', 1, '', '', '1', '2', '2', 'admin', 'corape', '2019-01-14 13:48:29', '2019-02-27 14:36:07'),
(4, 'logo footer', '2', '<p><img alt=\"\" src=\"media/pictures/web/inicio/xs_logo_blanco.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Con el apoyo de:</p>\r\n\r\n<p><img alt=\"\" src=\"media/pictures/web/slideshow/DWAcademy.jpg\" /></p>\r\n\r\n<p><img alt=\"\" src=\"media/pictures/web/slideshow/Apoyo1.jpg\" /></p>\r\n', 'es', '1', '2019-01-14', 'admin', 'xs_footer1', 1, '', '', '1', '2', '2', 'admin', 'corape', '2019-01-14 13:49:11', '2019-04-30 16:10:10'),
(5, 'Proyecto', '1', '<div class=\"wow fadeIn\" data-wow-delay=\"0.4s\">\r\n<ul class=\"arrow_list yellow\">\r\n	<li>El Proyecto</li>\r\n	<li><a class=\"xs_anima_forward\" href=\"./contenido/item/centro-de-documentacion\">Centro de capacitaci&oacute;n</a></li>\r\n	<li><a class=\"xs_anima_forward\" href=\"./contenido/item/derechos\">Derechos</a></li>\r\n</ul>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n', 'es', '1', '2019-01-14', 'admin', 'xs_footer2', 1, '', '', '1', '2', '2', 'admin', 'admin', '2019-01-14 13:51:00', '2019-07-01 17:00:57'),
(6, 'Repositorio', '1', '<div class=\"wow fadeIn\" data-wow-delay=\"0.4s\">\r\n<ul class=\"arrow_list yellow\">\r\n	<li><a class=\"xs_anima_forward\" href=\"./documento/categoria/multimedia\">Multimedia</a></li>\r\n	<li><a class=\"xs_anima_forward\" href=\"./documento/categoria/biblioteca\">Biblioteca</a></li>\r\n	<li><a class=\"xs_anima_forward\" href=\"./documento/categoria/otros-repositorios\">Otros repositorios</a></li>\r\n</ul>\r\n\r\n<p><a href=\"https://creativecommons.org/licenses/by-nc-nd/3.0/ec/\" target=\"_blank\"><img alt=\"\" src=\"media/pictures/web/centro_documento/cc-somerights.gif\" style=\"width: 88px; height: 31px;\" /></a></p>\r\n\r\n<p><small>El contenido del Centro de documentaci&oacute;n responde a esta licencia&nbsp; a no ser que en cada documento se indique lo contrario.</small></p>\r\n\r\n<p>Material de Acceso Libre</p>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'es', '1', '2019-01-14', 'admin', 'xs_footer3', 1, '', '', '1', '2', '2', 'admin', 'admin', '2019-01-14 13:52:21', '2019-04-03 10:56:45'),
(7, 'Contacto', '1', '<div class=\"wow fadeIn\" data-wow-delay=\"0.4s\">\r\n<ul class=\"unstyled_list\">\r\n	<li>Valladolid N24-59 y Madrid,&nbsp;</li>\r\n	<li>Quito &ndash; Ecuador</li>\r\n	<li>corape@corape.org.ec</li>\r\n	<li>(02) 2523 006 - (02) 2901 355</li>\r\n	<li>09 7494191</li>\r\n</ul>\r\n</div>\r\n\r\n<p><a class=\"button medium yellow\" href=\"./formulario/item/contacto\">ESCR&Iacute;BANOS</a></p>\r\n', 'es', '1', '2019-01-14', 'admin', 'xs_footer4', 1, '', '', '1', '2', '2', 'admin', 'dmuenala', '2019-01-14 13:53:06', '2019-07-01 16:33:24'),
(8, 'Links Superiores', '2', '<p style=\"text-align: right;\"><a href=\"/organizacion\" target=\"_blank\"><i aria-hidden=\"true\" class=\"fa fa-external-link\">&nbsp;</i> CORAPE ORGANIZACI&Oacute;N</a>&nbsp;&nbsp;&nbsp;<a href=\"/satelital\" target=\"_blank\"><i aria-hidden=\"true\" class=\"fa fa-external-link\">&nbsp;</i> CORAPE SATELITAL</a>&nbsp;&nbsp;&nbsp;<a href=\"./formulario/item/contacto\"><i aria-hidden=\"true\" class=\"fa fa-envelope\">&nbsp;</i> CONTACTO</a></p>\r\n', 'es', '1', '2019-01-14', 'admin', 'xs_top2', 1, '', '', '1', '2', '2', 'admin', 'admin', '2019-01-14 14:00:52', '2019-02-27 10:38:30'),
(9, 'Slide Inicio', '2', '<p>carousel_categoria=1&amp;carousel_cuantos=3&amp;carousel_titulo=true&amp;carousel_descripcion=true&amp;carousel_cuantos_mover=3&amp;carousel_cuantos_mostrar_1000=3&amp;carousel_cuantos_mostrar_600=2&amp;carousel_autoplay=true&amp;carousel_controls=true&amp;carousel_paginator=true&amp;carousel_loop=true</p>\r\n', 'es', '1', '2019-01-14', 'admin', 'xs_slide', NULL, 'slideshow', 'carousel_owl', '2', '2', '2', 'admin', 'admin', '2019-01-14 15:43:12', '2019-01-15 22:30:53'),
(10, 'Objetivos', '1', '<ul class=\"arrow_list orange\">\r\n	<li>Crear comunidades de ciberactivistas que incluyan las diferentes cosmovisiones de los pueblos originarios en los art&iacute;culos de Wikipedia que ya existen o creen algunos nuevo que sobre tem&aacute;ticas de su inter&eacute;s.</li>\r\n	<li>Generar investigaciones o documentos (imagen, videos, producciones de radio) que sirvan como respaldo para los art&iacute;culos que se modifiquen o creen en Wikipedia.</li>\r\n	<li>Fortalecer el trabajo de traducci&oacute;n de Wikipedia a idiomas originarios, o apoyando en la herramienta que la Fundaci&oacute;n est&aacute; desarrollando, o imaginando otras formas viables.</li>\r\n</ul>\r\n', 'es', '2', '2019-01-14', 'admin', 'xs_important3', NULL, '', '', '2', '2', '2', 'admin', 'dmuenala', '2019-01-14 16:36:46', '2019-07-01 15:39:51'),
(11, 'Buscador Repositorio', '2', '', 'es', '1', '2019-01-14', 'admin', 'xs_search', 1, 'buscador', 'repositorio', '1', '2', '2', 'admin', NULL, '2019-01-14 17:05:35', NULL),
(12, 'Logo Mobile', '2', '<p><a href=\"./inicio\"><img alt=\"\" src=\"media/pictures/web/inicio/xs_logo_mobile.png?xs=1234\" /></a></p>\r\n', 'es', '1', '2019-01-14', 'admin', 'xs_temporal_menu', 1, '', '', '1', '2', '2', 'admin', 'admin', '2019-01-14 19:22:42', '2019-02-18 10:51:53'),
(13, 'Logos Instituciones', '1', '<p>carousel_categoria=2&amp;carousel_titulo=false&amp;carousel_speed=2000&amp;carousel_pause=3000&amp;carousel_controls=false&amp;carousel_autoplay=true&amp;carousel_loop=true&amp;carousel_cuantos=8&amp;carousel_cuantos_mover=8&amp;carousel_paginator=false</p>\r\n', 'es', '1', '2019-03-13', 'corape', 'xs_important3', 3, 'slideshow', 'carousel', '1', '2', '2', 'corape', 'admin', '2019-03-13 16:47:02', '2019-07-01 15:58:01'),
(14, 'Logo Ampara Su', '1', '<p><img alt=\"Logo Ampara Su\" src=\"media/pictures/web/slideshow/logo-AmparuSU.jpg\" style=\"width: 887px; height: 887px;\" /></p>\r\n', 'es', '1', '2019-03-13', 'corape', 'xs_important3', NULL, 'slideshow', '', '2', '2', '2', 'corape', 'corape', '2019-03-13 17:16:43', '2019-03-13 17:21:48'),
(15, 'Dw Akademie', '1', '<p><img alt=\"\" src=\"media/pictures/web/logos/2LOGO-DW-TRANSPARENTE.png\" /></p>\r\n', 'es', '1', '2019-06-20', 'dmuenala', 'xs_important3', NULL, 'slideshow', NULL, '2', '2', '2', 'dmuenala', NULL, '2019-06-20 14:23:50', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_seccion_grupo_usuario`
--

CREATE TABLE `x_seccion_grupo_usuario` (
  `seccion_id` decimal(10,0) NOT NULL DEFAULT '0',
  `grupo_usuario_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_slideshow`
--

CREATE TABLE `x_slideshow` (
  `slideshow_id` decimal(10,0) NOT NULL,
  `slideshow_nombre` varchar(150) DEFAULT NULL,
  `slideshow_descripcion` text,
  `slideshow_url` varchar(250) DEFAULT NULL,
  `slideshow_link` varchar(250) DEFAULT NULL,
  `slideshow_link_target` varchar(30) DEFAULT NULL,
  `slideshow_bg_color` varchar(30) DEFAULT NULL,
  `slideshow_titulo_color` varchar(30) DEFAULT NULL,
  `slideshow_descripcion_color` varchar(30) DEFAULT NULL,
  `slideshow_orden` int(11) DEFAULT NULL,
  `slideshow_habilitado` varchar(5) DEFAULT NULL,
  `slideshow_lenguaje` varchar(5) DEFAULT NULL,
  `slideshow_categoria_id` decimal(10,0) DEFAULT NULL,
  `slideshow_usuario_crea` varchar(20) DEFAULT NULL,
  `slideshow_usuario_actualiza` varchar(20) DEFAULT NULL,
  `slideshow_fecha_creacion` datetime DEFAULT NULL,
  `slideshow_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_slideshow`
--

INSERT INTO `x_slideshow` (`slideshow_id`, `slideshow_nombre`, `slideshow_descripcion`, `slideshow_url`, `slideshow_link`, `slideshow_link_target`, `slideshow_bg_color`, `slideshow_titulo_color`, `slideshow_descripcion_color`, `slideshow_orden`, `slideshow_habilitado`, `slideshow_lenguaje`, `slideshow_categoria_id`, `slideshow_usuario_crea`, `slideshow_usuario_actualiza`, `slideshow_fecha_creacion`, `slideshow_fecha_actualizacion`) VALUES
(1, 'Multimedia', '<p><span style=\"font-size:18px;\"><span style=\"font-family:arial,helvetica,sans-serif;\"><em>Audios</em></span></span></p>\r\n\r\n<p><span style=\"font-size:18px;\"><span style=\"font-family:arial,helvetica,sans-serif;\"><em>Fotograf&iacute;a</em></span></span></p>\r\n\r\n<p><span style=\"font-size:18px;\"><span style=\"font-family:arial,helvetica,sans-serif;\"><em>Video</em></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n', 'media/pictures/GIF-MULTIMEDIA2.gif', './documento/categoria/multimedia', '', NULL, NULL, NULL, 1, '1', 'es', 1, 'admin', 'dmuenala', '2019-01-14 16:29:12', '2019-07-03 10:02:53'),
(2, 'Biblioteca', '<p><em>Pueblos y Nacionalidades</em></p>\r\n\r\n<p>&nbsp;</p>\r\n', 'media/pictures/GIF/GIF-BIBLIOTECA.gif', './documento/categoria/biblioteca', '', NULL, NULL, NULL, 2, '1', 'es', 1, 'admin', 'dmuenala', '2019-01-14 16:30:18', '2019-07-03 10:27:13'),
(3, 'Otros Repositorios', '<p><em>Enlaces a otros repositorios de inter&eacute;s</em></p>\r\n', 'media/pictures/GIF/GIF-ENLACES.gif', './documento/categoria/otros-repositorios', '', NULL, NULL, NULL, 3, '1', 'es', 1, 'admin', 'dmuenala', '2019-01-14 16:30:52', '2019-07-03 11:05:41'),
(4, 'logo3', '<p><img alt=\"\" src=\"media/pictures/web/logos/logo-amparasu-01.png\" /></p>\r\n', 'media/pictures/web/logos/logo-amparasu-01.png', 'https://radios.com.ec/ampara-su-90-7/', '', NULL, NULL, NULL, 3, '1', 'es', 2, 'admin', 'dmuenala', '2019-04-03 11:03:03', '2019-07-04 11:00:44'),
(5, 'logo 2', '<p><img alt=\"\" src=\"media/pictures/web/logos/2LOGO-DW-TRANSPARENTE.png\" /></p>\r\n', 'media/pictures/web/logos/2LOGO-DW-TRANSPARENTE.png', 'https://www.dw.com/es/dw-akademie/s-8137', '', NULL, NULL, NULL, 2, '1', 'es', 2, 'dmuenala', 'dmuenala', '2019-06-20 14:26:04', '2019-07-04 10:58:31'),
(6, 'logo 1', '<p><img alt=\"\" src=\"media/pictures/web/logos/logo-corape-web-repositorio.png\" /></p>\r\n', 'media/pictures/web/logos/logo-corape-web-repositorio.png', 'https://www.corape.org.ec/satelital/', '', NULL, NULL, NULL, 1, '1', 'es', 2, 'dmuenala', 'dmuenala', '2019-06-20 14:34:02', '2019-07-04 10:57:44'),
(7, 'logo4', '', 'media/pictures/web/logos/LOGOSCONAIECONFENIAE-02.png', 'https://conaie.org/', '', NULL, NULL, NULL, 4, '1', 'es', 2, 'dmuenala', 'dmuenala', '2019-07-03 11:15:53', '2019-07-04 11:12:26'),
(8, 'logo4', '', 'media/pictures/web/logos/LOGOSCONAIECONFENIAE-01.png', 'https://confeniae.net/', '', NULL, NULL, NULL, 5, '1', 'es', 2, 'dmuenala', 'dmuenala', '2019-07-03 11:17:14', '2019-07-04 10:33:29'),
(9, 'logo Erpe 5', '', 'media/pictures/web/logos/radio_erpe.jpg', 'http://www.erpe.org.ec/', '', NULL, NULL, NULL, 6, '1', 'es', 2, 'dmuenala', 'dmuenala', '2019-07-04 10:28:19', '2019-07-04 10:33:00'),
(10, 'logo guamote ', '', 'media/pictures/web/logos/radio_guamote.jpg', 'http://radioguamote.org/', '', NULL, NULL, NULL, 7, '1', 'es', 2, 'dmuenala', 'dmuenala', '2019-07-04 10:30:45', '2019-07-04 10:32:27'),
(11, 'logo illuman', '', 'media/pictures/web/logos/logoradioilumanuevo.png', 'https://radioiluman.ec/radio/', '', NULL, NULL, NULL, 8, '1', 'es', 2, 'dmuenala', NULL, '2019-07-04 10:35:18', NULL),
(12, 'logo sucumbios', '', 'media/pictures/web/logos/radio_sucumbios.jpg', 'https://radiosucumbios.org.ec/', '', NULL, NULL, NULL, 9, '1', 'es', 2, 'dmuenala', 'dmuenala', '2019-07-04 10:37:20', '2019-07-04 10:38:31'),
(13, 'logo latacunga', '', 'media/pictures/web/logos/radio_latacunga.png', 'https://www.facebook.com/stereolat/', '', NULL, NULL, NULL, 12, '1', 'es', 2, 'dmuenala', 'dmuenala', '2019-07-04 10:43:13', '2019-07-04 11:14:44'),
(14, 'logo buen pastor', '', 'media/pictures/web/logos/logobuenpastor-01.png', 'https://radiobpfm.wixsite.com/elbuenpastor929fm', '', NULL, NULL, NULL, 10, '1', 'es', 2, 'dmuenala', NULL, '2019-07-04 10:57:09', NULL),
(15, 'logo apak', '', 'media/pictures/web/logos/APAK.png', 'http://www.apakotavalo.tv/', '', NULL, NULL, NULL, 11, '1', 'es', 2, 'dmuenala', NULL, '2019-07-04 11:11:28', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_slideshow_categoria`
--

CREATE TABLE `x_slideshow_categoria` (
  `slideshow_categoria_id` decimal(10,0) NOT NULL,
  `slideshow_categoria_nombre` varchar(150) DEFAULT NULL,
  `slideshow_categoria_descripcion` text,
  `slideshow_categoria_habilitado` varchar(5) DEFAULT NULL,
  `slideshow_categoria_lenguaje` varchar(5) DEFAULT NULL,
  `slideshow_categoria_usuario_crea` varchar(20) DEFAULT NULL,
  `slideshow_categoria_usuario_actualiza` varchar(20) DEFAULT NULL,
  `slideshow_categoria_fecha_creacion` datetime DEFAULT NULL,
  `slideshow_categoria_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_slideshow_categoria`
--

INSERT INTO `x_slideshow_categoria` (`slideshow_categoria_id`, `slideshow_categoria_nombre`, `slideshow_categoria_descripcion`, `slideshow_categoria_habilitado`, `slideshow_categoria_lenguaje`, `slideshow_categoria_usuario_crea`, `slideshow_categoria_usuario_actualiza`, `slideshow_categoria_fecha_creacion`, `slideshow_categoria_fecha_actualizacion`) VALUES
(1, 'Slideshow Inicio', '', '1', 'es', 'admin', NULL, '2019-01-14 16:27:35', NULL),
(2, 'Slide Logos Instituciones', '', '1', 'es', 'admin', NULL, '2019-03-13 16:56:12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_super_permiso`
--

CREATE TABLE `x_super_permiso` (
  `modulo_id` varchar(30) NOT NULL DEFAULT '',
  `grupo_usuario_id` int(11) NOT NULL DEFAULT '0',
  `contenido_id` decimal(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_user_recovery`
--

CREATE TABLE `x_user_recovery` (
  `user_recovery_id` decimal(11,0) NOT NULL,
  `user_recovery_word` varchar(250) DEFAULT NULL,
  `user_recovery_email` varchar(50) DEFAULT NULL,
  `user_recovery_estado` varchar(5) DEFAULT NULL,
  `user_recovery_fecha_solicitud` datetime DEFAULT NULL,
  `user_recovery_fecha_activacion` datetime DEFAULT NULL,
  `user_recovery_usuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_usuario`
--

CREATE TABLE `x_usuario` (
  `usuario_nombre` varchar(20) NOT NULL,
  `grupo_usuario_id` int(11) DEFAULT NULL,
  `usuario_password` varchar(35) DEFAULT NULL,
  `usuario_nombre_usr` varchar(50) DEFAULT NULL,
  `usuario_apellido` varchar(50) DEFAULT NULL,
  `usuario_email` varchar(50) DEFAULT NULL,
  `usuario_habilitado` varchar(5) DEFAULT NULL,
  `usuario_rol_admin` varchar(5) DEFAULT NULL,
  `usuario_rol_web` varchar(5) DEFAULT NULL,
  `usuario_zip` varchar(20) DEFAULT NULL,
  `usuario_telefono` varchar(30) DEFAULT NULL,
  `usuario_movil` varchar(30) DEFAULT NULL,
  `usuario_pais` varchar(5) DEFAULT NULL,
  `usuario_localidad` varchar(50) DEFAULT NULL,
  `usuario_direccion_calle_principal` varchar(250) DEFAULT NULL,
  `usuario_direccion_calle_secundaria` varchar(250) DEFAULT NULL,
  `usuario_direccion_numeracion` varchar(50) DEFAULT NULL,
  `usuario_fecha_ultima_visita` datetime DEFAULT NULL,
  `usuario_usuario_crea` varchar(20) DEFAULT NULL,
  `usuario_usuario_actualiza` varchar(20) DEFAULT NULL,
  `usuario_fecha_creacion` datetime DEFAULT NULL,
  `usuario_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `x_usuario`
--

INSERT INTO `x_usuario` (`usuario_nombre`, `grupo_usuario_id`, `usuario_password`, `usuario_nombre_usr`, `usuario_apellido`, `usuario_email`, `usuario_habilitado`, `usuario_rol_admin`, `usuario_rol_web`, `usuario_zip`, `usuario_telefono`, `usuario_movil`, `usuario_pais`, `usuario_localidad`, `usuario_direccion_calle_principal`, `usuario_direccion_calle_secundaria`, `usuario_direccion_numeracion`, `usuario_fecha_ultima_visita`, `usuario_usuario_crea`, `usuario_usuario_actualiza`, `usuario_fecha_creacion`, `usuario_fecha_actualizacion`) VALUES
('admin', 1, '6702b8952c6b60af036945ac232088c3', 'XPERTO', 'DEVELOPER', 'xpertosolutions@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', 'Quito', NULL, NULL, NULL, '2019-07-27 10:00:38', 'admin', 'admin', '2009-07-16 14:01:03', '2017-11-07 17:27:44'),
('Bélgica Calderón', 4, '057cbef7616e3e4d22b8c74ddadbbecd', 'Bélgica', 'Calderón', 'belgum_19@hotmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-16 16:38:15', 'rocio', 'santiago', '2019-01-19 10:53:54', '2019-07-23 15:23:05'),
('Byroncr', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Byron', 'Cantincuz', 'byron100crc@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-16 14:19:58', 'rocio', 'rocio', '2019-01-25 19:23:32', '2019-01-25 19:33:27'),
('Chachi Manuel Añapa', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Manuel', 'Añapa', 'manuel72_@outlook.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-01-26 10:56:21', 'rocio', NULL, '2019-01-25 19:32:59', NULL),
('Chachi Tomas', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Tomás', 'de la Cruz', 'dtomas337@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-04-18 09:39:24', 'rocio', NULL, '2019-01-25 19:34:55', NULL),
('Chiripua', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Oscar ', 'Chiripua', 'chiripuaoscar@yahoo.es', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-16 15:29:45', 'rocio', NULL, '2019-01-25 19:17:55', NULL),
('Chushik61', 4, 'fa8b63cb9ab43d4383349d906ea516f8', 'Eduardo ', 'Aucancela', 'edaug@hotmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-20 17:10:19', 'rocio', 'dmuenala', '2019-01-19 10:57:13', '2019-07-23 15:23:45'),
('Corape', 1, '7ce70837df8803450551ce34fadb3a30', 'Corape ', 'Organización', 'corape@corape.org.ec', '1', '1', '1', NULL, NULL, NULL, 'EC', 'Quito', NULL, NULL, NULL, '2019-04-30 15:44:08', 'rocio', 'rocio', '2019-02-26 11:52:54', '2019-02-26 11:53:22'),
('dmuenala', 1, 'ab8a8e9d892ddabbe566a1e96189c070', 'David', 'Muenala', 'david@corape.org', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-08-16 17:51:11', 'rocio', 'dmuenala', '2019-01-19 17:18:46', '2019-06-14 10:14:06'),
('enriquezer', 1, '827ccb0eea8a706c4c34a16891f84e7b', 'Cristian ', 'Enriquez', 'enriquezer91@gmail.com', '1', '1', '2', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-08-13 15:25:10', 'dmuenala', NULL, '2019-08-12 18:00:12', NULL),
('Eslenmunayri', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Eslendy', 'Grefa', 'eslengre82@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-16 17:57:57', 'rocio', NULL, '2019-01-25 19:14:08', NULL),
('Ipiamat Tapuy', 4, '3f088ebeda03513be71d34d214291986', 'Tom', 'Sharupi', 'comunicacionconfeniae@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-01-19 11:22:35', 'rocio', 'santiago', '2019-01-19 11:22:26', '2019-07-23 15:23:26'),
('jorgeguachamin', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Jorge', 'Guachamin', 'jorgeguachamin@corape.org.ec', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-01-29 10:42:23', 'rocio', 'santiago', '2019-01-19 11:14:53', '2019-07-23 15:23:56'),
('Julio ', 4, '45c6708a6e690dc22395dc8ee81556c7', 'Julio ', 'Quintero', 'juliocesarq599@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-16 16:34:02', 'corape', 'corape', '2019-03-16 12:52:40', '2019-03-16 12:56:40'),
('mashi Luis', 4, 'b746616cca7d57acd209a3d47e84796a', 'Luis', 'Naula', 'luisnaula29@hotmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-16 12:47:43', 'rocio', 'dmuenala', '2019-01-19 10:52:17', '2019-07-23 15:24:14'),
('Narcizo Conejo', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Narcizo', 'Conejo', 'narcizo.conejo@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-01-26 10:54:13', 'rocio', NULL, '2019-01-25 19:25:48', NULL),
('prueba', 4, 'e2657ce0d878fe92fe5971a87271ce43', 'prueba', '', 'prueba#pirulito.com', '1', '1', '1', NULL, NULL, NULL, 'AZ', NULL, NULL, NULL, NULL, '2019-07-27 13:16:37', 'santiago', 'santiago', '2019-07-23 13:06:05', '2019-07-23 15:19:11'),
('rocio', 1, '7ce70837df8803450551ce34fadb3a30', 'Rocío', 'Gómez', 'rocioallpa@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-04-03 10:28:51', 'admin', 'jorgeguachamin', '2019-01-16 10:58:29', '2019-01-19 11:21:52'),
('runawiki2018', 4, '827ccb0eea8a706c4c34a16891f84e7b', 'Orlando ', 'Caiza', 'ocaiza@yahoo.es', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-01-23 09:33:33', 'rocio', 'rocio', '2019-01-19 10:55:03', '2019-01-23 09:30:32'),
('Ruth Angamarca A', 4, 'f1f30510be885c6da5843aff64967e69', 'Ruth', 'Angamarca', 'familydrisna@hotmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-16 15:15:55', 'jorgeguachamin', 'santiago', '2019-01-19 11:20:12', '2019-07-23 15:24:09'),
('Samiamaldonador', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Samia', 'Maldonado', 'apak.org@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-01-26 10:55:22', 'rocio', NULL, '2019-01-25 19:27:19', NULL),
('santiago', 1, '5ee93a0ae3f66488796eea735a673fe1', 'Santiago ', 'Garcia', 'santiago@radioslibres.net', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-07-28 10:43:36', 'rocio', 'corape', '2019-01-19 10:58:45', '2019-03-16 11:54:14'),
('Sisapak', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Sisa', 'Chicaiza', 'sisapak@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-16 15:11:03', 'santiago', 'santiago', '2019-03-16 11:59:33', '2019-07-23 15:24:27'),
('Su-palapcha', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Yicela', 'Guanga', 'yicelasolpac@yahoo.com.mx', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-16 11:42:47', 'rocio', 'rocio', '2019-01-25 19:20:52', '2019-01-25 19:21:47'),
('Tonny Che', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Tonny', 'Chimbo', 'tonny@hotmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-01-26 12:25:41', 'rocio', NULL, '2019-01-25 19:16:17', NULL),
('Wayrashigua', 4, '9a1bbf93fc44b6ebdb08af4fd31ad753', 'Wayra', 'Shigua', 'geronimosamuels@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-03-16 14:26:44', 'rocio', 'dmuenala', '2019-01-19 10:54:53', '2019-07-23 15:24:35'),
('webmaster', 4, 'd2617523e38b4d7e6e98b692c7e0e5ac', 'Webmaster', 'App', 'soporte@xpertosolutions.com', '1', '1', '1', NULL, NULL, NULL, 'EC', 'Quito', NULL, NULL, NULL, '2019-01-25 10:40:34', 'webmaster', 'admin', '2015-09-23 18:52:38', '2019-01-25 10:40:22'),
('yandainayuk', 4, '2e561d44db2f6b88ef808a50282de125', 'Yanda', 'Montahuano', 'yandainayuk@gmail.com', '1', '1', '1', NULL, NULL, NULL, 'EC', NULL, NULL, NULL, NULL, '2019-01-22 00:03:04', 'rocio', 'santiago', '2019-01-19 10:50:31', '2019-07-23 15:24:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_visitante_online`
--

CREATE TABLE `x_visitante_online` (
  `visitante_online_timestamp` int(15) NOT NULL DEFAULT '0',
  `visitante_online_ip` varchar(40) NOT NULL DEFAULT '',
  `visitante_online_file` varchar(100) NOT NULL DEFAULT '',
  `visitante_online_usuario_crea` varchar(20) DEFAULT NULL,
  `visitante_online_usuario_actualiza` varchar(20) DEFAULT NULL,
  `visitante_online_fecha_creacion` datetime DEFAULT NULL,
  `visitante_online_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `x_zona_envio`
--

CREATE TABLE `x_zona_envio` (
  `zona_envio_id` decimal(10,0) NOT NULL,
  `zona_envio_codigo_alterno` varchar(10) DEFAULT NULL,
  `zona_envio_nombre` varchar(250) DEFAULT NULL,
  `zona_envio_alias` varchar(250) DEFAULT NULL,
  `zona_envio_pais` varchar(5) DEFAULT NULL,
  `zona_envio_precio` decimal(10,2) DEFAULT NULL,
  `zona_envio_lenguaje` varchar(5) DEFAULT NULL,
  `zona_envio_publicado` varchar(5) DEFAULT NULL,
  `zona_envio_usuario_crea` varchar(20) DEFAULT NULL,
  `zona_envio_usuario_actualiza` varchar(20) DEFAULT NULL,
  `zona_envio_fecha_creacion` datetime DEFAULT NULL,
  `zona_envio_fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `c_nivel1`
--
ALTER TABLE `c_nivel1`
  ADD PRIMARY KEY (`nivel1_id`);

--
-- Indices de la tabla `c_nivel2`
--
ALTER TABLE `c_nivel2`
  ADD PRIMARY KEY (`nivel2_id`),
  ADD KEY `FK_C_NIVEL1` (`nivel1_id`);

--
-- Indices de la tabla `x_ciudad`
--
ALTER TABLE `x_ciudad`
  ADD PRIMARY KEY (`ciudad_id`),
  ADD KEY `FK_CIUDAD_PROVINCIA` (`provincia_id`);

--
-- Indices de la tabla `x_codigos`
--
ALTER TABLE `x_codigos`
  ADD PRIMARY KEY (`codigo_id`,`codigo_grupo_id`);

--
-- Indices de la tabla `x_contenido`
--
ALTER TABLE `x_contenido`
  ADD PRIMARY KEY (`contenido_id`),
  ADD KEY `FK_X_CONTENIDO_CATEGORIA` (`contenido_categoria_id`);

--
-- Indices de la tabla `x_contenido_categoria`
--
ALTER TABLE `x_contenido_categoria`
  ADD PRIMARY KEY (`contenido_categoria_id`);

--
-- Indices de la tabla `x_cupon`
--
ALTER TABLE `x_cupon`
  ADD PRIMARY KEY (`cupon_id`);

--
-- Indices de la tabla `x_documento`
--
ALTER TABLE `x_documento`
  ADD PRIMARY KEY (`documento_id`),
  ADD KEY `FK_DOCUMENTO_CATEGORIA` (`documento_categoria_id`);

--
-- Indices de la tabla `x_documento_categoria`
--
ALTER TABLE `x_documento_categoria`
  ADD PRIMARY KEY (`documento_categoria_id`);

--
-- Indices de la tabla `x_documento_categoria_grupo_usuario`
--
ALTER TABLE `x_documento_categoria_grupo_usuario`
  ADD PRIMARY KEY (`documento_categoria_id`,`grupo_usuario_id`),
  ADD KEY `documento_categoria_id` (`documento_categoria_id`),
  ADD KEY `grupo_usuario_id` (`grupo_usuario_id`);

--
-- Indices de la tabla `x_documento_grupo_usuario`
--
ALTER TABLE `x_documento_grupo_usuario`
  ADD PRIMARY KEY (`documento_id`,`grupo_usuario_id`),
  ADD KEY `documento_id` (`documento_id`),
  ADD KEY `grupo_usuario_id` (`grupo_usuario_id`);

--
-- Indices de la tabla `x_epago`
--
ALTER TABLE `x_epago`
  ADD PRIMARY KEY (`epago_id`),
  ADD KEY `FK_X_EPAGO_FORMA_PAGO` (`forma_pago_id`);

--
-- Indices de la tabla `x_epago_item`
--
ALTER TABLE `x_epago_item`
  ADD KEY `FK_X_EPAGO` (`epago_id`),
  ADD KEY `FK_EPAGO_ITEM_PRODUCTO` (`producto_id`);

--
-- Indices de la tabla `x_forma_pago`
--
ALTER TABLE `x_forma_pago`
  ADD PRIMARY KEY (`forma_pago_id`);

--
-- Indices de la tabla `x_formulario`
--
ALTER TABLE `x_formulario`
  ADD PRIMARY KEY (`formulario_id`);

--
-- Indices de la tabla `x_formulario_contacto`
--
ALTER TABLE `x_formulario_contacto`
  ADD PRIMARY KEY (`formulario_contacto_id`);

--
-- Indices de la tabla `x_formulario_cotizacion`
--
ALTER TABLE `x_formulario_cotizacion`
  ADD PRIMARY KEY (`formulario_cotizacion_id`);

--
-- Indices de la tabla `x_formulario_reserva`
--
ALTER TABLE `x_formulario_reserva`
  ADD PRIMARY KEY (`formulario_reserva_id`);

--
-- Indices de la tabla `x_formulario_soporte`
--
ALTER TABLE `x_formulario_soporte`
  ADD PRIMARY KEY (`formulario_soporte_id`);

--
-- Indices de la tabla `x_galeria`
--
ALTER TABLE `x_galeria`
  ADD PRIMARY KEY (`galeria_id`),
  ADD KEY `FK_GALERIA_CATEGORIA` (`galeria_categoria_id`);

--
-- Indices de la tabla `x_galeria_categoria`
--
ALTER TABLE `x_galeria_categoria`
  ADD PRIMARY KEY (`galeria_categoria_id`);

--
-- Indices de la tabla `x_grupo_codigos`
--
ALTER TABLE `x_grupo_codigos`
  ADD PRIMARY KEY (`grupo_id`);

--
-- Indices de la tabla `x_grupo_usuario`
--
ALTER TABLE `x_grupo_usuario`
  ADD PRIMARY KEY (`grupo_usuario_id`);

--
-- Indices de la tabla `x_mapa`
--
ALTER TABLE `x_mapa`
  ADD PRIMARY KEY (`mapa_id`);

--
-- Indices de la tabla `x_marca`
--
ALTER TABLE `x_marca`
  ADD PRIMARY KEY (`marca_id`);

--
-- Indices de la tabla `x_menu`
--
ALTER TABLE `x_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indices de la tabla `x_menu_seccion`
--
ALTER TABLE `x_menu_seccion`
  ADD PRIMARY KEY (`menu_id`,`seccion_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `seccion_id` (`seccion_id`);

--
-- Indices de la tabla `x_modulo`
--
ALTER TABLE `x_modulo`
  ADD PRIMARY KEY (`modulo_id`);

--
-- Indices de la tabla `x_noticia`
--
ALTER TABLE `x_noticia`
  ADD PRIMARY KEY (`noticia_id`);

--
-- Indices de la tabla `x_noticia_tag`
--
ALTER TABLE `x_noticia_tag`
  ADD PRIMARY KEY (`noticia_tag_id`);

--
-- Indices de la tabla `x_noticia_tag_noticia`
--
ALTER TABLE `x_noticia_tag_noticia`
  ADD PRIMARY KEY (`noticia_tag_id`,`noticia_id`),
  ADD KEY `FK_TAG_NOTICIA_TAG` (`noticia_tag_id`),
  ADD KEY `FK_TAG_NOTICIA` (`noticia_id`);

--
-- Indices de la tabla `x_parametros`
--
ALTER TABLE `x_parametros`
  ADD PRIMARY KEY (`parametros_id`);

--
-- Indices de la tabla `x_permiso_grupo`
--
ALTER TABLE `x_permiso_grupo`
  ADD KEY `FK_X_PERMISO_MODULO` (`modulo_id`),
  ADD KEY `FK_X_PERMISO_GRUPO_USUARIO` (`grupo_usuario_id`);

--
-- Indices de la tabla `x_peso_envio`
--
ALTER TABLE `x_peso_envio`
  ADD PRIMARY KEY (`peso_envio_id`);

--
-- Indices de la tabla `x_portafolio`
--
ALTER TABLE `x_portafolio`
  ADD PRIMARY KEY (`portafolio_id`),
  ADD KEY `FK_portafolio_CATEGORIA` (`portafolio_categoria_id`);

--
-- Indices de la tabla `x_portafolio_categoria`
--
ALTER TABLE `x_portafolio_categoria`
  ADD PRIMARY KEY (`portafolio_categoria_id`);

--
-- Indices de la tabla `x_producto`
--
ALTER TABLE `x_producto`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `FK_PRODUCTO_MARCA` (`marca_id`),
  ADD KEY `FK_PRODUCTO_CATEGORIA` (`producto_categoria_id`);

--
-- Indices de la tabla `x_producto_categoria`
--
ALTER TABLE `x_producto_categoria`
  ADD PRIMARY KEY (`producto_categoria_id`);

--
-- Indices de la tabla `x_provincia`
--
ALTER TABLE `x_provincia`
  ADD PRIMARY KEY (`provincia_id`);

--
-- Indices de la tabla `x_punto`
--
ALTER TABLE `x_punto`
  ADD PRIMARY KEY (`punto_id`),
  ADD KEY `FK_X_PUNTO_PUNTO_CATEGORIA` (`punto_categoria_id`);

--
-- Indices de la tabla `x_punto_categoria`
--
ALTER TABLE `x_punto_categoria`
  ADD PRIMARY KEY (`punto_categoria_id`);

--
-- Indices de la tabla `x_punto_mapa`
--
ALTER TABLE `x_punto_mapa`
  ADD PRIMARY KEY (`punto_id`,`mapa_id`),
  ADD KEY `FK_PUNTO_MAPA_MAPA` (`mapa_id`),
  ADD KEY `FK_PUNTO_MAPA_PUNTO` (`punto_id`);

--
-- Indices de la tabla `x_seccion`
--
ALTER TABLE `x_seccion`
  ADD PRIMARY KEY (`seccion_id`);

--
-- Indices de la tabla `x_seccion_grupo_usuario`
--
ALTER TABLE `x_seccion_grupo_usuario`
  ADD PRIMARY KEY (`seccion_id`,`grupo_usuario_id`),
  ADD KEY `seccion_id` (`seccion_id`),
  ADD KEY `grupo_usuario_id` (`grupo_usuario_id`);

--
-- Indices de la tabla `x_slideshow`
--
ALTER TABLE `x_slideshow`
  ADD PRIMARY KEY (`slideshow_id`),
  ADD KEY `FK_X_CATEGORIA_SLIDESHOW` (`slideshow_categoria_id`);

--
-- Indices de la tabla `x_slideshow_categoria`
--
ALTER TABLE `x_slideshow_categoria`
  ADD PRIMARY KEY (`slideshow_categoria_id`);

--
-- Indices de la tabla `x_super_permiso`
--
ALTER TABLE `x_super_permiso`
  ADD PRIMARY KEY (`modulo_id`,`grupo_usuario_id`,`contenido_id`),
  ADD KEY `FK_X_SUPER_PERMISO_MODULO` (`modulo_id`),
  ADD KEY `FK_X_SUPER_PERMISO_GRUPO_USUARIO` (`grupo_usuario_id`);

--
-- Indices de la tabla `x_user_recovery`
--
ALTER TABLE `x_user_recovery`
  ADD PRIMARY KEY (`user_recovery_id`);

--
-- Indices de la tabla `x_usuario`
--
ALTER TABLE `x_usuario`
  ADD PRIMARY KEY (`usuario_nombre`),
  ADD KEY `FK_X_GRUPO_USUARIO` (`grupo_usuario_id`);

--
-- Indices de la tabla `x_visitante_online`
--
ALTER TABLE `x_visitante_online`
  ADD PRIMARY KEY (`visitante_online_timestamp`);

--
-- Indices de la tabla `x_zona_envio`
--
ALTER TABLE `x_zona_envio`
  ADD PRIMARY KEY (`zona_envio_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `c_nivel2`
--
ALTER TABLE `c_nivel2`
  ADD CONSTRAINT `FK_C_NIVEL1` FOREIGN KEY (`nivel1_id`) REFERENCES `c_nivel1` (`nivel1_id`);

--
-- Filtros para la tabla `x_ciudad`
--
ALTER TABLE `x_ciudad`
  ADD CONSTRAINT `FK_CIUDAD_PROVINCIA` FOREIGN KEY (`provincia_id`) REFERENCES `x_provincia` (`provincia_id`);

--
-- Filtros para la tabla `x_contenido`
--
ALTER TABLE `x_contenido`
  ADD CONSTRAINT `FK_X_CATEGORIA_CONTENIDO` FOREIGN KEY (`contenido_categoria_id`) REFERENCES `x_contenido_categoria` (`contenido_categoria_id`);

--
-- Filtros para la tabla `x_documento`
--
ALTER TABLE `x_documento`
  ADD CONSTRAINT `FK_DOCUMENTO_CATEGORIA` FOREIGN KEY (`documento_categoria_id`) REFERENCES `x_documento_categoria` (`documento_categoria_id`);

--
-- Filtros para la tabla `x_documento_categoria_grupo_usuario`
--
ALTER TABLE `x_documento_categoria_grupo_usuario`
  ADD CONSTRAINT `FK_X_DOCCAT_GRUPO_USUARIO` FOREIGN KEY (`grupo_usuario_id`) REFERENCES `x_grupo_usuario` (`grupo_usuario_id`),
  ADD CONSTRAINT `FX_X_DOCCAT_CATEGORIA` FOREIGN KEY (`documento_categoria_id`) REFERENCES `x_documento_categoria` (`documento_categoria_id`);

--
-- Filtros para la tabla `x_documento_grupo_usuario`
--
ALTER TABLE `x_documento_grupo_usuario`
  ADD CONSTRAINT `FK_X_DOC_GRUPO_USUARIO` FOREIGN KEY (`grupo_usuario_id`) REFERENCES `x_grupo_usuario` (`grupo_usuario_id`),
  ADD CONSTRAINT `FX_X_DOC_DOCUMENTO` FOREIGN KEY (`documento_id`) REFERENCES `x_documento` (`documento_id`);

--
-- Filtros para la tabla `x_epago`
--
ALTER TABLE `x_epago`
  ADD CONSTRAINT `FK_X_EPAGO_FORMA_PAGO` FOREIGN KEY (`forma_pago_id`) REFERENCES `x_forma_pago` (`forma_pago_id`);

--
-- Filtros para la tabla `x_epago_item`
--
ALTER TABLE `x_epago_item`
  ADD CONSTRAINT `FK_EPAGO_ITEM_PRODUCTO` FOREIGN KEY (`producto_id`) REFERENCES `x_producto` (`producto_id`),
  ADD CONSTRAINT `FK_X_EPAGO` FOREIGN KEY (`epago_id`) REFERENCES `x_epago` (`epago_id`);

--
-- Filtros para la tabla `x_galeria`
--
ALTER TABLE `x_galeria`
  ADD CONSTRAINT `FK_GALERIA_CATEGORIA` FOREIGN KEY (`galeria_categoria_id`) REFERENCES `x_galeria_categoria` (`galeria_categoria_id`);

--
-- Filtros para la tabla `x_menu_seccion`
--
ALTER TABLE `x_menu_seccion`
  ADD CONSTRAINT `FK_X_MENU_SECCION1` FOREIGN KEY (`menu_id`) REFERENCES `x_menu` (`menu_id`),
  ADD CONSTRAINT `FX_X_SECCION` FOREIGN KEY (`seccion_id`) REFERENCES `x_seccion` (`seccion_id`);

--
-- Filtros para la tabla `x_noticia_tag_noticia`
--
ALTER TABLE `x_noticia_tag_noticia`
  ADD CONSTRAINT `FK_TAG_NOTICIA` FOREIGN KEY (`noticia_id`) REFERENCES `x_noticia` (`noticia_id`),
  ADD CONSTRAINT `FK_TAG_NOTICIA_TAG` FOREIGN KEY (`noticia_tag_id`) REFERENCES `x_noticia_tag` (`noticia_tag_id`);

--
-- Filtros para la tabla `x_permiso_grupo`
--
ALTER TABLE `x_permiso_grupo`
  ADD CONSTRAINT `FK_X_PERMISO_GRUPO_USUARIO` FOREIGN KEY (`grupo_usuario_id`) REFERENCES `x_grupo_usuario` (`grupo_usuario_id`),
  ADD CONSTRAINT `FK_X_PERMISO_MODULO` FOREIGN KEY (`modulo_id`) REFERENCES `x_modulo` (`modulo_id`);

--
-- Filtros para la tabla `x_portafolio`
--
ALTER TABLE `x_portafolio`
  ADD CONSTRAINT `FK_portafolio_CATEGORIA` FOREIGN KEY (`portafolio_categoria_id`) REFERENCES `x_portafolio_categoria` (`portafolio_categoria_id`);

--
-- Filtros para la tabla `x_producto`
--
ALTER TABLE `x_producto`
  ADD CONSTRAINT `FK_PRODUCTO_CATEGORIA` FOREIGN KEY (`producto_categoria_id`) REFERENCES `x_producto_categoria` (`producto_categoria_id`),
  ADD CONSTRAINT `FK_PRODUCTO_MARCA` FOREIGN KEY (`marca_id`) REFERENCES `x_marca` (`marca_id`);

--
-- Filtros para la tabla `x_punto`
--
ALTER TABLE `x_punto`
  ADD CONSTRAINT `FK_X_PUNTO_PUNTO_CATEGORIA` FOREIGN KEY (`punto_categoria_id`) REFERENCES `x_punto_categoria` (`punto_categoria_id`);

--
-- Filtros para la tabla `x_punto_mapa`
--
ALTER TABLE `x_punto_mapa`
  ADD CONSTRAINT `FK_PUNTO_MAPA_MAPA` FOREIGN KEY (`mapa_id`) REFERENCES `x_mapa` (`mapa_id`),
  ADD CONSTRAINT `FK_PUNTO_MAPA_PUNTO` FOREIGN KEY (`punto_id`) REFERENCES `x_punto` (`punto_id`);

--
-- Filtros para la tabla `x_seccion_grupo_usuario`
--
ALTER TABLE `x_seccion_grupo_usuario`
  ADD CONSTRAINT `FK_X_SECCION_GRUPO_USUARIO` FOREIGN KEY (`grupo_usuario_id`) REFERENCES `x_grupo_usuario` (`grupo_usuario_id`),
  ADD CONSTRAINT `FX_X_SECCION1` FOREIGN KEY (`seccion_id`) REFERENCES `x_seccion` (`seccion_id`);

--
-- Filtros para la tabla `x_slideshow`
--
ALTER TABLE `x_slideshow`
  ADD CONSTRAINT `FK_X_CATEGORIA_SLIDESHOW` FOREIGN KEY (`slideshow_categoria_id`) REFERENCES `x_slideshow_categoria` (`slideshow_categoria_id`);

--
-- Filtros para la tabla `x_super_permiso`
--
ALTER TABLE `x_super_permiso`
  ADD CONSTRAINT `FK_X_SUPER_PERMISO_GRUPO_USUARIO` FOREIGN KEY (`grupo_usuario_id`) REFERENCES `x_grupo_usuario` (`grupo_usuario_id`),
  ADD CONSTRAINT `FK_X_SUPER_PERMISO_MODULO` FOREIGN KEY (`modulo_id`) REFERENCES `x_modulo` (`modulo_id`);

--
-- Filtros para la tabla `x_usuario`
--
ALTER TABLE `x_usuario`
  ADD CONSTRAINT `FK_X_GRUPO_USUARIO` FOREIGN KEY (`grupo_usuario_id`) REFERENCES `x_grupo_usuario` (`grupo_usuario_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
