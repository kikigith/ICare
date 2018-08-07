--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: ciDB; Type: SCHEMA; Schema: -; Owner: cidbadmin

CREATE SCHEMA icare;

ALTER SCHEMA icare OWNER TO icare;

ALTER EXTENSION IF NOT EXISTS plpgsl WITH SCHEMA pg_catalog;

COMMENT ON EXTENSION plpgsql IS 'PL/PGSQL procedural language';

SET search_path = icare, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


--
--


-- Name: ic_mode_reglement; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_mode_reglement (
	code_mode VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	libelle VARCHAR(255), 
	version double precision, 
	PRIMARY KEY (code_mode)
);


-- Name: ic_materiel_medical; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_materiel_medical (
	id VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	version double precision, 
	PRIMARY KEY (id)
);

-- Name: ic_personne; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_personne (
	id_pers VARCHAR(32) NOT NULL, 
	DTYPE VARCHAR(31), 
	date_modif DATE NOT NULL, 
	date_naissance DATE NOT NULL, 
	departement_origine VARCHAR(30), 	
	email VARCHAR(30), 
	encodeur VARCHAR(80), 
	lieu_naissance VARCHAR(40) NOT NULL, 
	nom VARCHAR(80) NOT NULL, 
	photo VARCHAR(30), 
	prenoms VARCHAR(100) NOT NULL, 
	sexe VARCHAR(1) NOT NULL, 
	telephone VARCHAR(30), 
	version double precision, 
	ville_origine VARCHAR(30), 
	adresse VARCHAR(32) NOT NULL, 
	categorie VARCHAR(8) NOT NULL, 
	specialite VARCHAR(255) NOT NULL, 
	ASSURANCE_num_assurance VARCHAR(8), 
	PRIMARY KEY (id_pers)
);


-- Name: ic_utilisateur; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_utilisateur (
	identifiant VARCHAR(40) NOT NULL, 
	date_creation DATE NOT NULL, 
	date_modif DATE NOT NULL, 
	email VARCHAR(64), 
	encodeur VARCHAR(80), 
	mot_de_passe VARCHAR(64), 
	nom_de_famille VARCHAR(60), 
	prenom VARCHAR(60), 
	telephone VARCHAR(15), 
	version double precision, 
	PRIMARY KEY (identifiant)
);

-- Name: ic_consultation; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_consultation (
	num_cons VARCHAR(32) NOT NULL, 
	date_consultation DATE NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	observations VARCHAR(255), 
	poids VARCHAR(255), 
	pouls VARCHAR(255), 
	taille VARCHAR(255), 
	temperature VARCHAR(255), 
	version double precision, 
	praticien VARCHAR(255) NOT NULL, 
	PRIMARY KEY (num_cons)
);


-- Name: ic_consultation; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_prestation_medicale (
	num_prest VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	date_prestation DATE, 
	encodeur VARCHAR(80), 
	libelle VARCHAR(100), 
	version double precision, 
	NATURE_code_nat VARCHAR(8), 
	PRIMARY KEY (num_prest)
);

-- Name: ic_salle_hospitalisation; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_salle_hospitalisation (
	id VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	DESCRIPTION VARCHAR(255), 
	encodeur VARCHAR(80), 
	LOCALISATION VARCHAR(255), 
	NUMSALLE VARCHAR(255), 
	STANDING VARCHAR(255), 
	version double precision, 
PRIMARY KEY (id)
);

-- Name: ic_classe_pharmaceutique; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_classe_pharmaceutique (
	code_classe_phar VARCHAR(8) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	libelle VARCHAR(255), 
	version double precision, 
	PRIMARY KEY (code_classe_phar)
);

-- Name: ic_classe_pharmaceutique; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_nature_prestation (
	code_nat VARCHAR(8) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	libelle VARCHAR(255), 
	version double precision, 
	PRIMARY KEY (code_nat)
);

