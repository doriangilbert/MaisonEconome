DROP DATABASE IF EXISTS maisoneconome;

CREATE DATABASE maisoneconome DEFAULT CHARACTER SET utf8;

USE maisoneconome;

CREATE TABLE UTILISATEUR(
   userId INT AUTO_INCREMENT,
   userDate DATE,
   userState BOOLEAN,
   userIsAdmin BOOLEAN,
   userFirstname VARCHAR(50),
   userSurname VARCHAR(50),
   userBirth DATE,
   userGender BOOLEAN,
   userEmail VARCHAR(100),
   userTag VARCHAR(100),
   userPhone VARCHAR(20),
   userPassword VARCHAR(100),
   PRIMARY KEY(userId),
   UNIQUE(userEmail),
   UNIQUE(userTag)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE REGION(
   regionId INT AUTO_INCREMENT,
   regionLibelle VARCHAR(30),
   PRIMARY KEY(regionId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE TYPE_PIECE(
   typePieceId INT AUTO_INCREMENT,
   typePieceLibelle VARCHAR(50),
   PRIMARY KEY(typePieceId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE TYPE_APPARTEMENT(
   appartementTypeId INT AUTO_INCREMENT,
   appartementTypeLibelle VARCHAR(30),
   PRIMARY KEY(appartementTypeId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE SECURITY_APPARTEMENT(
   appartementSecurityId INT AUTO_INCREMENT,
   appartementSecurityLibelle VARCHAR(10),
   PRIMARY KEY(appartementSecurityId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE TYPE_EQUIPEMENT(
   typeEquipementId INT AUTO_INCREMENT,
   typeEquipementLibelle VARCHAR(25),
   equipementVideo VARCHAR(50),
   PRIMARY KEY(typeEquipementId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE RESSOURCE(
   ressourceId INT AUTO_INCREMENT,
   ressourceLibelle VARCHAR(50),
   ressourceDescription VARCHAR(100),
   ressourceValMin DECIMAL(15, 3),
   ressourceValMax DECIMAL(15, 3),
   ressourceValCritique DECIMAL(15, 3),
   ressourceValIdeale DECIMAL(15, 3),
   PRIMARY KEY(ressourceId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE SUBSTANCE(
   substanceId INT AUTO_INCREMENT,
   substanceLibelle VARCHAR(50),
   substanceDescription VARCHAR(100),
   substanceValMin DECIMAL(15, 3),
   substanceValMax DECIMAL(15, 3),
   substanceValCritique DECIMAL(15, 3),
   substanceValIdeale DECIMAL(15, 3),
   PRIMARY KEY(substanceId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE DEPARTEMENT(
   departementId INT AUTO_INCREMENT,
   departementLibelle VARCHAR(30),
   departementCode VARCHAR(5),
   regionId INT NOT NULL,
   PRIMARY KEY(departementId),
   FOREIGN KEY(regionId) REFERENCES REGION(regionId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE PIECE(
   pieceId INT AUTO_INCREMENT,
   pieceLibelle VARCHAR(50),
   typePieceId INT NOT NULL,
   PRIMARY KEY(pieceId),
   FOREIGN KEY(typePieceId) REFERENCES TYPE_PIECE(typePieceId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE EQUIPEMENT(
   equipementId INT AUTO_INCREMENT,
   equipementLibelle VARCHAR(50),
   equipementDescription VARCHAR(100),
   descriptionLieu VARCHAR(50),
   pieceId INT,
   typeEquipementId INT NOT NULL,
   PRIMARY KEY(equipementId),
   FOREIGN KEY(pieceId) REFERENCES PIECE(pieceId),
   FOREIGN KEY(typeEquipementId) REFERENCES TYPE_EQUIPEMENT(typeEquipementId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE VILLE(
   villeId INT AUTO_INCREMENT,
   villeLibelle VARCHAR(50),
   departementId INT NOT NULL,
   PRIMARY KEY(villeId),
   FOREIGN KEY(departementId) REFERENCES DEPARTEMENT(departementId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IMMEUBLE(
   immeubleId INT AUTO_INCREMENT,
   immeubleIsolation VARCHAR(50),
   immeubleEvalBase VARCHAR(50),
   immeubleNom VARCHAR(50),
   immeubleNumero VARCHAR(10),
   immeubleRue VARCHAR(50),
   immeubleCP CHAR(5),
   villeId INT NOT NULL,
   PRIMARY KEY(immeubleId),
   FOREIGN KEY(villeId) REFERENCES VILLE(villeId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE APPARTEMENT(
   appartementId INT AUTO_INCREMENT,
   immeubleId INT NOT NULL,
   appartementSecurityId INT NOT NULL,
   appartementTypeId INT NOT NULL,
   PRIMARY KEY(appartementId),
   FOREIGN KEY(immeubleId) REFERENCES IMMEUBLE(immeubleId),
   FOREIGN KEY(appartementSecurityId) REFERENCES SECURITY_APPARTEMENT(appartementSecurityId),
   FOREIGN KEY(appartementTypeId) REFERENCES TYPE_APPARTEMENT(appartementTypeId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE EstProprietaire(
   immeubleId INT,
   dateDebutPossession DATE,
   dateFinPossession DATE,
   userId INT NOT NULL,
   PRIMARY KEY(immeubleId, dateDebutPossession),
   FOREIGN KEY(immeubleId) REFERENCES IMMEUBLE(immeubleId),
   FOREIGN KEY(userId) REFERENCES UTILISATEUR(userId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE EstLocataire(
   appartementId INT,
   dateDebutLocation DATE,
   dateFinLocation DATE,
   appartementNbHabitant INT,
   userId INT NOT NULL,
   PRIMARY KEY(appartementId, dateDebutLocation),
   FOREIGN KEY(appartementId) REFERENCES APPARTEMENT(appartementId),
   FOREIGN KEY(userId) REFERENCES UTILISATEUR(userId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE AppartementContientPiece(
   appartementId INT,
   pieceId INT,
   PRIMARY KEY(appartementId, pieceId),
   FOREIGN KEY(appartementId) REFERENCES APPARTEMENT(appartementId),
   FOREIGN KEY(pieceId) REFERENCES PIECE(pieceId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE Consomme(
   equipementId INT,
   ressourceId INT,
   consommationHoraire DECIMAL(15, 3),
   PRIMARY KEY(equipementId, ressourceId),
   FOREIGN KEY(equipementId) REFERENCES EQUIPEMENT(equipementId),
   FOREIGN KEY(ressourceId) REFERENCES RESSOURCE(ressourceId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE Emet(
   equipementId INT,
   substanceId INT,
   emissionHoraire DECIMAL(15, 3),
   PRIMARY KEY(equipementId, substanceId),
   FOREIGN KEY(equipementId) REFERENCES EQUIPEMENT(equipementId),
   FOREIGN KEY(substanceId) REFERENCES SUBSTANCE(substanceId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE TypesPiecesConventionnement(
   typePieceId INT,
   appartementTypeId INT,
   quantiteMin TINYINT,
   PRIMARY KEY(typePieceId, appartementTypeId),
   FOREIGN KEY(typePieceId) REFERENCES TYPE_PIECE(typePieceId),
   FOREIGN KEY(appartementTypeId) REFERENCES TYPE_APPARTEMENT(appartementTypeId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE FonctionnementEquipement(
   equipementId INT,
   fonctionnementDebut DATETIME,
   fonctionnementFin DATETIME,
   PRIMARY KEY(equipementId, fonctionnementDebut),
   FOREIGN KEY(equipementId) REFERENCES EQUIPEMENT(equipementId)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;