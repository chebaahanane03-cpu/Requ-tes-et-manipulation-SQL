CREATE DATABASE library;
USE library;

-- =====================
-- TABLE RAYON
-- =====================
CREATE TABLE rayon (
    rayon_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

-- =====================
-- TABLE AUTEUR
-- =====================
CREATE TABLE auteur (
    auteur_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL
);

-- =====================
-- TABLE LECTEUR
-- =====================
CREATE TABLE lecteur (
    lecteur_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    tel VARCHAR(15) NOT NULL UNIQUE,
    cin VARCHAR(8) NOT NULL UNIQUE
);

-- =====================
-- TABLE OUVRAGE
-- =====================
CREATE TABLE ouvrage (
    ouvrage_id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    annee_publication YEAR NOT NULL,
    rayon_id INT NOT NULL,
    FOREIGN KEY (rayon_id) REFERENCES rayon(rayon_id)
);

-- =====================
-- TABLE ASSOCIATION OUVRAGE / AUTEUR
-- =====================
CREATE TABLE ouvrage_auteur (
    ouvrage_id INT,
    auteur_id INT,
    PRIMARY KEY (ouvrage_id, auteur_id),
    FOREIGN KEY (ouvrage_id) REFERENCES ouvrage(ouvrage_id),
    FOREIGN KEY (auteur_id) REFERENCES auteur(auteur_id)
);

-- =====================
-- TABLE EMPRUNT
-- =====================
CREATE TABLE emprunt (
    emprunt_id INT AUTO_INCREMENT PRIMARY KEY,
    date_emprunt DATE NOT NULL DEFAULT CURRENT_DATE,
    date_retour_prevue DATE NOT NULL,
    date_retour_effective DATE NULL,
    lecteur_id INT NOT NULL,
    ouvrage_id INT NOT NULL,
    FOREIGN KEY (lecteur_id) REFERENCES lecteur(lecteur_id),
    FOREIGN KEY (ouvrage_id) REFERENCES ouvrage(ouvrage_id)
);

-- =====================
-- TABLE PERSONNEL
-- =====================
CREATE TABLE personnel (
    personnel_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    tel VARCHAR(15) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    chef_id INT NULL,
    FOREIGN KEY (chef_id) REFERENCES personnel(personnel_id)
);

select * from rayon ;

select nom , prènom
 from auteur ;

select titre , annee_publication
 from ouvrage ;

select nom , prènom , email
 from lecteur ;

select annee_publication
 from ouvrage ; 
where annee_publication > 1950 ;

select nom
 from lecteur ;
where nom lik "M%" ;

select titre , annee_publication
from ouvrage
ORDER by annee_publication DESC ;

select *
 from emprunt
  where data_rotour_effective IS NULL

select 0.titre , M.nom
from auvrage 0
JOIN rayon r ONO.rayon_id = r.rayon_id

select 0.titre , a.nom , a.prenom
from ouvrage 0
JOIN ouvrage_auteur Oa ONO.O.ouvrage_id = Oa.ouvrage_id ;
JOIN auteur a ON Oa.auteur_id = a.auteur_id ;

select DTSTINCT p.nom,l.prenom 
from lecteur
JOIN emprunt e ON l.lecteur_id = e.lecteur_id ;

select r.nom, COUNT(o.ouvrage_id) AS nombre_ouvrages
from rayon r
LEFT JOIN ouvrage o ON r.rayon_id = o.rayon_id
GROUP by . r.nom

UPDATE lecteur
set email = 'nouveau_email@gmail.com'
where lecteur_id = 1 ;

UPDATE lecteur
set tel '0631205121'
where cin 'k512082';

UPDATE ouvrage 
set rayon_id = 2 
where ouvrage_id = 10 ;

UPDATE emprunt
set date_retour_effective = CURRENT_DATE
where emprunt_id = 5 ;

UPDATE personnel 
set chef_id = 3
where personnel_id = 8;

DELETE from emprunt
where emprunt_id = 4;

DELETE from lecteur
where lecteur_id NOT in 
( select DTSTINCT lecteur_id 
from emprunt) ;

DELETE from ouvrage
where ouvrage_id NOT in 
(select DTSTINCT ouvrage_id 
from emprunt) ;



