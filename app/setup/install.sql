# phpMyAdmin MySQL-Dump
# version 2.3.0-rc1
# http://phpwizard.net/phpMyAdmin/
# http://www.phpmyadmin.net/ (download page)
#
# Host: localhost
# Erstellungszeit: 16. Mai 2003 um 17:47
# Server Version: 3.23.53
# PHP-Version: 4.3.1
# Datenbank: `oxid`
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxaddress`
#

DROP TABLE IF EXISTS oxaddress;
CREATE TABLE oxaddress (
  OXID varchar(32) NOT NULL default '',
  OXUSERID varchar(32) NOT NULL default '',
  OXCOMPANY varchar(255) NOT NULL default '',
  OXFNAME varchar(255) NOT NULL default '',
  OXLNAME varchar(255) NOT NULL default '',
  OXSTREET varchar(255) NOT NULL default '',
  OXADDINFO varchar(255) NOT NULL default '',
  OXCITY varchar(255) NOT NULL default '',
  OXCOUNTRY varchar(255) NOT NULL default '',
  OXZIP varchar(50) NOT NULL default '',
  OXFON varchar(128) NOT NULL default '',
  OXFAX varchar(128) NOT NULL default '',
  OXSAL varchar(128) NOT NULL default '',
  PRIMARY KEY  (OXID),
  KEY OXUSERID (OXUSERID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxaddress`
#

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxarticles`
#

DROP TABLE IF EXISTS oxarticles;
CREATE TABLE oxarticles (
  OXID varchar(32) NOT NULL default '',
  OXNID varchar(32) NOT NULL default '',
  OXLANG tinyint(4) NOT NULL default '0',
  OXSHOPID varchar(32) NOT NULL default '',
  OXPARENTID varchar(32) default NULL,
  OXACTIV char(1) NOT NULL default '',
  OXACTIVFROM datetime default NULL,
  OXACTIVTO datetime default NULL,
  OXARTNUM varchar(255) NOT NULL default '',
  OXTITLE varchar(255) NOT NULL default '',
  OXSHORTDESC varchar(255) NOT NULL default '',
  OXLONGDESC text NOT NULL,
  OXPRICE double NOT NULL default '0',
  OXBPRICE double NOT NULL default '0',
  OXTPRICE double NOT NULL default '0',
  OXEXTURL varchar(255) NOT NULL default '',
  OXURLDESC varchar(255) NOT NULL default '',
  OXURLIMG varchar(128) NOT NULL default '',
  OXVAT double default NULL,
  OXTHUMB varchar(128) NOT NULL default '',
  OXPIC1 varchar(128) NOT NULL default '',
  OXPIC2 varchar(128) NOT NULL default '',
  OXPIC3 varchar(128) NOT NULL default '',
  OXPIC4 varchar(128) NOT NULL default '',
  OXPIC5 varchar(128) NOT NULL default '',
  OXWEIGHT double NOT NULL default '0',
  OXSTOCK int(11) NOT NULL default '-1',
  OXDELIVERY date NOT NULL default '0000-00-00',
  OXINSERT date NOT NULL default '0000-00-00',
  OXTIMESTAMP timestamp NOT NULL,
  OXLENGTH double NOT NULL default '0',
  OXWIDTH double NOT NULL default '0',
  OXHEIGHT double NOT NULL default '0',
  OXAKTION varchar(128) NOT NULL default '',
  OXFILE varchar(128) NOT NULL default '',
  OXSEARCHKEYS varchar(255) NOT NULL default '',
  OXTEMPLATE varchar(128) NOT NULL default '',
  OXQUESTIONEMAIL varchar(255) NOT NULL default '',
  PRIMARY KEY  (OXID),
  KEY OXNID (OXNID),
  KEY OXSHOPID (OXSHOPID),
  KEY OXLANG (OXLANG)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxarticles`
#

INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fa7a9ab7d91.20301208_0', '09c3e9fa7a9ab7d91.20301208', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1119', 'Essbare Unterw�sche GIRL', 'Ich lieb dich so, ich w�rd dich am liebsten aauufffressen, S��e!!', 'Ich lieb dich so, ich w�rd dich am liebsten aauufffressen, S��e!! Jetzt gibts keine Ausreden mehr. Zumindest der Slip muss dran glauben, denn der ist wirklich eine Gaumenfreude f�r verw�hnte Geniesser...Nicht ins Wasser h�pfen damit, denn da l�st er sich auf!<br><br>\r\n\r\nGr��e: Uni Size<br>', '9.9', '0', '12.9', '', '', '', '0', '1119_f.jpg', '1119.jpg', '1119_z1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '2003-04-20', '2003-04-18', 20030421135934, '0', '0', '0', '', '', 'sexy toys erotic him her liebe heiss hot dessous w�sche porno kult frauen', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9faa00b85159.72617565_0', '09c3e9faa00b85159.72617565', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1465', 'Slip Military GIRL', '�berrasch doch deinen S��en mal in Uniform!', '�berrasch doch deinen S��en mal in Uniform! Man muss ja am Anfang nicht gleich �bertreiben. Der Slip Military GIRL ist ein guter Einstieg!<br><br>\r\n\r\nGr��e: Uni Size<br>', '9.9', '0', '0', '', '', '', NULL, '1465_f.jpg', '1465.jpg', '1465_z1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-18', 20030421105514, '0', '0', '0', 'OXSTART', '', 'fashion konfektion unterhose badehose suit bikini dessous karneval fasching bdsm bizzar', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9faaa9a9be17.25775783_0', '09c3e9faaa9a9be17.25775783', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1468', 'Peppermint NIPPLES', 'Ein bischen Naschen schadet nie...', 'Ein bischen Naschen schadet nie... Damit kannst du wunderbar die Zeit, bis deine Angebetete wieder in deinen Armen liegt, �berbr�cken. Und den frischen Atem gibts gleich dazu.<br><br>\r\n\r\nInhalt: 75 g<br><br>', '5.95', '0', '0', '', '', '', NULL, '1468_f.jpg', '1468.jpg', '1468_z1.jpg', '', '', '', '0', -1, '0000-00-00', '2003-04-18', 20030425111445, '0', '0', '0', '', '', 'bonbon s�ssigkeit food essen lutschen party', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fab3fd08d54.35253029_0', '09c3e9fab3fd08d54.35253029', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1132', 'Set LATTE MACCHIATO', '"Ich h�tte gern einen Latte Macchiato"', '"Ich h�tte gern einen Latte Macchiato"<br>\r\n"Was bitte?"<br>\r\n"Na einen Espresso mit aufgesch�umter Milch!"<br>\r\n"Ah Kaffee... darf ich ihnen ein K�nnchen oder eine Tasse bringen?"<br><br>\r\nAlso wohl doch besser zu Hause geniessen! Im Set LATTE MACCHIATO ist alles drin f�rs kleine Gl�ck.<br><br>\r\n\r\nInhalt:<br>\r\n2 hohe Latte Macchiato Gl�ser<br>\r\n2 lange L�ffel<br>\r\n1 elektrischer Milchaufsch�umer inkl. Batterien<br>', '23.4', '0', '0', '', '', '', NULL, '1132_f.jpg', '1132.jpg', '1132_z1.jpg', '', '', '', '0', -1, '0000-00-00', '2003-04-18', 20030425111445, '0', '0', '0', '', '', 'Italien italia kaffee cafe capucchino milchkaffee geschenk muttertag genuss', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fabdd351246.80879105_0', '09c3e9fabdd351246.80879105', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1548', 'Zitronenquetscher SQUEEZE', 'Frisch gequetschter Zitronensaft aus dem SQUEEZE!', 'Frisch gequetschter Zitronensaft aus dem SQUEEZE! Speziell f�r kleinere Mengen in der K�che, oder zum Nachs�uern auf dem Tisch eine perfekte L�sung. Man vermeidet das Spritzen in die Augen und auf die Nachbarteller. Die Anwendung ist denkbar einfach: Zitrone rein und draufdr�cken.<br><br>\r\n\r\nH�he: 19 cm<br>\r\nDurchmesser: 8 cm<br>\r\nMaterial: lebensmittelechtes PVC<br>', '14.9', '0', '0', '', '', '', NULL, '1548_f.jpg', '1548.jpg', '1548_z1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-18', 20030425111445, '0', '0', '0', 'OXSTART', '', 'design k�che tisch kaffee tasse tee hype 70er 70ies', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fac43e3e318.94516920_0', '09c3e9fac43e3e318.94516920', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1348', 'Eierschalen-Sollbruchstellen-Verursacher CLACK', 'Der Name sagt eigentlich schon alles...', 'Der Name sagt eigentlich schon alles... Das Ei bekommt ein H�tchen auf, eine Kugel f�llt entlang der Stange drauf und CLACK ist der Deckel perfekter, sauberer und gerader als du es jemals zu tr�umen gewagt hattest, abgetrennt.<br><br>\r\n\r\nH�he: 24 cm<br>\r\nDurchmesser: 4 cm<br>\r\nGewicht: 110 g<br>', '17.8', '0', '0', '', '', '', NULL, '1348_f.jpg', '1348.jpg', '1348_z1.jpg', '', '', '', '0', -1, '0000-00-00', '2003-04-18', 20030425111445, '0', '0', '0', '', '', 'clack klack eierschalensollbruchstellenverursacher ostern abgefahren muttertag vatertag', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9facb1255690.68314300_0', '09c3e9facb1255690.68314300', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1113', 'Timer PiepEI', '"Ich wollt ich w�r ein Hahn..."', '"Ich wollt ich w�r ein Huhn..." Diese Melodie spielt unser PiepEI wenn es zusammen mit deinen Fr�hst�ckseiern im Topf schwimmend das Ende der Kochzeit feststellt. Das ist nicht nur �usserst praktisch, sondern auch ein echter Bonus f�r die Umwelt und deine Stromrechnung: Da das PiepEI durch eine Differentialgleichung die Temperatur im Dotter mit der Wassertemperatur vergleicht, kannst Du den Kochvorgang mit kaltem Wasser starten! Und noch besser: Auf das Anpieksen verzichten! Wird inklusive Batterien geliefert und ist nat�rlich auf Lebensmittelunbedenklichkeit gepr�ft.<br><br>', '12.7', '0', '0', '', '', '', NULL, '1113_f.jpg', '1113.jpg', '1113_z1.jpg', '', '', '', '0', -1, '0000-00-00', '2003-04-18', 20030425111445, '0', '0', '0', '', '', 'ostern eierkocher huhn h�hner muttertag eieruhr', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fb12656dd06.98348161_0', '09c3e9fb12656dd06.98348161', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '670-055', 'Schwenkgrill', 'Ein lackiertes Dreibeinstativ', 'Dieser Grill besteht aus einem lackiertem Dreibeinstativ an dem eine Kette eingeh�ngt ist mit der sich die H�he des daran eingeh�ngten Grillrost einstellen l��t.\r\nDie emaillierte Glutwanne steht auf drei F�ssen.\r\nDie Grillfl�che hat einen Durchmesser von 55 cm.', '48.9', '0', '0', '', '', '', NULL, 'thumb_670055.jpg', '670055.jpg', '670055_z1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-18', 20030425111445, '0', '0', '0', 'OXSTART', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fb35ac46af7.88737723_0', '09c3e9fb35ac46af7.88737723', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '670-021', 'Rundgrill 0666', 'Dieser Rundgrill hat drei F�sse', 'Dieser Rundgrill hat drei F�sse, an zwei befinden sich Rollen.\r\nDer Windschutz ist lackiert und die Feuersch�ssel ist emailiert.\r\nDer Grillrost hat einen Duchmesser von 45 cm und ist wie die Ablage verchromt.\r\nDer Grill hat eine H�he von 75 cm und ist T�V/GS gepr�ft.', '39', '0', '0', '', '', '', NULL, 'thumb_670021.jpg', '670021.jpg', '670021_z1.jpg', '', '', '', '0', -1, '0000-00-00', '2003-04-18', 20030425111445, '0', '0', '0', '', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fb3d152c690.15484054_0', '09c3e9fb3d152c690.15484054', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '670 129', 'Grillbesteck', '', '3-teiliges Grillbesteck aus Edelstahl.<br />\r\nDie Besteckl�nge betr�gt 37cm.<br />\r\nSet bestehend aus:<br />\r\n<ul><br />\r\n<li> Bratenwender<br />\r\n<li> Grillgabel<br />\r\n<li> Grillzange<br />\r\n</ul>', '19.95', '0', '0', '', '', '', NULL, 'thumb_670129.jpg', '670129.jpg', '670129_z1.jpg', '', '', '', '0', -1, '0000-00-00', '2003-04-18', 20030425111445, '0', '0', '0', '', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fb53e85f9a6.81000848_0', '09c3e9fb53e85f9a6.81000848', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '627827', 'Zwerg auf Flo�', 'Der Zwerg kann schwimmen', 'Gartenzwerg aus hochwertigem und bruchsicherem Kunststoff.\r\nKann z.B. auf dem Gartenteich schwimmen.\r\nL�nge: 37cm', '29.9', '0', '0', '', '', '', NULL, 'thumb_627827.jpg', '627827.jpg', '627827_z1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-18', 20030425111445, '0', '0', '0', 'OXSTART', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fb5cf8fb250.95817693_0', '09c3e9fb5cf8fb250.95817693', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '627828', 'Zwerg auf Seerosenblatt', 'Auch dieser Zwerg kann richtig schwimmen', 'Gartenzwerg aus hochwertigem und bruchsicherem Kunststoff.\r\nKann z.B auf dem Gartenteich schwimmen.\r\nDurchmesser: 30cm\r\n', '17.9', '0', '0', '', '', '', NULL, 'thumb_627828.jpg', '627828.jpg', '627828_z1.jpg', '', '', '', '0', -1, '0000-00-00', '2003-04-18', 20030425111445, '0', '0', '0', '', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fb8b2854ce4.98142407_0', '09c3e9fb8b2854ce4.98142407', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '001', 'oxid eSales', 'Basispaket Onlineshop', 'Wie hei�t es immer wieder so sch�n: Ein Onlineshop ist ein Verk�ufer, der einmal eingerichtet 7 Tage die Woche und 24 Stunden am Tag f�r Sie verkauft. \r\n<br><br>\r\n<ul><li><b>Frage 1:</b> W�rden Sie einen begnadeten Programmierer in Ihrem Laden stellen? Nein? Ach so, der kann nicht verkaufen - na ja, dann.</li>\r\n<li><b>Frage 2:</b> Warum soll ein begnadeter Programmierer auf einmal besser verkaufen, wenn er �ber das Internet verkauft?</li>\r\n</ul>\r\n<br>oxid eSales - ist Ihre L�sung. Sie k�nnen sich sicher sein, dass Sie Ihren Kunden mit oxid eSales  bestens bedienen! \r\n<br><br>\r\noxid eSales - <b>wurde von Verk�ufern - f�r Verk�ufer</b> entwickelt, und ist ganz nebenbei auf dem neuesten Stand der Technik. \r\nProduktbeschreibung\r\n<br><br>\r\noxid eSales ist ein sogenanntes Warenkorb, oder auch Onlineshoppingsystem. Sie k�nnen mit oxid eSales �ber das Internet verkaufen. <b>Ganz einfach � einfach verkaufen!</b> Sie haben mit oxid eSales alle M�glichkeiten, die Sie im altbekannten normalen Handel auch haben. Von<b> individuellen Rabatten </b>f�r Ihre Kunden �ber <b>H�ndler und Resellergruppierungen </b>bis zu <b>individuellen personalisierten Newslettern</b>. \r\n<br><br>\r\nDer Funktionsumfang von oxid eSales ist weitaus gr��er als alles was derzeit in dieser Gr��enordnung/Preisklasse am Markt zu finden ist.\r\n<br>\r\n�berzeugen Sie sich selbst! hier geht es direkt in den Demoshop: <br>\r\nhttp://www.nfq-esales.de/demoshop/\r\n<br>\r\n<br>\r\nin den Administrationsbereich kommen Sie hier:\r\nhttp://www.nfq-esales.de/demoshop/admin/\r\n<br>\r\n<br>\r\n\r\nLogin: admin/ Passwort/admin\r\n<br>\r\n<b>\r\n', '459', '0', '0', '', '', '', '0', 'pac_shop_th.jpg', 'pac_shop_p1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-18', 20030516174318, '0', '0', '0', '', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fb9bd782cb6.68718230_0', '09c3e9fb9bd782cb6.68718230', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '001-01', 'Modul Newsletter', 'Newsletter Modul passend zu oxid esales', '<b>Der passende Newsletter zu Ihrem Shop!</b>\r\n<br>\r\n<br>\r\nBleiben Sie mit Ihren Kunden in Kontakt, und sorgen Sie daf�r, dass die Erstbestellung nicht die letzte ist.\r\n<br>\r\n<br>\r\nMit dem Newslettermodul k�nnen Sie direkt aus dem Shop heraus auf Ihre Artikel aufmerksam machen. Sie k�nnen Ihre Kunden direkt und pers�nlich anschreiben. \r\n<br>\r\n<br>\r\nDer personalisierte Newsletter zu Ihrem Shop spricht Ihre Kunden nicht nur mit Namen an, er unterbreitet auch Angebote, die individuell auf Ihren Kunden zugeschnitten sind, (z.B. �hnliche Produkte zu den letzten Bestellungen des Kunden)\r\n<br>\r\n<br>\r\nNat�rlich haben Ihre Kunden auch die M�glichkeit, sich aus dem Newsletter auszutragen.\r\n<br>\r\n<br>\r\nDer Newsletter wird in HTML und Plaintext versendet - so \r\nbekommt Ihr Kunde nur', '459', '0', '0', '', '', '', '0', 'pac_mod_newsletter_th.jpg', 'pac_mod_newsletter_p1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-18', 20030516174343, '0', '0', '0', '', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fbf647d8279.17219606_0', '09c3e9fbf647d8279.17219606', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '001-07', 'Modul Produktvarianten', 'Modul Varianten passend zu oxid esales', 'Produktvarianten wie Sie sie brauchen!!\r\n<br>\r\n<br>\r\n<ul>\r\n<li>eigene Artikelnummern</li>\r\n<li>eigene Bilder</li>\r\n<li>eigene Produktbeschreibung</li>\r\n<li>eigener Lagerbestand</li>\r\n<li>eigener Produktpreis</li>\r\n<li>abh�ngige Variantensets</li>\r\n</ul>\r\n<br>\r\nBehandeln Sie Produktvarianten wie das, was sie sind: eigenst�ndige Produkte.\r\n\r\nSelbstverst�ndlich k�nnen Sie die Variantensets auch untereinander verschachteln. Das heisst, dass eine Variante wiederum verschiedene Untervarianten haben kann.\r\n<br>\r\n<br>', '59', '0', '0', '', '', '', '0', 'pac_mod_varianten_th.jpg', 'pac_mod_varianten_p1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-18', 20030516174352, '0', '0', '0', '', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fb9f6b35db3.82738508_0', '09c3e9fb9f6b35db3.82738508', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '001-03', 'Modul Zusatzverkauf', 'Modul passend zu oxid esales', 'Das Zusatzverkaufsmodul sorgt f�r deutlich mehr Umsatz!\r\n<br>\r\n<br>\r\nes bindet <b>ohne Installationsaufwand</b> folgende Funktionalit�ten in Ihren Shop ein:\r\n<br>\r\n<br>\r\n<ul>\r\n<li>\r\n<b>Cross Selling</b> Zu diesem Artikel ben�tigen Sie/empfehlen wir noch jenen Artikel</li>\r\n<li>\r\n<b>�hnliche Produkte</b> Anhand von zu vergebenden Attributen erkennt Ihr Shop automatisch �hnliche Produkte zum Artikel, den sich ein Besucher ihres Shops gerade ansieht, und unterbreitet ihm die Vorschl�ge</li>\r\n<li>\r\n<b>...mazonfunktion</b> - Kunden die dieses gekauft haben, haben auch jenes gekauft</li>\r\n<li>\r\n<b>Top 5</b> - Pr�sentieren Sie Ihren Kunden immer auch die 5 Bestverkauften Produkte -  nat�rlich Tagesaktuell und automatisch</li>\r\n<li>\r\n<b>Neueste Artikel</b> - Weisen Sie Ihre Kunden doch gleich darauf hin, wenn Sie etwas neues im, Programm haben. Ohne Aufwand erzielen Sie ein maximales Ergebnis.\r\n<br>\r\n<br>\r\nSchlagen Sie gleich zu, und erh�hen Sie effektiv, einfach und schnell die "Verkaufskraft" Ihres Shops!\r\n<br>\r\n<br>', '219', '0', '0', '', '', '', '0', 'pac_mod_zusatz_th.jpg', 'pac_mod_zusatz_p1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-18', 20030516174402, '0', '0', '0', '', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('9433ea3e571052410.94336156_0', '9433ea3e571052410.94336156', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '002-01', 'oxid Wartungsvertrag', 'Servicevertrag inkl. Updates und Support', 'Der Wartungsvertrag beinhaltet <b>alle Updates</b> und <b>monatlich 2 Stunden Unterst�tzung und Hilfestellung</b> per Telefon/Email/ Forum <b>bei individuellen Anpassungen.</b>\r\n<br>\r\n<br>\r\n<b>Fair geht vor!!</b> deshalb\r\ngibt es keine Mindestlaufzeit. \r\n<br>\r\n<br>\r\nDer Wartungsvertrag ist <b>jederzeit</b> und <b>ohne Angabe von Gr�nden</b> k�ndbar.<br>\r\n<br>\r\nZahlungsweise monatlich per Bankeinzug<br>\r\n<br>\r\n\r\n\r\n', '9.49', '0', '0', '', '', '', '0', 'wvertrag_t.jpg', 'wvertrag.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-21', 20030425145645, '0', '0', '0', 'oxid eCommerce OXTOPSTART', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fba96921142.33756556_0', '09c3e9fba96921142.33756556', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '001-06', 'Modul Produkt Bewertungen', 'Ihre Kunden k�nnen die Produkte bewerten', 'Lassen Sie Ihre Kunden zu Wort kommen,\r\nund schaffen Sie Transparenz. Mit dem Produktbewertungsmodul haben Ihre Kunden die M�glichkeit die eigene meinung �ber ein Produkt zum Ausdruck zu bringen.\r\n<br>\r\n<br>\r\n<b>Das schafft Vertrauen</b> und l�dt zum verweilen ein.\r\n<br>\r\n', '59', '0', '0', '', '', '', '0', 'pac_mod_bewertung_th.jpg', 'pac_mod_bewertung_p1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-18', 20030516174415, '0', '0', '0', 'OXBARGAIN', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('09c3e9fbd30776328.26967390_0', '09c3e9fbd30776328.26967390', 0, 'oxbaseshop', NULL, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '001-10', 'oxid eSales Bundle', 'Unser Preisbrecher - Shop inkl. allen Modulen.', '<b>Der Preisbrecher zum Kampfpreis!!!</b>\r\n<br>\r\n<br>\r\noxid esales Shoplizenz inkl. den Modulen :<br>\r\n<br>\r\n<ul>\r\n<li>Newsletter</li>\r\n<li>Produktvarianten</li>\r\n<li>Zusatzverkauf</li>\r\n</ul>\r\n<br>\r\n<b>Sie sparen 216,--  � !!!</b>\r\n<br>\r\n<br>\r\nWie hei�t es immer wieder so sch�n: Ein Onlineshop ist ein Verk�ufer, der einmal eingerichtet 7 Tage die Woche und 24 Stunden am Tag f�r Sie verkauft. \r\n<br><br>\r\n<ul><li><b>Frage 1:</b> W�rden Sie einen begnadeten Programmierer in Ihrem Laden stellen? Nein? Ach so, der kann nicht verkaufen - na ja, dann.</li>\r\n<li><b>Frage 2:</b> Warum soll ein begnadeter Programmierer auf einmal besser verkaufen, wenn er �ber das Internet verkauft?</li>\r\n</ul>\r\n<br>oxid eSales - ist Ihre L�sung. Sie k�nnen sich sicher sein, dass Sie Ihren Kunden mit oxid eSales  bestens bedienen! \r\n<br><br>\r\noxid eSales - <b>wurde von Verk�ufern - f�r Verk�ufer</b> entwickelt, und ist ganz nebenbei auf dem neuesten Stand der Technik. \r\nProduktbeschreibung\r\n<br><br>\r\noxid eSales ist ein sogenanntes Warenkorb, oder auch Onlineshoppingsystem. Sie k�nnen mit oxid eSales �ber das Internet verkaufen. <b>Ganz einfach � einfach verkaufen!</b> Sie haben mit oxid eSales alle M�glichkeiten, die Sie im altbekannten normalen Handel auch haben. Von<b> individuellen Rabatten </b>f�r Ihre Kunden �ber <b>H�ndler und Resellergruppierungen </b>bis zu <b>individuellen personalisierten Newslettern</b>. \r\n<br><br>\r\nDer Funktionsumfang von oxid eSales ist weitaus gr��er als alles was derzeit in dieser Gr��enordnung/Preisklasse am Markt zu finden ist.\r\n<br>\r\n�berzeugen Sie sich selbst! hier geht es direkt in den Demoshop: <br>\r\nhttp://www.nfq-esales.de/demoshop/\r\n<br>\r\n<br>\r\nin den Administrationsbereich kommen Sie hier:\r\nhttp://www.nfq-esales.de/demoshop/admin/\r\n<br>\r\n<br>\r\n\r\nLogin: admin/ Passwort/admin\r\n<br>\r\n<b>\r\n', '749', '0', '965', '', '', '', '0', 'pac_bundle_th.jpg', 'pac_bundle_p1.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-18', 20030516174424, '0', '0', '0', 'OXFIRSTSTART NFQ eSales', '', '', '', '');
INSERT INTO oxarticles (OXID, OXNID, OXLANG, OXSHOPID, OXPARENTID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXARTNUM, OXTITLE, OXSHORTDESC, OXLONGDESC, OXPRICE, OXBPRICE, OXTPRICE, OXEXTURL, OXURLDESC, OXURLIMG, OXVAT, OXTHUMB, OXPIC1, OXPIC2, OXPIC3, OXPIC4, OXPIC5, OXWEIGHT, OXSTOCK, OXDELIVERY, OXINSERT, OXTIMESTAMP, OXLENGTH, OXWIDTH, OXHEIGHT, OXAKTION, OXFILE, OXSEARCHKEYS, OXTEMPLATE, OXQUESTIONEMAIL) VALUES ('4c23ea9135f7ecb58.09825374_0', '4c23ea9135f7ecb58.09825374', 0, 'oxbaseshop', '9433ea3e571052410.94336156', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '002-02', 'oxid Wartungsvertrag <b>12f�r10</b>', 'Wartungsvertrag inkl. Updates und Hilfestellung', 'Der Wartungsvertrag beinhaltet <b>alle Updates</b> und <b>monatlich 2 Stunden Unterst�tzung und Hilfestellung</b> per Telefon/Email/ Forum <b>bei individuellen Anpassungen.</b>\r\n<br>\r\n<br>\r\n<b>Fair geht vor!!</b> deshalb\r\ngibt es keine Mindestlaufzeit. \r\n<br>\r\n<br>\r\nDer Wartungsvertrag ist <b>jederzeit</b> und <b>ohne Angabe von Gr�nden</b> k�ndbar.<br>Zuviel bezahltes wird zur�ckerstattet.\r\n<br>\r\n<br>\r\nZahlungsweise j�hrlich im voraus per Rechnung.<br>\r\n<br>\r\n', '94.9', '0', '0', '', '', '', '0', 'wvertrag_t.jpg', 'wvertrag.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', 'nopic.jpg', '0', -1, '0000-00-00', '2003-04-25', 20030425150107, '0', '0', '0', '', '', '', '', '');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxattribute`
#

DROP TABLE IF EXISTS oxattribute;
CREATE TABLE oxattribute (
  OXID varchar(32) NOT NULL default '',
  OXSHOPID varchar(32) NOT NULL default '',
  OXTITLE varchar(128) NOT NULL default ''
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxattribute`
#

INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('09c3e9fad1a6916f6.31435087', 'oxbaseshop', 'K�che');
INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('09c3e9fad298cc756.17607452', 'oxbaseshop', 'Rund ums Ei');
INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('09c3e9fae8cb752a2.90128094', 'oxbaseshop', 'Kleidung');
INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('09c3e9faef180a651.04573087', 'oxbaseshop', 'Sexy');
INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('09c3e9fb1754708e8.92846357', 'oxbaseshop', 'Garten');
INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('09c3e9fb17a910f94.48378680', 'oxbaseshop', 'Fr�hling');
INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('09c3e9fb17ed2c654.89803506', 'oxbaseshop', 'Grill');
INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('09c3e9fb56936b404.09572928', 'oxbaseshop', 'Lustiges');
INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('09c3e9fbaea8e3845.49898248', 'oxbaseshop', 'oxid');
INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('b8e3ea3fc7469e970.74268897', 'oxbaseshop', 'oxid modul');
INSERT INTO oxattribute (OXID, OXSHOPID, OXTITLE) VALUES ('b8e3ea3fcc6df76b9.98349619', 'oxbaseshop', 'oxid schn�pchen');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxcategories`
#

DROP TABLE IF EXISTS oxcategories;
CREATE TABLE oxcategories (
  OXID varchar(32) NOT NULL default '',
  OXNID varchar(32) NOT NULL default '',
  OXTYPE tinyint(4) NOT NULL default '0',
  OXPARENTID varchar(32) NOT NULL default 'oxrootid',
  OXLANG char(1) NOT NULL default '0',
  OXORDER int(11) NOT NULL default '9999',
  OXACTIV enum('1','0') NOT NULL default '1',
  OXSHOPID varchar(32) NOT NULL default '',
  OXTITLE varchar(254) NOT NULL default '',
  OXDESC varchar(255) NOT NULL default '',
  OXTHUMB varchar(128) NOT NULL default '',
  OXEXTLINK varchar(255) NOT NULL default '',
  OXTEMPLATE varchar(128) NOT NULL default '',
  PRIMARY KEY  (OXID),
  KEY OXACTIV (OXACTIV),
  KEY OXNID (OXNID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxcategories`
#

INSERT INTO oxcategories (OXID, OXNID, OXTYPE, OXPARENTID, OXLANG, OXORDER, OXACTIV, OXSHOPID, OXTITLE, OXDESC, OXTHUMB, OXEXTLINK, OXTEMPLATE) VALUES ('09c3e9fa63c8c5930.45657980_0', '09c3e9fa63c8c5930.45657980', 0, 'oxrootid', '0', 9999, '1', 'oxbaseshop', 'Demo Artikel', 'Ausgew�hlte Produkte von uns', '', '', '');
INSERT INTO oxcategories (OXID, OXNID, OXTYPE, OXPARENTID, OXLANG, OXORDER, OXACTIV, OXSHOPID, OXTITLE, OXDESC, OXTHUMB, OXEXTLINK, OXTEMPLATE) VALUES ('09c3e9fa66726c155.22768705_0', '09c3e9fa66726c155.22768705', 0, '09c3e9fa63c8c5930.45657980', '0', 9999, '1', 'oxbaseshop', 'www.desaster.com', 'desaster.com - Das:Gesch�ft.mit/dem-Wahnsinn', '', '', '');
INSERT INTO oxcategories (OXID, OXNID, OXTYPE, OXPARENTID, OXLANG, OXORDER, OXACTIV, OXSHOPID, OXTITLE, OXDESC, OXTHUMB, OXEXTLINK, OXTEMPLATE) VALUES ('09c3e9fa999d3f540.02989179_0', '09c3e9fa999d3f540.02989179', 0, '09c3e9fa66726c155.22768705', '0', 9999, '1', 'oxbaseshop', 'sexy things', 'F�r \'Sie und *Sie\' und \'Ihn* und Ihn\'.', '', '', '');
INSERT INTO oxcategories (OXID, OXNID, OXTYPE, OXPARENTID, OXLANG, OXORDER, OXACTIV, OXSHOPID, OXTITLE, OXDESC, OXTHUMB, OXEXTLINK, OXTEMPLATE) VALUES ('09c3e9fab52756877.16487437_0', '09c3e9fab52756877.16487437', 0, '09c3e9fa66726c155.22768705', '0', 9999, '1', 'oxbaseshop', 'K�che', 'Das Auge i�t mit!', '', '', '');
INSERT INTO oxcategories (OXID, OXNID, OXTYPE, OXPARENTID, OXLANG, OXORDER, OXACTIV, OXSHOPID, OXTITLE, OXDESC, OXTHUMB, OXEXTLINK, OXTEMPLATE) VALUES ('09c3e9fb0a8759f66.49105208_0', '09c3e9fb0a8759f66.49105208', 0, '09c3e9fa63c8c5930.45657980', '0', 9999, '1', 'oxbaseshop', 'www.dorfscheune.de', 'der Online Baumarkt aus dem Norden', '', '', '');
INSERT INTO oxcategories (OXID, OXNID, OXTYPE, OXPARENTID, OXLANG, OXORDER, OXACTIV, OXSHOPID, OXTITLE, OXDESC, OXTHUMB, OXEXTLINK, OXTEMPLATE) VALUES ('09c3e9fb0ba2b1151.91718933_0', '09c3e9fb0ba2b1151.91718933', 0, '09c3e9fb0a8759f66.49105208', '0', 9999, '1', 'oxbaseshop', 'Fr�hling', 'Der Fr�hling kommt', '', '', '');
INSERT INTO oxcategories (OXID, OXNID, OXTYPE, OXPARENTID, OXLANG, OXORDER, OXACTIV, OXSHOPID, OXTITLE, OXDESC, OXTHUMB, OXEXTLINK, OXTEMPLATE) VALUES ('09c3e9fb5158b8038.76669730_0', '09c3e9fb5158b8038.76669730', 0, '09c3e9fb0a8759f66.49105208', '0', 9999, '1', 'oxbaseshop', 'Gartenzwerge', 'Ein Zwerg kommt selten alleine...', '', '', '');
INSERT INTO oxcategories (OXID, OXNID, OXTYPE, OXPARENTID, OXLANG, OXORDER, OXACTIV, OXSHOPID, OXTITLE, OXDESC, OXTHUMB, OXEXTLINK, OXTEMPLATE) VALUES ('09c3e9fb6e7552e91.47341604_0', '09c3e9fb6e7552e91.47341604', 0, 'oxrootid', '0', 1, '1', 'oxbaseshop', 'NFQ eSales', 'Alle Produkte der NFQ eSales GmbH', '', '', '');
INSERT INTO oxcategories (OXID, OXNID, OXTYPE, OXPARENTID, OXLANG, OXORDER, OXACTIV, OXSHOPID, OXTITLE, OXDESC, OXTHUMB, OXEXTLINK, OXTEMPLATE) VALUES ('09c3e9fb726180075.82571307_0', '09c3e9fb726180075.82571307', 0, '09c3e9fb6e7552e91.47341604', '0', 9999, '1', 'oxbaseshop', 'oxid eCommerce', 'Alles f�r den erfolgreichen Online Verkauf', '', '', '');
INSERT INTO oxcategories (OXID, OXNID, OXTYPE, OXPARENTID, OXLANG, OXORDER, OXACTIV, OXSHOPID, OXTITLE, OXDESC, OXTHUMB, OXEXTLINK, OXTEMPLATE) VALUES ('09c3e9fbac717ac46.25334786_0', '09c3e9fbac717ac46.25334786', 0, '09c3e9fb726180075.82571307', '0', 9999, '1', 'oxbaseshop', 'Module', 'Module rund um oxid esales', '', '', '');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxdelivery`
#

DROP TABLE IF EXISTS oxdelivery;
CREATE TABLE oxdelivery (
  OXID varchar(32) NOT NULL default '',
  OXSHOPID varchar(32) NOT NULL default '',
  OXACTIV char(1) NOT NULL default '',
  OXACTIVFROM datetime NOT NULL default '0000-00-00 00:00:00',
  OXACTIVTO datetime NOT NULL default '0000-00-00 00:00:00',
  OXTITLE varchar(128) NOT NULL default '',
  OXCATNID varchar(32) NOT NULL default '',
  OXARTNID varchar(32) NOT NULL default '',
  OXUSERGROUPID varchar(32) NOT NULL default '',
  OXUSERID varchar(32) NOT NULL default '',
  OXCOUNTRY varchar(255) NOT NULL default '',
  OXADDSUMTYPE enum('%','abs') NOT NULL default 'abs',
  OXADDSUM double NOT NULL default '0',
  OXDELTYPE enum('a','s','w','p') NOT NULL default 'a',
  OXPARAM double NOT NULL default '0',
  OXPARAMEND double NOT NULL default '0'
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxdelivery`
#

INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('b763e957be61108f8.80080127', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '001 EU 1 (< 200)', '', '', '', '', 'Deutschland �sterreich Schweiz Liechtenstein Italien Luxemburg Frankreich', 'abs', '6', 'p', '19.99', '200');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('b763e957d6d42dd40.18579550', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '001 EU 1 (> 500 - Versandkostenfrei)', '', '', '', '', 'Deutschland �sterreich Schweiz Liechtenstein Italien Luxemburg Frankreich', 'abs', '0', 'p', '500', '500000');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('3033e968fb5b30930.92732498', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '001 EU 1 (< 20 Mindermengenzuschlag)', '', '', '', '', 'Deutschland �sterreich Schweiz Liechtenstein Italien Luxemburg Frankreich', 'abs', '9', 'p', '0', '20');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('3033e968ea11e6761.68821765', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '001 EU 1 (> 200)', '', '', '', '', 'Deutschland �sterreich Schweiz Liechtenstein Italien Luxemburg Frankreich', 'abs', '3', 'p', '199.99', '500');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('a713e96c15c7bf3c7.45279281', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '002 EU 2 (< 20 Mindermengenzuschlag)', '', '', '', '', 'Schweden Finnland Grossbritannien Irland Holland', 'abs', '17', 'p', '0', '20');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('a713e96c1aeaefa75.74010807', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '002 EU 2 (< 200)', '', '', '', '', 'Schweden Finnland Grossbritannien Irland Holland', 'abs', '15', 'p', '19.99', '200');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('a713e96c1d1143e91.53804369', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '002 EU 2 (> 200)', '', '', '', '', 'Schweden Finnland Grossbritannien Irland Holland', 'abs', '12', 'p', '199.99', '500');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('a713e96c1f593bf71.82312279', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '002 EU 2 (> 500 )', '', '', '', '', 'Schweden Finnland Grossbritannien Irland Holland', 'abs', '8', 'p', '499.99', '500000');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('a713e96bb0b6fcfa4.47870232', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '003 Rest Europ�ische Union (< 20 Mindermengenzuschlag)', '', '', '', '', 'Belgien Portugal Spanien Griechenland', 'abs', '24', 'p', '0', '20');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('a713e96bb5ade7078.12436067', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '003 Rest Europ�ische Union (< 200)', '', '', '', '', 'Belgien Portugal Spanien Griechenland', 'abs', '18', 'p', '19.99', '200');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('a713e96bb80196c52.81389768', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '003 Rest Europ�ische Union (> 200)', '', '', '', '', 'Belgien Portugal Spanien Griechenland', 'abs', '10', 'p', '199.99', '500');
INSERT INTO oxdelivery (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXCOUNTRY, OXADDSUMTYPE, OXADDSUM, OXDELTYPE, OXPARAM, OXPARAMEND) VALUES ('a713e96bb97201665.03452069', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '003 Rest Europ�ische Union (> 500 Versandkostenfrei)', '', '', '', '', 'Belgien Portugal Spanien Griechenland', 'abs', '0', 'p', '499.99', '50000');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxdiscount`
#

DROP TABLE IF EXISTS oxdiscount;
CREATE TABLE oxdiscount (
  OXID varchar(32) NOT NULL default '',
  OXSHOPID varchar(32) NOT NULL default '',
  OXACTIV char(1) NOT NULL default '',
  OXACTIVFROM datetime NOT NULL default '0000-00-00 00:00:00',
  OXACTIVTO datetime NOT NULL default '0000-00-00 00:00:00',
  OXTITLE varchar(128) NOT NULL default '',
  OXCATNID varchar(32) NOT NULL default '',
  OXARTNID varchar(32) NOT NULL default '',
  OXUSERGROUPID varchar(32) NOT NULL default '',
  OXUSERID varchar(32) NOT NULL default '',
  OXAMOUNT double NOT NULL default '0',
  OXPRICE double NOT NULL default '0',
  OXADDSUMTYPE enum('%','abs') NOT NULL default '%',
  OXADDSUM double NOT NULL default '0',
  OXTYPE enum('d','v') NOT NULL default 'd',
  PRIMARY KEY  (OXID),
  KEY OXSHOPID (OXSHOPID),
  KEY OXACTIV (OXACTIV),
  KEY OXACTIVFROM (OXACTIVFROM),
  KEY OXACTIVTO (OXACTIVTO),
  KEY OXTYPE (OXTYPE)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxdiscount`
#

