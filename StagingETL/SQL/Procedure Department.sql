USE [InstaCartDW]
GO

CREATE PROCEDURE load_department @department_id int, @department nvarchar(150)
AS
BEGIN
	IF NOT EXISTS (SELECT department_id FROM dbo.DimDepartment WHERE department_id = @department_id)
	BEGIN
		INSERT INTO dbo.DimDepartment(department_id, department) VALUES(@department_id,@department);
	END;
END;