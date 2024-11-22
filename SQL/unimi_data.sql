CREATE TABLE Professori (
id decimal(5,0) PRIMARY KEY,
Cognome varchar(30) NOT NULL,
Nome varchar(30) NOT NULL,
Stipendio decimal(8,2) NOT NULL DEFAULT 15000 CHECK (Stipendio >=0)
);

CREATE TABLE CorsiDiLaurea (
id decimal(3,0) PRIMARY KEY,
Facolta varchar(50) NOT NULL,
Denominazione varchar(50) NOT NULL,
Attivazione char(9) NOT NULL,
UNIQUE(Facolta, Denominazione)
);

CREATE TABLE Corsi (
id char(10) PRIMARY KEY,
CorsoDiLaurea decimal(3) NOT NULL REFERENCES CorsiDiLaurea (id) ON UPDATE CASCADE,
Denominazione varchar(50) NOT NULL,
Professore decimal(5,0)  REFERENCES Professori (id) ON DELETE NO ACTION ON UPDATE CASCADE,
Attivato boolean nOT NULL DEFAULT FALSE,
UNIQUE (CorsoDiLaurea, Denominazione)
);

CREATE TABLE Studenti (
Matricola varchar(10) PRIMARY KEY,
Cognome varchar(30) NOT NULL,
Nome varchar(30) NOT NULL,
Residenza varchar(30) NOT NULL,
DataNascita date NOT NULL,
LuogoNascita varchar(30) NOT NULL,
CorsoDiLaurea decimal(3,0) NOT NULL REFERENCES CorsiDiLaurea (id) ON UPDATE CASCADE,
Iscrizione char(9) NOT NULL,
Relatore decimal(5,0)  REFERENCES Professori (id) ON UPDATE CASCADE,
Laurea date,
UNIQUE(Cognome,Nome,DataNascita, LuogoNascita, CorsoDiLaurea)
);

CREATE TABLE Esami(
Studente varchar(10) REFERENCES Studenti (matricola) ON UPDATE CASCADE, 
Corso char(10)  REFERENCES Corsi (id) ON UPDATE NO ACTION, 
Data date,
Voto decimal(2,0) check (Voto  between 1 and 33),
PRIMARY KEY(Studente,Corso,Data)
);

CREATE TABLE PianiDiStudio(
Studente varchar(10) REFERENCES Studenti (matricola) ON UPDATE CASCADE, AnnoAccademico char(9),
Anno decimal(1,0) check (Anno  between 1 and 6),
PRIMARY KEY(Studente,AnnoAccademico,Anno)
);


--
-- Data for Name: professori
--

INSERT INTO professori VALUES (1, 'Aguzzoli', 'Davide', 120000.00);
INSERT INTO professori VALUES (2, 'Alberti', 'Maria', 16500.00);
INSERT INTO professori VALUES (3, 'Bettini', 'Claudio', 18000.00);
INSERT INTO professori VALUES (4, 'Borghese', 'Alberto', 12387.00);
INSERT INTO professori VALUES (5, 'Cerri', 'Stefano Alberto', 30000.00);
INSERT INTO professori VALUES (6, 'Campadelli', 'Laura', 13000.00);
INSERT INTO professori VALUES (7, 'Ferrari', 'Mauro', 25000.00);
INSERT INTO professori VALUES (8, 'De Falco', 'Stefano', 22000.00);
INSERT INTO professori VALUES (9, 'Haus', 'Goffredo', 15000.00);
INSERT INTO professori VALUES (10, 'Valle', 'Giorgio', 19760.00);
INSERT INTO professori VALUES (11, 'Morpurgo', 'Anna', 18734.00);
INSERT INTO professori VALUES (12, 'Aguzzoli', 'Stefano', 13700.00);
INSERT INTO professori VALUES (13, 'Angeleri', 'Emanuele', 14000.00);
INSERT INTO professori VALUES (14, 'Apolloni', 'Bruno', 17834.00);
INSERT INTO professori VALUES (15, 'Bellettini', 'Carlo', 12000.00);
INSERT INTO professori VALUES (16, 'Bertero', 'Gianni', 18000.00);
INSERT INTO professori VALUES (17, 'Ribaudo', 'Carlo', 19500.00);
INSERT INTO professori VALUES (18, 'Lamberti', 'Stefano', 15000.00);
INSERT INTO professori VALUES (19, 'Galvagna', 'Gabriele', 17600.00);
INSERT INTO professori VALUES (20, 'Levrero', 'Michele', 12000.00);
INSERT INTO professori VALUES (21, 'Martini', 'Guido', 19800.00);
INSERT INTO professori VALUES (22, 'Rondinelli', 'Maria', 13500.00);
INSERT INTO professori VALUES (23, 'Rondinelli', 'Gianluigi', 13500.00);
INSERT INTO professori VALUES (24, 'Rondinelli', 'Patrizio', 13500.00);
INSERT INTO professori VALUES (25, 'Rosa', 'Aldo', 19200.00);
INSERT INTO professori VALUES (26, 'Rondanino', 'Carmela', 19000.00);
INSERT INTO professori VALUES (27, 'Cangini', 'Palmiro', 11200.00);
INSERT INTO professori VALUES (28, 'Rondanino', 'Gianna', 19000.00);
INSERT INTO professori VALUES (29, 'Vincenzini', 'Palmiro', 11200.00);
INSERT INTO professori VALUES (30, 'Devoto', 'Gianni', 13500.00);
INSERT INTO professori VALUES (31, 'Farazza', 'Valentina', 18000.00);
INSERT INTO professori VALUES (32, 'Serra', 'Pietro', 22387.00);
INSERT INTO professori VALUES (33, 'Fabrizi', 'Maura', 30000.00);
INSERT INTO professori VALUES (34, 'Gavizzi', 'Stefania', 13000.00);
INSERT INTO professori VALUES (35, 'Nizzi', 'Marco', 25000.00);
INSERT INTO professori VALUES (36, 'Farano', 'Anna', 23000.00);
INSERT INTO professori VALUES (37, 'Merlo', 'Anita', 20000.00);

