
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/22/2019 23:59:13
-- Generated from EDMX file: D:\1Siful_Sir_Project\Original\FullCRUDImplementationWithJquery\FullCRUDImplementationWithJquery\Models\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MVCTutorial];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_tblStudent_tblDepartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblStudent] DROP CONSTRAINT [FK_tblStudent_tblDepartment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[tblDepartment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblDepartment];
GO
IF OBJECT_ID(N'[dbo].[tblStudent]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblStudent];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'tblDepartments'
CREATE TABLE [dbo].[tblDepartments] (
    [DepartmentId] int IDENTITY(1,1) NOT NULL,
    [DepartmentName] nvarchar(50)  NULL
);
GO

-- Creating table 'tblStudents'
CREATE TABLE [dbo].[tblStudents] (
    [StudentId] int IDENTITY(1,1) NOT NULL,
    [StudentName] nvarchar(50)  NULL,
    [Email] nvarchar(50)  NULL,
    [IsDeleted] bit  NULL,
    [DepartmentId] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [DepartmentId] in table 'tblDepartments'
ALTER TABLE [dbo].[tblDepartments]
ADD CONSTRAINT [PK_tblDepartments]
    PRIMARY KEY CLUSTERED ([DepartmentId] ASC);
GO

-- Creating primary key on [StudentId] in table 'tblStudents'
ALTER TABLE [dbo].[tblStudents]
ADD CONSTRAINT [PK_tblStudents]
    PRIMARY KEY CLUSTERED ([StudentId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DepartmentId] in table 'tblStudents'
ALTER TABLE [dbo].[tblStudents]
ADD CONSTRAINT [FK_tblStudent_tblDepartment]
    FOREIGN KEY ([DepartmentId])
    REFERENCES [dbo].[tblDepartments]
        ([DepartmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_tblStudent_tblDepartment'
CREATE INDEX [IX_FK_tblStudent_tblDepartment]
ON [dbo].[tblStudents]
    ([DepartmentId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------