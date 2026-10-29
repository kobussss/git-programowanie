
DESC kategoria;

INSERT INTO kategoria (nazwa)
VALUES ('komputery');

INSERT INTO kategoria (nazwa)
VALUES
	('Akcesoria'),
    ('Sprzet peryferyjny');
    
INSERT INTO kategoria
VALUES (4,'Test2');

SELECT * FROM kategoria;

UPDATE kategoria
SET nazwa = 'Test2'
WHERE id_kategorii =4;

ALTER TABLE kategoria
MODIFY nazwa VARCHAR(50) NOT NULL;

DELETE FROM kategoria WHERE id_kategorii = 4;

CREATE TABLE produkt (
	id_produkty INT AUTO_INCREMENT PRIMARY KEY,
    data_dodania DATE,
    id_kategorii INT,
    FOREIGN KEY(id_kategorii)
		REFERENCES kategoria(id_kategorii)
    );
    
    ALTER TABLE produkt
    ADD COLUMN nazwa VARCHAR(50) NOT NULL;
    
    DESC produkt;
    
    INSERT INTO produkt
    VALUES (1, '2026-10-29', 1, 'produkt1');
    
    DELETE FROM kategoria WHERE id_kategorii =1;
    
    ALTER TABLE produkt
    DROP FOREIGN KEY produkt_ibfk_1
    ADD FOREIGN KEY (id_kategorii)
		REFERENCES kategoria(id_kategorii)
        ON DELETE SET NULL;
        
	SELECT * FROM produkt;