--
-- Data for Name: corsidilaurea
--

INSERT INTO corsidilaurea VALUES (1, 'SS.MM.FF.NN', 'Matematica', '1970/1971');
INSERT INTO corsidilaurea VALUES (2, 'SS.MM.FF.NN', 'Chimica', '1980/1981');
INSERT INTO corsidilaurea VALUES (3, 'SS.MM.FF.NN', 'Scienze Biologiche', '1999/2000');
INSERT INTO corsidilaurea VALUES (4, 'SS.MM.FF.NN', 'Scienze Geologiche', '1998/1999');
INSERT INTO corsidilaurea VALUES (5, 'SS.MM.FF.NN', 'Chimica Industriale', '1982/1983');
INSERT INTO corsidilaurea VALUES (6, 'SS.MM.FF.NN', 'Fisica', '1985/1986');
INSERT INTO corsidilaurea VALUES (7, 'SS.MM.FF.NN', 'Scienza dei Materiali', '1995/1996');
INSERT INTO corsidilaurea VALUES (8, 'SS.MM.FF.NN', 'Scienze Ambientali', '1998/1999');
INSERT INTO corsidilaurea VALUES (9, 'SS.MM.FF.NN', 'Informatica', '1994/1995');
INSERT INTO corsidilaurea VALUES (10, 'SS.MM.FF.NN', 'Scienze dell''Informazione', '1986/1987');
INSERT INTO corsidilaurea VALUES (15, 'Agraria', 'Scienze e Tecnologie Alimentari', '1994/1995');
INSERT INTO corsidilaurea VALUES (16, 'Economia', 'Economia e Commercio', '1982/1983');
INSERT INTO corsidilaurea VALUES (17, 'Ingegneria', 'Ingegneria Elettronica', '1972/1971');
INSERT INTO corsidilaurea VALUES (18, 'Medicina e chirurgia', 'Biotecnologie', '1998/1999');
INSERT INTO corsidilaurea VALUES (19, 'Giurisprudenza', 'Giurisprudenza', '1997/1998');
INSERT INTO corsidilaurea VALUES (20, 'Farmacia', 'Biotecnologie', '1994/1995');
INSERT INTO corsidilaurea VALUES (21, 'Agraria', 'Scienze Ambientali', '1999/2000');
INSERT INTO corsidilaurea VALUES (22, 'Agraria', 'Biotecnologie', '1992/1993');
INSERT INTO corsidilaurea VALUES (23, 'Agraria', 'Scienze e Tecnologie Agrarie', '1997/1998');
INSERT INTO corsidilaurea VALUES (24, 'Medicina e Chirurgia', 'Odontoiatria', '1997/1998');
INSERT INTO corsidilaurea VALUES (25, 'Lettere e Filosofia', 'Filosofia', '1975/1976');
INSERT INTO corsidilaurea VALUES (26, 'Lettere e Filosofia', 'Lettere', '1975/1976');
INSERT INTO corsidilaurea VALUES (27, 'Ingegneria', 'Ingegneria Informatica', '1985/1986');

--
-- Data for Name: corsi
--

