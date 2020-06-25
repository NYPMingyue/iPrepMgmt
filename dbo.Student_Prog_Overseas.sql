CREATE TABLE [dbo].[Student_Prog_Overseas] (
    [SPOID]       INT         NOT NULL IDENTITY,
    [Admin_No]    VARCHAR (7) NOT NULL,
    [Overseas_ID] INT         NOT NULL,
    [Status]      TEXT        NOT NULL,
    [Claim_ID]    INT         NOT NULL,
    PRIMARY KEY CLUSTERED ([SPOID] ASC)
);

