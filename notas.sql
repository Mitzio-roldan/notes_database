-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: notas
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Tendencias'),(2,'Musica'),(3,'Finanzas'),(4,'Economia'),(5,'Bitcoin'),(6,'Criptomonedas'),(7,'Autos'),(8,'Tesla'),(9,'NFT'),(10,'Programacion');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `eliminable` tinyint(1) NOT NULL,
  `id_user` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user_idx` (`id_user`),
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'Bitcoin price briefly hits $69K ATH','2021-11-10','2021-11-10','Btc at all-time highs after U.S. announced this months inflation',1,1),(2,'Paulo Londra resolvi?? un conflicto legal y vuelve a la m??sica','2021-11-10','2021-11-10','Paulo Londra lleg?? a un amistoso acuerdo y el conflicto legal que manten??a con su sello discogr??fico anterior -y sus exproductores- qued?? atr??s: Londra ahora podr?? seguir haciendo m??sica libremente.',1,2),(3,'Pastillas antivirales COVID','2021-11-10','2021-11-10','En poco m??s de un mes, se descubri?? que dos medicamentos antivirales, ambos capaces de tomarse en forma de p??ldora, redujeron las hospitalizaciones y muertes por COVID-19 en ensayos cl??nicos de pacientes tratados poco despu??s de su infecci??n inicial.',1,3),(4,'Por qu?? saber de finanzas puede mejorar tu vida','2021-10-20','2021-10-20','???Todos nos relacionamos con el mundo financiero y por eso es bueno tener una buena cultura financiera???. Saber sobre finanzas nos ayudar?? a gestionar mejor nuestro dinero y a conocer mejor las oportunidades y riesgos que tienen los productos financieros.',1,4),(5,'Los precios de Estados Unidos est??n subiendo m??s de lo que han subido en 30 a??os','2021-11-10','2021-11-10','Durante los ??ltimos 12 meses, los precios subieron un 6,2%, lo que representa el mayor aumento desde noviembre de 1990.',1,5),(6,'Nueva York lanzar?? su propia criptomoneda','2021-11-08','2021-11-08','El alcalde electo de Nueva York, Eric Adams, promocion?? el lunes una nueva criptomoneda con la marca de la ciudad que se lanzar?? el mi??rcoles, un nuevo paso en su compromiso con las monedas virtuales.',1,6),(7,'Por primera vez un auto el??ctrico es el m??s vendido en Europa','2021-11-10','2021-11-10','La fiebre de los el??ctricos avanza m??s r??pido de lo esperado y Tesla corre con ventaja, tanto es as??, que el Model 3 fue el auto m??s vendido en septiembre en el viejo continente',1,7),(8,'El nuevo Tesla Model S Plaid acelera m??s que coches de 1 mill??n de d??lares','2021-06-03','2021-06-03','El Tesla Model S Plaid habr??a roto el r??cord oficial del cuarto de milla, superando en aceleraci??n a s??perdeportivos de m??s de un mill??n de d??lares.',1,8),(9,'El FC Barcelona lanzar?? NFT de momentos hist??ricos','2021-11-10','2021-11-10','\nEl FC Barcelona dar?? un paso m??s en el ecosistema cripto.',1,9),(10,'Oracle ense??ar?? programaci??n en cursos gratuitos','2021-11-11','2021-11-11','Se trata de un programa gratuito llamado \"Oracle Next Education\" que permitir?? a personas aprender todo lo que hay que saber para trabajar en tecnolog??a.',1,10);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_categorias`
--

DROP TABLE IF EXISTS `registro_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_categorias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_nota` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_notas_idx` (`id_nota`),
  KEY `id_categorias_idx` (`id_categoria`),
  CONSTRAINT `id_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  CONSTRAINT `id_notas` FOREIGN KEY (`id_nota`) REFERENCES `notas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_categorias`
--

LOCK TABLES `registro_categorias` WRITE;
/*!40000 ALTER TABLE `registro_categorias` DISABLE KEYS */;
INSERT INTO `registro_categorias` VALUES (1,1,5),(2,2,2),(3,3,1),(4,4,3),(5,5,4),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `registro_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Pedro','pedro@gmail.com'),(2,'Juan','juan@gmail.com'),(3,'Diego','diego@gmail.com'),(4,'Mariano','mariano@gmail.com'),(5,'Eduardo','eduardo@gmail.com'),(6,'Luis','luis@gmail.com'),(7,'Manuel','manuel@gmail.com'),(8,'Jorge','jorge@gmail.com'),(9,'Nicolas','nicolas@gmail.com'),(10,'Martin','martin@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18 10:55:05
