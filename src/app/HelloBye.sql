
USE consilia_jobcandidat;

-- --------------------------------------------------------
-- Créer la table des utilisateurs
CREATE TABLE users (
id_user  INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nom VARCHAR(255),
prenom VARCHAR(255),
mail VARCHAR(255)
) ;
ALTER TABLE users AUTO_INCREMENT=1;

-- --------------------------------------------------------
-- Créer la table des ressources humaines (niveau ) 
CREATE TABLE rh_compte (
id_rh  INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
mdp VARCHAR(30),
intitule_poste VARCHAR(255),
FOREIGN KEY (id_rh)  
REFERENCES users (id_user)
) ;
ALTER TABLE rh_compte AUTO_INCREMENT=1;

-- --------------------------------------------------------
-- Créer la table des super admins -- à revoir avec Hamza 
CREATE TABLE admin_compte (
id_admin  INT NOT NULL,
FOREIGN KEY (id_admin) 
REFERENCES rh_compte (id_rh)
) ;

-- --------------------------------------------------------
-- Créer la table des futurs chômeurs  
CREATE TABLE candidat (
id_candidat  INT NOT NULL,
situation VARCHAR(4),
date_de_naissance DATE,
mail VARCHAR(30),
num LONG,
linkedin_link VARCHAR(255),
FOREIGN KEY (id_candidat )  
REFERENCES users (id_user)
) ;

-- --------------------------------------------------------
-- Créer la table prérequis  
CREATE TABLE prerequis (
id_prerequis INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
type_ VARCHAR (255),
libelle_prerequis VARCHAR (255) -- niveau études....bac 
) ;
ALTER TABLE prerequis AUTO_INCREMENT=1;

-- --------------------------------------------------------
-- Créer la table offre 
CREATE TABLE offre (
id_offre  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_rh INT NOT NULL,
FOREIGN KEY (id_rh )  
REFERENCES rh_compte (id_rh ),
titre_offre VARCHAR(255),
missions VARCHAR(1000),
date_de_publication DATE,
statut_offre VARCHAR(10) 
) ;
ALTER TABLE offre AUTO_INCREMENT=1;

-- --------------------------------------------------------
-- Créer la table prérequis offre 
CREATE TABLE prerequis_offre (
id_prerequis INT NOT NULL,
id_offre INT NOT NULL,
FOREIGN KEY (id_prerequis )  
REFERENCES prerequis (id_prerequis),
FOREIGN KEY ( id_offre )  
REFERENCES  offre ( id_offre)
) ;

-- --------------------------------------------------------
-- Créer la table candidature
CREATE TABLE candidature (
id_candidat INT NOT NULL,
id_offre INT NOT NULL,
FOREIGN KEY ( id_candidat )  
REFERENCES  users (id_user ),
FOREIGN KEY ( id_offre )  
REFERENCES  offre ( id_offre),
date_de_candidature DATE,
cv BLOB, 
lettre_de_motivation BLOB,
statut_candidature VARCHAR(10) -- vue, refusée....
) ;

-- --------------------------------------------------------
-- Créer la table avantages
CREATE TABLE avantages (
id_avantage  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
libelle_avantage VARCHAR(255)
) ;
ALTER TABLE avantages AUTO_INCREMENT=1;

-- --------------------------------------------------------
-- Créer la table avantage_offre
CREATE TABLE avantage_offre (
id_avantage INT NOT NULL,
id_offre INT NOT NULL,
FOREIGN KEY ( id_avantage )  
REFERENCES  avantages (id_avantage ),
FOREIGN KEY ( id_offre )  
REFERENCES  offre ( id_offre)
) ;



-- Insérer un nouvel utilisateur dans la table des RH

INSERT INTO users (nom,prenom,mail) VALUES("Badis","tig","pjigdf@dgljl.com");
SELECT  * FROM users ;
INSERT INTO rh_compte (id_rh,mdp,intitule_poste) VALUES(1,"123456","stagiare");
SELECT  * FROM rh_compte ;
SELECT * FROM users WHERE id_user =1;
SELECT * FROM rh_compte WHERE id_rh =1;