INSERT INTO corsi VALUES ('bdd1n', 9, 'Basi Di Dati 1', 15, true);
INSERT INTO corsi VALUES ('bdd2', 9, 'Basi Di Dati 2', 1, true);
INSERT INTO corsi VALUES ('ldp', 9, 'Linguaggi di Programmazione', 2, true);
INSERT INTO corsi VALUES ('r1', 9, 'Reti di calcolatori 1', 3, true);
INSERT INTO corsi VALUES ('r2', 9, 'Reti di Calcolatori 2', 3, true);
INSERT INTO corsi VALUES ('elimm1', 9, 'Elaborazione delle immagini 1', 5, true);
INSERT INTO corsi VALUES ('elimm2', 9, 'Elaborazione delle immagini 2', NULL, false);
INSERT INTO corsi VALUES ('mecraz', 27, 'Meccanica Razionale', NULL, false);
INSERT INTO corsi VALUES ('an1info', 9, 'Analisi 1', 1, true);
INSERT INTO corsi VALUES ('an2info', 9, 'Analisi 2', NULL, false);
INSERT INTO corsi VALUES ('an1mate', 1, 'Analisi 1', 1, true);
INSERT INTO corsi VALUES ('an2mate', 1, 'Analisi 2', NULL, false);
INSERT INTO corsi VALUES ('mate', 2, 'Istituzioni Matematiche', 2, true);
INSERT INTO corsi VALUES ('mat', 20, 'Istituzioni Matematiche', 1, true);
INSERT INTO corsi VALUES ('org1', 2, 'Chimica Organica 1', 10, true);
INSERT INTO corsi VALUES ('graf', 9, 'Grafica', 22, true);
INSERT INTO corsi VALUES ('ig', 9, 'Interfacce Grafiche', 22, true);
INSERT INTO corsi VALUES ('fis1', 6, 'Fisica 1', 1, true);
INSERT INTO corsi VALUES ('fis2', 6, 'Fisica 2 ', 2, true);
INSERT INTO corsi VALUES ('infogen', 6, 'Informatica Generale', 8, true);
INSERT INTO corsi VALUES ('infogenM', 1, 'Informatica Generale', 8, true);
INSERT INTO corsi VALUES ('matGen', 27, 'Istituzioni Matematiche', 14, true);
INSERT INTO corsi VALUES ('fis1si', 10, 'Fisica 1', 18, true);
INSERT INTO corsi VALUES ('fis2si', 10, 'Fisica 2', NULL, false);
INSERT INTO corsi VALUES ('ep', 25, 'Epistemologia', 7, true);
INSERT INTO corsi VALUES ('ai1', 10, 'Intelligenza Artificiale 1', 25, true);
INSERT INTO corsi VALUES ('ai2', 10, 'Intelligenza Artificiale 2', 27, true);
INSERT INTO corsi VALUES ('ai1in', 9, 'Intelligenza Artificiale 1', 23, true);
INSERT INTO corsi VALUES ('se', 9, 'Sistemi Esperti', 22, true);
INSERT INTO corsi VALUES ('it', 9, 'Informatica Teorica ', 20, true);
INSERT INTO corsi VALUES ('met', 10, 'Metodi', 19, true);
INSERT INTO corsi VALUES ('algo1', 9, 'Algoritmi e strutture dati 1', 15, true);
INSERT INTO corsi VALUES ('algo2', 10, 'Algoritmi e strutture dati 2', 15, true);
INSERT INTO corsi VALUES ('mraz', 6, 'Meccanica Razionale', 3, true);
INSERT INTO corsi VALUES ('mring', 17, 'Meccanica Razionale', 10, true);
INSERT INTO corsi VALUES ('info', 27, 'Informatica', 6, true);
INSERT INTO corsi VALUES ('ele1', 2, 'elettrochimica 1', 20, true);
INSERT INTO corsi VALUES ('ele2', 2, 'elettrochimica 2', 22, true);

--
-- Data for Name: studenti
--

