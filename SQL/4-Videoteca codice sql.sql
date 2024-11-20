

CREATE TABLE cliente (
    codcli int NOT NULL,
    nome varchar(20) NOT NULL,
    cognome varchar(20) NOT NULL,
    datan date NOT NULL,
    residenza varchar(40) NOT NULL
);

CREATE TABLE consiglia (
    codcli int NOT NULL,
    titolo varchar(30) NOT NULL,
    regista varchar(20) NOT NULL,
    giudizio int NOT NULL,
    CONSTRAINT check_1 CHECK ((giudizio >= 0) AND (giudizio <= 5))
);

CREATE TABLE film (
    titolo varchar(30) NOT NULL,
    regista varchar(20) NOT NULL,
    anno int NOT NULL,
    genere varchar(20) NOT NULL,
    valutazione numeric(3,2),
    CONSTRAINT v_ok CHECK ((valutazione >= 0) AND (valutazione <= 5))
);

CREATE TABLE noleggio (
    codcli int NOT NULL,
    colloc int NOT NULL,
    datanol timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    datarest timestamp
);

CREATE TABLE rispondea (
    codcli int NOT NULL,
    numero varchar(20) NOT NULL
);

CREATE TABLE video (
    colloc int NOT NULL,
    titolo varchar(30) NOT NULL,
    regista varchar(20) NOT NULL,
    tipo varchar(1) DEFAULT 'd',
    CONSTRAINT check_1 CHECK ((tipo = 'd') OR (tipo = 'v'))
);

CREATE TABLE standard (
    codcli int NOT NULL,
    ptimancanti int NOT NULL
);

CREATE TABLE telefono (
    numero varchar(20) NOT NULL
);

CREATE TABLE vip (
    codcli int NOT NULL,
    bonus numeric(3,2) NOT NULL
);

