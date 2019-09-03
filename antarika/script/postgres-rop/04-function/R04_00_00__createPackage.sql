-- DROP FUNCTION IF EXISTS increment(INT);
CREATE OR REPLACE FUNCTION increment(i INT)
	RETURNS INT AS
$$
    BEGIN
      RETURN i + 1;
    END;
$$
LANGUAGE plpgsql;

 -- An example how to use the function (Returns: 11)
-- SELECT increment(10);
