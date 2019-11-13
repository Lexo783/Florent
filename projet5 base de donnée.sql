--Exo1--

CREATE DATABASE projet5 CHARACTER SET 'utf8';

--Exo2--

CREATE USER 'hugo'@'192.168.43.223' IDENTIFIED BY 'coding';
GRANT ALL ON projet5.* TO 'hugo'@'192.168.43.223';
FLUSH PRIVILEGES;
(DROP USER 'hugo'@'192.168.43.223')

--Exo3--
CREATE TABLE IF NOT EXISTS Utilisateurs(
	Id_user int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    User_name varchar(20) NOT NULL,
    User_firstname varchar(20) NOT NULL,
 	User_email varchar(100) NOT NULL,
    User_phone varchar(10) NOT NULL,
    User_adresse varchar(100) NOT NULL,
 	User_code_postal varchar(5) NOT NULL,
    User_role VARCHAR(15) NOT NULL,
    User_password varchar(150) NOT NULL,    
 	PRIMARY KEY (Id_user)
	)
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS football_team(
	Id_team_f int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	Team_name VARCHAR(50) NOT NULL,
    Team_create DATE NOT NULL,
    Site_team VARCHAR(100) NOT NULL,
    PRIMARY KEY (Id_team_f)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS football_player(
	Id_player_f int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Name_player_f VARCHAR(20) NOT NULL,
    Firstname_player_f VARCHAR(20) NOT NULL,
    Age_player_f VARCHAR(2) NOT NULL,    
    J_id_team_f int(10) UNSIGNED NOT NULL,
    Titulaire_player_f VARCHAR(20) NOT NULL,
    FOREIGN KEY (J_id_team_f) REFERENCES football_team (Id_team_f) ON DELETE CASCADE ON UPDATE CASCADE, 
    PRIMARY KEY (Id_player_f)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS matchs_football(
	Id_match_f int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Date_match_f DATETIME NOT NULL,
    Id_team_inside_f int(10) UNSIGNED NOT NULL,
    Id_team_outside_f int(10) UNSIGNED NOT NULL,
    Nbr_but_inside_f int(10) UNSIGNED NOT NULL,
    Nbr_but_outside_f int(10) UNSIGNED NOT NULL,
    FOREIGN KEY (Id_team_inside_f) REFERENCES football_team (Id_team_f) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_team_outside_f) REFERENCES football_team (Id_team_f) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Id_match_f)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS players_tennis(
	Id_player_t int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Name_player_t VARCHAR(20) NOT NULL,
    Firstname_player_t VARCHAR(20) NOT NULL,
    Age_player_t VARCHAR(2) NOT NULL,    
    Nbr_medal_t VARCHAR(3),
    PRIMARY KEY (Id_player_t)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS matchs_tennis(
	Id_match_t int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Date_match_t DATETIME NOT NULL,
    Location_match_t VARCHAR(40) NOT NULL,
    Surface_t VARCHAR(30) NOT NULL,
    Id_first_player_t int(10) UNSIGNED NOT NULL,
    Id_secondary_player_t int(10) UNSIGNED NOT NULL,
    Speed_shot_first_player_t int(3) NOT NULL,
    Speed_shot_secondary_player_t int(3) NOT NULL,
    Speedrun_first_player_t int(2) NOT NULL,
    Speedrun_secondary_player_t int(2) NOT NULL,
    Result_match_t VARCHAR(1) NOT NULL,
	FOREIGN KEY (Id_first_player_t) REFERENCES players_tennis (Id_player_t) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_secondary_player_t) REFERENCES players_tennis (Id_player_t) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Id_match_t)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS chevaux_hippique(
	Id_horse int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Name_horse VARCHAR(70) NOT NULL,
    Age_horse int(2) NOT NULL,
    Picture_horse VARCHAR(100) NOT NULL,
    Date_veterinaire DATE NOT NULL,
    PRIMARY KEY (Id_horse)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS jockeys_hippique(
	Id_jockey int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Name_jockey VARCHAR(20) NOT NULL,
    Firstname_jockey VARCHAR(20) NOT NULL,
    Age_jockey int(2) NOT NULL,
    Weight_jockey int(3) NOT NULL,
    Id_horse_j int(10) UNSIGNED NOT NULL,
    FOREIGN KEY (Id_horse_j) REFERENCES chevaux_hippique (Id_horse) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Id_jockey)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS race_hippiques(
	Id_race int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Time_race DATETIME NOT NULL,
    Location_race VARCHAR(40) NOT NULL,
    Weather_race VARCHAR(20) NOT NULL,
    PRIMARY KEY (Id_race)
    )
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS classement_horse_race(
	Id_classement_h int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    Id_race_c int(10)UNSIGNED NOT NULL,
    Id_horse_c int(10)UNSIGNED NOT NULL,
    Classement_horse int(2) NOT NULL,
    Speed_horse int(3) NOT NULL,
    FOREIGN KEY (Id_race_c) REFERENCES race_hippiques (Id_race) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Id_horse_c) REFERENCES chevaux_hippique (Id_horse) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Id_classement_h)
    )
