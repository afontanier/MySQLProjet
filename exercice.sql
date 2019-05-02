CREATE DATABASE salleDeCinema;
  USE salleDeCinema;

CREATE TABLE Films (
    Code INTEGER PRIMARY KEY NOT NULL ,
    Titre TEXT NOT NULL ,
    Note TEXT
  );

  CREATE TABLE salleDeCinema (
    Code INTEGER PRIMARY KEY NOT NULL ,
    Nom TEXT NOT NULL ,
    Film INTEGER,
      FOREIGN KEY (Film) REFERENCES Films(Code)
  );

INSERT INTO Films(Code,Titre,Note) VALUES(9,'Citizen King','G');
INSERT INTO Films(Code,Titre,Note) VALUES(1,'Citizen Kane','PG');
INSERT INTO Films(Code,Titre,Note) VALUES(2,'Singin in the Rain','G');
INSERT INTO Films(Code,Titre,Note) VALUES(3,'Le magicien dOz','G');
INSERT INTO Films(Code,Titre,Note) VALUES(4,'The Quiet Man',NULL);
INSERT INTO Films(Code,Titre,Note) VALUES(5,'North by Northwest',NULL);
INSERT INTO Films(Code,Titre,Note) VALUES(6,'Le dernier tango à Paris','NC-17');
INSERT INTO Films(Code,Titre,Note) VALUES(7,'Certains laiment chaud','PG-13');
INSERT INTO Films(Code,Titre,Note) VALUES(8,'Une nuit à lopéra',NULL);

INSERT INTO salleDeCinema(Code,Nom,Film) VALUES(1,'Odeon',5);
INSERT INTO salleDeCinema(Code,Nom,Film) VALUES(2,'Impérial',1);
INSERT INTO salleDeCinema(Code,Nom,Film) VALUES(3,'Majestic',NULL);
INSERT INTO salleDeCinema(Code,Nom,Film) VALUES(4,'Royale',6);
INSERT INTO salleDeCinema(Code,Nom,Film) VALUES(5,'Paraiso',3);
INSERT INTO salleDeCinema(Code,Nom,Film) VALUES(6,'Nickelodeon',NULL);

/*1*/
SELECT Titre
FROM Films;
/*2*/
SELECT DISTINCT Note
FROM Films;
/*3*/
SELECT Titre
FROM Films
WHERE Note IS NULL;
/*4*/
SELECT *
FROM salleDeCinema
WHERE Film IS NULL;
/*5*/
SELECT *
FROM salleDeCinema
LEFT JOIN Films F on salleDeCinema.Film = F.Code;
/*6*/
SELECT *
FROM Films
LEFT JOIN salleDeCinema Cinema on Films.Code = Cinema.Film;
/*7*/
SELECT Titre
FROM Films
WHERE Code NOT IN (SELECT Film FROM salleDeCinema
WHERE Film IS NOT NULL );
/*8*/
INSERT INTO Films VALUES (10,'Un Deux Trois',NULL);
/*9*/
UPDATE Films
SET Note='G'
WHERE Note IS NULL;
/*10*/
DELETE FROM salleDeCinema
WHERE Film IN (SELECT Code FROM Films
WHERE Note='NC-17');