INSERT INTO cliente VALUES (6610, 'anna', 'rossi', '1979-10-05', 'via scribanti 16 16131 genova');
INSERT INTO cliente VALUES (6635, 'paola', 'bianchi', '1976-04-12', 'via dodecaneso 35 16146 genova');
INSERT INTO cliente VALUES (6642, 'marco', 'verdi', '1972-10-16', 'via langustena 35 16131 genova');
INSERT INTO consiglia VALUES (6642, 'pulp fiction', 'quentin tarantino', 5);
INSERT INTO consiglia VALUES (6635, 'pulp fiction', 'quentin tarantino', 4);
INSERT INTO film VALUES ('underground', 'emir kusturica', 1995, 'drammatico', 3.20);
INSERT INTO film VALUES ('edward mani di forbici', 'tim burton', 1990, 'fantastico', 3.60);
INSERT INTO film VALUES ('nightmare before christmas', 'tim burton', 1993, 'animazione', 4.00);
INSERT INTO film VALUES ('ed wood', 'tim burton', 1994, 'drammatico', 4.00);
INSERT INTO film VALUES ('mars attacks', 'tim burton', 1996, 'fantascienza', 3.00);
INSERT INTO film VALUES ('il mistero di sleepy hollow', 'tim burton', 1999, 'horror', 3.50);
INSERT INTO film VALUES ('big fish', 'tim burton', 2003, 'fantastico', 3.10);
INSERT INTO film VALUES ('la sposa cadavere', 'tim burton', 2005, 'animazione', 3.50);
INSERT INTO film VALUES ('la fabbrica di cioccolato', 'tim burton', 2005, 'fantastico', 4.00);
INSERT INTO film VALUES ('io non ho paura', 'gabriele salvatores', 2003, 'drammatico', 3.50);
INSERT INTO film VALUES ('nirvana', 'gabriele salvatores', 1997, 'fantascienza', 3.00);
INSERT INTO film VALUES ('mediterraneo', 'gabriele salvatores', 1991, 'commedia', 3.80);
INSERT INTO film VALUES ('pulp fiction', 'quentin tarantino', 1994, 'thriller', 3.50);
INSERT INTO film VALUES ('le iene', 'quentin tarantino', 1992, 'thriller', 4.00);
INSERT INTO noleggio VALUES (6635, 1111, '2006-03-01 00:00:00', '2006-03-02 00:00:00');
INSERT INTO noleggio VALUES (6635, 1115, '2006-03-01 00:00:00', '2006-03-02 00:00:00');
INSERT INTO noleggio VALUES (6635, 1117, '2006-03-02 00:00:00', '2006-03-06 00:00:00');
INSERT INTO noleggio VALUES (6635, 1118, '2006-03-02 00:00:00', '2006-03-06 00:00:00');
INSERT INTO noleggio VALUES (6642, 1111, '2006-03-04 00:00:00', '2006-03-05 00:00:00');
INSERT INTO noleggio VALUES (6635, 1119, '2006-03-08 00:00:00', '2006-03-10 00:00:00');
INSERT INTO noleggio VALUES (6635, 1120, '2006-03-08 00:00:00', '2006-03-10 00:00:00');
INSERT INTO noleggio VALUES (6642, 1116, '2006-03-08 00:00:00', '2006-03-09 00:00:00');
INSERT INTO noleggio VALUES (6642, 1118, '2006-03-10 00:00:00', '2006-03-11 00:00:00');
INSERT INTO noleggio VALUES (6635, 1121, '2006-03-15 00:00:00', '2006-03-18 00:00:00');
INSERT INTO noleggio VALUES (6635, 1122, '2006-03-15 00:00:00', '2006-03-18 00:00:00');
INSERT INTO noleggio VALUES (6635, 1113, '2006-03-15 00:00:00', '2006-03-18 00:00:00');
INSERT INTO noleggio VALUES (6635, 1129, '2006-03-15 00:00:00', '2006-03-20 00:00:00');
INSERT INTO noleggio VALUES (6642, 1119, '2006-03-15 00:00:00', '2006-03-16 00:00:00');
INSERT INTO noleggio VALUES (6610, 1126, '2006-03-15 00:00:00', '2006-03-16 00:00:00');
INSERT INTO noleggio VALUES (6610, 1112, '2006-03-16 00:00:00', '2006-03-18 00:00:00');
INSERT INTO noleggio VALUES (6610, 1114, '2006-03-16 00:00:00', '2006-03-17 00:00:00');
INSERT INTO noleggio VALUES (6642, 1128, '2006-03-18 00:00:00', '2006-03-20 00:00:00');
INSERT INTO noleggio VALUES (6610, 1124, '2006-03-20 00:00:00', '2006-03-21 00:00:00');
INSERT INTO noleggio VALUES (6610, 1115, '2006-03-20 00:00:00', '2006-03-21 00:00:00');
INSERT INTO noleggio VALUES (6642, 1124, '2006-03-21 00:00:00', '2006-03-22 00:00:00');
INSERT INTO noleggio VALUES (6610, 1116, '2006-03-21 00:00:00', NULL);
INSERT INTO noleggio VALUES (6610, 1117, '2006-03-21 00:00:00', NULL);
INSERT INTO noleggio VALUES (6635, 1127, '2006-03-22 00:00:00', NULL);
INSERT INTO noleggio VALUES (6635, 1125, '2006-03-22 00:00:00', NULL);
INSERT INTO noleggio VALUES (6642, 1122, '2006-03-22 00:00:00', NULL);
INSERT INTO noleggio VALUES (6642, 1113, '2006-03-22 00:00:00', NULL);
INSERT INTO rispondea VALUES (6610, '01055664433');
INSERT INTO rispondea VALUES (6635, '0104647992');
INSERT INTO rispondea VALUES (6642, '3336745383');
INSERT INTO standard VALUES (6610, 5);
INSERT INTO standard VALUES (6642, 4);
INSERT INTO telefono VALUES ('01055664433');
INSERT INTO telefono VALUES ('0104647992');
INSERT INTO telefono VALUES ('3336745383');
INSERT INTO video VALUES (1111, 'underground', 'emir kusturica', 'v');
INSERT INTO video VALUES (1112, 'underground', 'emir kusturica', 'd');
INSERT INTO video VALUES (1113, 'big fish', 'tim burton', 'v');
INSERT INTO video VALUES (1114, 'big fish', 'tim burton', 'd');
INSERT INTO video VALUES (1115, 'edward mani di forbici', 'tim burton', 'd');
INSERT INTO video VALUES (1116, 'nightmare before christmas', 'tim burton', 'v');
INSERT INTO video VALUES (1117, 'nightmare before christmas', 'tim burton', 'd');
INSERT INTO video VALUES (1118, 'ed wood', 'tim burton', 'd');
INSERT INTO video VALUES (1119, 'mars attacks', 'tim burton', 'd');
INSERT INTO video VALUES (1120, 'il mistero di sleepy hollow', 'tim burton', 'd');
INSERT INTO video VALUES (1121, 'la sposa cadavere', 'tim burton', 'd');
INSERT INTO video VALUES (1122, 'la fabbrica di cioccolato', 'tim burton', 'd');
INSERT INTO video VALUES (1123, 'la fabbrica di cioccolato', 'tim burton', 'd');
INSERT INTO video VALUES (1124, 'io non ho paura', 'gabriele salvatores', 'd');
INSERT INTO video VALUES (1125, 'nirvana', 'gabriele salvatores', 'd');
INSERT INTO video VALUES (1126, 'mediterraneo', 'gabriele salvatores', 'd');
INSERT INTO video VALUES (1127, 'pulp fiction', 'quentin tarantino', 'v');
INSERT INTO video VALUES (1128, 'pulp fiction', 'quentin tarantino', 'd');
INSERT INTO video VALUES (1129, 'le iene', 'quentin tarantino', 'd');
INSERT INTO vip VALUES (6635, 5.00);
ALTER TABLE cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY (codcli);
ALTER TABLE cliente
    ADD CONSTRAINT cliente_ak_1 UNIQUE (nome, cognome, datan);    
