USE DBuenProvecho
GO


--CREACION
CREATE FUNCTION Completar
(
	--DECLARE 
	@valor		VARCHAR(MAX), 
	@remplazar	CHAR(1),
	@longitud	INT, 
	@posicion	INT
) 
RETURNS VARCHAR(MAX) 
AS 

BEGIN 
DECLARE @restante INT
DECLARE @resultado VARCHAR(MAX)
SET @restante = @longitud - LEN(@valor)


IF @posicion = 0 
	BEGIN
		SET @resultado =  REPLICATE(@remplazar,@restante ) +  @valor
	END 
ELSE IF @posicion = 1
	BEGIN
		SET @resultado =   @valor  + REPLICATE(@remplazar,@restante ) 
	END
ELSE 
	BEGIN
		SET @resultado =   REPLICATE(@remplazar,@longitud ) 
	END 
	RETURN @resultado
END
GO



--UTILIZACION
SELECT DBO.Completar('1','0', 10, 0)