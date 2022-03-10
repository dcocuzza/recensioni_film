-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.21-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database progettobasididati
CREATE DATABASE IF NOT EXISTS `progettobasididati` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `progettobasididati`;

-- Dump della struttura di tabella progettobasididati.cast
CREATE TABLE IF NOT EXISTS `cast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `cognome` varchar(50) NOT NULL DEFAULT '0',
  `datanascita` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella progettobasididati.cast: ~7 rows (circa)
/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
INSERT INTO `cast` (`id`, `nome`, `cognome`, `datanascita`) VALUES
	(1, 'Tom', 'Holland', '1996-06-01'),
	(2, 'Jon', 'Watts', '1981-06-28'),
	(3, 'Zendaya', 'Coleman', '1996-09-01'),
	(4, 'Steven', 'Spielberg', '1946-12-18'),
	(5, 'Tom', 'Hanks', '1956-07-09'),
	(6, 'Theodore', 'Melfi', '1970-10-07'),
	(7, 'Taraji', 'Henson', '1970-10-11');
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;

-- Dump della struttura di tabella progettobasididati.film
CREATE TABLE IF NOT EXISTS `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(50) DEFAULT NULL,
  `trama` varchar(500) DEFAULT NULL,
  `uscita` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella progettobasididati.film: ~2 rows (circa)
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` (`id`, `titolo`, `trama`, `uscita`) VALUES
	(1, 'Spiderman', 'Il morso di un ragno mutante dona degli incredibili, e inaspettati, poteri al giovane Peter Parker, che li usa nella guerra contro un minaccioso nemico.', '2022-02-17'),
	(2, 'Salvate il soldato Ryan', 'Nei giorni seguenti lo sbarco in Normandia, una madre americana sta per ricevere nello stesso giorno la notizia della morte di tre dei suoi figli su diversi fronti della guerra. Il comandante in capo ', '2022-02-17'),
	(3, 'Il ragazzo che catturò il vento', 'Un ragazzo di 13 anni viene espulso dalla scuola che frequenta quando la sua famiglia non può più pagare la retta. Il giovane, quindi, impara a costruire un mulino a vento per salvare la propria gente dalla carestia.', '2022-02-17'),
	(4, 'Il diritto di contare', 'La storia di tre scienziate afroamericane, Katherine Johnson, Dortohy Vaughan e Mary Jackson, che lavorarono alla NASA agli inizi degli anni 60 collaborando all\'operazione spaziale degli Stati Uniti.', '2017-01-06');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Dump della struttura di tabella progettobasididati.genere
CREATE TABLE IF NOT EXISTS `genere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella progettobasididati.genere: ~6 rows (circa)
/*!40000 ALTER TABLE `genere` DISABLE KEYS */;
INSERT INTO `genere` (`id`, `descrizione`) VALUES
	(1, 'guerra'),
	(2, 'drammatico'),
	(3, 'fantasy'),
	(4, 'commedia'),
	(5, 'sci-fi'),
	(6, 'romantico');
/*!40000 ALTER TABLE `genere` ENABLE KEYS */;

-- Dump della struttura di tabella progettobasididati.generefilm
CREATE TABLE IF NOT EXISTS `generefilm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idfilm` int(11) NOT NULL,
  `idgenere` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_generefilm_film` (`idfilm`),
  KEY `FK_generefilm_genere` (`idgenere`),
  CONSTRAINT `FK_generefilm_film` FOREIGN KEY (`idfilm`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_generefilm_genere` FOREIGN KEY (`idgenere`) REFERENCES `genere` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella progettobasididati.generefilm: ~6 rows (circa)
/*!40000 ALTER TABLE `generefilm` DISABLE KEYS */;
INSERT INTO `generefilm` (`id`, `idfilm`, `idgenere`) VALUES
	(1, 1, 5),
	(2, 2, 1),
	(3, 2, 2),
	(4, 3, 4),
	(5, 1, 3),
	(6, 4, 3);
