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