INSERT INTO studenti VALUES ('pd123745', 'Rossi', 'Mario', 'Genova', '1977-12-23', 'Savona', 9, '1996/1997', 1, NULL);
INSERT INTO studenti VALUES ('se2084', 'Gelli', 'Mirko', 'Genova', '1980-07-01', 'Savona', 1, '1999/2000', NULL, NULL);
INSERT INTO studenti VALUES ('cdo42361', 'Parodi', 'Franca', 'Savona', '1979-08-15', 'Rimini', 4, '1998/1999', 1, NULL);
INSERT INTO studenti VALUES ('23re123', 'Verdi', 'Luisa', 'Roma', '1980-08-04', 'Bari', 4, '1999/2000', 1, NULL);
INSERT INTO studenti VALUES ('sc4023', 'Mercurio', 'Giuliano', 'La Spezia', '1980-01-06', 'Novi Ligure', 9, '1996/1997', 21, NULL);
INSERT INTO studenti VALUES ('pl5672', 'Merello', 'Fabrizio', 'Noli', '1980-07-03', 'Firenze', 6, '1989/1990', 21, NULL);
INSERT INTO studenti VALUES ('hg76394', 'Merella', 'Maurizio', 'Loano', '1976-12-15', 'Darfo B. T.', 9, '1995/1996', 12, NULL);
INSERT INTO studenti VALUES ('iu765', 'Gavilli', 'Dino', 'La Spezia', '1980-01-06', 'Novi Ligure', 9, '1996/1997', 21, NULL);
INSERT INTO studenti VALUES ('mf192', 'Fara', 'Vincenzo', 'Spotorno', '1975-07-03', 'Firenze', 9, '1989/1990', 3, NULL);
INSERT INTO studenti VALUES ('9uhg563', 'Fanizzi', 'Maurizio', 'Boissano', '1981-12-15', 'Milano', 1, '1993/1994', 5, NULL);
INSERT INTO studenti VALUES ('ed362', 'Gavizzi', 'Pietro', 'Bogliasco', '1979-01-15', 'Genova', 19, '1992/1993', 7, '2000-02-23');
INSERT INTO studenti VALUES ('kfi345', 'Fantino', 'Giuliano', 'Genova', '1980-07-08', 'Genova', 9, '1996/1997', 4, '2001-03-12');
INSERT INTO studenti VALUES ('pl489d', 'Bodrato', 'Fabrizio', 'Genova', '1980-11-03', 'Arquata Scrivia', 1, '1995/1996', 1, NULL);
INSERT INTO studenti VALUES ('hg763d', 'De Vecchi', 'Maurizio', 'Genova', '1979-12-12', 'Genova', 9, '1999/2000', 4, NULL);
INSERT INTO studenti VALUES ('12gt5', 'Devoto', 'Stefania', 'Genova', '1978-06-25', 'La Spezia', 9, '1996/1997', 2, NULL);
INSERT INTO studenti VALUES ('bd765', 'Gavilli', 'Mauro', 'La Spezia', '1980-01-06', 'Novi Ligure', 9, '1996/1997', 21, NULL);
INSERT INTO studenti VALUES ('ijff192', 'Fara', 'Vincenza', 'Spotorno', '1975-07-03', 'Firenze', 9, '1989/1990', 3, NULL);
INSERT INTO studenti VALUES ('45hg563', 'Fanizzi', 'Angela', 'Genova', '1981-12-15', 'Milano', 1, '1993/1994', 5, '2001-04-03');
INSERT INTO studenti VALUES ('e3462', 'Gavizzi', 'Simona', 'Bogliasco', '1979-01-15', 'Genova', 19, '1999/2000', 7, NULL);
INSERT INTO studenti VALUES ('kf7645', 'Fantino', 'Giulia', 'Genova', '1980-07-08', 'Genova', 9, '1996/1997', 4, NULL);
INSERT INTO studenti VALUES ('hy489d', 'Bodrato', 'Fabiana', 'Genova', '1980-11-03', 'Arquata Scrivia', 1, '1995/1996', 1, NULL);
INSERT INTO studenti VALUES ('h8u763d', 'De Vecchi', 'Massimiliano', 'Genova', '1979-12-12', 'Genova', 9, '1999/2000', 4, NULL);
INSERT INTO studenti VALUES ('23gt5', 'Devoto', 'Gianni', 'Genova', '1978-06-25', 'La Spezia', 9, '1996/1997', 2, '2001-10-24');
INSERT INTO studenti VALUES ('ki1235', 'Rossini', 'Mario', 'Genova', '1969-12-23', 'Genova', 9, '1994/1995', 1, NULL);
INSERT INTO studenti VALUES ('se26084', 'Gellini', 'Marco', 'Genova', '1980-07-01', 'Savona', 1, '1999/2000', NULL, NULL);
INSERT INTO studenti VALUES ('cdo361', 'Parodi', 'Francesco', 'Savona', '1979-08-15', 'Rimini', 4, '1998/1999', 1, NULL);
INSERT INTO studenti VALUES ('23re12yr3', 'De Vecchi', 'Luisa', 'Roma', '1980-08-04', 'Bari', 4, '1999/2000', 1, NULL);
INSERT INTO studenti VALUES ('sc47e023', 'Marcia', 'Giuliano', 'La Spezia', '1980-01-06', 'Novi Ligure', 9, '1996/1997', 8, NULL);
INSERT INTO studenti VALUES ('ed12yr3', 'Rossi', 'Mario', 'Roma', '1980-08-04', 'Bari', 4, '1999/2000', 1, NULL);
INSERT INTO studenti VALUES ('pl567re2', 'Marello', 'Fabrizio', 'Noli', '1980-07-03', 'Firenze', 6, '1989/1990', 21, NULL);
INSERT INTO studenti VALUES ('hg794', 'Marte', 'Maurizio', 'Loano', '1976-12-15', 'Brescia', 9, '1995/1996', 12, NULL);
INSERT INTO studenti VALUES ('12765tr', 'Gavizzi', 'Stefania', 'Roma', '1973-06-13', 'Roma', 19, '1992/1993', 7, '2000-02-21');
INSERT INTO studenti VALUES ('lu765', 'Gavilli', 'Daniela', 'La Spezia', '1980-01-06', 'Novi Ligure', 9, '1996/1997', 21, NULL);
INSERT INTO studenti VALUES ('mfiu192', 'Farassa', 'Vincenzina', 'Spotorno', '1975-07-03', 'Firenze', 9, '1989/1990', 8, NULL);
INSERT INTO studenti VALUES ('9ug563', 'Ferizzi', 'Maurizio', 'Boissano', '1981-12-15', 'Milano', 1, '1993/1994', 5, NULL);
INSERT INTO studenti VALUES ('xsed362', 'Gavilli', 'Giulio', 'Bogliasco', '1979-01-15', 'Genova', 19, '1992/1993', 7, '2000-02-21');
INSERT INTO studenti VALUES ('lofi345', 'Fantino', 'Alberto', 'Genova', '1980-07-08', 'Genova', 9, '1996/1997', 4, '2001-03-21');
INSERT INTO studenti VALUES ('pl9d', 'Bodrato', 'Emanuele', 'Genova', '1980-11-03', 'Arquata Scrivia', 1, '1995/1996', 1, NULL);
INSERT INTO studenti VALUES ('hg7d', 'Devoto', 'Marilena', 'Genova', '1979-12-12', 'Genova', 9, '1999/2000', 4, NULL);
INSERT INTO studenti VALUES ('12olgt5', 'Casaccio', 'Stefania', 'Genova', '1978-06-25', 'La Spezia', 9, '1996/1997', 2, NULL);
INSERT INTO studenti VALUES ('bd70f65', 'Novarese', 'Mauro', 'La Spezia', '1980-01-06', 'Novi Ligure', 9, '1996/1997', 21, NULL);
INSERT INTO studenti VALUES ('ijfer92', 'Novella', 'Vincenza', 'Spotorno', '1975-07-03', 'Firenze', 9, '1989/1990', 3, NULL);
INSERT INTO studenti VALUES ('43olg563', 'Filli', 'Angela', 'Genova', '1981-12-15', 'Milano', 1, '1993/1994', 5, NULL);
INSERT INTO studenti VALUES ('cde3462', 'Licci', 'Simona', 'Bogliasco', '1979-01-15', 'Genova', 19, '1995/1996', 7, NULL);
INSERT INTO studenti VALUES ('kf76hy', 'Damassino', 'Giulia', 'Genova', '1980-07-08', 'Genova', 9, '1996/1997', 4, NULL);
INSERT INTO studenti VALUES ('hy4mj89d', 'Baroncelli', 'Fabiana', 'Genova', '1980-11-03', 'Arquata Scrivia', 1, '1995/1996', 1, NULL);
INSERT INTO studenti VALUES ('h3d', 'De Sanctis', 'Massimiliano', 'Genova', '1979-12-12', 'Genova', 9, '1999/2000', 4, NULL);
INSERT INTO studenti VALUES ('23glot5', 'Danza', 'Gianni', 'Genova', '1978-06-25', 'La Spezia', 9, '1996/1997', 2, NULL);
INSERT INTO studenti VALUES ('dy192', 'Farazza', 'Valentina', 'Genova', '1972-07-03', 'Firenze', 6, '1989/1990', 3, '1996-07-03');
INSERT INTO studenti VALUES ('rehg563', 'Fabrizi', 'Maura', 'Boissano', '1973-12-15', 'Milano', 6, '1992/1993', 5, '1997-04-03');
INSERT INTO studenti VALUES ('ewd362', 'Serra', 'Pietro', 'Genova', '1976-01-15', 'Genova', 6, '1992/1993', 7, '1999-02-21');
INSERT INTO studenti VALUES ('kefi345', 'Melogno', 'Giuliano', 'Genova', '1974-07-08', 'Genova', 6, '1993/1994', 4, '2000-03-12');
INSERT INTO studenti VALUES ('dy3192', 'Farazza', 'Michele', 'Genova', '1972-07-03', 'Firenze', 9, '2000/2001', NULL, NULL);
INSERT INTO studenti VALUES ('r5g563', 'Fabrizi', 'Morena', 'Boissano', '1973-12-15', 'Milano', 9, '2000/2001', NULL, NULL);
INSERT INTO studenti VALUES ('e8fdy62', 'Serra', 'Paride', 'Genova', '1976-01-15', 'Genova', 9, '2000/2001', NULL, NULL);
INSERT INTO studenti VALUES ('kedue45', 'Melogno', 'Gennaro', 'Genova', '1974-07-08', 'Genova', 9, '2000/2001', NULL, NULL);
INSERT INTO studenti VALUES ('dy3192fr', 'Farazza', 'Michele', 'Genova', '1980-07-03', 'Firenze', 1, '2000/2001', NULL, '2006-02-02');
INSERT INTO studenti VALUES ('r5g56de3', 'Fabrizi', 'Morena', 'Boissano', '1978-12-15', 'Milano', 1, '2000/2001', NULL, NULL);
INSERT INTO studenti VALUES ('e8fdy62fs', 'Serra', 'Paride', 'Genova', '1980-01-15', 'Genova', 6, '2000/2001', NULL, NULL);
INSERT INTO studenti VALUES ('kedue45srt', 'Melogno', 'Gennaro', 'Genova', '1979-07-08', 'Genova', 6, '2000/2001', NULL, '2006-02-02');
INSERT INTO studenti VALUES ('kee45srt', 'Melogno', 'Gennaro', 'Genova', '1973-07-08', 'Genova', 6, '2000/2001', NULL, NULL);
INSERT INTO studenti VALUES ('af198aa', 'Farano', 'Anna', 'Spotorno', '1975-07-03', 'Firenze', 9, '1988/1989', 3, '1993-02-23');
INSERT INTO studenti VALUES ('nm4hg56', 'Nizzi', 'Marco', 'Genova', '1979-12-15', 'Genova', 1, '1989/1990', 5, '1994-02-03');
INSERT INTO studenti VALUES ('am166mm', 'Merlo', 'Anita', 'Rapallo', '1979-07-03', 'Genova', 9, '1989/1990', 3, '1994-06-23');

