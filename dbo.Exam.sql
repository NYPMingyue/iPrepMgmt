CREATE TABLE [dbo].[Exam] (
    [EID]       INT          NOT NULL IDENTITY,
    [CID]       INT          NOT NULL,
    [Exam_Date] DATE         NOT NULL,
    [Title]     VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([EID] ASC),
    CONSTRAINT [FK_Exam_ToTable] FOREIGN KEY ([CID]) REFERENCES [dbo].[Courses] ([CID])
);

