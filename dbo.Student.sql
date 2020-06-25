CREATE TABLE [dbo].[Student] (
    [SID]     VARCHAR (7)  NOT NULL,
    [Name]    NCHAR (50)   NOT NULL,
    [HP]      INT          NOT NULL,
    [Email]   VARCHAR (50) NOT NULL,
    [PEM]     VARCHAR (6)  NOT NULL,
    [Diploma] NCHAR (10)   NOT NULL,
    [PIN] VARCHAR(10) NULL, 
    PRIMARY KEY CLUSTERED ([SID] ASC)
);

