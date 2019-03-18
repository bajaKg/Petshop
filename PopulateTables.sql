SET IDENTITY_INSERT [dbo].[korisnik] ON
INSERT INTO [dbo].[korisnik] ([ID], [Ime], [Prezime], [UserName], [Passwrod], [EMail], [Role]) VALUES (1, N'Milos', N'Bajic', N'milos', N'milos',N'milos@live.com', 'admin')
INSERT INTO [dbo].[korisnik] ([ID], [Ime], [Prezime], [UserName],[Passwrod],[EMail], [Role]) VALUES (2, N'Sandra', N'Sandric', N'sandra', N'sandra', N'sandra@live.com', 'admin')
INSERT INTO [dbo].[korisnik] ([ID], [Ime], [Prezime], [UserName],[Passwrod],[EMail], [Role]) VALUES (3, N'Jhon', N'Trbosek', 'trba', 'trba', 'trbsk@live.com', 'admin')
INSERT INTO [dbo].[korisnik] ([ID], [Ime], [Prezime], [UserName],[Passwrod],[EMail], [Role]) VALUES (4, N'Nevena', N'Maric', 'nevena', 'maric', 'nena@live.com', 'user')
SET IDENTITY_INSERT [dbo].[korisnik] OFF

select * from korisnik
select * from komentar
select * from korpa
select * from proizvod


DELETE FROM [dbo].[korisnik] 

SET IDENTITY_INSERT [dbo].[proizvod] ON
INSERT INTO [dbo].[proizvod] ([ID], [Naziv], [Cena], [Opis], [Slika], [Tip], [ID_Kategorije]) VALUES (1, N'Hrana za pse', 350.56, N'Hrana viskogo sadrzaja minerala i belancevina.', N'hranaZaPse.gif', N'hrana', 1)
INSERT INTO [dbo].[proizvod] ([ID], [Naziv], [Cena], [Opis], [Slika], [Tip], [ID_Kategorije]) VALUES (2, N'Hrana za macke', 458.00, N'Hrana za macke sa ukusom misa.', N'hranaZaMacke.gif', N'hrana', 2)
INSERT INTO [dbo].[proizvod] ([ID], [Naziv], [Cena], [Opis], [Slika], [Tip], [ID_Kategorije]) VALUES (3, N'Hrana za ribice', 120.30, 'Melevena dzigerica sa dodatkom skampa.', N'hranaZaRibice.jpg', N'hrana', 3)
SET IDENTITY_INSERT [dbo].[proizvod] OFF


SET IDENTITY_INSERT [dbo].[kategorija] ON
INSERT INTO [dbo].[kategorija] ([ID], [Naziv]) VALUES (1, N'Psi')
INSERT INTO [dbo].[kategorija] ([ID], [Naziv]) VALUES (2, N'Macke')
INSERT INTO [dbo].[kategorija] ([ID], [Naziv]) VALUES (3, N'Akvaristika')
SET IDENTITY_INSERT [dbo].[kategorija] OFF



INSERT INTO [dbo].[komentar] ([ID_Proizvoda], [ID_Korisnika], [Sadrzaj], [Datum]) VALUES (1, 1, N'Sadrzaj prvog komentara. Odlican proizvod, sve pohvala', '2008-11-11')
INSERT INTO [dbo].[komentar] ([ID_Proizvoda], [ID_Korisnika], [Sadrzaj], [Datum]) VALUES (1, 2, N'Sadrzaj drugog komentara. Odlican proizvod, sve pohvala', '2009-11-11')
INSERT INTO [dbo].[komentar] ([ID_Proizvoda], [ID_Korisnika], [Sadrzaj], [Datum]) VALUES (1, 3, N'Sadrzaj treceg komentara. Odlican proizvod, sve pohvala', '2015-11-11')
INSERT INTO [dbo].[komentar] ([ID_Proizvoda], [ID_Korisnika], [Sadrzaj], [Datum]) VALUES (1, 4, N'Sadrzaj cetvrtog komentara. Odlican proizvod, sve pohvala', '2017-11-11')
INSERT INTO [dbo].[komentar] ([ID_Proizvoda], [ID_Korisnika], [Sadrzaj], [Datum]) VALUES (2, 1, N'Sadrzaj prvog komentara. Odlican proizvod, sve pohvala', '2008-11-11')
INSERT INTO [dbo].[komentar] ([ID_Proizvoda], [ID_Korisnika], [Sadrzaj], [Datum]) VALUES (2, 2, N'Sadrzaj drugog komentara. Odlican proizvod, sve pohvala', '2003-11-11')
INSERT INTO [dbo].[komentar] ([ID_Proizvoda], [ID_Korisnika], [Sadrzaj], [Datum]) VALUES (3, 1, N'Sadrzaj prvog komentara. Odlican proizvod, sve pohvala', '2018-11-11')
INSERT INTO [dbo].[komentar] ([ID_Proizvoda], [ID_Korisnika], [Sadrzaj], [Datum]) VALUES (3, 2, N'Sadrzaj drugog komentara. Odlican proizvod, sve pohvala', '2014-11-11')

INSERT INTO [dbo].[korpa] ([ID_Proizvoda], [ID_Korisnika], [Kolicina]) VALUES (1, 1, 1)
INSERT INTO [dbo].[korpa] ([ID_Proizvoda], [ID_Korisnika], [Kolicina]) VALUES (2, 1, 1)
INSERT INTO [dbo].[korpa] ([ID_Proizvoda], [ID_Korisnika], [Kolicina]) VALUES (3, 1, 1)
INSERT INTO [dbo].[korpa] ([ID_Proizvoda], [ID_Korisnika], [Kolicina]) VALUES (6, 1, 1)

SELECT * FROM komentar
