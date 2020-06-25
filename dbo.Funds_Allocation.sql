CREATE TABLE [dbo].[Funds_Allocation] (
    [FAID]     INT          IDENTITY (1, 1) NOT NULL,
    [FID]      INT          NOT NULL,
    [Pro_Desc] VARCHAR (50) NOT NULL,
    [Amt]      FLOAT (53)   NOT NULL,
    PRIMARY KEY CLUSTERED ([FAID] ASC),
    CONSTRAINT [FK_Funds_Allocation_ToTable] FOREIGN KEY ([FID]) REFERENCES [dbo].[Funds] ([FID])
);

