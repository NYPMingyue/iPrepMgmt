CREATE TABLE [dbo].[Overseas] (
    [OID]              INT          IDENTITY (1, 1) NOT NULL,
    [PFID]             INT          NOT NULL,
    [Start]            DATE         NULL,
    [EndDate]          DATE         NULL,
    [Title]            VARCHAR (50) NULL,
    [PricePerPax]      FLOAT (53)   NULL,
    [Claim]            FLOAT (53)   NULL,
    [NoOfPax]          INT          NULL,
    [Status]           NCHAR (10)   NULL,
    [Date_Last_Action] DATE         NOT NULL,
    [Comments]         NCHAR (100)  NULL,
    PRIMARY KEY CLUSTERED ([OID] ASC),
    CONSTRAINT [FK_Overseas_ToTable] FOREIGN KEY ([PFID]) REFERENCES [dbo].[Programme_Funding] ([PID])
);

