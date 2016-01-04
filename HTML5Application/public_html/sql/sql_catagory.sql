CONCAT(UCASE(LEFT(test_char, 1)), LCASE(SUBSTRING(test_char, 2)))

DELIMITER //
DROP FUNCTION IF EXISTS camelcase;
CREATE FUNCTION `camelcase`(str VARCHAR(500) )
RETURNS VARCHAR(500)
BEGIN
   DECLARE RET VARCHAR(500);
   SET RET = CONCAT(UCASE(LEFT(str, 1)), LCASE(SUBSTRING(str, 2)));
   RETURN RET;
END; //
DELIMITER ;

SELECT DISTINCT concat("<rdfs:range rdf:resource=\"&dbo;",camelcase(`group`),"\" />") FROM `lab_test` WHERE 1