--
-- Data for Name: esami
--

INSERT INTO esami VALUES ('23glot5', 'algo1', '1998-02-20', 21);
INSERT INTO esami VALUES ('23glot5', 'graf', '1998-07-20', 25);
INSERT INTO esami VALUES ('23glot5', 'bdd2', '1999-02-27', 29);
INSERT INTO esami VALUES ('23glot5', 'bdd1n', '2000-09-08', 27);
INSERT INTO esami VALUES ('23glot5', 'it', '1999-06-02', 30);
INSERT INTO esami VALUES ('23glot5', 'ldp', '2001-09-09', 27);
INSERT INTO esami VALUES ('23glot5', 'r1', '1999-11-27', 29);
INSERT INTO esami VALUES ('23glot5', 'r2', '2001-09-21', 30);
INSERT INTO esami VALUES ('bd70f65', 'algo1', '1998-02-20', 21);
INSERT INTO esami VALUES ('bd70f65', 'graf', '1998-07-20', 25);
INSERT INTO esami VALUES ('bd70f65', 'bdd2', '1999-02-27', 29);
INSERT INTO esami VALUES ('bd70f65', 'bdd1n', '2000-09-08', 27);
INSERT INTO esami VALUES ('bd70f65', 'it', '1999-06-02', 30);
INSERT INTO esami VALUES ('bd70f65', 'ldp', '2001-09-09', 27);
INSERT INTO esami VALUES ('bd70f65', 'r1', '1999-11-27', 29);
INSERT INTO esami VALUES ('bd70f65', 'r2', '2001-09-21', 30);
INSERT INTO esami VALUES ('h3d', 'algo1', '2000-02-20', 21);
INSERT INTO esami VALUES ('h3d', 'graf', '2000-07-20', 25);
INSERT INTO esami VALUES ('h3d', 'bdd2', '2001-02-27', 29);
INSERT INTO esami VALUES ('h3d', 'bdd1n', '2001-09-08', 27);
INSERT INTO esami VALUES ('ijff192', 'algo1', '1998-02-20', 21);
INSERT INTO esami VALUES ('ijff192', 'graf', '1998-07-20', 20);
INSERT INTO esami VALUES ('ijff192', 'bdd2', '1994-02-27', 19);
INSERT INTO esami VALUES ('ijff192', 'an1mate', '2000-02-27', 19);
INSERT INTO esami VALUES ('ijff192', 'bdd1n', '2000-09-08', 27);
INSERT INTO esami VALUES ('ijff192', 'it', '1998-04-02', 30);
INSERT INTO esami VALUES ('ijff192', 'ldp', '2001-09-09', 27);
INSERT INTO esami VALUES ('ijff192', 'r1', '1999-11-27', 29);
INSERT INTO esami VALUES ('ijff192', 'r2', '2001-09-21', 30);
INSERT INTO esami VALUES ('sc47e023', 'bdd1n', '2000-09-08', 27);
INSERT INTO esami VALUES ('sc47e023', 'it', '1998-04-02', 30);
INSERT INTO esami VALUES ('sc47e023', 'ldp', '2001-09-09', 27);
INSERT INTO esami VALUES ('sc47e023', 'r1', '1999-11-27', 29);
INSERT INTO esami VALUES ('sc47e023', 'r2', '2002-02-15', 29);
INSERT INTO esami VALUES ('hy489d', 'infogenM', '2000-02-15', 18);
INSERT INTO esami VALUES ('43olg563', 'an2mate', '2000-02-15', 25);
INSERT INTO esami VALUES ('43olg563', 'infogenM', '2002-02-15', 25);
INSERT INTO esami VALUES ('45hg563', 'infogenM', '2002-02-15', 20);
INSERT INTO esami VALUES ('hy4mj89d', 'infogenM', '2002-02-15', 19);
INSERT INTO esami VALUES ('pl9d', 'infogenM', '2002-02-15', 19);
INSERT INTO esami VALUES ('se2084', 'infogenM', '2002-02-15', 29);
INSERT INTO esami VALUES ('h3d', 'bdd1n', '1999-10-08', 20);
INSERT INTO esami VALUES ('bd70f65', 'bdd1n', '1999-10-08', 29);
INSERT INTO esami VALUES ('bd70f65', 'ig', '1999-10-22', 24);
INSERT INTO esami VALUES ('23glot5', 'bdd1n', '1999-10-08', 23);
INSERT INTO esami VALUES ('ijff192', 'bdd1n', '2000-06-15', 22);
INSERT INTO esami VALUES ('sc47e023', 'bdd1n', '2000-06-15', 20);
INSERT INTO esami VALUES ('ijff192', 'ig', '2000-06-30', 24);
INSERT INTO esami VALUES ('sc47e023', 'ig', '2000-06-29', 27);
INSERT INTO esami VALUES ('23glot5', 'algo1', '2000-06-01', 32);
INSERT INTO esami VALUES ('23glot5', 'ldp', '2000-06-09', 22);
INSERT INTO esami VALUES ('bd70f65', 'bdd1n', '1998-10-08', 12);
INSERT INTO esami VALUES ('bd70f65', 'ig', '1999-09-01', 15);
INSERT INTO esami VALUES ('23glot5', 'bdd1n', '1999-02-12', 10);
INSERT INTO esami VALUES ('ijff192', 'bdd1n', '2000-01-15', 8);
INSERT INTO esami VALUES ('sc47e023', 'ig', '2000-04-12', 16);
INSERT INTO esami VALUES ('23glot5', 'algo1', '2000-04-01', 12);
INSERT INTO esami VALUES ('23glot5', 'ldp', '2000-01-07', 13);
INSERT INTO esami VALUES ('23glot5', 'it', '1999-04-01', 10);
INSERT INTO esami VALUES ('23glot5', 'ldp', '2001-07-09', 7);
INSERT INTO esami VALUES ('23glot5', 'r1', '1999-01-27', 9);
INSERT INTO esami VALUES ('23glot5', 'r2', '2001-02-21', 10);
INSERT INTO esami VALUES ('bd70f65', 'algo1', '1997-02-20', 11);
INSERT INTO esami VALUES ('bd70f65', 'graf', '1998-06-20', 5);
INSERT INTO esami VALUES ('h8u763d', 'an1info', '2000-02-21', 10);
INSERT INTO esami VALUES ('hg76394', 'an1info', '2000-02-21', 8);
INSERT INTO esami VALUES ('hg763d', 'an1info', '2000-02-21', 15);
INSERT INTO esami VALUES ('h8u763d', 'an2info', '2001-02-21', 10);
INSERT INTO esami VALUES ('hg76394', 'an2info', '2001-02-21', 8);
INSERT INTO esami VALUES ('hg763d', 'an2info', '2001-02-21', 15);
INSERT INTO esami VALUES ('h8u763d', 'elimm1', '1999-02-21', 10);
INSERT INTO esami VALUES ('hg76394', 'elimm1', '1999-02-21', 8);
INSERT INTO esami VALUES ('hg763d', 'elimm2', '1999-02-21', 15);
INSERT INTO esami VALUES ('e8fdy62fs', 'fis1', '1999-02-21', 20);
INSERT INTO esami VALUES ('e8fdy62fs', 'fis2', '1999-06-21', 24);
INSERT INTO esami VALUES ('e8fdy62fs', 'infogen', '2000-04-21', 27);
INSERT INTO esami VALUES ('e8fdy62fs', 'mraz', '2001-06-21', 28);
INSERT INTO esami VALUES ('kee45srt', 'fis1', '1999-02-21', 20);
INSERT INTO esami VALUES ('kee45srt', 'fis2', '1999-06-21', 24);
INSERT INTO esami VALUES ('kee45srt', 'infogen', '2000-04-21', 27);
INSERT INTO esami VALUES ('kee45srt', 'mraz', '2001-06-21', 28);
INSERT INTO esami VALUES ('dy3192fr', 'an1mate', '1999-06-21', 24);
INSERT INTO esami VALUES ('dy3192fr', 'an2mate', '2000-04-21', 27);
INSERT INTO esami VALUES ('dy3192fr', 'infogenM', '2001-06-21', 28);
INSERT INTO esami VALUES ('9ug563', 'an2mate', '2000-06-07', 14);
INSERT INTO esami VALUES ('dy3192fr', 'an2mate', '2000-06-07', 24);
INSERT INTO esami VALUES ('9uhg563', 'an2mate', '2000-06-07', 21);
INSERT INTO esami VALUES ('pl489d', 'infogenM', '2000-06-15', 22);
INSERT INTO esami VALUES ('kedue45srt', 'infogen', '2000-06-12', 14);
INSERT INTO esami VALUES ('kee45srt', 'fis2', '2000-06-14', 24);
INSERT INTO esami VALUES ('kefi345', 'fis2', '2000-06-14', 21);
INSERT INTO esami VALUES ('dy192', 'fis1', '2000-06-30', 22);
INSERT INTO esami VALUES ('hg794', 'r2', '2000-06-14', 21);
INSERT INTO esami VALUES ('hg7d', 'r2', '2000-06-30', 22);
INSERT INTO esami VALUES ('kfi345', 'algo1', '2000-06-20', 21);
INSERT INTO esami VALUES ('ki1235', 'elimm2', '2000-06-20', 22);
INSERT INTO esami VALUES ('kedue45', 'bdd1n', '2000-06-20', 21);
INSERT INTO esami VALUES ('lofi345', 'bdd1n', '2000-06-20', 22);
INSERT INTO esami VALUES ('sc4023', 'ig', '2000-06-20', 22);
INSERT INTO esami VALUES ('mf192', 'ig', '2000-06-20', 21);
INSERT INTO esami VALUES ('r5g563', 'ig', '2000-06-20', 22);
INSERT INTO esami VALUES ('kf7645', 'bdd1n', '2000-06-13', 22);
INSERT INTO esami VALUES ('kf76hy', 'ig', '2000-06-01', 22);
INSERT INTO esami VALUES ('mfiu192', 'ig', '2000-06-01', 21);
INSERT INTO esami VALUES ('pd123745', 'ig', '2000-06-01', 22);

