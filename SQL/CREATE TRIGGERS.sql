

CREATE TRIGGER New_User_Trigger
ON usuarios
AFTER  INSERT
AS
INSERT INTO actividades
(Create_date, Id_usuario, Actividad)
VALUES
(GETDATE(), (SELECT Id_usuario from inserted ), 'Creaci�n de Usuario' );
GO

CREATE TRIGGER Update_User_Trigger
ON usuarios
AFTER  UPDATE
AS
INSERT INTO actividades
(Create_date, Id_usuario, Actividad)
VALUES
(GETDATE(),(SELECT Id_usuario from inserted ), 'Modificaci�n de Usuario' )
GO

CREATE TRIGGER Delete_User_Trigger
ON usuarios
AFTER  DELETE
AS
INSERT INTO actividades
(Create_date, Id_usuario, Actividad)
VALUES
(GETDATE(), (SELECT Id_usuario from inserted ), 'Usuario eliminado.' )