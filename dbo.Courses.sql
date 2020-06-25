CREATE TABLE [dbo].[Courses] (
    [CID]              INT          IDENTITY (1, 1) NOT NULL,
    [PFID]             INT          NOT NULL,
    [Start]            DATE         NULL,
    [EndDate]          DATE         NULL,
    [Title]            VARCHAR (50) NULL,
    [PricePerPax]      FLOAT (53)   NULL,
    [Claim]            FLOAT (53)   NULL,
    [NoOfPax]          INT          NULL,
    [Status]           NCHAR (10)   NULL,
    [Date_Last_Action] DATE         NULL,
    [Exam]             NCHAR (1)    NULL,
    [PreApproved]      NCHAR (1)    NULL,
    [Comments]         VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([CID] ASC),
    CONSTRAINT [FK_Courses_ToTable] FOREIGN KEY ([PFID]) REFERENCES [dbo].[Programme_Funding] ([PID])
);

