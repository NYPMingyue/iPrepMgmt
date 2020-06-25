CREATE TABLE [dbo].[Claim] (
    [CLID]                       INT        NOT NULL IDENTITY,
    [Date_Received_From_Student] DATE       NULL,
    [Claim_Status]               INT        NOT NULL,
    [Date_Last_Action]           DATE       NOT NULL,
    [Finance_Record]             NCHAR (10) NULL,
    [Comments]                   NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([CLID] ASC)
);

