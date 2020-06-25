CREATE TABLE [dbo].[Funds] (
    [FID]        INT            IDENTITY (1, 1) NOT NULL,
    [Year]       INT            NOT NULL,
    [Amount]     FLOAT (53)     NOT NULL,
    [Start_Date] DATE           NOT NULL,
    [End_Date]   DATE           NOT NULL,
    [Comments]   VARCHAR (1000) NULL,
    PRIMARY KEY CLUSTERED ([FID] ASC)
);

