USE InstaCartDW
GO

DECLARE @hours int;
DECLARE @week int;
SET @week = 0;
SET @hours = 0;

WHILE (@week < 7)
BEGIN
	
	WHILE (@hours < 24)
	BEGIN
		--PRINT @week;
		IF @week = 1
		BEGIN
			INSERT INTO dbo.DimDate(SK_Date,day_of_week,hour) VALUES (CONVERT(INT, CONCAT('7',CONVERT(varchar, @week),CONVERT(varchar, @hours))),@week,@hours);
		END
		ELSE
		BEGIN
			INSERT INTO dbo.DimDate(SK_Date,day_of_week,hour) VALUES (CONVERT(INT, CONCAT(CONVERT(varchar, @week),CONVERT(varchar, @hours))),@week,@hours);
		END;
		SET @hours = @hours+1;
	END;
	SET @hours = 0;
	SET @week = @week + 1;
END;