CREATE TABLE [dbo].[Staff] (
    [SID]   CHAR (10)    NOT NULL,
    [Name]  TEXT         NOT NULL,
    [HP]    INT          NOT NULL,
    [Email] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([SID] ASC)
);

