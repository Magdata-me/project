#ESERCITAZIONE STEFANETTI 8/1/23


#1.Creazione delle tabelle
/*CREATE TABLE IF NOT EXISTS vendite (
  id_transazione INT PRIMARY KEY,
  categoria_prodotto VARCHAR (40),
  prezzo_vendita DECIMAL(6,2) ,
  sconto_xcento int
  );

CREATE TABLE IF NOT EXISTS dettagli_vendite (
  id_transazione INT PRIMARY KEY,
  data_transazione TIMESTAMP,
  quantita INT
  ); */

#2.Popolare le tabelle
#Ho svolto l'esercizio su beekeper e ho esportato la tabella come csv in alternativa allego anche gli screenshot delle tabelle vendite e dettagli_vendite


/*
#3. Query Semplici: •Seleziona tutte le vendite avvenute in una specifica data. 
SELECT *
FROM dettagli_vendite
WHERE DATE
(data_transazione) = "2023-10-02";


#Elenco delle vendite con sconti maggiori del 50%.
/*
SELECT *
FROM vendite
WHERE sconto_xcento > 50;
*/

#4. Aggregazione dei Dati: •Calcola il totale delle vendite per categoria. 
/*
SELECT categoria_prodotto, SUM(prezzo_vendita) AS vendite_per_categoria
FROM vendite
GROUP BY categoria_prodotto;
*/

#Trova il numero totale di prodotti venduti per ogni categoria. 
/*

SELECT categoria_prodotto, SUM(quantita) AS totale_prodotti
FROM vendite JOIN dettagli_vendite on vendite.id_transazione = dettagli_vendite.id_transazione
GROUP BY categoria_prodotto;
*/
#5. Funzioni di Data: •Seleziona le vendite dell'ultimo trimestre.
/*
SELECT *
FROM vendite JOIN dettagli_vendite on vendite.id_transazione = dettagli_vendite.id_transazione
WHERE YEAR(data_transazione) = 2023
AND QUARTER(data_transazione) = 4;
*/

#6.Raggruppa le vendite per mese e calcola il totale delle vendite per ogni mese. 
/*
SELECT YEAR(data_transazione) AS Anno, MONTHNAME(data_transazione) AS Mese, SUM(prezzo_vendita) AS vendite_mensili
FROM vendite JOIN dettagli_vendite on vendite.id_transazione = dettagli_vendite.id_transazione
GROUP BY YEAR(data_transazione), MONTH(data_transazione)
ORDER BY vendite_mensili desc;
*/

#7. Analisi degli Sconti: •Trova la categoria con lo sconto medio più alto. 
/*
SELECT categoria_prodotto, AVG(sconto_xcento) AS sconto_medio
FROM vendite
GROUP BY categoria_prodotto
ORDER BY sconto_medio desc limit 1; 29.4 per le tshirt
*/

#8. Variazioni delle Vendite: •Confronta le vendite mese per mese per vedere l'incremento o il decremento delle vendite. Calcola l’incremento o decremento mese per mese
/*
CREATE VIEW vista_vendite_mese AS
SELECT YEAR(data_transazione) AS Anno,
       MONTH(data_transazione) AS Mese,
       SUM(prezzo_vendita) AS Vendite_mese
FROM vendite JOIN dettagli_vendite on vendite.id_transazione = dettagli_vendite.id_transazione
GROUP BY YEAR(data_transazione), MONTH(data_transazione)
ORDER BY Mese ASC;


SELECT
    Anno,
    Mese,
    Vendite_mese,
    Vendite_mese - LAG(Vendite_mese) OVER (ORDER BY Mese) AS DifferenzaMesePerMese
FROM
    vista_vendite_mese
WHERE
    Anno = 2023

*/

