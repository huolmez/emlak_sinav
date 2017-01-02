
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/20/2016 11:27:48
-- Generated from EDMX file: C:\Users\husey\Desktop\JAVA\Emlak\Data\emlakmvc.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [emlakk];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserTypeUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSet] DROP CONSTRAINT [FK_UserTypeUser];
GO
IF OBJECT_ID(N'[dbo].[FK_KategoriIlan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[IlanSet] DROP CONSTRAINT [FK_KategoriIlan];
GO
IF OBJECT_ID(N'[dbo].[FK_UserSikayet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SikayetSet] DROP CONSTRAINT [FK_UserSikayet];
GO
IF OBJECT_ID(N'[dbo].[FK_IlanDetayIlan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[IlanSet] DROP CONSTRAINT [FK_IlanDetayIlan];
GO
IF OBJECT_ID(N'[dbo].[FK_UserIlan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[IlanSet] DROP CONSTRAINT [FK_UserIlan];
GO
IF OBJECT_ID(N'[dbo].[FK_UserComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentSet] DROP CONSTRAINT [FK_UserComment];
GO
IF OBJECT_ID(N'[dbo].[FK_IlanComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentSet] DROP CONSTRAINT [FK_IlanComment];
GO
IF OBJECT_ID(N'[dbo].[FK_UserLog]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LogSet] DROP CONSTRAINT [FK_UserLog];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProjectSet] DROP CONSTRAINT [FK_UserProject];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProjectAccess]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProjectAccessSet] DROP CONSTRAINT [FK_UserProjectAccess];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectProjectAccess]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProjectAccessSet] DROP CONSTRAINT [FK_ProjectProjectAccess];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CartSet] DROP CONSTRAINT [FK_UserCart];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectCart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CartSet] DROP CONSTRAINT [FK_ProjectCart];
GO
IF OBJECT_ID(N'[dbo].[FK_UserPayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentSet] DROP CONSTRAINT [FK_UserPayment];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectAccessPayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentSet] DROP CONSTRAINT [FK_ProjectAccessPayment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSet];
GO
IF OBJECT_ID(N'[dbo].[UserTypeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserTypeSet];
GO
IF OBJECT_ID(N'[dbo].[IlanSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[IlanSet];
GO
IF OBJECT_ID(N'[dbo].[IlanDetaySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[IlanDetaySet];
GO
IF OBJECT_ID(N'[dbo].[LogSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LogSet];
GO
IF OBJECT_ID(N'[dbo].[KategoriSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KategoriSet];
GO
IF OBJECT_ID(N'[dbo].[SikayetSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SikayetSet];
GO
IF OBJECT_ID(N'[dbo].[CommentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CommentSet];
GO
IF OBJECT_ID(N'[dbo].[CartSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CartSet];
GO
IF OBJECT_ID(N'[dbo].[PaymentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentSet];
GO
IF OBJECT_ID(N'[dbo].[ProjectAccessSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProjectAccessSet];
GO
IF OBJECT_ID(N'[dbo].[ProjectSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProjectSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserTypeId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL,
    [Telefon] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Avatar] varbinary(max)  NULL
);
GO

-- Creating table 'UserTypeSet'
CREATE TABLE [dbo].[UserTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'IlanSet'
CREATE TABLE [dbo].[IlanSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Fiyat] nvarchar(max)  NOT NULL,
    [MetreKare] int  NOT NULL,
    [Tarih] datetime  NOT NULL,
    [Resim] varbinary(max)  NULL,
    [UserId] int  NOT NULL,
    [KategoriId] int  NOT NULL,
    [IlanDetayId] int  NOT NULL
);
GO

-- Creating table 'IlanDetaySet'
CREATE TABLE [dbo].[IlanDetaySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Kat] nvarchar(max)  NOT NULL,
    [OdaSayi] nvarchar(max)  NOT NULL,
    [BanyoSayi] nvarchar(max)  NOT NULL,
    [Isitma] nvarchar(max)  NOT NULL,
    [Esyalimi] nvarchar(max)  NOT NULL,
    [Aciklama] nvarchar(max)  NOT NULL,
    [Adres] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LogSet'
CREATE TABLE [dbo].[LogSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Subject] nvarchar(max)  NOT NULL,
    [Detail] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'KategoriSet'
CREATE TABLE [dbo].[KategoriSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [KategoriAdi] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SikayetSet'
CREATE TABLE [dbo].[SikayetSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Subject] nvarchar(max)  NOT NULL,
    [Aciklama] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'CommentSet'
CREATE TABLE [dbo].[CommentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [IlanId] int  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [Verified] bit  NOT NULL
);
GO

-- Creating table 'CartSet'
CREATE TABLE [dbo].[CartSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Status] int  NOT NULL,
    [Count] int  NOT NULL,
    [ProjectId] int  NOT NULL
);
GO

-- Creating table 'PaymentSet'
CREATE TABLE [dbo].[PaymentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Amount] decimal(18,2)  NOT NULL,
    [Date] datetime  NOT NULL,
    [ProjectAccess_Id] int  NOT NULL
);
GO

-- Creating table 'ProjectAccessSet'
CREATE TABLE [dbo].[ProjectAccessSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ProjectId] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'ProjectSet'
CREATE TABLE [dbo].[ProjectSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [File] varbinary(max)  NULL,
    [FileName] nvarchar(max)  NOT NULL,
    [ContentType] nvarchar(max)  NULL,
    [Price] decimal(18,2)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserTypeSet'
ALTER TABLE [dbo].[UserTypeSet]
ADD CONSTRAINT [PK_UserTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'IlanSet'
ALTER TABLE [dbo].[IlanSet]
ADD CONSTRAINT [PK_IlanSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'IlanDetaySet'
ALTER TABLE [dbo].[IlanDetaySet]
ADD CONSTRAINT [PK_IlanDetaySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LogSet'
ALTER TABLE [dbo].[LogSet]
ADD CONSTRAINT [PK_LogSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'KategoriSet'
ALTER TABLE [dbo].[KategoriSet]
ADD CONSTRAINT [PK_KategoriSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SikayetSet'
ALTER TABLE [dbo].[SikayetSet]
ADD CONSTRAINT [PK_SikayetSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [PK_CommentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [PK_CartSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [PK_PaymentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectAccessSet'
ALTER TABLE [dbo].[ProjectAccessSet]
ADD CONSTRAINT [PK_ProjectAccessSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectSet'
ALTER TABLE [dbo].[ProjectSet]
ADD CONSTRAINT [PK_ProjectSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserTypeId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [FK_UserTypeUser]
    FOREIGN KEY ([UserTypeId])
    REFERENCES [dbo].[UserTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserTypeUser'
CREATE INDEX [IX_FK_UserTypeUser]
ON [dbo].[UserSet]
    ([UserTypeId]);
GO

-- Creating foreign key on [KategoriId] in table 'IlanSet'
ALTER TABLE [dbo].[IlanSet]
ADD CONSTRAINT [FK_KategoriIlan]
    FOREIGN KEY ([KategoriId])
    REFERENCES [dbo].[KategoriSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KategoriIlan'
CREATE INDEX [IX_FK_KategoriIlan]
ON [dbo].[IlanSet]
    ([KategoriId]);
GO

-- Creating foreign key on [UserId] in table 'SikayetSet'
ALTER TABLE [dbo].[SikayetSet]
ADD CONSTRAINT [FK_UserSikayet]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSikayet'
CREATE INDEX [IX_FK_UserSikayet]
ON [dbo].[SikayetSet]
    ([UserId]);
GO

-- Creating foreign key on [IlanDetayId] in table 'IlanSet'
ALTER TABLE [dbo].[IlanSet]
ADD CONSTRAINT [FK_IlanDetayIlan]
    FOREIGN KEY ([IlanDetayId])
    REFERENCES [dbo].[IlanDetaySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IlanDetayIlan'
CREATE INDEX [IX_FK_IlanDetayIlan]
ON [dbo].[IlanSet]
    ([IlanDetayId]);
GO

-- Creating foreign key on [UserId] in table 'IlanSet'
ALTER TABLE [dbo].[IlanSet]
ADD CONSTRAINT [FK_UserIlan]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserIlan'
CREATE INDEX [IX_FK_UserIlan]
ON [dbo].[IlanSet]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [FK_UserComment]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserComment'
CREATE INDEX [IX_FK_UserComment]
ON [dbo].[CommentSet]
    ([UserId]);
GO

-- Creating foreign key on [IlanId] in table 'CommentSet'
ALTER TABLE [dbo].[CommentSet]
ADD CONSTRAINT [FK_IlanComment]
    FOREIGN KEY ([IlanId])
    REFERENCES [dbo].[IlanSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IlanComment'
CREATE INDEX [IX_FK_IlanComment]
ON [dbo].[CommentSet]
    ([IlanId]);
GO

-- Creating foreign key on [UserId] in table 'LogSet'
ALTER TABLE [dbo].[LogSet]
ADD CONSTRAINT [FK_UserLog]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserLog'
CREATE INDEX [IX_FK_UserLog]
ON [dbo].[LogSet]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'ProjectSet'
ALTER TABLE [dbo].[ProjectSet]
ADD CONSTRAINT [FK_UserProject]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProject'
CREATE INDEX [IX_FK_UserProject]
ON [dbo].[ProjectSet]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'ProjectAccessSet'
ALTER TABLE [dbo].[ProjectAccessSet]
ADD CONSTRAINT [FK_UserProjectAccess]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProjectAccess'
CREATE INDEX [IX_FK_UserProjectAccess]
ON [dbo].[ProjectAccessSet]
    ([UserId]);
GO

-- Creating foreign key on [ProjectId] in table 'ProjectAccessSet'
ALTER TABLE [dbo].[ProjectAccessSet]
ADD CONSTRAINT [FK_ProjectProjectAccess]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[ProjectSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectProjectAccess'
CREATE INDEX [IX_FK_ProjectProjectAccess]
ON [dbo].[ProjectAccessSet]
    ([ProjectId]);
GO

-- Creating foreign key on [UserId] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [FK_UserCart]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCart'
CREATE INDEX [IX_FK_UserCart]
ON [dbo].[CartSet]
    ([UserId]);
GO

-- Creating foreign key on [ProjectId] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [FK_ProjectCart]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[ProjectSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectCart'
CREATE INDEX [IX_FK_ProjectCart]
ON [dbo].[CartSet]
    ([ProjectId]);
GO

-- Creating foreign key on [UserId] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [FK_UserPayment]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPayment'
CREATE INDEX [IX_FK_UserPayment]
ON [dbo].[PaymentSet]
    ([UserId]);
GO

-- Creating foreign key on [ProjectAccess_Id] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [FK_ProjectAccessPayment]
    FOREIGN KEY ([ProjectAccess_Id])
    REFERENCES [dbo].[ProjectAccessSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectAccessPayment'
CREATE INDEX [IX_FK_ProjectAccessPayment]
ON [dbo].[PaymentSet]
    ([ProjectAccess_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------