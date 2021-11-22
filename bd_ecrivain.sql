#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: livre
#------------------------------------------------------------

CREATE TABLE livre(
        Id_livre      Int  Auto_increment  NOT NULL ,
        nom_livre     Varchar (50) NOT NULL ,
        editeur       Varchar (50) NOT NULL ,
        annee_edition Int NOT NULL
	,CONSTRAINT livre_PK PRIMARY KEY (Id_livre)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Editeur
#------------------------------------------------------------

CREATE TABLE Editeur(
        id_editeur      Int  Auto_increment  NOT NULL ,
        nom_editeur     Varchar (50) NOT NULL ,
        adresse_editeur Varchar (50) NOT NULL
	,CONSTRAINT Editeur_PK PRIMARY KEY (id_editeur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ecrivain
#------------------------------------------------------------

CREATE TABLE ecrivain(
        id_ecrivain  Int  Auto_increment  NOT NULL ,
        nom_ecrivain Varchar (50) NOT NULL
	,CONSTRAINT ecrivain_PK PRIMARY KEY (id_ecrivain)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: theme
#------------------------------------------------------------

CREATE TABLE theme(
        id_theme  Int  Auto_increment  NOT NULL ,
        nom_theme Varchar (50) NOT NULL
	,CONSTRAINT theme_PK PRIMARY KEY (id_theme)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ecrire
#------------------------------------------------------------

CREATE TABLE ecrire(
        id_ecrivain Int NOT NULL ,
        Id_livre    Int NOT NULL
	,CONSTRAINT ecrire_PK PRIMARY KEY (id_ecrivain,Id_livre)

	,CONSTRAINT ecrire_ecrivain_FK FOREIGN KEY (id_ecrivain) REFERENCES ecrivain(id_ecrivain)
	,CONSTRAINT ecrire_livre0_FK FOREIGN KEY (Id_livre) REFERENCES livre(Id_livre)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: edition
#------------------------------------------------------------

CREATE TABLE edition(
        id_editeur    Int NOT NULL ,
        Id_livre      Int NOT NULL ,
        annee_edition Int NOT NULL
	,CONSTRAINT edition_PK PRIMARY KEY (id_editeur,Id_livre)

	,CONSTRAINT edition_Editeur_FK FOREIGN KEY (id_editeur) REFERENCES Editeur(id_editeur)
	,CONSTRAINT edition_livre0_FK FOREIGN KEY (Id_livre) REFERENCES livre(Id_livre)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: relation3
#------------------------------------------------------------

CREATE TABLE relation3(
        id_theme           Int NOT NULL ,
        Id_livre           Int NOT NULL ,
        Id_livre_relation3 Int NOT NULL
	,CONSTRAINT relation3_PK PRIMARY KEY (id_theme,Id_livre,Id_livre_relation3)

	,CONSTRAINT relation3_theme_FK FOREIGN KEY (id_theme) REFERENCES theme(id_theme)
	,CONSTRAINT relation3_livre0_FK FOREIGN KEY (Id_livre) REFERENCES livre(Id_livre)
	,CONSTRAINT relation3_livre1_FK FOREIGN KEY (Id_livre_relation3) REFERENCES livre(Id_livre)
)ENGINE=InnoDB;