ENGINE=InnoDB;

--Exo4--
INSERT INTO `Utilisateurs`(`User_name`, `User_firstname`, `User_email`, `User_phone`, `User_adresse`, `User_code_postal`, `User_role`, `User_password`)
VALUES ("DEBUCHY","Florent","florent.debuchy@edu.itescia.fr","0634827604","45 rue des boustipailles","48370","Admin3","LemotDePasseCriptéSaMere")

INSERT INTO `Utilisateurs`(`User_name`, `User_firstname`, `User_email`, `User_phone`, `User_adresse`, `User_code_postal`, `User_role`, `User_password`)
VALUES ("MONNERIE","Hugo","hugo.monnerie@edu.itescia.fr","0647326669","82 chemin des grands chênes","39360","Admin","XXXXXXXXXX")

INSERT INTO `Utilisateurs`(`User_name`, `User_firstname`, `User_email`, `User_phone`, `User_adresse`, `User_code_postal`, `User_role`, `User_password`)
VALUES ("GRANDPIERRE","Andrian","Andrian.grandpierre@edu.itescia.fr","0611093245","28 chemin des grandes personnes","31820","Normale","ZZROT")

--Exo5--

INSERT INTO football_team(Team_name, Team_create, Site_team)
VALUES ('Casseurs Flowters', '2014-12-12', 'https://casseur-flowter.fr');

INSERT INTO football_team(Team_name, Team_create, Site_team) 
VALUES ('Pied ballon','2015-04-01','https://piedballon.fr');

INSERT INTO football_team(Team_name, Team_create, Site_team) 
VALUES ('Paris Saint-Germain','1970-06-12','https://psg.fr');

INSERT INTO football_team(Team_name, Team_create, Site_team)
VALUES ('Les Bizounours', '1980-06-14', 'https://bizounours.fr');

INSERT INTO football_team(Team_name, Team_create, Site_team)
VALUES ('Olypique de Marseille', '1899-06-31', 'https://om.fr');

INSERT INTO football_team(Team_name, Team_create, Site_team)
VALUES ('Olympique lyonnais', '1950-06-04', 'https://ol.fr');

--Exo6--

-- TEAM 1
INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('San', 'Orel', '37', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Dupond', 'Bernard', '25', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('San', 'Albert', '26', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Cérien', 'Jean', '37', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Tretien', 'Jean', '28', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Aïmar', 'Jean', '31', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Boréal', 'Aurore', '32', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Lavillan', 'Rose', '30', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Rible', 'Téo', '28', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Troajour', 'Adan', '22', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Ein', 'Jeff', '24', 1, 'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Croch','Sara','24',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Touille','Sacha','28',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Orlapydza','Jade','21',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Orkaéfcé','Jade','20',1,'remplaçant');

-- TEAM 2
INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Coptère','Élie','24',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Kedalcesoir','Énora','28',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Nouie','Éva','21',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('lepaké','Jamie','20',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('redemende','Jean','24',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Peuplu','Jean','28',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Hépipiholi','Jeff','21',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Hun','Jeff','25',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Nanasse','Judas','26',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('age','Karl','28',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Caille','Lara','31',2,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Golade','Larry','24',2,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Tatouille','Lara','28',2,'remplaçant');

