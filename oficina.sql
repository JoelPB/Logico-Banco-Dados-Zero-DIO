CREATE DATABASE  IF NOT EXISTS `oficina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oficina`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'João Silva','Rua das Flores, 123'),(2,'Maria Oliveira','Av. Brasil, 456'),(3,'João Silva','Rua das Flores, 123'),(4,'Maria Oliveira','Av. Brasil, 456');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe_mecanicos`
--

DROP TABLE IF EXISTS `equipe_mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe_mecanicos` (
  `idEquipe` int NOT NULL AUTO_INCREMENT,
  `nomeEquipe` varchar(20) NOT NULL,
  PRIMARY KEY (`idEquipe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe_mecanicos`
--

LOCK TABLES `equipe_mecanicos` WRITE;
/*!40000 ALTER TABLE `equipe_mecanicos` DISABLE KEYS */;
INSERT INTO `equipe_mecanicos` VALUES (1,'Equipe Alpha'),(2,'Equipe Beta');
/*!40000 ALTER TABLE `equipe_mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `idMecanico` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `especialidade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idMecanico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'Carlos Andrade','Rua dos Mecânicos, 100','Motor'),(2,'Fernanda Costa','Av. Mecânica, 200','Suspensão');
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico_equipe_mecanicos`
--

DROP TABLE IF EXISTS `mecanico_equipe_mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico_equipe_mecanicos` (
  `Mecanico_idMecanico` int NOT NULL,
  `Equipe_Mecanicos_idEquipe` int NOT NULL,
  PRIMARY KEY (`Mecanico_idMecanico`,`Equipe_Mecanicos_idEquipe`),
  KEY `Equipe_Mecanicos_idEquipe` (`Equipe_Mecanicos_idEquipe`),
  CONSTRAINT `mecanico_equipe_mecanicos_ibfk_1` FOREIGN KEY (`Mecanico_idMecanico`) REFERENCES `mecanico` (`idMecanico`),
  CONSTRAINT `mecanico_equipe_mecanicos_ibfk_2` FOREIGN KEY (`Equipe_Mecanicos_idEquipe`) REFERENCES `equipe_mecanicos` (`idEquipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico_equipe_mecanicos`
--

LOCK TABLES `mecanico_equipe_mecanicos` WRITE;
/*!40000 ALTER TABLE `mecanico_equipe_mecanicos` DISABLE KEYS */;
INSERT INTO `mecanico_equipe_mecanicos` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `mecanico_equipe_mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_servico` (
  `numeroOS` int NOT NULL AUTO_INCREMENT,
  `dataEmissao` date NOT NULL,
  `dataEntrega` date DEFAULT NULL,
  `valorTotal` float DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `autorizado` tinyint(1) DEFAULT '0',
  `Veiculo_idVeiculo` int NOT NULL,
  `Equipe_Mecanicos_idEquipe` int NOT NULL,
  PRIMARY KEY (`numeroOS`),
  KEY `Veiculo_idVeiculo` (`Veiculo_idVeiculo`),
  KEY `Equipe_Mecanicos_idEquipe` (`Equipe_Mecanicos_idEquipe`),
  CONSTRAINT `ordem_servico_ibfk_1` FOREIGN KEY (`Veiculo_idVeiculo`) REFERENCES `veiculo` (`idVeiculo`),
  CONSTRAINT `ordem_servico_ibfk_2` FOREIGN KEY (`Equipe_Mecanicos_idEquipe`) REFERENCES `equipe_mecanicos` (`idEquipe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
INSERT INTO `ordem_servico` VALUES (3,'2024-11-01','2024-11-10',500,'Aberto',1,1,1),(4,'2024-11-05',NULL,300,'Em andamento',0,2,2);
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca`
--

DROP TABLE IF EXISTS `peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca` (
  `idPeca` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`idPeca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
INSERT INTO `peca` VALUES (1,'Filtro de óleo',50),(2,'Pastilha de freio',100);
/*!40000 ALTER TABLE `peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca_os`
--

DROP TABLE IF EXISTS `peca_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca_os` (
  `Peca_idPeca` int NOT NULL,
  `OS_numeroOS` int NOT NULL,
  `OS_Equipe_Mecanicos_idEquipe` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`Peca_idPeca`,`OS_numeroOS`,`OS_Equipe_Mecanicos_idEquipe`),
  KEY `OS_numeroOS` (`OS_numeroOS`),
  KEY `OS_Equipe_Mecanicos_idEquipe` (`OS_Equipe_Mecanicos_idEquipe`),
  CONSTRAINT `peca_os_ibfk_1` FOREIGN KEY (`Peca_idPeca`) REFERENCES `peca` (`idPeca`),
  CONSTRAINT `peca_os_ibfk_2` FOREIGN KEY (`OS_numeroOS`) REFERENCES `ordem_servico` (`numeroOS`),
  CONSTRAINT `peca_os_ibfk_3` FOREIGN KEY (`OS_Equipe_Mecanicos_idEquipe`) REFERENCES `equipe_mecanicos` (`idEquipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca_os`
--

LOCK TABLES `peca_os` WRITE;
/*!40000 ALTER TABLE `peca_os` DISABLE KEYS */;
INSERT INTO `peca_os` VALUES (1,3,1,2),(2,4,2,4);
/*!40000 ALTER TABLE `peca_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `idServico` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(1000) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`idServico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'Troca de óleo',200),(2,'Revisão completa',400);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico_os`
--

DROP TABLE IF EXISTS `servico_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico_os` (
  `Servico_idServico` int NOT NULL,
  `OS_numeroOS` int NOT NULL,
  `OS_Equipe_Mecanicos_idEquipe` int NOT NULL,
  `valorMaoDeObra` float DEFAULT NULL,
  PRIMARY KEY (`Servico_idServico`,`OS_numeroOS`,`OS_Equipe_Mecanicos_idEquipe`),
  KEY `OS_numeroOS` (`OS_numeroOS`),
  KEY `OS_Equipe_Mecanicos_idEquipe` (`OS_Equipe_Mecanicos_idEquipe`),
  CONSTRAINT `servico_os_ibfk_1` FOREIGN KEY (`Servico_idServico`) REFERENCES `servico` (`idServico`),
  CONSTRAINT `servico_os_ibfk_2` FOREIGN KEY (`OS_numeroOS`) REFERENCES `ordem_servico` (`numeroOS`),
  CONSTRAINT `servico_os_ibfk_3` FOREIGN KEY (`OS_Equipe_Mecanicos_idEquipe`) REFERENCES `equipe_mecanicos` (`idEquipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico_os`
--

LOCK TABLES `servico_os` WRITE;
/*!40000 ALTER TABLE `servico_os` DISABLE KEYS */;
INSERT INTO `servico_os` VALUES (1,3,1,50),(2,4,2,100);
/*!40000 ALTER TABLE `servico_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `idVeiculo` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(30) NOT NULL,
  `placa` char(7) NOT NULL,
  `ano` int NOT NULL,
  `Clientes_idCliente` int NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  UNIQUE KEY `placa` (`placa`),
  KEY `Clientes_idCliente` (`Clientes_idCliente`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`Clientes_idCliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'Fiat Uno','ABC1234',2010,1),(2,'Toyota Corolla','XYZ5678',2020,2);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 19:00:10
