-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: veterinaria
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Medicamento','Productos medicinales para animales.'),(2,'Accesorio','Accesorios y complementos para mascotas.'),(3,'Higiene','Productos de higiene y cuidado para mascotas.'),(4,'Alimento','Comida y suplementos para mascotas.');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `ingredientes` mediumtext,
  `asociacion` mediumtext,
  `formulacion` mediumtext,
  `presentacion_comercial_M` mediumtext,
  `dosis` mediumtext,
  `indicaciones` text,
  `cantidad` int DEFAULT NULL,
  `proveedor_id` int DEFAULT NULL,
  `precio_unitario_E` decimal(10,2) DEFAULT NULL,
  `precio_unitario_P` decimal(10,2) DEFAULT NULL,
  `descripcion` text,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proveedor` (`proveedor_id`),
  KEY `fk_categoria` (`categoria_id`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'MED001','Antiparasitario Canino','VetPharma',1,'Ivermectina, Praziquantel','N/A','Tabletas','Caja con 10 tabletas','1 tableta por cada 10 kg de peso','Tratamiento de parásitos internos',50,1,10.00,12.00,'Antiparasitario para perros','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(2,'MED002','Antibiótico Felino','CatHealth',1,'Amoxicilina','N/A','Suspensión oral','Frasco de 100 ml','5 ml cada 12 horas','Infecciones bacterianas en gatos',30,2,15.00,18.00,'Antibiótico de amplio espectro para gatos','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(3,'MED003','Vacuna Triple Felina','PetVacc',1,'Virus atenuados','N/A','Inyección','Caja con 10 dosis','1 ml por vía subcutánea','Prevención de enfermedades virales en gatos',20,3,25.00,30.00,'Vacuna para gatos','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(4,'MED004','Desparasitante Bovino','FarmVet',1,'Albendazol','N/A','Suspensión oral','Frasco de 500 ml','10 ml por cada 50 kg de peso','Tratamiento de parásitos internos en bovinos',40,4,20.00,24.00,'Desparasitante para bovinos','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(5,'MED005','Antiinflamatorio Equino','EquiCare',1,'Fenilbutazona','N/A','Inyección','Caja con 5 ampollas','1 ml por cada 50 kg de peso','Tratamiento de inflamaciones en caballos',25,5,30.00,35.00,'Antiinflamatorio para caballos','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(6,'MED006','Antiparasitario Aves','BirdVet',1,'Levamisol','N/A','Polvo soluble','Sobre de 100 g','1 g por litro de agua','Tratamiento de parásitos internos en aves',60,6,8.00,10.00,'Antiparasitario para aves','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(7,'MED007','Antibiótico Canino','DogHealth',1,'Cefalexina','N/A','Tabletas','Caja con 20 tabletas','1 tableta cada 12 horas','Infecciones bacterianas en perros',35,7,18.00,22.00,'Antibiótico de amplio espectro para perros','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(8,'MED008','Vacuna Antirrábica','SafePet',1,'Virus inactivado','N/A','Inyección','Caja con 10 dosis','1 ml por vía subcutánea','Prevención de la rabia en mascotas',50,8,12.00,15.00,'Vacuna contra la rabia','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(9,'MED009','Desparasitante Felino','CatCare',1,'Piperazina','N/A','Suspensión oral','Frasco de 50 ml','2 ml cada 12 horas','Tratamiento de parásitos internos en gatos',45,9,10.00,12.00,'Desparasitante para gatos','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(10,'MED010','Antiinflamatorio Canino','VetRelief',1,'Meloxicam','N/A','Suspensión oral','Frasco de 30 ml','0.1 ml por kg de peso','Tratamiento de inflamaciones en perros',30,10,22.00,25.00,'Antiinflamatorio para perros','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(11,'MED011','Antiparasitario Bovino','BovVet',1,'Ivermectina','N/A','Inyección','Caja con 10 ampollas','1 ml por cada 50 kg de peso','Tratamiento de parásitos internos y externos en bovinos',20,1,28.00,32.00,'Antiparasitario para bovinos','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(12,'MED012','Antibiótico Equino','HorseHealth',1,'Oxitetraciclina','N/A','Inyección','Caja con 5 ampollas','1 ml por cada 50 kg de peso','Infecciones bacterianas en caballos',15,2,35.00,40.00,'Antibiótico de amplio espectro para caballos','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(13,'MED013','Vacuna Canina','DogVacc',1,'Virus atenuados','N/A','Inyección','Caja con 10 dosis','1 ml por vía subcutánea','Prevención de enfermedades virales en perros',25,3,20.00,24.00,'Vacuna para perros','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(14,'MED014','Desparasitante Equino','EquiVet',1,'Fenbendazol','N/A','Pasta oral','Jeringa de 30 g','1 g por cada 50 kg de peso','Tratamiento de parásitos internos en caballos',30,4,18.00,22.00,'Desparasitante para caballos','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(15,'MED015','Antiinflamatorio Felino','CatRelief',1,'Prednisolona','N/A','Tabletas','Caja con 10 tabletas','1 tableta cada 24 horas','Tratamiento de inflamaciones en gatos',20,5,25.00,28.00,'Antiinflamatorio para gatos','https://figa.com.co/v2/wp-content/uploads/2023/09/GASTRIVET-WEB.jpg'),(16,'ACC001','Collar Antipulgas','PetSafe',2,'Deltametrina','N/A','Collar','Paquete con 1 collar','N/A','Prevención de pulgas y garrapatas',100,1,15.00,18.00,'Collar antipulgas para perros y gatos','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(17,'ACC002','Juguete Mordedor','ChewToys',2,'Caucho natural','N/A','Juguete','Paquete con 1 juguete','N/A','Entretenimiento y salud dental',150,2,8.00,10.00,'Juguete mordedor para perros','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(18,'ACC003','Cama para Mascotas','ComfyPet',2,'Algodón, Poliéster','N/A','Cama','Paquete con 1 cama','N/A','Descanso y comodidad',50,3,25.00,30.00,'Cama cómoda para perros y gatos','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(19,'ACC004','Arnés Reflectante','SafeWalk',2,'Nylon, Reflectante','N/A','Arnés','Paquete con 1 arnés','N/A','Seguridad en paseos nocturnos',80,4,20.00,24.00,'Arnés reflectante para perros','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(20,'ACC005','Rascador para Gatos','CatFun',2,'Cartón, Sisal','N/A','Rascador','Paquete con 1 rascador','N/A','Entretenimiento y cuidado de uñas',60,5,18.00,22.00,'Rascador para gatos','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(21,'ACC006','Comedero Automático','FeedMaster',2,'Plástico, Electrónica','N/A','Comedero','Paquete con 1 comedero','N/A','Alimentación programada',40,6,50.00,55.00,'Comedero automático para mascotas','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(22,'ACC007','Fuente de Agua','HydroPet',2,'Plástico, Electrónica','N/A','Fuente','Paquete con 1 fuente','N/A','Hidratación continua',30,7,35.00,40.00,'Fuente de agua para mascotas','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(23,'ACC008','Transportadora','TravelPet',2,'Plástico, Metal','N/A','Transportadora','Paquete con 1 transportadora','N/A','Transporte seguro',20,8,45.00,50.00,'Transportadora para mascotas','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(24,'ACC009','Cepillo de Pelo','GroomEase',2,'Plástico, Metal','N/A','Cepillo','Paquete con 1 cepillo','N/A','Cuidado del pelaje',70,9,12.00,15.00,'Cepillo de pelo para mascotas','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(25,'ACC010','Cortauñas','NailTrim',2,'Acero inoxidable','N/A','Cortauñas','Paquete con 1 cortauñas','N/A','Cuidado de uñas',90,10,10.00,12.00,'Cortauñas para mascotas','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(26,'ACC011','Juguete Interactivo','PlayPet',2,'Plástico','N/A','Juguete','Paquete con 1 juguete','N/A','Estimulación mental',50,1,22.00,25.00,'Juguete interactivo para mascotas','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(27,'ACC012','Collar Luminoso','BrightPet',2,'Silicona, LED','N/A','Collar','Paquete con 1 collar','N/A','Visibilidad nocturna',100,2,18.00,20.00,'Collar luminoso para perros y gatos','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(28,'ACC013','Manta para Mascotas','WarmPet',2,'Fleece','N/A','Manta','Paquete con 1 manta','N/A','Calor y comodidad',60,3,15.00,18.00,'Manta cálida para mascotas','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(29,'ACC014','Bebedero Portátil','DrinkEase',2,'Plástico','N/A','Bebedero','Paquete con 1 bebedero','N/A','Hidratación en movimiento',80,4,12.00,15.00,'Bebedero portátil para mascotas','https://i5.walmartimages.com.mx/mg/gm/3pp/asr/e92adc82-496e-4572-bf79-ce935aadfb24.55c931bba51f3903df51074ebc141010.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),(30,'HIG001','Shampoo para Perros','PetClean',3,'Extracto de avena, Aloe Vera','N/A','Líquido','Botella de 500 ml','N/A','Limpieza y cuidado del pelaje',100,1,12.00,14.00,'Shampoo suave para perros','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(31,'HIG002','Acondicionador para Gatos','CatGroom',3,'Aceite de argán, Vitamina E','N/A','Líquido','Botella de 250 ml','N/A','Suavidad y brillo del pelaje',80,2,10.00,12.00,'Acondicionador para gatos','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(32,'HIG003','Toallitas Húmedas','CleanPaws',3,'Aloe Vera, Vitamina E','N/A','Toallitas','Paquete con 50 toallitas','N/A','Limpieza rápida y fácil',150,3,8.00,10.00,'Toallitas húmedas para mascotas','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(33,'HIG004','Spray Desinfectante','PetSanitizer',3,'Alcohol, Clorhexidina','N/A','Spray','Botella de 200 ml','N/A','Desinfección de superficies y objetos',60,4,15.00,18.00,'Spray desinfectante para mascotas','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(34,'HIG005','Pasta Dental para Perros','DogDent',3,'Flúor, Bicarbonato de sodio','N/A','Pasta','Tubo de 100 g','N/A','Cuidado dental y prevención de sarro',90,5,7.00,9.00,'Pasta dental para perros','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(35,'HIG006','Cepillo Dental para Gatos','CatSmile',3,'Plástico, Cerdas suaves','N/A','Cepillo','Paquete con 1 cepillo','N/A','Higiene bucal',70,6,5.00,6.00,'Cepillo dental para gatos','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(36,'HIG007','Desodorante para Mascotas','FreshPet',3,'Extracto de manzanilla, Aloe Vera','N/A','Spray','Botella de 150 ml','N/A','Eliminación de olores',50,7,10.00,12.00,'Desodorante para mascotas','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(37,'HIG008','Limpiador de Oídos','EarCare',3,'Ácido bórico, Glicerina','N/A','Líquido','Botella de 100 ml','N/A','Limpieza y cuidado de oídos',40,8,12.00,14.00,'Limpiador de oídos para mascotas','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(38,'HIG009','Cortaúñas para Perros','NailCare',3,'Acero inoxidable','N/A','Cortaúñas','Paquete con 1 cortaúñas','N/A','Cuidado de uñas',100,9,8.00,10.00,'Cortaúñas para perros','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(39,'HIG010','Polvo Antipulgas','FleaAway',3,'Permetrina','N/A','Polvo','Frasco de 200 g','N/A','Prevención y tratamiento de pulgas',60,10,15.00,18.00,'Polvo antipulgas para mascotas','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(40,'HIG011','Limpiador de Patas','PawClean',3,'Extracto de aloe, Vitamina E','N/A','Líquido','Botella de 250 ml','N/A','Limpieza de patas',80,1,10.00,12.00,'Limpiador de patas para mascotas','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(41,'HIG012','Spray Antipulgas','FleaSpray',3,'Fipronil','N/A','Spray','Botella de 300 ml','N/A','Prevención y tratamiento de pulgas',70,2,18.00,20.00,'Spray antipulgas para mascotas','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(42,'HIG013','Shampoo Anticaspa','PetDandruff',3,'Ácido salicílico, Aloe Vera','N/A','Líquido','Botella de 500 ml','N/A','Tratamiento de caspa',50,3,14.00,16.00,'Shampoo anticaspa para mascotas','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(43,'HIG014','Acondicionador Hidratante','HydraPet',3,'Aceite de coco, Vitamina E','N/A','Líquido','Botella de 250 ml','N/A','Hidratación y suavidad del pelaje',60,4,12.00,14.00,'Acondicionador hidratante para mascotas','https://m.media-amazon.com/images/I/61sZ-4dS+UL._AC_SL1500_.jpg'),(44,'ALI001','Croquetas para Perros','DogChow',4,'Carne, Cereales, Vitaminas','N/A','Seco','Bolsa de 5 kg','N/A','Alimentación diaria',100,1,25.00,28.00,'Croquetas nutritivas para perros adultos','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(45,'ALI002','Comida Húmeda para Gatos','Whiskas',4,'Pollo, Pescado, Vitaminas','N/A','Húmedo','Lata de 400 g','N/A','Alimentación diaria',150,2,2.50,3.00,'Comida húmeda para gatos','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(46,'ALI003','Snacks para Perros','Pedigree',4,'Carne, Cereales','N/A','Seco','Paquete de 200 g','N/A','Premios y entrenamiento',200,3,5.00,6.00,'Snacks para perros','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(47,'ALI004','Leche para Gatitos','CatMilk',4,'Leche, Vitaminas','N/A','Líquido','Botella de 250 ml','N/A','Suplemento alimenticio',80,4,3.50,4.00,'Leche especial para gatitos','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(48,'ALI005','Comida para Peces','AquaFood',4,'Pescado, Algas','N/A','Seco','Frasco de 100 g','N/A','Alimentación diaria',120,5,7.00,8.00,'Comida para peces tropicales','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(49,'ALI006','Alimento para Aves','BirdSeed',4,'Semillas, Frutas','N/A','Seco','Bolsa de 1 kg','N/A','Alimentación diaria',90,6,10.00,12.00,'Alimento para aves','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(50,'ALI007','Comida para Conejos','BunnyFood',4,'Heno, Vegetales','N/A','Seco','Bolsa de 2 kg','N/A','Alimentación diaria',70,7,15.00,18.00,'Comida para conejos','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(51,'ALI008','Snacks para Gatos','CatTreats',4,'Pescado, Pollo','N/A','Seco','Paquete de 100 g','N/A','Premios y entrenamiento',110,8,4.00,5.00,'Snacks para gatos','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(52,'ALI009','Alimento para Hamsters','HamsterMix',4,'Semillas, Frutas','N/A','Seco','Bolsa de 500 g','N/A','Alimentación diaria',60,9,6.00,7.00,'Alimento para hamsters','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(53,'ALI010','Comida para Tortugas','TurtleFood',4,'Pescado, Vegetales','N/A','Seco','Frasco de 200 g','N/A','Alimentación diaria',50,10,8.00,9.00,'Comida para tortugas','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(54,'ALI011','Alimento para Periquitos','ParakeetFood',4,'Semillas, Frutas','N/A','Seco','Bolsa de 1 kg','N/A','Alimentación diaria',100,1,10.00,12.00,'Alimento para periquitos','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(55,'ALI012','Comida para Hurones','FerretFood',4,'Carne, Cereales','N/A','Seco','Bolsa de 1 kg','N/A','Alimentación diaria',40,2,12.00,14.00,'Comida para hurones','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(56,'ALI013','Snacks para Conejos','BunnyTreats',4,'Frutas, Vegetales','N/A','Seco','Paquete de 150 g','N/A','Premios y entrenamiento',90,3,5.00,6.00,'Snacks para conejos','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png'),(57,'ALI014','Comida para Loros','ParrotFood',4,'Semillas, Frutas','N/A','Seco','Bolsa de 2 kg','N/A','Alimentación diaria',70,4,15.00,18.00,'Comida para loros','https://nutritecat.com/wp-content/uploads/2021/06/1-Empaque-v2.png');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_ventas`
