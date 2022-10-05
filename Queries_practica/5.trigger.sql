-- Trigger. Por cada valor que insertemos en la columnas 'bbb' y 'ccc' de la tabla 'aaa', se va a duplicar en 'bbba' y 'ccca' de la tabla 'aaab'

CREATE OR REPLACE FUNCTION duplicate_records()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO aaab(bbba, ccca)
	VALUES (NEW.bbb, NEW.ccc);
	RETURN NEW;
END
$$;

-- Se crea el trigger

CREATE TRIGGER aaa_changes
	BEFORE INSERT
	ON aaa
	FOR EACH ROW
	EXECUTE PROCEDURE duplicate_records();
	
-- Chequeamos que todo funcione bien. Si se duplica significa que funciona bien.

INSERT INTO aaa(bbb, ccc)
VALUES('abcde', 'efghi');