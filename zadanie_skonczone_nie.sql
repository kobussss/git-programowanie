SHOW DATABASES;
SELECT*FROM infs_kaczanw;
CREATE TABLE pracownik (
	id_pracownika INT PRIMARY KEY,
    imie VARCHAR(40) NOT NULL,
    nazwisko VARCHAR(60) NOT NULL,
    data_urodzenia DATE NOT NULL
);
ALTER TABLE pracownik;
INSERT INTO pracownik (id_pracownika, imie, nazwisko, data_urodzenia)
	VALUES
	(1, 'Jan', 'Kowalski', '2007-11-17'),
    (2, 'Wojciech', 'Parda', '2008-12-31'),
    (3, 'Kamil', 'Kovalenko', '1960-9-1');
UPDATE pracownik
SET data_urodzenia = '1990-12-10'
WHERE id_pracownika = 1;





CREATE TABLE zadania (
id_zadania INT PRIMARY KEY,
nazwa_zadania VARCHAR(150) NOT NULL,
priorytet ENUM('niski', 'normalny', 'wysoki'),
opis TEXT NULL,
FOREIGN KEY (pracownik) REFERENCES pracownik(id_pracownika) ON DELETE SET NULL
);

ALTER TABLE zadania
MODIFY COLUMN priorytet ENUM('normalny', 'wysoki', 'niski')
NOT NULL DEFAULT 'normalny';

INSERT INTO zadania (id_zadania, nazwa_zadania, pracownik)
VALUES
(1, 'Zbieranie smieci', 1),
(2, 'Napelnianie kubkow', 2),
(3, 'aktualizacja systemu', 3);

SELECT * FROM zadania;



CREATE TABLE projekt (
	id_projektu INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_projektu VARCHAR (150),
    data_rozpoczecia DATE,
    data_zakonczenia DATE NULL
);
ALTER TABLE projekt
ADD menadzer_projektu INT;

ALTER TABLE projekt
ADD FOREIGN KEY (menadzer_projektu)
REFERENCES pracownik(id_pracownika);

INSERT INTO projekt
(nazwa_projektu, data_rozpoczecia, data_zakonczenia, menadzer_projektu)
VALUES
('rekord1', 2026-12-11, '2027-12-11', 1),
('rekord2', 2026-02-01, NULL, 2);

ALTER TABLE zadania
ADD projekt INT;

ALTER TABLE zadania
ADD FOREIGN KEY (projekt)
REFERENCES projekt(id_projektu)
ON DELETE CASCADE;

UPDATE zadania 
SET projekt = 1
WHERE id_zadania = 1;

UPDATE zadania
SET projekt = 1
WHERE id_zadania = 2;

UPDATE zadania
SET projekt = 2
WHERE id_zadania = 3;

SELECT * FROM projekt;
SELECT * FROM zadania;



CREATE TABLE sprint (
	id_sprintu INT AUTO_INCREMENT PRIMARY KEY,
    numer_sprintu INT UNSIGNED,
    data_rozpoczecia DATE,
    data_zakonczenia date
    );
    
ALTER TABLE zadanie
ADD sprint INT NULL;
    
ALTER TABLE zadanie
ADD FOREIGN KEY (sprint)
REFERENCES sprint(id_sprintu)
ON DELETE SET NULL;

INSERT INTO sprint
(numer_sprintu, data_rozpoczecia, data_zakonczenia)
VALUES
(1, '2026-12-11', '2026-13-11');

UPDATE zadanie
SET sprint = 1
WHERE id_zadania = 1;

UPDATE zadanie
SET sprint = 1
WHERE id_zadania = 2;

SELECT * FROM sprint;
SELECT * FROM zadanie;



CREATE TABLE status (
	id_statusu INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_statusu VARCHAR(30)
);

INSERT INTO status (nazwa_statusu)
VALUES
('do zrobienia'),
('w trakcie'),
('zakoczone');

SELECT * FROM status;

CREATE TABLE zadanie_has_status (
	id_zdarzenia INT AUTO_INCREMENT PRIMARY KEY,
    id_zdarzenia INT,
    id_statusu INT,
    data_zdarzenia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_zadania)
		REFERENCES zadanie(id_zadania)
        ON DELETE CASCADE,
	FOREIGN KEY (id_statusu)
		REFERENCES status(id_statusu)
);

INSERT INTO zadanie_has_status (id_zadania, id_statusu)
VALUES
(1,1),
(2,2),
(3,3);

SELECT*FROM zadanie_has_status;
SHOW CREATE TABLE zadanie;

ALTER TABLE zadanie
DROP FOREIGN KEY 1zadanie_ibfk_1;

ALTER TABLE zadanie
ADD FOREIGN KEY (projekt)
REFERENCES projekt(id_projektu)
ON DELETE CASCADE;

DELETE FROM projekt
WHERE id_projektu = 1;

SELECT*FROM projekt;
SELECT*FROM zadanie;

SHOW TABLES;

USE 1zadanie


    
    