-- Name: ic_ligne_ordonnance_medicale; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_ligne_ordonnance_medicale (
	id VARCHAR(32) NOT NULL, 
	commentaire VARCHAR(255), 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	posologie VARCHAR(255), 
	version double precision, 
	ordonnance VARCHAR(8), 
	consultation VARCHAR(255), 
	PRIMARY KEY (id)
);

-- Name: ic_role; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_role (
	code VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	libelle VARCHAR(80) NOT NULL, 
	version double precision, 
	PRIMARY KEY (code)
);

-- Name: ic_adresse; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_adresse (
	code_adr VARCHAR(32) NOT NULL, 
	BP VARCHAR(255), 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	MOBILE VARCHAR(255), 
	QUARTIER VARCHAR(255), 
	RUE VARCHAR(255), 
	TELEPHONE VARCHAR(255), 
	version double precision, 
	ville VARCHAR(255), 
	PRIMARY KEY (code_adr)
);


-- Name: ic_resultat_examen_medical; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_resultat_examen_medical (
	id VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	date_prescription DATE, 
	date_realisation DATE, 
	encodeur VARCHAR(80), 
	observation VARCHAR(255), 
	prescripteur VARCHAR(255), 
	realisateur VARCHAR(255), 
	resultat VARCHAR(255), 
	version double precision, 
	consultation VARCHAR(255), 
	EXAMEN_code VARCHAR(8), 
	PRIMARY KEY (id)
);

-- Name: ic_categorie_praticien; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_categorie_praticien (
	code_cat VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	libelle VARCHAR(255), 
	version double precision, 
	PRIMARY KEY (code_cat)
);


-- Name: ic_frais_annuel_prestation; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_frais_annuel_prestation (
	id VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	montant FLOAT, 
	version double precision, 
	ANNEEMEDICALE_code_annee VARCHAR(8), 
	CATEGORIEPATIENT_code_cat_pat VARCHAR(8), 
	NATUREPRESTATION_code_nat VARCHAR(8), 
	PRIMARY KEY (id)
);

-- Name: ic_specialite_medicale; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_specialite_medicale (
	code VARCHAR(8) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	libelle VARCHAR(255), 
	version double precision, 
	PRIMARY KEY (code)
);

-- Name: ic_diagnostic_pathologique; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_diagnostic_pathologique (
	code_diagnostic_pathologique VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	description VARCHAR(100), 
	DIAGNOSTIC BYTEA, 
	encodeur VARCHAR(80), 
	observation VARCHAR(100), 
	STATUSPATHOLOGIE VARCHAR(255), 
	version double precision, 
	PATHOLOGIE_id VARCHAR(32), 
	PRIMARY KEY (code_diagnostic_pathologique)
);

-- Name: ic_annee_medical; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_annee_medical (
	code_annee VARCHAR(8) NOT NULL, 
	date_debut DATE, 
	date_fin DATE, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	version double precision, 
	PRIMARY KEY (code_annee)
);

-- Name: ic_assurance_medical; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_assurance_medical (
	num_assurance VARCHAR(8) NOT NULL, 
	date_delivrance DATE, 
	date_expiration DATE, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	TAUX FLOAT, 
	taux_vitamine FLOAT, 
	version double precision, 
	assureur VARCHAR(8), 
	PRIMARY KEY (num_assurance)
);

-- Name: ic_assureur; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_assureur (
	code_assureur VARCHAR(8) NOT NULL, 
	date_modif DATE NOT NULL, 
	denomination VARCHAR(255), 
	encodeur VARCHAR(80), 
	version double precision, 
	PRIMARY KEY (code_assureur)
);


-- Name: ic_reglement; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_reglement (
	num_reglement VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	date_reglement DATE, 
	encodeur VARCHAR(80), 
	NUMREGLEMENT BIGINT, 
	version double precision, 
	MODEREGLEMENT_code_mode VARCHAR(32), 
	PRESTATION_num_prest VARCHAR(32), 
	PRIMARY KEY (num_reglement)
);

-- Name: ic_soin_medical; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_soin_medical (
	id VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	version double precision, 
	PRIMARY KEY (id)
);

