DECLARE @table TABLE (PrimeNumber INT)
DECLARE @final AS VARCHAR(1500)
SET @final = ''
DECLARE @counter INT
SET @counter = 2
WHILE @counter <= 1000
 BEGIN
 IF NOT EXISTS (SELECT primenumber
 FROM   @table
 WHERE  @counter % primenumber = 0)
 BEGIN
 INSERT INTO @table
 SELECT @counter
 SET @final = @final + Cast(@counter AS VARCHAR(20)) + '&'
 END
 SET @counter = @counter + 1
 END
 SELECT Substring(@final, 0, Len(@final));