/*!40000 ALTER TABLE `generefilm` ENABLE KEYS */;

-- Dump della struttura di tabella progettobasididati.recensione
CREATE TABLE IF NOT EXISTS `recensione` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idutente` int(11) NOT NULL DEFAULT 0,
  `idfilm` int(11) NOT NULL DEFAULT 0,
  `voto` enum('1','2','3','4','5','6','7','8','9','10') NOT NULL,
  `commento` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_recensione_utente` (`idutente`),
  KEY `FK_recensione_film` (`idfilm`),
  CONSTRAINT `FK_recensione_film` FOREIGN KEY (`idfilm`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_recensione_utente` FOREIGN KEY (`idutente`) REFERENCES `utente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella progettobasididati.recensione: ~5 rows (circa)
/*!40000 ALTER TABLE `recensione` DISABLE KEYS */;
INSERT INTO `recensione` (`id`, `idutente`, `idfilm`, `voto`, `commento`) VALUES
	(1, 1, 1, '7', 'Divertente'),
	(2, 3, 2, '8', 'Stupendo'),
	(3, 2, 2, '5', 'Bello'),
	(4, 4, 4, '10', 'Bellissimo'),
	(5, 4, 1, '9', 'Meraviglioso');
/*!40000 ALTER TABLE `recensione` ENABLE KEYS */;

-- Dump della struttura di tabella progettobasididati.ruolo
CREATE TABLE IF NOT EXISTS `ruolo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruolo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella progettobasididati.ruolo: ~5 rows (circa)
/*!40000 ALTER TABLE `ruolo` DISABLE KEYS */;
INSERT INTO `ruolo` (`id`, `ruolo`) VALUES
	(1, 'attore'),
	(2, 'regista'),
	(3, 'scenografo'),
	(4, 'fonico'),
	(5, 'produttore');
/*!40000 ALTER TABLE `ruolo` ENABLE KEYS */;

-- Dump della struttura di tabella progettobasididati.ruolofilm
CREATE TABLE IF NOT EXISTS `ruolofilm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idfilm` int(11) DEFAULT NULL,
  `idcast` int(11) DEFAULT NULL,
  `idruolo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_castfilm_film` (`idfilm`),
  KEY `FK_castfilm_cast` (`idcast`),
  KEY `FK_castfilm_ruolo` (`idruolo`),
  CONSTRAINT `FK_castfilm_cast` FOREIGN KEY (`idcast`) REFERENCES `cast` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_castfilm_film` FOREIGN KEY (`idfilm`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_castfilm_ruolo` FOREIGN KEY (`idruolo`) REFERENCES `ruolo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella progettobasididati.ruolofilm: ~5 rows (circa)
/*!40000 ALTER TABLE `ruolofilm` DISABLE KEYS */;
INSERT INTO `ruolofilm` (`id`, `idfilm`, `idcast`, `idruolo`) VALUES
	(1, 1, 1, 1),
	(2, 1, 2, 2),
	(3, 1, 3, 1),
	(4, 2, 4, 2),
	(5, 2, 5, 1),
	(6, 2, 1, 1);
/*!40000 ALTER TABLE `ruolofilm` ENABLE KEYS */;

-- Dump della struttura di tabella progettobasididati.utente
CREATE TABLE IF NOT EXISTS `utente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella progettobasididati.utente: ~2 rows (circa)
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` (`id`, `nome`, `cognome`, `email`, `password`) VALUES
	(1, 'Daniele', 'Cocuzza', 'dcocuzza01@gmail.com', '123'),
	(2, 'Nicolò', 'Barella', 'barella@gmail.com', '345'),
	(3, 'Lautaro', 'Martinez', 'lau@virgilio.it', 'lau97'),
	(4, 'Mario', 'Bianchi', 'mario@gmail.com', 'mario98');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
