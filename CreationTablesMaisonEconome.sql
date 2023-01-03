CREATE TABLE UTILISATEUR(
   userId INT AUTO_INCREMENT,
   userDate DATE,
   userState BOOLEAN,
   userIsAdmin BOOLEAN,
   userFirstname VARCHAR(50) ,
   userSurname VARCHAR(50) ,
   userBirth DATE,
   userGender BOOLEAN,
   userEmail VARCHAR(100) ,
   userTag VARCHAR(100) ,
   userPhone VARCHAR(20) ,
   PRIMARY KEY(userId),
   UNIQUE(userEmail),
   UNIQUE(userTag)
);

CREATE TABLE REGION(
   regionId INT AUTO_INCREMENT,
   regionLibelle VARCHAR(30) ,
   PRIMARY KEY(regionId)
);

CREATE TABLE TYPE_PIECE(
   typePieceId INT AUTO_INCREMENT,
   typePieceLibelle VARCHAR(50) ,
   PRIMARY KEY(typePieceId)
);

CREATE TABLE TYPE_APPARTEMENT(
   appartementTypeId INT AUTO_INCREMENT,
   appartementTypeLibelle VARCHAR(30) ,
   PRIMARY KEY(appartementTypeId)
);

CREATE TABLE SECURITY_APPARTEMENT(
   appartementSecurityId INT AUTO_INCREMENT,
   appartementSecurityLibelle VARCHAR(10) ,
   PRIMARY KEY(appartementSecurityId)
);

CREATE TABLE TYPE_EQUIPEMENT(
   typeEquipementId INT AUTO_INCREMENT,
   typeEquipementLibelle VARCHAR(25) ,
   PRIMARY KEY(typeEquipementId)
);

CREATE TABLE RESSOURCE(
   ressourceId INT AUTO_INCREMENT,
   ressourceLibelle VARCHAR(50) ,
   ressourceDescription VARCHAR(100) ,
   ressourceValMin DECIMAL(15,3)  ,
   ressourceValMax DECIMAL(15,3)  ,
   ressourceValCritique DECIMAL(15,3)  ,
   ressourceValIdeale DECIMAL(15,3)  ,
   PRIMARY KEY(ressourceId)
);

CREATE TABLE SUBSTANCE(
   substanceId INT AUTO_INCREMENT,
   substanceLibelle VARCHAR(50) ,
   substanceDescription VARCHAR(100) ,
   substanceValMin DECIMAL(15,3)  ,
   substanceValMax DECIMAL(15,3)  ,
   substanceValCritique DECIMAL(15,3)  ,
   substanceValIdeale DECIMAL(15,3)  ,
   PRIMARY KEY(substanceId)
);

CREATE TABLE FONCTIONNEMENT(
   fonctionnementDebut DATETIME,
   PRIMARY KEY(fonctionnementDebut)
);

CREATE TABLE DEPARTEMENT(
   departementId INT AUTO_INCREMENT,
   departementLibelle VARCHAR(30) ,
   regionId INT NOT NULL,
   PRIMARY KEY(departementId),
   FOREIGN KEY(regionId) REFERENCES REGION(regionId)
);

CREATE TABLE PIECE(
   pieceId INT AUTO_INCREMENT,
   pieceLibelle VARCHAR(50) ,
   typePieceId INT NOT NULL,
   PRIMARY KEY(pieceId),
   FOREIGN KEY(typePieceId) REFERENCES TYPE_PIECE(typePieceId)
);

CREATE TABLE EQUIPEMENT(
   equipementId INT AUTO_INCREMENT,
   equipementLibelle VARCHAR(50) ,
   equipementDescription VARCHAR(100) ,
   equipementVideo VARCHAR(200) ,
   typeEquipementId INT NOT NULL,
   PRIMARY KEY(equipementId),
   FOREIGN KEY(typeEquipementId) REFERENCES TYPE_EQUIPEMENT(typeEquipementId)
);

CREATE TABLE VILLE(
   villeId INT AUTO_INCREMENT,
   villeLibelle VARCHAR(50) ,
   departementId INT NOT NULL,
   PRIMARY KEY(villeId),
   FOREIGN KEY(departementId) REFERENCES DEPARTEMENT(departementId)
);