-- Name: ic_ligne_diagnostic; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_ligne_diagnostic (
	id VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	DIAGNOSTIC BYTEA, 
	encodeur VARCHAR(80), 
	etat VARCHAR(255), 
	traits_particuliers VARCHAR(255), 
	version double precision, 
	CONSULTATION_num_cons VARCHAR(32), 
	PRIMARY KEY (id)
);

-- Name: ic_produit_pharmaceutique; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_produit_pharmaceutique (
	code_prod VARCHAR(8) NOT NULL, 
	date_modif DATE NOT NULL, 
	designation VARCHAR(255), 
	encodeur VARCHAR(80), 
	version double precision, 
	classe_pharmaceutique VARCHAR(8), 
	PRIMARY KEY (code_prod)
);

-- Name: ic_examen_medical; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_examen_medical (
	code VARCHAR(8) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	libelle VARCHAR(255), 
	version double precision, 
	PRIMARY KEY (code)
);

-- Name: ic_pathologie; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_pathologie (
	id VARCHAR(32) NOT NULL, 
	CARACTERISTIQUE VARCHAR(255), 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	LIBELLE VARCHAR(255), 
	version double precision, 
	PRIMARY KEY (id)
);

-- Name: ic_ordonnance_medicale; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_ordonnance_medicale (
	num_ord VARCHAR(8) NOT NULL, 
	date_modif DATE NOT NULL, 
	date_ordonnance DATE NOT NULL, 
	encodeur VARCHAR(80), 
	version double precision, 
	consultation VARCHAR(32), 
	RDVSUIVANT_num_rdv VARCHAR(8), 
	PRIMARY KEY (num_ord)
);

-- Name: ic_hospitalisation; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_hospitalisation (
	id VARCHAR(32) NOT NULL, 
	DATEENTREE TIMESTAMP, 
	date_modif DATE NOT NULL, 
	DATESORTIE TIMESTAMP, 
	encodeur VARCHAR(80), 
	OBSERVATION VARCHAR(255), 
	version double precision, 
	PATIENT_id_pers VARCHAR(32), 
	SALLE_id VARCHAR(32), 
	PRIMARY KEY (id)
);

-- Name: ic_rayon; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_rayon (
	id VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	version double precision, 
	PRIMARY KEY (id)
);
-- Name: ic_rendez_vous; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_rendez_vous (
	num_rdv VARCHAR(8) NOT NULL, 
	date_modif DATE NOT NULL, 
	date_rdv DATE, 
	encodeur VARCHAR(80), 
	version double precision, 
	patient VARCHAR(255), 
	CONSULTATION_num_cons VARCHAR(32), 
	PRIMARY KEY (num_rdv)
);
-- Name: ic_frais_annuel_salle; Type: TABLE; Schema: icare; Owner: icare
--
CREATE TABLE ic_frais_annuel_salle (
	id VARCHAR(32) NOT NULL, 
	date_modif DATE NOT NULL, 
	encodeur VARCHAR(80), 
	montant FLOAT, 
	version double precision, 
	ANNEEMEDICALE_code_annee VARCHAR(8), 
	SALLEHOSPITALISATION_id VARCHAR(32), 
	PRIMARY KEY (id)
);

CREATE TABLE join_utilisateur2role (
	identifiant VARCHAR(40) NOT NULL, 
	groupe VARCHAR(40) NOT NULL
);
--Constraints 