INSERT INTO oxdiscount (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXAMOUNT, OXPRICE, OXADDSUMTYPE, OXADDSUM, OXTYPE) VALUES ('9fc3e801d40332ae4.08296552', 'oxbaseshop', '0', '2003-03-29 00:00:00', '2003-03-30 00:00:00', '15% auf den gesamten Shop an einem Tag', '', '', '', '', '0', '0', '%', '15', 'd');
INSERT INTO oxdiscount (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXAMOUNT, OXPRICE, OXADDSUMTYPE, OXADDSUM, OXTYPE) VALUES ('9fc3e801d7c0c31e5.29322791', 'oxbaseshop', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '10% wenn man mindestens 5 Artikel aus Kinderzimmer kauft', 'kinderzimmer', '', '', '', '5', '0', '%', '10', 'd');
INSERT INTO oxdiscount (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXAMOUNT, OXPRICE, OXADDSUMTYPE, OXADDSUM, OXTYPE) VALUES ('9fc3e801da9cdd0b2.74513077', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '10% ab 200 Euro Einkaufswert', '', '', '', '', '0', '200', '%', '10', 'd');
INSERT INTO oxdiscount (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXAMOUNT, OXPRICE, OXADDSUMTYPE, OXADDSUM, OXTYPE) VALUES ('9fc3e801dd2940be4.58648480', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '20% f�r Benutzer Volker auf best. Artikel', '', '1126', '', 'd523e8d2c4c418524.87834505', '0', '0', '%', '20', 'd');
INSERT INTO oxdiscount (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXAMOUNT, OXPRICE, OXADDSUMTYPE, OXADDSUM, OXTYPE) VALUES ('0693e8aab9b01dc46.38765070', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shop Mwst. generell', '', '', '', '', '0', '0', '%', '16', 'v');
INSERT INTO oxdiscount (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXAMOUNT, OXPRICE, OXADDSUMTYPE, OXADDSUM, OXTYPE) VALUES ('ab23e8b1d5e2323f7.13192579', 'oxbaseshop', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Test Dodger', '', '', '', '', '0', '0', '%', '100', 'v');
INSERT INTO oxdiscount (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXAMOUNT, OXPRICE, OXADDSUMTYPE, OXADDSUM, OXTYPE) VALUES ('1073e9fdad04db780.26378432', 'oxbaseshop', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dodger Test', '', '09c3e9fb8b2854ce4.98142407', '', '', '5', '0', 'abs', '100', 'd');
INSERT INTO oxdiscount (OXID, OXSHOPID, OXACTIV, OXACTIVFROM, OXACTIVTO, OXTITLE, OXCATNID, OXARTNID, OXUSERGROUPID, OXUSERID, OXAMOUNT, OXPRICE, OXADDSUMTYPE, OXADDSUM, OXTYPE) VALUES ('53a3ea50224a10a17.20640434', 'oxbaseshop', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'test', '', '', '', '', '0', '0', '', '0', 'v');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxgroups`
#

DROP TABLE IF EXISTS oxgroups;
CREATE TABLE oxgroups (
  OXID varchar(32) NOT NULL default '',
  OXACTIV enum('1','0') NOT NULL default '1',
  OXSHOPID varchar(32) NOT NULL default '',
  OXTITLE varchar(254) NOT NULL default '',
  PRIMARY KEY  (OXID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxgroups`
#

INSERT INTO oxgroups (OXID, OXACTIV, OXSHOPID, OXTITLE) VALUES ('oxidblacklist', '1', 'oxbaseshop', 'Blacklist');
INSERT INTO oxgroups (OXID, OXACTIV, OXSHOPID, OXTITLE) VALUES ('oxidsmallcust', '1', 'oxbaseshop', 'Geringer Umsatz');
INSERT INTO oxgroups (OXID, OXACTIV, OXSHOPID, OXTITLE) VALUES ('oxidmiddlecust', '1', 'oxbaseshop', 'Mittlerer Umsatz');
INSERT INTO oxgroups (OXID, OXACTIV, OXSHOPID, OXTITLE) VALUES ('oxidgoodcust', '1', 'oxbaseshop', 'Grosser Umsatz');
INSERT INTO oxgroups (OXID, OXACTIV, OXSHOPID, OXTITLE) VALUES ('oxidforeigncustomer', '1', 'oxbaseshop', 'Auslandskunde');
INSERT INTO oxgroups (OXID, OXACTIV, OXSHOPID, OXTITLE) VALUES ('oxidnewcustomer', '1', 'oxbaseshop', 'Neukunde');
INSERT INTO oxgroups (OXID, OXACTIV, OXSHOPID, OXTITLE) VALUES ('oxidpowershopper', '1', 'oxbaseshop', 'Powershopper');
INSERT INTO oxgroups (OXID, OXACTIV, OXSHOPID, OXTITLE) VALUES ('oxiddealer', '1', 'oxbaseshop', 'H�ndler');
INSERT INTO oxgroups (OXID, OXACTIV, OXSHOPID, OXTITLE) VALUES ('oxidnewsletter', '1', 'oxbaseshop', 'Newsletter Abonnenten');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxnewsletter`
#

DROP TABLE IF EXISTS oxnewsletter;
CREATE TABLE oxnewsletter (
  OXID varchar(32) NOT NULL default '',
  OXSHOPID varchar(32) NOT NULL default '',
  OXTITLE varchar(255) NOT NULL default '',
  OXTEMPLATE text NOT NULL,
  OXPLAINTEMPLATE text NOT NULL,
  PRIMARY KEY  (OXID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxnewsletter`
#

INSERT INTO oxnewsletter (OXID, OXSHOPID, OXTITLE, OXTEMPLATE, OXPLAINTEMPLATE) VALUES ('d4f3e9bf5341fa658.54951834', 'oxbaseshop', 'Newsletter 01 f�r oxid eSales', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">\r\n\r\n<html>\r\n<head>\r\n	<title>oxid eSales Newsletter</title>\r\n<STYLE TYPE="text/css" MEDIA=screen>\r\n<!--\r\nA        {\r\n        font-size: 9pt;\r\n        text-decoration: none;\r\n        color: black;\r\n        }\r\n\r\nA:Hover     {\r\n        text-decoration: underline;\r\n        color: #AB0101;\r\n        }\r\n\r\nbody    {\r\n    margin-bottom : 0;\r\n    margin-left : 0;\r\n    margin-right : 0;\r\n    margin-top : 0;\r\n    background-color: #FFFFFF;\r\n}\r\n\r\n.pagehead {\r\n	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n	font-size: 10px;\r\n	color: #000000;\r\n	font-weight: normal;\r\n	background-color: #494949;\r\n	height : 50;\r\n	vertical-align : bottom;\r\n}\r\n\r\n.pageheadlink {\r\n	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n	font-size: 11px;\r\n	color: #F7F7F7;\r\n	font-weight: normal;\r\n}\r\n\r\n.pagebottom {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 9px;\r\n        color: #000000;\r\n        font-weight: normal;\r\n	    height : 13;\r\n    	vertical-align : top;\r\n}\r\n\r\n.defaultcontent {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #000000;\r\n        font-weight: normal;\r\n    	vertical-align : top;\r\n}\r\n\r\n.detailcontent {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #000000;\r\n        font-weight: normal;\r\n    	vertical-align : top;\r\n		padding-left: 10px;\r\n}\r\n\r\n.detailproductlink {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 9px;\r\n        color: #9D0101;\r\n        font-weight: bold;\r\n}\r\n\r\n.detailheader {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 11px;\r\n        color: #9D0101;\r\n        font-weight: bold;\r\n}\r\n\r\n.detailsales {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #000000;\r\n        font-weight: bold;\r\n		background-color: #CECDCD;\r\n}\r\n\r\n.aktionhead {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #FFFFFF;\r\n        font-weight: bold;\r\n		background-color: #767575;\r\n}\r\n\r\n.aktionmain {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #000000;\r\n        font-weight: normal;\r\n		border : 3px #767575;\r\n		border-style : none solid solid solid;\r\n		padding-left : 2px;\r\n		padding-top : 5px;\r\n		padding-bottom : 5px;\r\n		padding-right : 2px;\r\n}\r\n\r\n.aktion {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #000000;\r\n        font-weight: normal;\r\n}\r\n\r\n.aktionhighlight {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #AB0101;\r\n        font-weight: bold;\r\n}\r\n\r\n.startpageFirstProductTitle {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 12px;\r\n        color: #AB0101;\r\n        font-weight: bold;\r\n}\r\n\r\n.startpageFirstProductText {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #242424;\r\n        font-weight: normal;\r\n}\r\n\r\n.startpageFirstProductPrice {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 17px;\r\n        color: #AB0101;\r\n        font-weight: bold;\r\n}\r\n\r\n.startpageFirstProductOldPrice {\r\n	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n	font-size: 17px;\r\n	color: #AB0101;\r\n	font-weight: bold;\r\n	text-decoration : line-through;\r\n}\r\n\r\n.startpageProductTitle {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 12px;\r\n        color: #242424;\r\n        font-weight: bold;\r\n}\r\n\r\n.startpageProductText {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #AB0101;\r\n        font-weight: normal;\r\n}\r\n\r\n.startpageBoxContent {\r\n	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n	font-size: 10px;\r\n	color: #000000;\r\n	font-weight: normal;\r\n	border : 3px #CECDCD;\r\n	border-style : none solid solid solid;\r\n	padding-left : 5px;\r\n	padding-top : 5px;\r\n	padding-bottom : 5px;\r\n	padding-right : 5px;\r\n}\r\n\r\n.startpageBoxHead {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #000000;\r\n        font-weight: bold;\r\n		background-color: #CECDCD;\r\n}\r\n\r\n.newestProductHead {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #8D0101;\r\n        font-weight: bold;\r\n}\r\n\r\n\r\n.newestProduct {\r\n        font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;\r\n        font-size: 10px;\r\n        color: #000000;\r\n        font-weight: normal;\r\n}\r\n\r\n\r\n}\r\n-->\r\n</STYLE>\r\n	\r\n</head>\r\n\r\n<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">\r\n<table width="780" height="100%" border="0" cellspacing="0" cellpadding="0">\r\n<!-- Kopf Start -->\r\n<tr>\r\n<td class="pagehead">\r\n	<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n	<tr>\r\n	<td class="pagehead" width="152" align="right">\r\n	<a href="[{$myshop->selflink}]" class="pageheadlink"><img src="[{$myshop->imagedir}]/logo.gif" alt="" border="0"></a>\r\n	</td>\r\n	</tr>\r\n	</table>\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td height="15">\r\n\r\n</td>\r\n</tr>\r\n\r\n<!-- Kopf Ende -->\r\n\r\n<!-- Content Start -->\r\n<tr>\r\n<td valign="top">\r\n\r\n    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">\r\n    <tr>\r\n    <td class="defaultcontent">\r\n	\r\nHallo [{ $myuser->oxuser__oxsal->value }] [{ $myuser->oxuser__oxfname->value }] [{ $myuser->oxuser__oxlname->value }],<br>\r\n<br>\r\nwie Sie sehen k�nnen funktioniert unser Newsletter Modul richtig gut.<br>\r\n<br>\r\nNicht nur, das wir hier Ihre Adresse ausgeben k�nnen :<br>\r\n\r\n[{ $myuser->oxuser__oxaddinfo->value }]<br>\r\n[{ $myuser->oxuser__oxstreet->value }]<br>\r\n[{ $myuser->oxuser__oxzip->value }] [{ $myuser->oxuser__oxcity->value }]<br>\r\n[{ $myuser->oxuser__oxcountry->value }]<br>\r\nTelefon: [{ $myuser->oxuser__oxfon->value }]<br>\r\n<br>\r\nsondern wir k�nnen noch viel mehr !<br>\r\n<br>\r\nSie wollen diesen Newsletter nicht mehr erhalten ? Kein Problem - klicken Sie einfach <a href="[{$myshop->selflink}]&cl=newsletter&fnc=removeme&uid=[{ $myuser->oxuser__oxid->value}]"  class="defaultcontent">hier</a>.\r\n<br>\r\n<br>\r\n	\r\n	[{if isset($simarticle0) }]\r\n		Ein �hnlicher Artikel zu Ihrer letzten Bestellung :<br>\r\n        <table border="0" cellspacing="0" cellpadding="0">\r\n		<tr>\r\n		<td>\r\n		<a class="startpageProduct" href="[{ $simarticle0->oxdetaillink}]"><img src="[{$myshop->dimagedir}]/[{$simarticle0->oxarticles__oxpic1->value }]" border="0" hspace="0" vspace="0" alt="[{ $simarticle0->oxarticles__oxtitle->value }]"></a>\r\n		</td>\r\n		<td class="startpageFirstProductTitle" valign="top" width="10">*</td>\r\n		<td class="startpageFirstProductTitle" valign="top" width="320">\r\n		[{ $simarticle0->oxarticles__oxtitle->value }]<br>\r\n		<br>\r\n		<span class="startpageFirstProductText">[{ $simarticle0->oxarticles__oxshortdesc->value }]</span><br>\r\n		<br>\r\n		<span class="startpageProductText"><b>Statt <span class="startpageFirstProductOldPrice">[{ $simarticle0->ftprice}]</span> jetzt nur </b></span><span class="startpageFirstProductPrice">[{ $simarticle0->fprice }] [{ $mycurrency->sign}]</span><br>\r\n		<br>\r\n		<a class="startpageProductText" href="[{ $simarticle0->oxdetaillink}]"><b>mehr Infos</b></a><br>\r\n		</td>\r\n		</tr>\r\n	    </table>\r\n	[{/if}]\r\n	<br><br>\r\n	[{if isset($articlelist) }]\r\n		Ausgesuchte Artikel aus unserem Shop extra f�r diesen Newsletter : <br>\r\n		<table border="0" cellspacing="0" cellpadding="0">\r\n		<tr>\r\n		<td height="1" bgcolor="#CECDCD"></td>\r\n		<td height="1" bgcolor="#CECDCD"></td>\r\n		</tr>\r\n		<tr>\r\n		<td height="7"></td>\r\n		<td></td>\r\n		</tr>\r\n    	[{assign var="iPos" value=1}]\r\n    	[{foreach from=$articlelist item=product}]  \r\n    	\r\n    	[{if $iPos == 1}]\r\n    	<tr>\r\n    	<td valign="top">\r\n			<table border="0" cellspacing="0" cellpadding="0">\r\n			<tr>\r\n			    <td class="startpageProduct" height="100" align="left" width="220">\r\n			    <a class="startpageProduct" href="[{ $product->oxdetaillink}]"><img src="[{$myshop->dimagedir}]/[{$product->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $product->oxarticles__oxtitle->value }]"></a>\r\n			    </td>\r\n			</tr>\r\n			<tr>\r\n			    <td class="startpageProductTitle" align="left">\r\n			    [{ $product->oxarticles__oxtitle->value }]\r\n			    </td>\r\n			</tr>\r\n			<tr>\r\n			    <td class="startpageProductText" align="left" height="20">\r\n			    <b>Jetzt nur [{ $product->fprice }] [{ $mycurrency->sign}]</b> \r\n			    </td>\r\n			</tr>\r\n			<tr>\r\n			    <td class="startpageProductText" align="left" height="20">\r\n			    <a class="startpageProductText" href="[{ $product->oxdetaillink}]">mehr Infos</a><br>\r\n			    </td>\r\n			</tr>\r\n			</table>\r\n    	</td>\r\n    	[{assign var="iPos" value=2}]\r\n    	[{elseif $iPos==2}]\r\n    	<td valign="top">\r\n			<table border="0" cellspacing="0" cellpadding="0">\r\n			<tr>\r\n			    <td class="startpageProduct" height="100" align="left" width="220">\r\n			    <a class="startpageProduct" href="[{ $product->oxdetaillink}]"><img src="[{$myshop->dimagedir}]/[{$product->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $product->oxarticles__oxtitle->value }]"></a>\r\n			    </td>\r\n			</tr>\r\n			<tr>\r\n			    <td class="startpageProductTitle" align="left">\r\n			    [{ $product->oxarticles__oxtitle->value }]\r\n			    </td>\r\n			</tr>\r\n			<tr>\r\n			    <td class="startpageProductText" align="left" height="20">\r\n			    <b>Jetzt nur [{ $product->fprice }] [{ $mycurrency->sign}]</b> \r\n			    </td>\r\n			</tr>\r\n			<tr>\r\n			    <td class="startpageProductText" align="left" height="20">\r\n			    <a class="startpageProductText" href="[{ $product->oxdetaillink}]">mehr Infos</a><br>\r\n			    </td>\r\n			</tr>\r\n			</table>\r\n    	</td>\r\n    	</tr>\r\n		<tr>\r\n		<td height="7"></td>\r\n		<td></td>\r\n		</tr>\r\n		<tr>\r\n		<td height="1" bgcolor="#CECDCD"></td>\r\n		<td height="1" bgcolor="#CECDCD"></td>\r\n		</tr>\r\n		<tr>\r\n		<td height="7"></td>\r\n		<td></td>\r\n		</tr>\r\n    	<!-- ende zeile -->\r\n    	[{assign var="iPos" value=1}]\r\n    	[{/if}]\r\n    	[{/foreach}] \r\n        \r\n        <!-- fehlende ausgleichen -->\r\n    	[{if $iPos == 1}]\r\n    	<td></td>\r\n    	</tr>\r\n    	[{/if}]\r\n		</table>\r\n    [{/if}]           \r\n   	<br>\r\n    </td>\r\n\r\n    <td class="defaultcontent" align="right" width="165">\r\n    [{ if $simarticle1 }]\r\n		Auch das hier ist ein �hnlicher Artikel zu Ihrer letzten Bestellung :<br>\r\n		<table border="0" cellspacing="0" cellpadding="0" width="100%">\r\n		<tr>\r\n		<td class="aktionhead" align="center" height="15" width="100%">Top Angebot der Woche</td>\r\n		</tr>\r\n		<tr>\r\n		<td class="aktionmain">\r\n			<table border="0" cellspacing="0" cellpadding="0">\r\n			<tr>\r\n			<td class="aktion"><a class="aktion" href="[{ $simarticle1->oxdetaillink}]"><img src="[{$myshop->dimagedir}]/[{$simarticle1->oxarticles__oxthumb->value }]" border="0" hspace="0" vspace="0" alt="[{ $simarticle1->oxarticles__oxtitle->value }]"></a></td>\r\n			</tr>\r\n			<tr>\r\n			<td class="aktion" height="15">[{ $simarticle1->oxarticles__oxtitle->value }]</td>\r\n			<td class="aktion"></td>\r\n			</tr>\r\n			<tr>\r\n			<td class="aktionhighlight" height="15"><b>Jetzt nur [{ $simarticle1->fprice }] [{ $mycurrency->sign}] !!</b></td>\r\n			</tr>\r\n			<tr>\r\n			<td class="aktion" height="25">\r\n				<table border="0" cellspacing="0" cellpadding="0">\r\n				<tr>\r\n				<td class="aktion" width="120"><a class="aktion" href="[{ $simarticle1->oxdetaillink}]">mehr Infos</a></td>\r\n				</tr>\r\n				</table>\r\n			</td>\r\n			</tr>\r\n			</table>\r\n		</td>\r\n		</tr>\r\n		</table>\r\n    [{ /if }]\r\n    <br>\r\n    <br>\r\n	[{ if $simarticle2 }]\r\n		Und zuletzt nochmal ein �hnlicher Artikel zu Ihrer letzten Bestellung :<br>\r\n		<table border="0" cellspacing="0" cellpadding="0" width="100%">\r\n		<tr>\r\n			<td class="aktionhead" align="center" height="15" width="165">Schn�ppchen !</td>\r\n		</tr>\r\n		<tr>\r\n			<td class="aktionmain" height="145" valign="top">\r\n			Jetzt gibt es unseren Bestseller <a href="[{ $simarticle2->oxdetaillink}]" class="aktionhighlight">[{ $simarticle2->oxarticles__oxtitle->value }]</a> in der g�nstigen Sonderausgabe exklusiv bei oxid !<br>\r\n			Gleich <a href="[{ $simarticle2->tobasketlink }]&am=1" class="aktionhighlight">bestellen</a> !<br>\r\n			</td>\r\n		</tr>\r\n		</table>\r\n	[{/if}]\r\n    </td>\r\n	\r\n	\r\n    </tr>\r\n    </table>\r\n\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="pagebottom" align="right">\r\n� 2003 Lars Jankowfsky, Eric Jankowfsky   \r\n\r\n</td>\r\n</tr>\r\n</table>\r\n</body>\r\n</html>\r\n', 'oxid eSales Newsletter\r\n\r\nHallo [{ $myuser->oxuser__oxsal->value }] [{ $myuser->oxuser__oxfname->value }] [{ $myuser->oxuser__oxlname->value }],\r\n\r\nwie Sie sehen k�nnen funktioniert unser Newsletter Modul richtig gut.\r\n\r\nNicht nur, das wir hier Ihre Adresse ausgeben k�nnen :\r\n\r\n[{ $myuser->oxuser__oxaddinfo->value }]\r\n[{ $myuser->oxuser__oxstreet->value }]\r\n[{ $myuser->oxuser__oxzip->value }] [{ $myuser->oxuser__oxcity->value }]\r\n[{ $myuser->oxuser__oxcountry->value }]\r\nTelefon: [{ $myuser->oxuser__oxfon->value }]\r\n\r\nsondern wir k�nnen noch viel mehr !\r\n\r\nSie wollen diesen Newsletter nicht mehr erhalten ? Kein Problem - klicken Sie einfach hier :\r\n[{$myshop->selflink}]&cl=newsletter&fnc=removeme&uid=[{ $myuser->oxuser__oxid->value}]\r\n\r\n[{if isset($simarticle0) }]\r\n	Ein �hnlicher Artikel zu Ihrer letzten Bestellung ist :\r\n	\r\n	[{ $simarticle0->oxarticles__oxtitle->value }] \r\n	Statt [{ $simarticle0->ftprice}] jetzt nur [{ $simarticle0->fprice }] [{ $mycurrency->name}]\r\n[{/if}]\r\n\r\n[{if isset($articlelist) }]\r\n	Ausgesuchte Artikel aus unserem Shop extra f�r diesen Newsletter : \r\n   	[{foreach from=$articlelist item=product}]  \r\n	    [{ $product->oxarticles__oxtitle->value }]   Jetzt nur [{ $product->fprice }] [{ $mycurrency->name}]\r\n   	[{/foreach}] \r\n[{/if}]           \r\n   	\r\n');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxobject2article`
#

DROP TABLE IF EXISTS oxobject2article;
CREATE TABLE oxobject2article (
  OXID varchar(32) NOT NULL default '',
  OXOBJECTID varchar(32) NOT NULL default '',
  OXARTICLENID varchar(32) NOT NULL default '',
  PRIMARY KEY  (OXID),
  KEY OXOBJECTID (OXOBJECTID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxobject2article`
#

INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9faf28c50e41.59887835', '09c3e9faaa9a9be17.25775783', '09c3e9fa7a9ab7d91.20301208');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9faf3d999101.15353002', '09c3e9faaa9a9be17.25775783', '09c3e9faa00b85159.72617565');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fb024dcc8e2.27894720', '09c3e9faaa9a9be17.25775783', '09c3e9fabdd351246.80879105');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9faf6bdb19d9.15969880', '09c3e9fabdd351246.80879105', '09c3e9fac43e3e318.94516920');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9faf8728a541.27540138', '09c3e9fabdd351246.80879105', '09c3e9fab3fd08d54.35253029');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fafaa9a3b10.23884310', '09c3e9fab3fd08d54.35253029', '09c3e9facb1255690.68314300');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fb4349cc319.01970902', '09c3e9fb3d152c690.15484054', '09c3e9fb12656dd06.98348161');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fb4c5bb3cb1.67420585', '09c3e9fb3d152c690.15484054', '09c3e9fb35ac46af7.88737723');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fb6761d1a70.89693735', '09c3e9fb12656dd06.98348161', '09c3e9fb5cf8fb250.95817693');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fb668cbc199.66004868', '09c3e9fb35ac46af7.88737723', '09c3e9fb53e85f9a6.81000848');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fbb04ce8b21.24734337', '09c3e9fb9d7b2c275.50282439', '09c3e9fb8b2854ce4.98142407');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fbb04cecd29.46532854', '09c3e9fba45f1c7f6.64521235', '09c3e9fb8b2854ce4.98142407');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('b8e3ea3fc1d8cacc0.46423639', '09c3e9fbd30776328.26967390', '09c3e9fb8b2854ce4.98142407');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('b8e3ea3fd85e82252.08299373', '9433ea3e571052410.94336156', '09c3e9fb9bd782cb6.68718230');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fbb38ae9594.31877214', '09c3e9fb8b2854ce4.98142407', '09c3e9fb9d7b2c275.50282439');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('b8e3ea3fd73d52372.23878303', '9433ea3e571052410.94336156', '09c3e9fb9f6b35db3.82738508');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fbb68cddb48.95224902', '09c3e9fb8b2854ce4.98142407', '09c3e9fba45f1c7f6.64521235');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fbb813a5636.28179379', '09c3e9fb8b2854ce4.98142407', '09c3e9fba6b520c56.92155495');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fbb813a82a4.78070800', '09c3e9fba45f1c7f6.64521235', '09c3e9fba6b520c56.92155495');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('b8e3ea3fd9eae5cc3.68942418', '9433ea3e571052410.94336156', '09c3e9fba96921142.33756556');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('09c3e9fbd46beb502.71791708', '09c3e9fb9d7b2c275.50282439', '09c3e9fbd30776328.26967390');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('b8e3ea3fdb93c3f63.35136183', '9433ea3e571052410.94336156', '09c3e9fbd30776328.26967390');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('b8e3ea3fd7b35c0f4.53372678', '9433ea3e571052410.94336156', '09c3e9fbf647d8279.17219606');
INSERT INTO oxobject2article (OXID, OXOBJECTID, OXARTICLENID) VALUES ('b8e3ea3ff1d5159b5.79695476', '09c3e9fbd30776328.26967390', '9433ea3e571052410.94336156');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxobject2attribute`
#

DROP TABLE IF EXISTS oxobject2attribute;
CREATE TABLE oxobject2attribute (
  OXID varchar(32) NOT NULL default '',
  OXOBJECTID varchar(32) NOT NULL default '',
  OXATTRID varchar(32) NOT NULL default '',
  PRIMARY KEY  (OXID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxobject2attribute`
#

INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fad2d975768.34509044', '09c3e9fac43e3e318.94516920', '09c3e9fad298cc756.17607452');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fad2d9790a6.55241803', '09c3e9facb1255690.68314300', '09c3e9fad298cc756.17607452');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fad338c4b93.15343553', '09c3e9fab3fd08d54.35253029', '09c3e9fad1a6916f6.31435087');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fad338c7644.96860563', '09c3e9fabdd351246.80879105', '09c3e9fad1a6916f6.31435087');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fad338c96f7.20665567', '09c3e9fac43e3e318.94516920', '09c3e9fad1a6916f6.31435087');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fad338cbd11.29811237', '09c3e9facb1255690.68314300', '09c3e9fad1a6916f6.31435087');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9faeea8aaa16.71553399', '09c3e9fa7a9ab7d91.20301208', '09c3e9fae8cb752a2.90128094');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9faeea8ad4f2.28745576', '09c3e9faa00b85159.72617565', '09c3e9fae8cb752a2.90128094');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9faef6d0a007.46964905', '09c3e9fa7a9ab7d91.20301208', '09c3e9faef180a651.04573087');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9faef6d0c978.68201998', '09c3e9faa00b85159.72617565', '09c3e9faef180a651.04573087');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9faef6d0e929.44997594', '09c3e9faaa9a9be17.25775783', '09c3e9faef180a651.04573087');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb1bf6197c7.16046924', '09c3e9fb12656dd06.98348161', '09c3e9fb17a910f94.48378680');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb1bf61c595.76458602', '09c3e9fb12656dd06.98348161', '09c3e9fb1754708e8.92846357');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb1bf61e5d3.00333357', '09c3e9fb12656dd06.98348161', '09c3e9fb17ed2c654.89803506');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb3754f11e2.88199576', '09c3e9fb35ac46af7.88737723', '09c3e9fb17a910f94.48378680');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb3754f3ec1.13576751', '09c3e9fb35ac46af7.88737723', '09c3e9fb1754708e8.92846357');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb3754f5f23.02160542', '09c3e9fb35ac46af7.88737723', '09c3e9fb17ed2c654.89803506');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb576797f66.16064840', '09c3e9faaa9a9be17.25775783', '09c3e9fb56936b404.09572928');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb57679b7c3.38904278', '09c3e9fac43e3e318.94516920', '09c3e9fb56936b404.09572928');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb5767a3889.48564626', '09c3e9fb53e85f9a6.81000848', '09c3e9fb56936b404.09572928');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb5f29d56d8.59457238', '09c3e9fb5cf8fb250.95817693', '09c3e9fb56936b404.09572928');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb5f4688167.92054678', '09c3e9fb5cf8fb250.95817693', '09c3e9fb1754708e8.92846357');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fb64fe3be69.70541176', '09c3e9fb53e85f9a6.81000848', '09c3e9fb1754708e8.92846357');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fbb17373676.60361116', '09c3e9fb9bd782cb6.68718230', '09c3e9fbaea8e3845.49898248');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fbb308a74b6.27063757', '09c3e9fb9d7b2c275.50282439', '09c3e9fbaea8e3845.49898248');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fbb4f8189a3.17036299', '09c3e9fb9f6b35db3.82738508', '09c3e9fbaea8e3845.49898248');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fbb62ce2dd8.36554935', '09c3e9fba45f1c7f6.64521235', '09c3e9fbaea8e3845.49898248');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fbb760ffac8.75924467', '09c3e9fba6b520c56.92155495', '09c3e9fbaea8e3845.49898248');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fbb8cb11484.90935767', '09c3e9fba96921142.33756556', '09c3e9fbaea8e3845.49898248');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fbd3d5c7d78.17917609', '09c3e9fbd30776328.26967390', '09c3e9fbaea8e3845.49898248');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('09c3e9fbf8c497ae3.87442283', '09c3e9fbf647d8279.17219606', '09c3e9fbaea8e3845.49898248');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('b8e3ea3fbf74dba44.21462272', '09c3e9fb8b2854ce4.98142407', '09c3e9fbaea8e3845.49898248');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('b8e3ea3fce49af387.99781084', '09c3e9fb9bd782cb6.68718230', 'b8e3ea3fc7469e970.74268897');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('b8e3ea3fceaa261b1.42839804', '09c3e9fbf647d8279.17219606', 'b8e3ea3fc7469e970.74268897');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('b8e3ea3fcf1bba313.10475832', '09c3e9fb9f6b35db3.82738508', 'b8e3ea3fc7469e970.74268897');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('b8e3ea3fcfba691b0.90470454', '09c3e9fba96921142.33756556', 'b8e3ea3fc7469e970.74268897');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('b8e3ea3ff0411f635.16626182', '9433ea3e571052410.94336156', 'b8e3ea3fc7469e970.74268897');
INSERT INTO oxobject2attribute (OXID, OXOBJECTID, OXATTRID) VALUES ('3533ea93769767c61.64640138', '09c3e9fb3d152c690.15484054', '09c3e9fb17a910f94.48378680');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxobject2category`
#

DROP TABLE IF EXISTS oxobject2category;
CREATE TABLE oxobject2category (
  OXID varchar(32) NOT NULL default '',
  OXOBJECTID varchar(32) NOT NULL default '',
  OXCATNID varchar(32) NOT NULL default '',
  OXPOS int(11) NOT NULL default '0',
  PRIMARY KEY  (OXID),
  KEY OXOBJECTID (OXOBJECTID),
  KEY OXCATNID (OXCATNID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxobject2category`
#

INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fa87711de89.30203206', '09c3e9fa7a9ab7d91.20301208', '09c3e9fa66726c155.22768705', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fa9a22c2633.53546113', '09c3e9fa7a9ab7d91.20301208', '09c3e9fa999d3f540.02989179', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9faa2033f568.92031789', '09c3e9faa00b85159.72617565', '09c3e9fa66726c155.22768705', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9faa203426d4.51837224', '09c3e9faa00b85159.72617565', '09c3e9fa999d3f540.02989179', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9faab0bfe900.49111677', '09c3e9faaa9a9be17.25775783', '09c3e9fa66726c155.22768705', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9faab0c01728.00330180', '09c3e9faaa9a9be17.25775783', '09c3e9fa999d3f540.02989179', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fab5f78c608.59954358', '09c3e9fab3fd08d54.35253029', '09c3e9fa66726c155.22768705', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fab5f78ffa8.05705441', '09c3e9fab3fd08d54.35253029', '09c3e9fab52756877.16487437', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fabe2783568.46617148', '09c3e9fabdd351246.80879105', '09c3e9fa66726c155.22768705', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fabe2786414.53311735', '09c3e9fabdd351246.80879105', '09c3e9fab52756877.16487437', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fac4e20e847.39940918', '09c3e9fac43e3e318.94516920', '09c3e9fa66726c155.22768705', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fac4e2116a7.30467587', '09c3e9fac43e3e318.94516920', '09c3e9fab52756877.16487437', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9facc55afb09.36969452', '09c3e9facb1255690.68314300', '09c3e9fa66726c155.22768705', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9facc55b2aa5.42846281', '09c3e9facb1255690.68314300', '09c3e9fab52756877.16487437', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb130a04093.06409032', '09c3e9fb12656dd06.98348161', '09c3e9fb0a8759f66.49105208', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb58a4c87b5.93013150', '09c3e9fb53e85f9a6.81000848', '09c3e9fb0a8759f66.49105208', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb3fc85f020.92609271', '09c3e9fb35ac46af7.88737723', '09c3e9fb0a8759f66.49105208', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb3fc862036.16918078', '09c3e9fb3d152c690.15484054', '09c3e9fb0a8759f66.49105208', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb40a486237.76700301', '09c3e9fb35ac46af7.88737723', '09c3e9fb0ba2b1151.91718933', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb40a489791.63833015', '09c3e9fb3d152c690.15484054', '09c3e9fb0ba2b1151.91718933', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb414994b09.63019692', '09c3e9fb12656dd06.98348161', '09c3e9fb0ba2b1151.91718933', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb58a4cb7d5.55210956', '09c3e9fb53e85f9a6.81000848', '09c3e9fb5158b8038.76669730', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb60071ebd7.94462759', '09c3e9fb5cf8fb250.95817693', '09c3e9fb0a8759f66.49105208', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb6007226a7.95916922', '09c3e9fb5cf8fb250.95817693', '09c3e9fb5158b8038.76669730', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb69b5110e1.83181590', '09c3e9facb1255690.68314300', '09c3e9fa63c8c5930.45657980', 11);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb69b513f65.33806740', '09c3e9fa7a9ab7d91.20301208', '09c3e9fa63c8c5930.45657980', 3);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb69b516454.06667069', '09c3e9faa00b85159.72617565', '09c3e9fa63c8c5930.45657980', 5);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb69b518825.10403383', '09c3e9faaa9a9be17.25775783', '09c3e9fa63c8c5930.45657980', 7);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb69b51b923.92441080', '09c3e9fab3fd08d54.35253029', '09c3e9fa63c8c5930.45657980', 8);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb69b51dff3.41850535', '09c3e9fabdd351246.80879105', '09c3e9fa63c8c5930.45657980', 9);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb69b528c63.98956584', '09c3e9fac43e3e318.94516920', '09c3e9fa63c8c5930.45657980', 10);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb6a1419ba2.20531654', '09c3e9fb12656dd06.98348161', '09c3e9fa63c8c5930.45657980', 2);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb6a141ca99.67542153', '09c3e9fb35ac46af7.88737723', '09c3e9fa63c8c5930.45657980', 4);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb6a141efe7.35617592', '09c3e9fb3d152c690.15484054', '09c3e9fa63c8c5930.45657980', 6);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb6a1421744.10294474', '09c3e9fb53e85f9a6.81000848', '09c3e9fa63c8c5930.45657980', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb6a1423bd2.22053548', '09c3e9fb5cf8fb250.95817693', '09c3e9fa63c8c5930.45657980', 1);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb8c851c4d0.25174645', '09c3e9fb8b2854ce4.98142407', '09c3e9fb6e7552e91.47341604', 2);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fb8c851f4d9.29033670', '09c3e9fb8b2854ce4.98142407', '09c3e9fb726180075.82571307', 2);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb1254d485.47855146', '09c3e9fb9bd782cb6.68718230', '09c3e9fb6e7552e91.47341604', 3);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb125503d7.60496919', '09c3e9fb9bd782cb6.68718230', '09c3e9fb726180075.82571307', 3);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb2c4dd0b4.75565085', '09c3e9fb9d7b2c275.50282439', '09c3e9fb6e7552e91.47341604', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb2c4dff96.89920634', '09c3e9fb9d7b2c275.50282439', '09c3e9fb726180075.82571307', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb2c4e24b3.41573291', '09c3e9fb9d7b2c275.50282439', '09c3e9fbac717ac46.25334786', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb4b36e4b3.53535105', '09c3e9fb9f6b35db3.82738508', '09c3e9fb6e7552e91.47341604', 5);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb4b371ff0.98904136', '09c3e9fb9f6b35db3.82738508', '09c3e9fb726180075.82571307', 5);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb4b3749b0.35376225', '09c3e9fb9f6b35db3.82738508', '09c3e9fbac717ac46.25334786', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb5da652f8.54563450', '09c3e9fba45f1c7f6.64521235', '09c3e9fb6e7552e91.47341604', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb5da6a535.65463466', '09c3e9fba45f1c7f6.64521235', '09c3e9fb726180075.82571307', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb5da6d9b2.25230048', '09c3e9fba45f1c7f6.64521235', '09c3e9fbac717ac46.25334786', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb72ac8fe8.48874743', '09c3e9fba6b520c56.92155495', '09c3e9fb6e7552e91.47341604', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb72acc1e8.56168399', '09c3e9fba6b520c56.92155495', '09c3e9fb726180075.82571307', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb88909899.84942505', '09c3e9fba96921142.33756556', '09c3e9fb6e7552e91.47341604', 6);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb8890cb30.59612260', '09c3e9fba96921142.33756556', '09c3e9fb726180075.82571307', 6);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbb8890f4e3.11078583', '09c3e9fba96921142.33756556', '09c3e9fbac717ac46.25334786', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbd3a4095b0.99161052', '09c3e9fbd30776328.26967390', '09c3e9fb726180075.82571307', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbf88dec487.37373255', '09c3e9fbf647d8279.17219606', '09c3e9fb6e7552e91.47341604', 4);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbf88def921.25221051', '09c3e9fbf647d8279.17219606', '09c3e9fb726180075.82571307', 4);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fbf88df2122.56824639', '09c3e9fbf647d8279.17219606', '09c3e9fbac717ac46.25334786', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('09c3e9fcb8b3c29f6.09618376', '09c3e9fcb862a3d60.76946761', '09c3e9fb6e7552e91.47341604', 0);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('9433ea3e577aa6ec0.95432648', '9433ea3e571052410.94336156', '09c3e9fb6e7552e91.47341604', 1);
INSERT INTO oxobject2category (OXID, OXOBJECTID, OXCATNID, OXPOS) VALUES ('5cb3ea90cb0bfccc1.12653885', '5cb3ea90c18965af9.51266815', '09c3e9fb6e7552e91.47341604', 0);
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxobject2group`
#

DROP TABLE IF EXISTS oxobject2group;
CREATE TABLE oxobject2group (
  OXID varchar(32) NOT NULL default '',
  OXOBJECTID varchar(32) NOT NULL default '',
  OXGROUPSID varchar(32) NOT NULL default '',
  PRIMARY KEY  (OXID),
  KEY OXOBJECTID (OXOBJECTID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxobject2group`
#

INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('d573ea406959c96f7.93767554', 'd523e8d2c4c418524.87834505', 'oxidsmallcust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('d573ea406959cd6b3.97593144', 'd523e8d2c4c418524.87834505', 'oxidforeigncustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('d573ea406959cfad5.81801860', 'd523e8d2c4c418524.87834505', 'oxidnewcustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('d573ea406959d1a54.24600927', 'd523e8d2c4c418524.87834505', 'oxidnewsletter');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('bd03ea7ba0863f229.46173905', 'd523e8d2c4c418524.87834505', 'oxiddealer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be8c342616.76972283', 'oxiddebitnote', 'oxidsmallcust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be8c345a60.71241828', 'oxiddebitnote', 'oxidmiddlecust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be8c347c29.74576645', 'oxiddebitnote', 'oxidgoodcust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be8c349d29.90532508', 'oxiddebitnote', 'oxidforeigncustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be8c354270.78283724', 'oxiddebitnote', 'oxidpowershopper');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be8c3566f2.53206229', 'oxiddebitnote', 'oxiddealer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be92421040.59370651', '24a3e8d4dc007ab08.06151825', 'oxidblacklist');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be92424369.80237130', '24a3e8d4dc007ab08.06151825', 'oxidsmallcust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be92426445.14581589', '24a3e8d4dc007ab08.06151825', 'oxidmiddlecust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be92428437.21976414', '24a3e8d4dc007ab08.06151825', 'oxidgoodcust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be9242a4a4.30098809', '24a3e8d4dc007ab08.06151825', 'oxidforeigncustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be9242c4b2.50743906', '24a3e8d4dc007ab08.06151825', 'oxidnewcustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be9242e4e1.06682046', '24a3e8d4dc007ab08.06151825', 'oxidpowershopper');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be924304e6.31299558', '24a3e8d4dc007ab08.06151825', 'oxiddealer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7be924324d8.03957098', '24a3e8d4dc007ab08.06151825', 'oxidnewsletter');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beae5e5cd2.01446243', 'oxidcreditcard', 'oxidmiddlecust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beae5e98b1.44298719', 'oxidcreditcard', 'oxidgoodcust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beae5ebeb5.91137291', 'oxidcreditcard', 'oxidforeigncustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beae5ee126.69028880', 'oxidcreditcard', 'oxidpowershopper');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beae5f02e3.42946278', 'oxidcreditcard', 'oxiddealer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7bee2a281f1.40224406', 'a713e96cb3051d598.22935426', 'oxidpowershopper');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beb8e15fa5.87363077', 'oxidcashondel', 'oxidsmallcust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beb8e18700.21427654', 'oxidcashondel', 'oxidmiddlecust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beb8e1a9f3.54351175', 'oxidcashondel', 'oxidgoodcust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beb8e1cc19.11824649', 'oxidcashondel', 'oxidforeigncustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beb8e1ede2.43302336', 'oxidcashondel', 'oxidnewcustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beb8e20ed1.65742511', 'oxidcashondel', 'oxidpowershopper');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beb8e23053.23198618', 'oxidcashondel', 'oxiddealer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7bee2a2b6e5.99929525', 'a713e96cb3051d598.22935426', 'oxiddealer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beea2d9659.08229306', 'a713e96ca0bab4ff2.29366696', 'oxidblacklist');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beea2dd828.48750069', 'a713e96ca0bab4ff2.29366696', 'oxidsmallcust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beea2dfdb6.11405613', 'a713e96ca0bab4ff2.29366696', 'oxidmiddlecust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beea2e20c7.09885880', 'a713e96ca0bab4ff2.29366696', 'oxidgoodcust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beea2e4370.53712945', 'a713e96ca0bab4ff2.29366696', 'oxidforeigncustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beea2e6613.10595674', 'a713e96ca0bab4ff2.29366696', 'oxidnewcustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beea2e8883.91038997', 'a713e96ca0bab4ff2.29366696', 'oxidpowershopper');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('aea3ea7beea2ead98.33405368', 'a713e96ca0bab4ff2.29366696', 'oxiddealer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('cb63eb116e7e3d0d0.60961506', '77c3ea91c3362b382.94852565', 'oxidmiddlecust');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('77c3ea91c370fce82.43019087', '77c3ea91c3362b382.94852565', 'oxidnewsletter');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('77c3ea91c3b117e21.57532041', '77c3ea91c3362b382.94852565', 'oxidnewcustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('77c3ea91c87da1916.61062242', 'd4f3e9bf5341fa658.54951834', 'oxidnewsletter');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('cb63eb116e7e413c9.81806989', '77c3ea91c3362b382.94852565', 'oxidforeigncustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('af43eb288e4817879.06374498', 'af43eb288e47e3399.32076984', 'oxidnewcustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('af43eb28a79379638.05659736', 'af43eb28a793300e1.56383126', 'oxidnewcustomer');
INSERT INTO oxobject2group (OXID, OXOBJECTID, OXGROUPSID) VALUES ('af43eb28aea02d8e3.51027779', 'af43eb28ae9f3d103.38671119', 'oxidnewcustomer');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxobject2selectlist`
#

DROP TABLE IF EXISTS oxobject2selectlist;
CREATE TABLE oxobject2selectlist (
  OXID varchar(32) NOT NULL default '',
  OXOBJECTID varchar(32) NOT NULL default '',
  OXSELNID varchar(32) NOT NULL default '',
  PRIMARY KEY  (OXID),
  KEY OXOBJECTID (OXOBJECTID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxobject2selectlist`
#

INSERT INTO oxobject2selectlist (OXID, OXOBJECTID, OXSELNID) VALUES ('09c3e9fad0729dde2.29864994', '09c3e9facb1255690.68314300', '09c3e9facf8b17f28.25384199');
INSERT INTO oxobject2selectlist (OXID, OXOBJECTID, OXSELNID) VALUES ('6c13ea3b7526e2b11.94435059', '09c3e9faa00b85159.72617565', '09c3e9fafd9371c75.68165035');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxorder`
#

DROP TABLE IF EXISTS oxorder;
CREATE TABLE oxorder (
  OXID varchar(32) NOT NULL default '',
  OXSHOPID varchar(32) NOT NULL default '',
  OXUSERID varchar(32) NOT NULL default '',
  OXORDERDATE datetime NOT NULL default '0000-00-00 00:00:00',
  OXORDERNR int(11) NOT NULL default '0',
  OXBILLCOMPANY varchar(255) NOT NULL default '',
  OXBILLFNAME varchar(255) NOT NULL default '',
  OXBILLLNAME varchar(255) NOT NULL default '',
  OXBILLSTREET varchar(255) NOT NULL default '',
  OXBILLADDINFO varchar(255) NOT NULL default '',
  OXBILLCITY varchar(255) NOT NULL default '',
  OXBILLCOUNTRY varchar(255) NOT NULL default '',
  OXBILLZIP varchar(16) NOT NULL default '',
  OXBILLFON varchar(128) NOT NULL default '',
  OXBILLFAX varchar(128) NOT NULL default '',
  OXBILLSAL varchar(128) NOT NULL default '',
  OXDELCOMPANY varchar(255) NOT NULL default '',
  OXDELFNAME varchar(255) NOT NULL default '',
  OXDELLNAME varchar(255) NOT NULL default '',
  OXDELSTREET varchar(255) NOT NULL default '',
  OXDELADDINFO varchar(255) NOT NULL default '',
  OXDELCITY varchar(255) NOT NULL default '',
  OXDELCOUNTRY varchar(255) NOT NULL default '',
  OXDELZIP varchar(16) NOT NULL default '',
  OXDELFON varchar(128) NOT NULL default '',
  OXDELFAX varchar(128) NOT NULL default '',
  OXDELSAL varchar(128) NOT NULL default '',
  OXPAYMENTID varchar(32) NOT NULL default '',
  OXPAYMENTVAL varchar(255) NOT NULL default '',
  OXDELCOST double NOT NULL default '0',
  OXPAYCOST double NOT NULL default '0',
  OXEXPORT tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (OXID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxorder`
#

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxorderarticles`
#

DROP TABLE IF EXISTS oxorderarticles;
CREATE TABLE oxorderarticles (
  OXID varchar(32) NOT NULL default '',
  OXORDERID varchar(32) NOT NULL default '',
  OXAMOUNT double NOT NULL default '0',
  OXARTID varchar(32) NOT NULL default '',
  OXARTNUM varchar(255) NOT NULL default '',
  OXTITLE varchar(255) NOT NULL default '',
  OXSHORTDESC varchar(255) NOT NULL default '',
  OXSELVARIANT varchar(255) NOT NULL default '',
  OXNETPRICE double NOT NULL default '0',
  OXBRUTPRICE double NOT NULL default '0',
  OXVAT double NOT NULL default '0',
  PRIMARY KEY  (OXID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxorderarticles`
#

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxpayments`
#

DROP TABLE IF EXISTS oxpayments;
CREATE TABLE oxpayments (
  OXID varchar(32) NOT NULL default '',
  OXSHOPID varchar(32) NOT NULL default '',
  OXACTIV enum('1','0') NOT NULL default '1',
  OXDESC varchar(128) NOT NULL default '',
  OXADDSUM double NOT NULL default '0',
  OXADDSUMTYPE enum('abs','%') NOT NULL default 'abs',
  OXFROMBONI int(11) NOT NULL default '0',
  OXVALDESC text NOT NULL,
  PRIMARY KEY  (OXID),
  KEY OXACTIV (OXACTIV)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxpayments`
#

INSERT INTO oxpayments (OXID, OXSHOPID, OXACTIV, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXVALDESC) VALUES ('oxidcashondel', 'oxbaseshop', '1', 'Nachnahme', '7.5', 'abs', 0, '');
INSERT INTO oxpayments (OXID, OXSHOPID, OXACTIV, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXVALDESC) VALUES ('oxidcreditcard', 'oxbaseshop', '1', 'Kreditkarte', '20.9', 'abs', 500, 'kktype__@@kknumber__@@kkmonth__@@kkyear__@@kkname__@@');
INSERT INTO oxpayments (OXID, OXSHOPID, OXACTIV, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXVALDESC) VALUES ('oxiddebitnote', 'oxbaseshop', '1', 'Bankeinzug/Lastschrift', '0', 'abs', 0, 'lsbankname__@@lsblz__@@lsktonr__@@lsktoinhaber__@@');
INSERT INTO oxpayments (OXID, OXSHOPID, OXACTIV, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXVALDESC) VALUES ('24a3e8d4dc007ab08.06151825', 'oxbaseshop', '1', 'Kokosn�sse', '20', 'abs', 500, 'Lagerort__@@Abholung ?__@@Dominikanische N�sse ?__@@');
INSERT INTO oxpayments (OXID, OXSHOPID, OXACTIV, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXVALDESC) VALUES ('a713e96ca0bab4ff2.29366696', 'oxbaseshop', '1', 'Vorkasse', '0', 'abs', 0, '');
INSERT INTO oxpayments (OXID, OXSHOPID, OXACTIV, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXVALDESC) VALUES ('a713e96cb3051d598.22935426', 'oxbaseshop', '1', 'Rechnung', '0', 'abs', 800, '');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxremark`
#

DROP TABLE IF EXISTS oxremark;
CREATE TABLE oxremark (
  OXID varchar(32) NOT NULL default '',
  OXPARENTID varchar(32) NOT NULL default '',
  OXSHOPID varchar(32) NOT NULL default '',
  OXTYPE enum('o','r','n') NOT NULL default 'r',
  OXHEADER varchar(255) NOT NULL default '',
  OXTEXT text NOT NULL,
  OXCREATE datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (OXID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxremark`
#

# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxreviews`
#

DROP TABLE IF EXISTS oxreviews;
CREATE TABLE oxreviews (
  OXID varchar(32) NOT NULL default '',
  OXNID varchar(32) NOT NULL default '',
  OXPARENTID varchar(32) NOT NULL default '',
  OXLANG char(1) NOT NULL default '0',
  OXSHOPID varchar(32) NOT NULL default '',
  OXTEXT text NOT NULL,
  OXUSERID varchar(32) NOT NULL default '',
  OXCREATE datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (OXID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxreviews`
#

INSERT INTO oxreviews (OXID, OXNID, OXPARENTID, OXLANG, OXSHOPID, OXTEXT, OXUSERID, OXCREATE) VALUES ('1a83ea3f058a6ed22.87950613_0', '1a83ea3f058a6ed22.87950613', '09c3e9fbf647d8279.17219606', '0', 'oxbaseshop', 'Das Modul Produktvarianten ist ein <b>Muss</b> f�r alle, die �ber ein reichhaltiges Produktsortiment verf�gen.\r\n\r\nMit dem Modul Produktvarianten ist es ein leichtes die Waren anschaulich zu pr�sentieren, und dabei den �berblick �ber den Lagerbestand zu behalten.\r\n\r\n\r\n\r\n', '9fc3e7ffed9bc1363.02273044', '2003-04-21 15:21:28');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxselectlist`
#

DROP TABLE IF EXISTS oxselectlist;
CREATE TABLE oxselectlist (
  OXID varchar(32) NOT NULL default '',
  OXNID varchar(32) NOT NULL default '',
  OXLANG char(1) NOT NULL default '0',
  OXSHOPID varchar(32) NOT NULL default '',
  OXTITLE varchar(254) NOT NULL default '',
  OXVALDESC text NOT NULL,
  PRIMARY KEY  (OXID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxselectlist`
#

INSERT INTO oxselectlist (OXID, OXNID, OXLANG, OXSHOPID, OXTITLE, OXVALDESC) VALUES ('09c3e9facf8b17f28.25384199_0', '09c3e9facf8b17f28.25384199', '0', 'oxbaseshop', 'H�rtegrad', 'Detlef__@@Chantall__@@Hartmut__@@');
INSERT INTO oxselectlist (OXID, OXNID, OXLANG, OXSHOPID, OXTITLE, OXVALDESC) VALUES ('09c3e9fafd9371c75.68165035_0', '09c3e9fafd9371c75.68165035', '0', 'oxbaseshop', 'Gr�sse', 'S__@@M__@@L__@@XL__@@');
INSERT INTO oxselectlist (OXID, OXNID, OXLANG, OXSHOPID, OXTITLE, OXVALDESC) VALUES ('9433ea3e597beb743.66195223_0', '9433ea3e597beb743.66195223', '0', 'oxbaseshop', 'Zahlungsweise', 'Monatlich__@@J�hrlich__@@');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxshops`
#

DROP TABLE IF EXISTS oxshops;
CREATE TABLE oxshops (
  OXID varchar(32) NOT NULL default '',
  OXACTIV enum('1','0') NOT NULL default '1',
  OXDEFCURRENCY varchar(32) NOT NULL default '',
  OXDEFLANGUAGE int(11) NOT NULL default '0',
  OXNAME varchar(255) NOT NULL default '',
  OXINFOEMAIL varchar(255) NOT NULL default '',
  OXORDEREMAIL varchar(255) NOT NULL default '',
  OXOWNEREMAIL varchar(255) NOT NULL default '',
  OXORDERSUBJECT varchar(255) NOT NULL default '',
  OXREGISTERSUBJECT varchar(255) NOT NULL default '',
  OXFORGOTPWDSUBJECT varchar(255) NOT NULL default '',
  OXSMTP varchar(255) NOT NULL default '',
  OXSMTPUSER varchar(128) NOT NULL default '',
  OXSMTPPWD varchar(128) NOT NULL default '',
  OXSERIAL varchar(255) NOT NULL default '',
  OXCOMPANY varchar(128) NOT NULL default '',
  OXSTREET varchar(255) NOT NULL default '',
  OXZIP varchar(255) NOT NULL default '',
  OXCITY varchar(255) NOT NULL default '',
  OXCOUNTRY varchar(255) NOT NULL default '',
  OXBANKNAME varchar(255) NOT NULL default '',
  OXBANKNUMBER varchar(255) NOT NULL default '',
  OXBANKCODE varchar(255) NOT NULL default '',
  OXVATNUMBER varchar(255) NOT NULL default '',
  OXFNAME varchar(255) NOT NULL default '',
  OXLNAME varchar(255) NOT NULL default '',
  OXTELEFON varchar(255) NOT NULL default '',
  OXTELEFAX varchar(255) NOT NULL default '',
  OXURL varchar(255) NOT NULL default '',
  OXDEFCAT varchar(32) NOT NULL default '',
  PRIMARY KEY  (OXID),
  KEY OXACTIV (OXACTIV)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxshops`
#

INSERT INTO oxshops (OXID, OXACTIV, OXDEFCURRENCY, OXDEFLANGUAGE, OXNAME, OXINFOEMAIL, OXORDEREMAIL, OXOWNEREMAIL, OXORDERSUBJECT, OXREGISTERSUBJECT, OXFORGOTPWDSUBJECT, OXSMTP, OXSMTPUSER, OXSMTPPWD, OXSERIAL, OXCOMPANY, OXSTREET, OXZIP, OXCITY, OXCOUNTRY, OXBANKNAME, OXBANKNUMBER, OXBANKCODE, OXVATNUMBER, OXFNAME, OXLNAME, OXTELEFON, OXTELEFAX, OXURL, OXDEFCAT) VALUES ('oxbaseshop', '1', '', 0, '[.nfq] oxid', 'info@nfq-esales.de', 'sales@nfq-esales.de', 'sales@nfq-esales.de', 'Ihre Bestellung bei NFQ eSales', 'Vielen Dank f�r Ihre Registrierung bei NFQ eSales', 'Ihr Passwort bei NFQ eSales', 'localhost', '', '', 'XKVQRFNYRFQRZBYVMRAM', 'nfq esales GmbH', 'Am Kraftwerk 4', '79183', 'Waldkirch', 'Deutschland', 'Volksbank Freiburg', '', '', '', 'Eric', 'Jankowfsky', '0800 0999444', '', 'www.nfq-esales.de', '09c3e9fb726180075.82571307');
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxuser`
#

DROP TABLE IF EXISTS oxuser;
CREATE TABLE oxuser (
  OXID varchar(32) NOT NULL default '',
  OXACTIV enum('1','0') NOT NULL default '1',
  OXRIGHTS varchar(32) NOT NULL default '',
  OXUSERNAME varchar(255) NOT NULL default '',
  OXPASSWORD varchar(16) NOT NULL default '',
  OXCUSTNR varchar(64) NOT NULL default '',
  OXCOMPANY varchar(255) NOT NULL default '',
  OXFNAME varchar(255) NOT NULL default '',
  OXLNAME varchar(255) NOT NULL default '',
  OXSTREET varchar(255) NOT NULL default '',
  OXADDINFO varchar(255) NOT NULL default '',
  OXCITY varchar(255) NOT NULL default '',
  OXCOUNTRY varchar(255) NOT NULL default '',
  OXZIP varchar(16) NOT NULL default '',
  OXFON varchar(128) NOT NULL default '',
  OXFAX varchar(128) NOT NULL default '',
  OXSAL varchar(128) NOT NULL default '',
  OXBONI int(11) NOT NULL default '0',
  OXCREATE datetime NOT NULL default '0000-00-00 00:00:00',
  OXPRIVFON varchar(64) NOT NULL default '',
  OXMOBFON varchar(64) NOT NULL default '',
  OXDBOPTIN tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (OXID),
  UNIQUE KEY OXUSERNAME (OXUSERNAME),
  KEY OXPASSWORD (OXPASSWORD)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxuser`
#

INSERT INTO oxuser (OXID, OXACTIV, OXRIGHTS, OXUSERNAME, OXPASSWORD, OXCUSTNR, OXCOMPANY, OXFNAME, OXLNAME, OXSTREET, OXADDINFO, OXCITY, OXCOUNTRY, OXZIP, OXFON, OXFAX, OXSAL, OXBONI, OXCREATE, OXPRIVFON, OXMOBFON, OXDBOPTIN) VALUES ('d523e8d2c4c418524.87834505', '1', 'oxbaseshop', 'admin', 'admin', '1', 'NFQ eSales GmbH', 'Eric', 'Jankowfsky', 'Am Kraftwerk 4', '', 'Waldkirch', 'Deutschland', '79183', '0800 0999444', '07681/4749989', 'Herr', 1000, '0000-00-00 00:00:00', 'uh', 'iopip', 1);
INSERT INTO oxuser (OXID, OXACTIV, OXRIGHTS, OXUSERNAME, OXPASSWORD, OXCUSTNR, OXCOMPANY, OXFNAME, OXLNAME, OXSTREET, OXADDINFO, OXCITY, OXCOUNTRY, OXZIP, OXFON, OXFAX, OXSAL, OXBONI, OXCREATE, OXPRIVFON, OXMOBFON, OXDBOPTIN) VALUES ('77c3ea91c3362b382.94852565', '1', 'oxbaseshop', 'lars@jankowfsky.de', 'admin', '2', 'NFQ eSales GmbH', 'Lars', 'Jankowfsky', 'Am Kraftwerk 4', 'CTO', 'Waldkirch', 'Deutschland', '79183', '0800 0999444', '07681/4749989', 'Herr', 0, '2003-04-25 13:29:55', '', '', 1);
# --------------------------------------------------------

#
# Tabellenstruktur f�r Tabelle `oxuserpayments`
#

DROP TABLE IF EXISTS oxuserpayments;
CREATE TABLE oxuserpayments (
  OXID varchar(32) NOT NULL default '',
  OXUSERID varchar(32) NOT NULL default '',
  OXPAYMENTSID varchar(32) NOT NULL default '',
  OXVALUE varchar(255) NOT NULL default '',
  PRIMARY KEY  (OXID),
  KEY OXUSERID (OXUSERID)
) ENGINE=MyISAM;

#
# Daten f�r Tabelle `oxuserpayments`
#