ALTER TABLE consiglia
    ADD CONSTRAINT consiglia_pk PRIMARY KEY (codcli, titolo, regista);
ALTER TABLE film
    ADD CONSTRAINT film_pk PRIMARY KEY (titolo, regista);
ALTER TABLE noleggio
    ADD CONSTRAINT noleggio_pk PRIMARY KEY (codcli, colloc, datanol);
ALTER TABLE rispondea
    ADD CONSTRAINT rispondea_pk PRIMARY KEY (codcli, numero);
ALTER TABLE standard
    ADD CONSTRAINT standard_pk PRIMARY KEY (codcli);
ALTER TABLE telefono
    ADD CONSTRAINT telefono_pk PRIMARY KEY (numero);
ALTER TABLE video
    ADD CONSTRAINT video_pk PRIMARY KEY (colloc);
ALTER TABLE vip
    ADD CONSTRAINT vip_pk PRIMARY KEY (codcli);
ALTER TABLE consiglia
    ADD CONSTRAINT consiglia_cliente FOREIGN KEY (codcli) REFERENCES cliente(codcli) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE consiglia
    ADD CONSTRAINT consiglia_film FOREIGN KEY (titolo, regista) REFERENCES film(titolo, regista) ON UPDATE CASCADE;
ALTER TABLE noleggio
    ADD CONSTRAINT noleggio_cliente FOREIGN KEY (codcli) REFERENCES cliente(codcli) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE noleggio
    ADD CONSTRAINT noleggio_video FOREIGN KEY (colloc) REFERENCES video(colloc) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE rispondea
    ADD CONSTRAINT rispondea_cliente FOREIGN KEY (codcli) REFERENCES cliente(codcli) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE rispondea
    ADD CONSTRAINT rispondea_telefono FOREIGN KEY (numero) REFERENCES telefono(numero) ON UPDATE CASCADE;
ALTER TABLE standard
    ADD CONSTRAINT standard_cliente FOREIGN KEY (codcli) REFERENCES cliente(codcli) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE video
    ADD CONSTRAINT video_film FOREIGN KEY (titolo, regista) REFERENCES film(titolo, regista) ON UPDATE CASCADE;
ALTER TABLE vip
    ADD CONSTRAINT vip_cliente FOREIGN KEY (codcli) REFERENCES cliente(codcli) ON UPDATE CASCADE ON DELETE CASCADE;