ALTER TABLE icare.ic_frais_annuel_prestation ADD CONSTRAINT UNQ_ic_frais_annuel_prestation_0 UNIQUE (annee_medicale, categorie_patient, nature_prestation);
ALTER TABLE icare.ic_ligne_diagnostic ADD CONSTRAINT UNQ_ic_ligne_diagnostic_0 UNIQUE (consultation, diagnostic);
ALTER TABLE icare.ic_frais_annuel_salle ADD CONSTRAINT UNQ_ic_frais_annuel_salle_0 UNIQUE (salle_hospitalisation, annee_medicale);
ALTER TABLE icare.ic_personne ADD CONSTRAINT FK_ic_personne_adresse FOREIGN KEY (adresse) REFERENCES icare.ic_adresse (code_adr);
ALTER TABLE icare.ic_consultation ADD CONSTRAINT FK_ic_consultation_praticien FOREIGN KEY (praticien) REFERENCES icare.ic_personne (num_prat);
ALTER TABLE icare.ic_prestation_medicale ADD CONSTRAINT FK_ic_prestation_medicale_NATURE_code_nat FOREIGN KEY (NATURE_code_nat) REFERENCES icare.ic_nature_prestation (code_nat);
ALTER TABLE icare.ic_ligne_ordonnance_medicale ADD CONSTRAINT FK_ic_ligne_ordonnance_medicale_consultation FOREIGN KEY (consultation) REFERENCES icare.ic_produit_pharmaceutique (code);
ALTER TABLE icare.ic_resultat_examen_medical ADD CONSTRAINT FK_ic_resultat_examen_medical_consultation FOREIGN KEY (consultation) REFERENCES icare.ic_consultation (code);
ALTER TABLE icare.ic_frais_annuel_prestation ADD CONSTRAINT FK_ic_frais_annuel_prestation_ANNEEMEDICALE_code_annee FOREIGN KEY (ANNEEMEDICALE_code_annee) REFERENCES icare.ic_annee_medical (code_annee);
ALTER TABLE icare.ic_diagnostic_pathologique ADD CONSTRAINT FK_ic_diagnostic_pathologique_PATHOLOGIE_id FOREIGN KEY (PATHOLOGIE_id) REFERENCES icare.ic_pathologie (id);
ALTER TABLE icare.ic_assurance_medical ADD CONSTRAINT FK_ic_assurance_medical_assureur FOREIGN KEY (assureur) REFERENCES icare.ic_assureur (code_assureur);
ALTER TABLE icare.ic_reglement ADD CONSTRAINT FK_ic_reglement_PRESTATION_num_prest FOREIGN KEY (PRESTATION_num_prest) REFERENCES icare.ic_prestation_medicale (num_prest);
ALTER TABLE icare.ic_ligne_diagnostic ADD CONSTRAINT FK_ic_ligne_diagnostic_CONSULTATION_num_cons FOREIGN KEY (CONSULTATION_num_cons) REFERENCES icare.ic_consultation (num_cons);
ALTER TABLE icare.ic_produit_pharmaceutique ADD CONSTRAINT FK_ic_produit_pharmaceutique_classe_pharmaceutique FOREIGN KEY (classe_pharmaceutique) REFERENCES icare.ic_classe_pharmaceutique (code_classe_phar);
ALTER TABLE icare.ic_ordonnance_medicale ADD CONSTRAINT FK_ic_ordonnance_medicale_consultation FOREIGN KEY (consultation) REFERENCES icare.ic_consultation (num_cons);
ALTER TABLE icare.ic_hospitalisation ADD CONSTRAINT FK_ic_hospitalisation_SALLE_id FOREIGN KEY (SALLE_id) REFERENCES icare.ic_salle_hospitalisation (id);
ALTER TABLE icare.ic_rendez_vous ADD CONSTRAINT FK_ic_rendez_vous_patient FOREIGN KEY (patient) REFERENCES icare.ic_patient (num_pat);
ALTER TABLE icare.ic_frais_annuel_salle ADD CONSTRAINT FK_ic_frais_annuel_salle_SALLEHOSPITALISATION_id FOREIGN KEY (SALLEHOSPITALISATION_id) REFERENCES icare.ic_salle_hospitalisation (id);
ALTER TABLE icare.join_utilisateur2role ADD CONSTRAINT FK_join_utilisateur2role_groupe FOREIGN KEY (groupe) REFERENCES icare.ic_role (code);
--ALTER TABLE icare.ic_personne_ic_consultation ADD CONSTRAINT FK_ic_personne_ic_consultation_consultations_num_cons FOREIGN KEY (consultations_num_cons) REFERENCES icare.ic_consultation (num_cons);































