-- TEAM 3
INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Navas','Keylor','32',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Bernat','Juan','26',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Corrêa','Marquinhos','25',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Silva','Thiago','35',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Meunier','Thomas','28',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Verrati','Marco','27',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Gueye','Idrissa','30',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Di maria','Angel','29',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Junior','Neymar','27',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('M’bappe','Kylian','20',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Icardi','Mauro','26',3,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Cavani','Edison','32',3,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Diallo','Abdou','26',3,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Draxler','Julian','27',3,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Kehrer','Thilo','22',3,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Kimpembe','Presnel','24',3,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Herrera','Ander','29',3,'remplaçant');


-- TEAM 4
INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Dépoin','Marc','24',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Dégouts','Roland','28',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Dissoire','Sam','21',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Ypontoise','Serge','20',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Houtan','Laurent','24',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Dycull','Thierry','28',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Tim','Vic','21',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Noisète','Lucas','25',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Sur','LucSur','26',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Ômaly','Anne','28',4,'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Cehef','Hassan','31',4,'titulaire');

-- TEAM 5
INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Payet', 'Dimitri', '32', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Thauvin', 'Florian', '26', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Benedetto', 'Albert', '26', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Cérien', 'Darío', '29', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Rongier', 'Valentin', '24', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('González Soberón', 'Álvaro', '29', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Lopez', 'Maxime', '21', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Strootman', 'Kevin', '29', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Mandanda', 'Steve', '34', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Germain', 'Valère', '29', 5, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Sakai', 'Hiroki', '29', 5, 'titulaire');

-- TEAM 6
INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('San', 'Orel', '37', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Dupond', 'Bernard', '25', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('San', 'Albert', '26', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Cérien', 'Jean', '37', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Tretien', 'Jean', '28', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Aïmar', 'Jean', '31', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Boréal', 'Aurore', '32', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Lavillan', 'Rose', '30', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Rible', 'Téo', '28', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Troajour', 'Adan', '22', 1, 'titulaire');

INSERT INTO `football_player` (`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Ein', 'Jeff', '24', 1, 'titulaire');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Croch','Sara','24',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Touille','Sacha','28',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Orlapydza','Jade','21',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Orkaéfcé','Jade','20',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Croch','Sara','24',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Touille','Sacha','28',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Orlapydza','Jade','21',1,'remplaçant');

INSERT INTO `football_player`(`Name_player_f`, `Firstname_player_f`, `Age_player_f`, `J_id_team_f`, `Titulaire_player_f`) 
VALUES ('Orkaéfcé','Jade','20',1,'remplaçant');

--Exo7--

-- TEAM 1
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-02-02’,1,3,2,1);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-06-11’,2,1,1,8);
-- TEAM 2
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-07-10’,5,2,0,3);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-09-14’,4,2,0,11);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-09-14’,2,5,4,3);
-- TEAM 3
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-06-14’,2,3,0,3);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-06-21’,3,2,10,4);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-06-21’,3,6,3,1);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-06-21’,6,3,1,3);
-- TEAM 4
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-09-14’,6,4,4,9);
-- TEAM 5
-- TEAM 6
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2011-02-10’,1,6,1,3);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-09-14’,2,6,3,4);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-09-14’,2,6,0,3);
INSERT INTO matchs_football(Date_match_f, Id_team_inside_f, Id_team_outside_f, Nbr_but_inside_f, Nbr_but_outside_f)
VALUES (‘2010-09-14’,5,6,4,5);

--Exo8--

INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Nadal’,‘Rafael’,33,84);
INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Djokovic’,‘Novak’,32,77);
INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Federer’,‘Roger’,38,103);
INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Medvedev’,‘Daniil’,23,7);
INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Thiem’,‘Dominic’,26,16);
INSERT INTO players_tennis(Name_player_t, Firstname_player_t, Age_player_t, Nbr_medal_t)
VALUES ( ‘Stéfanos’,‘Tsitsipas’,21,3);