--

DROP TABLE IF EXISTS `producto_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_ventas` (
  `id_producto` int NOT NULL,
  `id_venta` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_producto`,`id_venta`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `producto_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`),
  CONSTRAINT `producto_ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_ventas`
--

LOCK TABLES `producto_ventas` WRITE;
/*!40000 ALTER TABLE `producto_ventas` DISABLE KEYS */;
INSERT INTO `producto_ventas` VALUES (1,6,2),(1,7,2),(1,25,2),(2,6,1),(2,7,1),(2,25,1),(3,34,11),(3,36,12),(6,34,10),(6,35,10),(7,26,1),(7,32,1),(7,33,1),(8,26,5),(8,32,5),(8,33,5),(21,36,5),(37,36,8),(48,35,11);
/*!40000 ALTER TABLE `producto_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ruc` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `direccion` text,
  `referencia` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'1234567890','Proveedor Uno S.A.','Proveedor de productos veterinarios.','Calle Principal 123, Ciudad','Cerca del parque central.'),(2,'0987654321','Proveedor Dos Ltda.','Proveedor de alimentos para mascotas.','Avenida Secundaria 456, Ciudad','Frente a la plaza.'),(3,'1122334455','Proveedor Tres C.A.','Proveedor de accesorios para mascotas.','Boulevard Terciario 789, Ciudad','Junto a la estación de servicio.'),(4,'2233445566','Proveedor Cuatro S.A.','Proveedor de medicamentos veterinarios.','Carrera Cuarta 101, Ciudad','A la vuelta del supermercado.'),(5,'3344556677','Proveedor Cinco Ltda.','Proveedor de productos de higiene para mascotas.','Vía Quinta 202, Ciudad','Al lado del banco.'),(6,'4455667788','Proveedor Seis C.A.','Proveedor de suplementos alimenticios.','Calle Sexta 303, Ciudad','Cerca del centro comercial.'),(7,'5566778899','Proveedor Siete S.A.','Proveedor de juguetes para mascotas.','Avenida Séptima 404, Ciudad','Frente a la clínica veterinaria.'),(8,'6677889900','Proveedor Ocho Ltda.','Proveedor de equipos médicos veterinarios.','Boulevard Octavo 505, Ciudad','Junto al gimnasio.'),(9,'7788990011','Proveedor Nueve C.A.','Proveedor de productos premium para mascotas.','Carrera Novena 606, Ciudad','A la vuelta de la biblioteca.'),(10,'8899001122','Proveedor Diez S.A.','Proveedor de alimentos orgánicos para mascotas.','Vía Décima 707, Ciudad','Cerca del museo.');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta_cliente`
--

DROP TABLE IF EXISTS `tarjeta_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta_cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_titular` varchar(100) NOT NULL,
  `numero_tarjeta` varchar(16) NOT NULL,
  `codigo_seguridad` varchar(4) NOT NULL,
  `vencimiento` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta_cliente`
--

LOCK TABLES `tarjeta_cliente` WRITE;
/*!40000 ALTER TABLE `tarjeta_cliente` DISABLE KEYS */;
INSERT INTO `tarjeta_cliente` VALUES (7,'Juan Pérez','1234567812345678','123','2025-12-01'),(8,'Juan Pérez','1234567812345678','123','2025-12-01'),(26,'Juan Pérez','1234567812345678','123','2025-12-01'),(27,'Ana Gomez','5555666677778888','321','2023-09-01'),(33,'Ano Gomez','5555661677778888','321','2023-09-01'),(34,'Ano Gomez','5555661677778888','321','2023-09-01'),(37,'Sebastian Toro','8371781983122441','123','2024-07-24'),(38,'dEREK cHUQUIZALA','1234567894567891','123','2024-07-24'),(39,'Derek Chuquizala','1234567891234561','123','2024-07-10');
/*!40000 ALTER TABLE `tarjeta_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_de_compra` date NOT NULL,
  `idtarjeta_cliente` int DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idtarjeta_cliente` (`idtarjeta_cliente`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idtarjeta_cliente`) REFERENCES `tarjeta_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (6,'2024-07-25',7,150.00),(7,'2024-07-25',8,150.00),(25,'2024-07-25',26,150.00),(26,'2024-07-25',27,300.25),(32,'2024-07-25',33,300.25),(33,'2024-07-25',34,300.25),(34,'2024-07-25',37,319.50),(35,'2024-07-25',38,141.30),(36,'2024-07-25',39,581.40);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-26 17:32:18