CREATE TABLE IMMEUBLE(
   immeubleId INT AUTO_INCREMENT,
   immeubleIsolation VARCHAR(50) ,
   immeubleEvalBase VARCHAR(50) ,
   immeubleNom VARCHAR(50) ,
   immeubleNumero VARCHAR(10) ,
   immeubleRue VARCHAR(50) ,
   immeubleCP CHAR(5) ,
   villeId INT NOT NULL,
   PRIMARY KEY(immeubleId),
   FOREIGN KEY(villeId) REFERENCES VILLE(villeId)
);

CREATE TABLE APPARTEMENT(
   appartementId INT AUTO_INCREMENT,
   immeubleId INT NOT NULL,
   appartementSecurityId INT NOT NULL,
   appartementTypeId INT NOT NULL,
   PRIMARY KEY(appartementId),
   FOREIGN KEY(immeubleId) REFERENCES IMMEUBLE(immeubleId),
   FOREIGN KEY(appartementSecurityId) REFERENCES SECURITY_APPARTEMENT(appartementSecurityId),
   FOREIGN KEY(appartementTypeId) REFERENCES TYPE_APPARTEMENT(appartementTypeId)
);

CREATE TABLE EstProprietaire(
   immeubleId INT,
   dateDebutPossession DATE,
   dateFinPossession DATE,
   userId INT NOT NULL,
   PRIMARY KEY(immeubleId, dateDebutPossession),
   FOREIGN KEY(immeubleId) REFERENCES IMMEUBLE(immeubleId),
   FOREIGN KEY(userId) REFERENCES UTILISATEUR(userId)
);

CREATE TABLE EstLocataire(
   appartementId INT,
   dateDebutLocation DATE,
   dateFinLocation DATE,
   appartementNbHabitant INT,
   userId INT NOT NULL,
   PRIMARY KEY(appartementId, dateDebutLocation),
   FOREIGN KEY(appartementId) REFERENCES APPARTEMENT(appartementId),
   FOREIGN KEY(userId) REFERENCES UTILISATEUR(userId)
);

CREATE TABLE AppartementContientPiece(
   appartementId INT,
   pieceId INT,
   PRIMARY KEY(appartementId, pieceId),
   FOREIGN KEY(appartementId) REFERENCES APPARTEMENT(appartementId),
   FOREIGN KEY(pieceId) REFERENCES PIECE(pieceId)
);

CREATE TABLE EquipementEstDansPiece(
   pieceId INT,
   equipementId INT,
   descriptionLieu VARCHAR(30) ,
   PRIMARY KEY(pieceId, equipementId),
   FOREIGN KEY(pieceId) REFERENCES PIECE(pieceId),
   FOREIGN KEY(equipementId) REFERENCES EQUIPEMENT(equipementId)
);

CREATE TABLE Consomme(
   equipementId INT,
   ressourceId INT,
   consommationHoraire DECIMAL(15,3)  ,
   PRIMARY KEY(equipementId, ressourceId),
   FOREIGN KEY(equipementId) REFERENCES EQUIPEMENT(equipementId),
   FOREIGN KEY(ressourceId) REFERENCES RESSOURCE(ressourceId)
);

CREATE TABLE Emet(
   equipementId INT,
   substanceId INT,
   emissionHoraire DECIMAL(15,3)  ,
   PRIMARY KEY(equipementId, substanceId),
   FOREIGN KEY(equipementId) REFERENCES EQUIPEMENT(equipementId),
   FOREIGN KEY(substanceId) REFERENCES SUBSTANCE(substanceId)
);

CREATE TABLE TypesPiecesConventionnement(
   typePieceId INT,
   appartementTypeId INT,
   PRIMARY KEY(typePieceId, appartementTypeId),
   FOREIGN KEY(typePieceId) REFERENCES TYPE_PIECE(typePieceId),
   FOREIGN KEY(appartementTypeId) REFERENCES TYPE_APPARTEMENT(appartementTypeId)
);

CREATE TABLE FonctionnementEquipement(
   equipementId INT,
   fonctionnementDebut DATETIME,
   fonctionnementFin DATETIME,
   PRIMARY KEY(equipementId, fonctionnementDebut),
   FOREIGN KEY(equipementId) REFERENCES EQUIPEMENT(equipementId),
   FOREIGN KEY(fonctionnementDebut) REFERENCES FONCTIONNEMENT(fonctionnementDebut)
);
