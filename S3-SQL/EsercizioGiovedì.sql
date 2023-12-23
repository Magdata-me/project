CREATE TABLE DISCO (
    NroSerie INT PRIMARY KEY,
    TitoloAlbum VARCHAR(100),
    Anno INT,
    Prezzo DECIMAL(8, 2));

CREATE TABLE CONTIENEX
    (NroSerieDisco INTEGER PRIMARY KEY,
    CodiceReg INT,
    NroProg INT);

CREATE TABLE ESECUZIONE (
    CodiceReg INTEGER PRIMARY KEY,
    TitoloCanz VARCHAR(100),
    Anno INTEGER
    
    );

CREATE TABLE AUTORE (
    Nome VARCHAR(100) PRIMARY KEY,
    TitoloCanzone VARCHAR(100)

);

CREATE TABLE CANTANTE (
    NomeCantante VARCHAR(100) PRIMARY KEY,
    CodiceReg INT

);

-- Inserimento dati nella tabella DISCO
INSERT INTO DISCO (NroSerie, TitoloAlbum, Anno, Prezzo)
VALUES
    (1, 'Inverno Oscuro', 2022, 27.50),
    (2, 'Viaggiatore Senza Meta', 2021, 22.99),
    (3, 'Riflessi Notturni', 2023, 25.00),
    (4, 'Luci Lontane', 2020, 20.75),
    (5, 'Sogni Infranti', 2022, 23.00),
    (6, 'Echi Dimenticati', 2021, 24.25),
    (7, 'Sospiri nel Vento', 2019, 28.99),
    (8, 'Frammenti di Emozioni', 2020, 26.50),
    (9, 'Versi Confusi', 2023, 29.00),
    (10, 'Ombre Incerte', 2021, 21.99);

-- Inserimento dati nella tabella CONTIENEX
INSERT INTO CONTIENEX (NroSerieDisco, CodiceReg, NroProg)
VALUES
    (1, 201, 1),
    (2, 216, 1),
    (3, 203, 1),
    (4, 204, 1),
    (5, 205, 1),
    (6, 206, 1),
    (7, 207, 1),
    (8, 208, 1),
    (9, 209, 1),
    (10, 210, 1);

#-- Inserimento dati nella tabella ESECUZIONE
INSERT INTO ESECUZIONE (CodiceReg, TitoloCanz, Anno)
VALUES
    (201, 'Umpa lumpa', 2022),
    (202, 'Viaggio Interiore', 2021),
    (203, 'Luci dellAnima', 2023),
    (204, 'Riflessi Nel Buio', 2020),
    (205, 'Sogni Infranti', NULL),
    (206, 'miraggi', 2021),
    (207, 'Ventagli di Vento', 2019),
    (208, 'Frammenti di Passato', 2020),
    (209, 'Versi Sconosciuti', NULL),
    (210, 'Ombre Incerte', 2021);

-- Inserimento dati nella tabella AUTORE
INSERT INTO AUTORE (Nome, TitoloCanzone)
VALUES
    ('davive', 'Sussurri Notturni'),
    ('ligabue', 'Viaggio Interiore'),
    ('luciano', 'Luci dellAnima'),
    ('calcutta', 'Riflessi Nel Buio'),
    ('883', 'Sogni Infranti'),
    ('giorgia', 'Echi Dimenticati'),
    ('samuele bersani', 'Ventagli di Vento'),
    ('daftpunk', 'Frammenti di Passato'),
    ('fabri fibra', 'Versi Sconosciuti'),
    ('alex britti', 'Ombre Incerte');

-- Inserimento dati nella tabella CANTANTE
INSERT INTO CANTANTE (NomeCantante, CodiceReg)
VALUES
    ('tiziano ferro', 201),
    ('ligabue', 202),
    ('baustelle', 203),
    ('elisa', 204),
    ('alex britti', 205),
    ('daftpunk', 206),
    ('883', 207),
    ('donatella', 208),
    ('fabri fibra', 209),
    ('samuele bersani', 210);

/*
1. I cantautori (persone che hanno cantato e scritto la stessa canzone) il cui nome inizia per 'D’;
2. I titoli dei dischi che contengono canzoni di cui non si conosce l'anno di registrazione; 
*/

#SELECT * FROM CANTANTE;
#seleziona le cose che voglio da unione delle tabelle

/*SELECT AUTORE.Nome FROM AUTORE JOIN CANTANTE ON AUTORE.Nome = CANTANTE.NomeCantante 
    WHERE AUTORE.Nome LIKE "D%";*/


/* #formula unione
SELECT Nome
FROM AUTORE
WHERE Nome LIKE 'D%'
UNION
SELECT NomeCantante
FROM CANTANTE
WHERE NomeCantante LIKE 'D%'; */

/*
SELECT DISCO.TitoloAlbum FROM DISCO JOIN CONTIENEX ON CONTIENEX.NroSerieDisco = DISCO.NroSerie
JOIN ESECUZIONE ON CONTIENEX.CodiceReg = ESECUZIONE.CodiceReg WHERE ESECUZIONE.anno IS NULL; */


/*
select NomeCantante
from CANTANTE JOIN ESECUZIONEX ON
CANTANTE.CodiceReg=ESECUZIONEX.CodiceReg
join AUTORE on ESECUZIONEX.TitoloCanz=AUTORE.TitoloCanzone
where Nome=NomeCantante and Nome like 'D%';





