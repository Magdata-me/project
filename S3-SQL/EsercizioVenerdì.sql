-- Creazione della tabella Dipartimento
CREATE TABLE Dipartimento (
    id_dipartimento INT PRIMARY KEY,
    nome_dip VARCHAR(255),
    id_manager INT,
    id_location INT
);

-- Creazione della tabella Dipendente
CREATE TABLE Dipendente (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    cognome VARCHAR(255),
    email VARCHAR(255),
    numerotelefono VARCHAR(20),
    data_assunzione DATE,
    id_lavoro INT,
    salario DECIMAL(10, 2),
    id_manager INT,
    id_dipartimento INT);



    -- Inserimento di valori nella tabella Dipartimento
INSERT INTO Dipartimento (id_dipartimento, nome_dip, id_manager, id_location)
VALUES
    (1, 'Vendite', 101, 1),
    (2, 'Marketing', 102, 2),
    (3, 'Risorse Umane', 103, 1),
    (4, 'Amministrazione', 104, 3),
    (5, 'Produzione', 105, 2);
/*

| id_dipartimento | nome_dip         | id_manager | id_location |
|-----------------|------------------|------------|-------------|
| 1               | Vendite          | 101        | 1           |
| 2               | Marketing        | 102        | 2           |
| 3               | Risorse Umane    | 103        | 1           |
| 4               | Amministrazione  | 104        | 3           |
| 5               | Produzione       | 105        | 2           | */


-- Inserimento di valori nella tabella Dipendente
INSERT INTO Dipendente (id, nome, cognome, email, numerotelefono, data_assunzione, id_lavoro, salario, id_manager, id_dipartimento)
VALUES
    (101, 'Mario', 'Rossi', 'mario.rossi@email.com', '1234567890', '2017-01-15', 1, 50000.00, NULL, 1),
    (102, 'Laura', 'Bianchi', 'laura.bianchi@email.com', '9876543210', '2022-03-20', 2, 60000.00, 101, 2),
    (103, 'Luca', 'Verdi', 'luca.verdi@email.com', '5556667777', '2022-05-10', 1, 55000.00, 101, 1),
    (104, 'Giulia', 'Neri', 'giulia.neri@email.com', '1112223333', '2016-04-05', 3, 52000.00, 102, 3),
    (105, 'Paolo', 'Gialli', 'paolo.gialli@email.com', '9998887777', '2022-06-30', 2, 58000.00, 103, 1),
    (106, 'Sara', 'Marroni', 'sara.marroni@email.com', '3334445555', '2022-02-18', 4, 53000.00, 102, 4),
    (107, 'Alessio', 'Blu', 'alessio.blu@email.com', '7778889999', '2020-07-12', 3, 54000.00, 103, 2),
    (108, 'Martina', 'Viola', 'martina.viola@email.com', '6665554444', '2020-09-08', 1, 56000.00, 104, 5),
    (109, 'Giovanni', 'Arancio', 'giovanni.arancio@email.com', '2223334444', '2018-08-25', 2, 59000.00, 101, 3),
    (110, 'Elena', 'Rosa', 'elena.rosa@email.com', '4445556666', '2022-11-03', 4, 57000.00, 102, 4);


