CREATE TABLE [dbo].[Student_Prog_Course] (
    [SPCID]          INT          NOT NULL IDENTITY,
    [Admin_No]       VARCHAR (7)  NOT NULL,
    [Course_ID]      INT          NOT NULL,
    [Course_Status]  TEXT         NOT NULL,
    [Claim_ID]       INT          NULL,
    [Personal_Email] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([SPCID] ASC)
);