--
-- Data for Name: pianidistudio
--

INSERT INTO pianidistudio VALUES ('kf7645', '2001/2002', 5);
INSERT INTO pianidistudio VALUES ('kf76hy', '2001/2002', 5);
INSERT INTO pianidistudio VALUES ('kfi345', '2001/2002', 5);
INSERT INTO pianidistudio VALUES ('mfiu192', '2001/2002', 5);
INSERT INTO pianidistudio VALUES ('ki1235', '2001/2002', 5);
INSERT INTO pianidistudio VALUES ('pd123745', '2001/2002', 5);
INSERT INTO pianidistudio VALUES ('sc4023', '2001/2002', 5);
INSERT INTO pianidistudio VALUES ('sc47e023', '2001/2002', 5);
INSERT INTO pianidistudio VALUES ('23re123', '2000/2001', 2);
INSERT INTO pianidistudio VALUES ('45hg563', '1993/1994', 1);
INSERT INTO pianidistudio VALUES ('45hg563', '1994/1995', 2);
INSERT INTO pianidistudio VALUES ('45hg563', '1995/1996', 3);
INSERT INTO pianidistudio VALUES ('45hg563', '2000/2001', 4);
INSERT INTO pianidistudio VALUES ('bd765', '1996/1997', 1);
INSERT INTO pianidistudio VALUES ('bd765', '1997/1998', 2);
INSERT INTO pianidistudio VALUES ('bd765', '1998/1999', 3);
INSERT INTO pianidistudio VALUES ('bd765', '2000/2001', 4);
INSERT INTO pianidistudio VALUES ('bd765', '2001/2002', 5);
INSERT INTO pianidistudio VALUES ('23gt5', '1996/1997', 1);
INSERT INTO pianidistudio VALUES ('23gt5', '1997/1998', 2);
INSERT INTO pianidistudio VALUES ('23gt5', '1998/1999', 3);
INSERT INTO pianidistudio VALUES ('23gt5', '2000/2001', 4);
INSERT INTO pianidistudio VALUES ('23gt5', '2001/2002', 5);
INSERT INTO pianidistudio VALUES ('h8u763d', '1999/2000', 1);
INSERT INTO pianidistudio VALUES ('h8u763d', '2000/2001', 2);
INSERT INTO pianidistudio VALUES ('h8u763d', '2001/2002', 3);