/*

| id  | nome      | cognome  | email                      | numerotelefono | data_assunzione | id_lavoro | salario   | id_manager | id_dipartimento |
|-----|-----------|----------|----------------------------|----------------|-----------------|-----------|-----------|------------|-----------------|
| 101 | Mario     | Rossi    | mario.rossi@email.com      | 1234567890     | 2022-01-15      | 1         | 50000.00  | NULL       | 1               |
| 102 | Laura     | Bianchi  | laura.bianchi@email.com    | 9876543210     | 2022-03-20      | 2         | 60000.00  | 101        | 2               |
| 103 | Luca      | Verdi    | luca.verdi@email.com       | 5556667777     | 2022-05-10      | 1         | 55000.00  | 101        | 1               |
| 104 | Giulia    | Neri     | giulia.neri@email.com      | 1112223333     | 2022-04-05      | 3         | 52000.00  | 102        | 3               |
| 105 | Paolo     | Gialli   | paolo.gialli@email.com     | 9998887777     | 2022-06-30      | 2         | 58000.00  | 103        | 1               |
| 106 | Sara      | Marroni  | sara.marroni@email.com     | 3334445555     | 2022-02-18      | 4         | 53000.00  | 102        | 4               |
| 107 | Alessio   | Blu      | alessio.blu@email.com      | 7778889999     | 2022-07-12      | 3         | 54000.00  | 103        | 2               |
| 108 | Martina   | Viola    | martina.viola@email.com    | 6665554444     | 2022-09-08      | 1         | 56000.00  | 104        | 5               |
| 109 | Giovanni  | Arancio  | giovanni.arancio@email.com | 2223334444     | 2022-08-25      | 2         | 59000.00  | 101        | 3               |
| 110 | Elena     | Rosa     | elena.rosa@email.com       | 4445556666     | 2022-11-03      | 4         | 57000.00  | 102        | 5               |

*/

#SELECT * FROM Dipartimento;

#SELECT * FROM Dipendente;
#Visualizzare la data di assunzione dei manager e i loro id appartenenti al dipartimento 
#’Amministrazione’ nel formato Nome mese, giorno, anno 
/*
SELECT Dipendente.cognome, DATE_FORMAT( Dipendente.data_assunzione , "%M %d %Y") 
 FROM Dipendente JOIN Dipartimento 
  ON Dipartimento.id_dipartimento = Dipendente.id_dipartimento  WHERE Dipendente.id_dipartimento = 4;
*/

/*
#2. Visualizzare il nome e il cognome dei dipendenti assunti nel mese di Giugno 
SELECT Dipendente.nome, Dipendente.cognome 
FROM Dipendente WHERE DATE_FORMAT(Dipendente.data_assunzione, "%m") = "06";*/
#--- alternativa Maco - SELECT MONTH("2017-06-15");


#3. Visualizzare gli anni in cui più di 10 dipendenti sono stati assunti
/*
SELECT DATE_FORMAT(Dipendente.data_assunzione, "%Y") AS conteggioANNI
FROM Dipendente
GROUP BY DATE_FORMAT(Dipendente.data_assunzione, "%Y") HAVING COUNT(*) > 5
    ;*/

#4. Visualizzare il nome del dipartimento, il nome del manager, il salario del manager 
#di tutti i manager la cui esperienza è maggiore di 5 anni

SELECT Dipartimento.nome_dip, Dipendente.nome , Dipendente.salario 
FROM Dipendente LEFT JOIN Dipartimento ON Dipartimento.id_manager = Dipendente.id_manager
WHERE DATEDIFF ("2023-12-22", Dipendente.data_assunzione) / 365 > 5;
    
#SOLUZIONE Marco del 4°
/*SELECT dipartimento.nome_dipartimento, Dipendente.nome AS Nome, Dipendente.salario
FROM Dipendente AS Dipendente
JOIN Dipartimento AS dipartimento ON Dipendente.id_dipartimento = dipartimento.id_dipartimento 
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(data_assunzione) >= 5;*/

/*SELECT COUNT(*) AS conteggioANNI
FROM Dipendente WHERE DATE_FORMAT(Dipendente.data_assunzione, "%Y") ;

/*
SELECT nome, COUNT(*) AS conteggio
FROM clienti
GROUP BY nome;

/* --- Soluzione Marco
SELECT DATE_FORMAT(data_assunzione, '%M %D, %Y') AS data_assunzione, id_dipartimento 
FROM Dipendente 
WHERE id_lavoro = 2 AND id_dipartimento = 2;*/

/*
3. Visualizzare gli anni in cui più di 10 dipendenti sono stati assunti 


SELECT DATE_FORMAT("2017-06-15", "%Y");
*/
