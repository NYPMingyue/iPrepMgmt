CREATE TABLE [dbo].[Programme_Funding] (
    [PID]             INT            NOT NULL IDENTITY,
    [FAID]            INT            NOT NULL,
    [Staff_In_Charge] CHAR (10)      NOT NULL,
    [Comments]        NVARCHAR (MAX) NOT NULL,
    [Sub_Prog_Code]   NCHAR (10)     NOT NULL,
    [ClaimPerPax]     FLOAT (53)     NOT NULL,
    [NoOfPax]         INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([PID] ASC),
    CONSTRAINT [FK_Programme_Funding_ToTable_1] FOREIGN KEY ([Staff_In_Charge]) REFERENCES [dbo].[Staff] ([SID]),
    CONSTRAINT [FK_Programme_Funding_ToTable] FOREIGN KEY ([FAID]) REFERENCES [dbo].[Funds_Allocation] ([FAID])
);