#9. Analisi Stagionale: •Confronta le vendite totali in diverse stagioni. 
/*
SELECT
    CASE 
        WHEN MONTH(data_transazione) BETWEEN 3 AND 5 THEN 'Primavera'
        WHEN MONTH(data_transazione) BETWEEN 6 AND 8 THEN 'Estate'
        WHEN MONTH(data_transazione) BETWEEN 9 AND 11 THEN 'Autunno'
        ELSE 'Inverno' END AS stagioni,
           SUM(prezzo_vendita) AS Vendite
FROM vendite JOIN dettagli_vendite on vendite.id_transazione = dettagli_vendite.id_transazione
GROUP BY Stagioni;
*/
#stagioni più precise
/*
SELECT
    CASE 
        WHEN (MONTH(data_transazione) = 3 AND DAY(data_transazione) >= 20) OR 
             (MONTH(data_transazione) > 3 AND MONTH(data_transazione) < 6) OR 
             (MONTH(data_transazione) = 6 AND DAY(data_transazione) <= 20) THEN 'Primavera'
             
        WHEN (MONTH(data_transazione) = 6 AND DAY(data_transazione) >= 21) OR 
             (MONTH(data_transazione) > 6 AND MONTH(data_transazione) < 9) OR 
             (MONTH(data_transazione) = 9 AND DAY(data_transazione) < 21) THEN 'Estate'
             
        WHEN (MONTH(data_transazione) = 9 AND DAY(data_transazione) >= 22) OR 
             (MONTH(data_transazione) > 9 AND MONTH(data_transazione) < 12) OR 
             (MONTH(data_transazione) = 12 AND DAY(data_transazione) < 21) THEN 'Autunno'
             
        ELSE 'Inverno' END AS Stagione,
    SUM(prezzo_vendita) AS Vendite
FROM vendite JOIN dettagli_vendite on vendite.id_transazione = dettagli_vendite.id_transazione
GROUP BY Stagione;
*/


#10. Clienti Fedeli: •Supponendo di avere una tabella clienticon i campi IDClientee IDVendita, scrivi una query per trovare i top 5 clienti con il maggior numero di acquisti.

/*
CREATE TABLE IF NOT EXISTS clienti (
    id_cliente INT,
    id_vendita INT
);
*/
#in base all numero di transazioni effettuate   
/*
SELECT id_cliente, COUNT(id_vendita) AS NumeroAcquisti
FROM clienti JOIN dettagli_vendite on dettagli_vendite.id_transazione= clienti.id_vendita
GROUP BY id_cliente
ORDER BY NumeroAcquisti DESC
LIMIT 5;
*/
#-- in base all'importo speso
/*
SELECT id_cliente, SUM(prezzo_vendita) AS totale_speso
FROM clienti JOIN vendite on vendite.id_transazione= clienti.id_vendita
GROUP BY id_cliente
ORDER BY totale_speso DESC
LIMIT 5;

*/


#BONUS QUERY : creo una Tabella marketing dove metto gli id cliente, la città di provenienza, la mail e i valori 0 e 1 se la mail è stata letta o meno, 1 email letta
/*
CREATE TABLE if not exists marketing (
    citta VARCHAR(50),
    id_cliente INT primary key,
    mail VARCHAR(100),
    apertura_mail INT
);
*/
#voglio dapprima sapere quale è stata la città con più apertura mail
/*
SELECT
    citta,
    COUNT(*) AS N_Email_Lette
FROM
    marketing
WHERE
    apertura_mail = 1
GROUP BY
    citta
ORDER BY
    N_Email_Lette DESC
;
*/

# Voglio sapere la campagna marketing che mi ha dato maggior risultato in termini di vendite. è stata Bologna
/*
SELECT
    m.citta,
    SUM(v.prezzo_vendita) AS GuadagnoTotale
FROM
    marketing m
JOIN
    clienti c ON m.id_cliente = c.id_cliente
JOIN
    vendite v ON c.id_vendita = v.id_transazione
GROUP BY
    m.citta
ORDER BY
    GuadagnoTotale DESC
;
*/
