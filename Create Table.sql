CREATE TABLE [dbo].[kategorija](
    [ID]      INT           IDENTITY (1, 1) NOT NULL,
    [Naziv]		NVARCHAR (50)  NOT NULL,            
    CONSTRAINT [pk_kategorija] PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE [dbo].[proizvod] (
    [ID]      INT           IDENTITY (1, 1) NOT NULL,
    [Naziv]      NVARCHAR (50) NOT NULL,
	[Cena]		 FLOAT	  NOT NULL,
	[Opis]		 NVARCHAR (300),
	[Slika]		 NVARCHAR (200),
	[Tip]		 NVARCHAR (200),
    [ID_Kategorije] INT           NOT NULL,
    CONSTRAINT [pk_proizvod] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [fk_proizvod_kategorija] FOREIGN KEY ([ID_Kategorije]) REFERENCES [dbo].[kategorija] ([ID])
);

CREATE TABLE [dbo].[korisnik] (
    [ID]		INT           IDENTITY (1, 1) NOT NULL,
    [Ime]		NVARCHAR (50) NOT NULL,
	[Prezime]	NVARCHAR (50),
	[UserName]	NVARCHAR (50) NOT NULL,
	[Passwrod]	NVARCHAR (50) NOT NULL,
	[EMail]		NVARCHAR (50) NOT NULL,
    CONSTRAINT [pk_korisnika] PRIMARY KEY CLUSTERED ([ID] ASC)
);

ALTER TABLE [dbo].[korisnik] ADD [Role] NVARCHAR (50) NOT NULL

CREATE TABLE [dbo].[korpa] (
    [ID_Proizvoda]             INT  NOT NULL,
    [ID_Korisnika]	           INT  NOT NULL,            
    [Kolicina]				   INT NULL,
    CONSTRAINT [pk_korpa] PRIMARY KEY NONCLUSTERED ([ID_Proizvoda], [ID_Korisnika]),
    CONSTRAINT [fk_korpa_korisnik] FOREIGN KEY ([ID_Korisnika]) REFERENCES [dbo].[korisnik] ([ID]),
    CONSTRAINT [fk_korpa_proizvod] FOREIGN KEY ([ID_Proizvoda]) REFERENCES [dbo].[proizvod] ([ID])
);

UPDATE [dbo].[korpa] SET [Kolicina]=0 WHERE [Kolicina] IS NULL;
ALTER TABLE [dbo].[korpa] ALTER COLUMN [Kolicina] INTEGER NOT NULL;

ALTER TABLE [dbo].[korpa] DROP CONSTRAINT [fk_korpa_proizvod]  
ALTER TABLE [dbo].[korpa] ADD CONSTRAINT [fk_korpa_proizvod] 
		FOREIGN KEY ([ID_Proizvoda]) REFERENCES [dbo].[proizvod] ([ID]) ON DELETE CASCADE

ALTER TABLE [dbo].[korpa] DROP CONSTRAINT [fk_korpa_korisnik]  
ALTER TABLE [dbo].[korpa] ADD CONSTRAINT [fk_korpa_korisnik] 
		FOREIGN KEY ([ID_Korisnika]) REFERENCES [dbo].[korisnik] ([ID]) ON DELETE CASCADE

CREATE TABLE [dbo].[komentar] (
    [ID_Proizvoda] INT           NOT NULL,
    [ID_Korisnika] INT NOT NULL,	
    [Sadrzaj]      NVARCHAR (300) NOT NULL,
    [Datum]		   DATE	         NOT NULL,
    CONSTRAINT [PK_komentara] PRIMARY KEY CLUSTERED ([ID_Proizvoda] ASC, [ID_Korisnika] ASC),
    CONSTRAINT [FK_komentara_proizvod] FOREIGN KEY ([ID_Proizvoda]) REFERENCES [dbo].[proizvod] ([ID]),
	CONSTRAINT [FK_komentara_korisnik] FOREIGN KEY ([ID_Korisnika]) REFERENCES [dbo].[korisnik] ([ID])
);

ALTER TABLE [dbo].[komentar] DROP CONSTRAINT [FK_komentara_proizvod]  
ALTER TABLE [dbo].[komentar] ADD CONSTRAINT [FK_komentara_proizvod] 
		FOREIGN KEY ([ID_Proizvoda]) REFERENCES [dbo].[proizvod] ([ID]) ON DELETE CASCADE

ALTER TABLE [dbo].[komentar] DROP CONSTRAINT [FK_komentara_korisnik]  
ALTER TABLE [dbo].[komentar] ADD CONSTRAINT [FK_komentara_korisnik] 
		FOREIGN KEY ([ID_Korisnika]) REFERENCES [dbo].[korisnik] ([ID]) ON DELETE CASCADE

ALTER TABLE [dbo].[komentar] ADD [ID_Komentara] INT IDENTITY (1,1) NOT NULL;
ALTER TABLE [dbo].[komentar] DROP CONSTRAINT [PK_komentara]
ALTER TABLE [dbo].[komentar] ADD PRIMARY KEY ([ID_Proizvoda],[ID_Korisnika],[ID_Komentara])



CREATE VIEW komentar_view
AS   
SELECT pro.Naziv, pro.Cena, kor.Kolicina 
FROM korpa kor
JOIN proizvod AS pro ON kor.ID_Proizvoda = pro.ID;  
GO 


select * from proizvod
select * from korisnik
select * from [dbo].[kategorija]