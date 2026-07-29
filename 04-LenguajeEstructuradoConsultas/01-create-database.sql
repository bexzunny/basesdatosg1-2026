/*=================================================================

DQL (Data Query Languaje) en SQLSERVER

Archivo: 01-create-database.sql

Descripción: Crear la base de datos para la práctica de consultas

=================================================================*/

USE master;
GO

if DB_ID('comercial_db') IS NOT NULL    -- es null, no existe
BEGIN										-- NULL == NOT NULL, no debería entrar
 ALTER DATABASE comercial_db
 SET SINGLE_USER
 WITH ROLLBACK IMMEDIATE;
 
 DROP DATABASE comercial_db;
 END;
 GO
 
 CREATE DATABASE comercial_db;
 GO

 USE comercial_db;
 GO

 print 'La base de datos comercial_db se creo correctamente';
 GO

	--SELECT DB_ID('comercial_db')