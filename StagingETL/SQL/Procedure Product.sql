USE InstaCartDW
GO

CREATE PROCEDURE load_products @product_id int, @product varchar(250), @department int, @aisle int
AS
BEGIN
	IF NOT EXISTS (SELECT product_id FROM dbo.DimProduct WHERE product_id = @product_id)
	BEGIN
		INSERT INTO dbo.DimProduct(product_id, name, SK_department, SK_aisle) VALUES(@product_id, @product, @department, @aisle);
	END;
END;