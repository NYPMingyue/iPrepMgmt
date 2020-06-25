CREATE TABLE [dbo].[Claim_Status_Codes] (
    [Status_ID] INT           NOT NULL IDENTITY,
    [Desc]      TEXT          NOT NULL,
    [Long_Desc] VARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([Status_ID] ASC)
);

