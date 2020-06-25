CREATE TABLE [dbo].[Account] (
    [SID]      INT          NOT NULL,
    [UserName] VARCHAR (10) NOT NULL,
    [Password] VARCHAR (50) NOT NULL,
    [Role]     VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([SID] ASC)
);

