--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 9.5.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: icare; Type: SCHEMA; Schema: -; Owner: icare
--

CREATE SCHEMA icare;


ALTER SCHEMA icare OWNER TO icare;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = icare, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ic_adresse; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_adresse (
    code_adr character varying(32) NOT NULL,
    bp character varying(255),
    date_modif date NOT NULL,
    encodeur character varying(80),
    mobile character varying(255),
    quartier character varying(255),
    rue character varying(255),
    telephone character varying(255),
    version double precision default 1 not null,
    ville character varying(255)
);


ALTER TABLE ic_adresse OWNER TO icare;

--
-- Name: ic_annee_medical; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_annee_medical (
    code_annee character varying(8) NOT NULL,
    date_debut date,
    date_fin date,
    date_modif date NOT NULL,
    encodeur character varying(80),
    version double precision default 1 not null
);


ALTER TABLE ic_annee_medical OWNER TO icare;

--
-- Name: ic_assurance_medical; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_assurance_medical (
    num_assurance character varying(8) NOT NULL,
    date_delivrance date,
    date_expiration date,
    date_modif date NOT NULL,
    encodeur character varying(80),
    taux double precision,
    taux_vitamine double precision,
    version double precision default 1 not null,
    assureur character varying(8)
);


ALTER TABLE ic_assurance_medical OWNER TO icare;

--
-- Name: ic_assureur; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_assureur (
    code_assureur character varying(8) NOT NULL,
    date_modif date NOT NULL,
    denomination character varying(255),
    encodeur character varying(80),
    version double precision default 1 not null
);


ALTER TABLE ic_assureur OWNER TO icare;

--
-- Name: ic_categorie_praticien; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_categorie_praticien (
    code_cat character varying(32) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    libelle character varying(255),
    version double precision default 1 not null
);


ALTER TABLE ic_categorie_praticien OWNER TO icare;

--
-- Name: ic_categorie_patient; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_categorie_patient (
    code_cat_pat character varying(32) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    libelle character varying(255),
    version double precision default 1 not null
);


ALTER TABLE ic_categorie_patient OWNER TO icare;

--
-- Name: ic_classe_pharmaceutique; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_classe_pharmaceutique (
    code_classe_phar character varying(8) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    libelle character varying(255),
    version double precision default 1 not null
);


ALTER TABLE ic_classe_pharmaceutique OWNER TO icare;

--
-- Name: ic_consultation; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_consultation (
    num_cons character varying(32) NOT NULL,
    date_consultation date NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    observations character varying(255),
    poids character varying(255),
    pouls character varying(255),
    taille character varying(255),
    temperature character varying(255),
    version double precision default 1 not null,
    praticien character varying(255) NOT NULL
);


ALTER TABLE ic_consultation OWNER TO icare;

--
-- Name: ic_diagnostic_pathologique; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_diagnostic_pathologique (
    code_diagnostic_pathologique character varying(32) NOT NULL,
    date_modif date NOT NULL,
    description character varying(100),
    diagnostic bytea,
    encodeur character varying(80),
    observation character varying(100),
    statuspathologie character varying(255),
    version double precision  default 1 not null,
    pathologie_id character varying(32)
);


ALTER TABLE ic_diagnostic_pathologique OWNER TO icare;

--
-- Name: ic_examen_medical; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_examen_medical (
    code character varying(8) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    libelle character varying(255),
    version double precision  default 1 not null
);


ALTER TABLE ic_examen_medical OWNER TO icare;

--
-- Name: ic_frais_annuel_prestation; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_frais_annuel_prestation (
    id character varying(32) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    montant double precision,
    version double precision  default 1 not null,
    anneemedicale_code_annee character varying(8),
    categoriepatient_code_cat_pat character varying(8),
    natureprestation_code_nat character varying(8)
);


ALTER TABLE ic_frais_annuel_prestation OWNER TO icare;

--
-- Name: ic_frais_annuel_salle; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_frais_annuel_salle (
    id character varying(32) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    montant double precision,
    version double precision  default 1 not null,
    anneemedicale_code_annee character varying(8),
    sallehospitalisation_id character varying(32)
);


ALTER TABLE ic_frais_annuel_salle OWNER TO icare;

--
-- Name: ic_hospitalisation; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_hospitalisation (
    id character varying(32) NOT NULL,
    dateentree timestamp without time zone,
    date_modif date NOT NULL,
    datesortie timestamp without time zone,
    encodeur character varying(80),
    observation character varying(255),
    version double precision  default 1 not null,
    patient_id_pers character varying(32),
    salle_id character varying(32)
);


ALTER TABLE ic_hospitalisation OWNER TO icare;

--
-- Name: ic_ligne_diagnostic; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_ligne_diagnostic (
    id character varying(32) NOT NULL,
    date_modif date NOT NULL,
    diagnostic bytea,
    encodeur character varying(80),
    etat character varying(255),
    traits_particuliers character varying(255),
    version double precision  default 1 not null,
    consultation_num_cons character varying(32)
);


ALTER TABLE ic_ligne_diagnostic OWNER TO icare;

--
-- Name: ic_ligne_ordonnance_medicale; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_ligne_ordonnance_medicale (
    id character varying(32) NOT NULL,
    commentaire character varying(255),
    date_modif date NOT NULL,
    encodeur character varying(80),
    posologie character varying(255),
    version double precision  default 1 not null,
    ordonnance character varying(8),
    consultation character varying(255)
);


ALTER TABLE ic_ligne_ordonnance_medicale OWNER TO icare;

--
-- Name: ic_materiel_medical; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_materiel_medical (
    id character varying(32) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    version double precision  default 1 not null
);


ALTER TABLE ic_materiel_medical OWNER TO icare;

--
-- Name: ic_mode_reglement; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_mode_reglement (
    code_mode character varying(32) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    libelle character varying(255),
    version double precision  default 1 not null
);


ALTER TABLE ic_mode_reglement OWNER TO icare;

--
-- Name: ic_nature_prestation; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_nature_prestation (
    code_nat character varying(8) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    libelle character varying(255),
    version double precision  default 1 not null
);


ALTER TABLE ic_nature_prestation OWNER TO icare;

--
-- Name: ic_ordonnance_medicale; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_ordonnance_medicale (
    num_ord character varying(8) NOT NULL,
    date_modif date NOT NULL,
    date_ordonnance date NOT NULL,
    encodeur character varying(80),
    version double precision default 1 not null,
    consultation character varying(32),
    rdvsuivant_num_rdv character varying(8)
);


ALTER TABLE ic_ordonnance_medicale OWNER TO icare;

--
-- Name: ic_pathologie; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_pathologie (
    id character varying(32) NOT NULL,
    caracteristique character varying(255),
    date_modif date NOT NULL,
    encodeur character varying(80),
    libelle character varying(255),
    version double precision default 1 not null
);


ALTER TABLE ic_pathologie OWNER TO icare;

--
-- Name: ic_personne; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_personne (
    id_pers character varying(32) NOT NULL,
    dtype character varying(31),
    date_modif date NOT NULL,
    date_naissance date NOT NULL,
    departement_origine character varying(30),
    email character varying(30),
    encodeur character varying(80),
    lieu_naissance character varying(40) NOT NULL,
    nom character varying(80) NOT NULL,
    photo character varying(30),
    prenoms character varying(100) NOT NULL,
    sexe character varying(1) NOT NULL,
    telephone character varying(30),
    version double precision default 1 not null,
    ville_origine character varying(30),
    adresse character varying(32) NOT NULL,
    categorie character varying(8) NOT NULL,
    specialite character varying(255) NOT NULL,
    assurance_num_assurance character varying(8)
);


ALTER TABLE ic_personne OWNER TO icare;


CREATE TABLE ic_patient (
    num_pat VARCHAR(32) NOT NULL, 
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
    version double precision default 1 not null, 
    ville_origine VARCHAR(30), 
    adresse VARCHAR(32) NOT NULL, 
    assurance VARCHAR(8) NOT NULL, 
    categorie VARCHAR(8) NOT NULL
);

ALTER TABLE ic_patient OWNER TO icare;
--
-- Name: ic_personne_ic_consultation; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_personne_ic_consultation (
    praticienentite_id_pers character varying(32) NOT NULL,
    consultations_num_cons character varying(32) NOT NULL
);


ALTER TABLE ic_personne_ic_consultation OWNER TO icare;

--
-- Name: ic_prestation_medicale; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_prestation_medicale (
    num_prest character varying(32) NOT NULL,
    date_modif date NOT NULL,
    date_prestation date,
    encodeur character varying(80),
    libelle character varying(100),
    version double precision default 1 not null,
    nature_code_nat character varying(8)
);


ALTER TABLE ic_prestation_medicale OWNER TO icare;

--
-- Name: ic_produit_pharmaceutique; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_produit_pharmaceutique (
    code_prod character varying(8) NOT NULL,
    date_modif date NOT NULL,
    designation character varying(255),
    encodeur character varying(80),
    version double precision default 1 not null,
    classe_pharmaceutique character varying(8)
);


ALTER TABLE ic_produit_pharmaceutique OWNER TO icare;

--
-- Name: ic_rayon; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_rayon (
    id character varying(32) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    version double precision  default 1 not null,
);


ALTER TABLE ic_rayon OWNER TO icare;

--
-- Name: ic_reglement; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_reglement (
    num_reglement character varying(32) NOT NULL,
    date_modif date NOT NULL,
    date_reglement date,
    encodeur character varying(80),
    numreglement bigint,
    version double precision default 1 not null,
    modereglement_code_mode character varying(32),
    prestation_num_prest character varying(32)
);


ALTER TABLE ic_reglement OWNER TO icare;

--
-- Name: ic_rendez_vous; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_rendez_vous (
    num_rdv character varying(8) NOT NULL,
    date_modif date NOT NULL,
    date_rdv date,
    encodeur character varying(80),
    version double precision  default 1 not null,
    patient character varying(255),
    consultation_num_cons character varying(32)
);


ALTER TABLE ic_rendez_vous OWNER TO icare;

--
-- Name: ic_resultat_examen_medical; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_resultat_examen_medical (
    id character varying(32) NOT NULL,
    date_modif date NOT NULL,
    date_prescription date,
    date_realisation date,
    encodeur character varying(80),
    observation character varying(255),
    prescripteur character varying(255),
    realisateur character varying(255),
    resultat character varying(255),
    version double precision default 1 not null,
    consultation character varying(255),
    examen_code character varying(8)
);


ALTER TABLE ic_resultat_examen_medical OWNER TO icare;

--
-- Name: ic_role; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_role (
    code character varying(32) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    libelle character varying(80) NOT NULL,
    version double precision default 1 not null
);


ALTER TABLE ic_role OWNER TO icare;

--
-- Name: ic_salle_hospitalisation; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_salle_hospitalisation (
    id character varying(32) NOT NULL,
    date_modif date NOT NULL,
    description character varying(255),
    encodeur character varying(80),
    localisation character varying(255),
    numsalle character varying(255),
    standing character varying(255),
    version double precision default 1 not null
);


ALTER TABLE ic_salle_hospitalisation OWNER TO icare;

--
-- Name: ic_soin_medical; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_soin_medical (
    id character varying(32) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    version double precision default 1 not null
);


ALTER TABLE ic_soin_medical OWNER TO icare;

--
-- Name: ic_specialite_medicale; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_specialite_medicale (
    code character varying(8) NOT NULL,
    date_modif date NOT NULL,
    encodeur character varying(80),
    libelle character varying(255),
    version double precision default 1 not null
);


ALTER TABLE ic_specialite_medicale OWNER TO icare;

--
-- Name: ic_utilisateur; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE ic_utilisateur (
    identifiant character varying(40) NOT NULL,
    date_creation date NOT NULL,
    date_modif date NOT NULL,
    email character varying(64),
    encodeur character varying(80),
    mot_de_passe character varying(64),
    nom_de_famille character varying(60),
    prenom character varying(60),
    telephone character varying(15),
    version double precision  default 1 not null
);


ALTER TABLE ic_utilisateur OWNER TO icare;

--
-- Name: join_utilisateur2role; Type: TABLE; Schema: icare; Owner: icare
--

CREATE TABLE join_utilisateur2role (
    identifiant character varying(40) NOT NULL,
    groupe character varying(40) NOT NULL
);


ALTER TABLE join_utilisateur2role OWNER TO icare;

SET search_path = public, pg_catalog;

--
-- Name: sequence; Type: TABLE; Schema: public; Owner: icare
--

CREATE TABLE sequence (
    seq_name character varying(50) NOT NULL,
    seq_count numeric(38,0)
);
--
-- Name: ic_generateur_sequence_numero; Type: TABLE; Schema: public; Owner: icare
--
create table ic_generateur_sequence_numero( 
    id character varying(2) not null, 
    seq double precision not null, 
    version double precision not null default(1)
);

alter table ic_generateur_sequence_numero add constraint ic_generateur_sequence_numero_pkey primary key(id);

ALTER TABLE sequence OWNER TO icare;

SET search_path = icare, pg_catalog;

--
-- Data for Name: ic_adresse; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_adresse (code_adr, bp, date_modif, encodeur, mobile, quartier, rue, telephone, version, ville) FROM stdin;
\.


--
-- Data for Name: ic_annee_medical; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_annee_medical (code_annee, date_debut, date_fin, date_modif, encodeur, version) FROM stdin;
\.


--
-- Data for Name: ic_assurance_medical; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_assurance_medical (num_assurance, date_delivrance, date_expiration, date_modif, encodeur, taux, taux_vitamine, version, assureur) FROM stdin;
\.


--
-- Data for Name: ic_assureur; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_assureur (code_assureur, date_modif, denomination, encodeur, version) FROM stdin;
\.


--
-- Data for Name: ic_categorie_praticien; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_categorie_praticien (code_cat, date_modif, encodeur, libelle, version) FROM stdin;
\.


--
-- Data for Name: ic_classe_pharmaceutique; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_classe_pharmaceutique (code_classe_phar, date_modif, encodeur, libelle, version) FROM stdin;
\.


--
-- Data for Name: ic_consultation; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_consultation (num_cons, date_consultation, date_modif, encodeur, observations, poids, pouls, taille, temperature, version, praticien) FROM stdin;
\.


--
-- Data for Name: ic_diagnostic_pathologique; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_diagnostic_pathologique (code_diagnostic_pathologique, date_modif, description, diagnostic, encodeur, observation, statuspathologie, version, pathologie_id) FROM stdin;
\.


--
-- Data for Name: ic_examen_medical; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_examen_medical (code, date_modif, encodeur, libelle, version) FROM stdin;
\.


--
-- Data for Name: ic_frais_annuel_prestation; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_frais_annuel_prestation (id, date_modif, encodeur, montant, version, anneemedicale_code_annee, categoriepatient_code_cat_pat, natureprestation_code_nat) FROM stdin;
\.


--
-- Data for Name: ic_frais_annuel_salle; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_frais_annuel_salle (id, date_modif, encodeur, montant, version, anneemedicale_code_annee, sallehospitalisation_id) FROM stdin;
\.


--
-- Data for Name: ic_hospitalisation; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_hospitalisation (id, dateentree, date_modif, datesortie, encodeur, observation, version, patient_id_pers, salle_id) FROM stdin;
\.


--
-- Data for Name: ic_ligne_diagnostic; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_ligne_diagnostic (id, date_modif, diagnostic, encodeur, etat, traits_particuliers, version, consultation_num_cons) FROM stdin;
\.


--
-- Data for Name: ic_ligne_ordonnance_medicale; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_ligne_ordonnance_medicale (id, commentaire, date_modif, encodeur, posologie, version, ordonnance, consultation) FROM stdin;
\.


--
-- Data for Name: ic_materiel_medical; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_materiel_medical (id, date_modif, encodeur, version) FROM stdin;
\.


--
-- Data for Name: ic_mode_reglement; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_mode_reglement (code_mode, date_modif, encodeur, libelle, version) FROM stdin;
\.


--
-- Data for Name: ic_nature_prestation; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_nature_prestation (code_nat, date_modif, encodeur, libelle, version) FROM stdin;
\.


--
-- Data for Name: ic_ordonnance_medicale; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_ordonnance_medicale (num_ord, date_modif, date_ordonnance, encodeur, version, consultation, rdvsuivant_num_rdv) FROM stdin;
\.


--
-- Data for Name: ic_pathologie; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_pathologie (id, caracteristique, date_modif, encodeur, libelle, version) FROM stdin;
\.


--
-- Data for Name: ic_personne; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_personne (id_pers, dtype, date_modif, date_naissance, departement_origine, email, encodeur, lieu_naissance, nom, photo, prenoms, sexe, telephone, version, ville_origine, adresse, categorie, specialite, assurance_num_assurance) FROM stdin;
\.


--
-- Data for Name: ic_personne_ic_consultation; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_personne_ic_consultation (praticienentite_id_pers, consultations_num_cons) FROM stdin;
\.


--
-- Data for Name: ic_prestation_medicale; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_prestation_medicale (num_prest, date_modif, date_prestation, encodeur, libelle, version, nature_code_nat) FROM stdin;
\.


--
-- Data for Name: ic_produit_pharmaceutique; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_produit_pharmaceutique (code_prod, date_modif, designation, encodeur, version, classe_pharmaceutique) FROM stdin;
\.


--
-- Data for Name: ic_rayon; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_rayon (id, date_modif, encodeur, version) FROM stdin;
\.


--
-- Data for Name: ic_reglement; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_reglement (num_reglement, date_modif, date_reglement, encodeur, numreglement, version, modereglement_code_mode, prestation_num_prest) FROM stdin;
\.


--
-- Data for Name: ic_rendez_vous; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_rendez_vous (num_rdv, date_modif, date_rdv, encodeur, version, patient, consultation_num_cons) FROM stdin;
\.


--
-- Data for Name: ic_resultat_examen_medical; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_resultat_examen_medical (id, date_modif, date_prescription, date_realisation, encodeur, observation, prescripteur, realisateur, resultat, version, consultation, examen_code) FROM stdin;
\.


--
-- Data for Name: ic_role; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_role (code, date_modif, encodeur, libelle, version) FROM stdin;
admin	2017-09-16	\N	administrateur	\N
\.


--
-- Data for Name: ic_salle_hospitalisation; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_salle_hospitalisation (id, date_modif, description, encodeur, localisation, numsalle, standing, version) FROM stdin;
\.


--
-- Data for Name: ic_soin_medical; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_soin_medical (id, date_modif, encodeur, version) FROM stdin;
\.


--
-- Data for Name: ic_specialite_medicale; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_specialite_medicale (code, date_modif, encodeur, libelle, version) FROM stdin;
\.


--
-- Data for Name: ic_utilisateur; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY ic_utilisateur (identifiant, date_creation, date_modif, email, encodeur, mot_de_passe, nom_de_famille, prenom, telephone, version) FROM stdin;
kiki	2017-09-16	2017-09-16	\N	\N	0d61130a6dd5eea85c2c5facfe1c15a7	\N	\N	\N	1
test	2017-09-16	2017-09-16	\N	\N	kiki	\N	\N	\N	1
\.


--
-- Data for Name: join_utilisateur2role; Type: TABLE DATA; Schema: icare; Owner: icare
--

COPY join_utilisateur2role (identifiant, groupe) FROM stdin;
kiki	admin
test	admin
\.


SET search_path = public, pg_catalog;

--
-- Data for Name: sequence; Type: TABLE DATA; Schema: public; Owner: icare
--

COPY sequence (seq_name, seq_count) FROM stdin;
generator	0
\.


SET search_path = icare, pg_catalog;
--
-- Name: ic_patient_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_patient
    ADD CONSTRAINT ic_patient_pkey PRIMARY KEY (num_pat);
--
-- Name: ic_adresse_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_adresse
    ADD CONSTRAINT ic_adresse_pkey PRIMARY KEY (code_adr);


--
-- Name: ic_annee_medical_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_annee_medical
    ADD CONSTRAINT ic_annee_medical_pkey PRIMARY KEY (code_annee);


--
-- Name: ic_assurance_medical_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_assurance_medical
    ADD CONSTRAINT ic_assurance_medical_pkey PRIMARY KEY (num_assurance);


--
-- Name: ic_assureur_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_assureur
    ADD CONSTRAINT ic_assureur_pkey PRIMARY KEY (code_assureur);


--
-- Name: ic_categorie_praticien_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_categorie_praticien
    ADD CONSTRAINT ic_categorie_praticien_pkey PRIMARY KEY (code_cat);

--
-- Name: ic_categorie_patient_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_categorie_patient
    ADD CONSTRAINT ic_categorie_patient_pkey PRIMARY KEY (code_cat_pat);

--
-- Name: ic_classe_pharmaceutique_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_classe_pharmaceutique
    ADD CONSTRAINT ic_classe_pharmaceutique_pkey PRIMARY KEY (code_classe_phar);


--
-- Name: ic_consultation_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_consultation
    ADD CONSTRAINT ic_consultation_pkey PRIMARY KEY (num_cons);


--
-- Name: ic_diagnostic_pathologique_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_diagnostic_pathologique
    ADD CONSTRAINT ic_diagnostic_pathologique_pkey PRIMARY KEY (code_diagnostic_pathologique);


--
-- Name: ic_examen_medical_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_examen_medical
    ADD CONSTRAINT ic_examen_medical_pkey PRIMARY KEY (code);


--
-- Name: ic_frais_annuel_prestation_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_frais_annuel_prestation
    ADD CONSTRAINT ic_frais_annuel_prestation_pkey PRIMARY KEY (id);


--
-- Name: ic_frais_annuel_salle_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_frais_annuel_salle
    ADD CONSTRAINT ic_frais_annuel_salle_pkey PRIMARY KEY (id);


--
-- Name: ic_hospitalisation_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_hospitalisation
    ADD CONSTRAINT ic_hospitalisation_pkey PRIMARY KEY (id);


--
-- Name: ic_ligne_diagnostic_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_ligne_diagnostic
    ADD CONSTRAINT ic_ligne_diagnostic_pkey PRIMARY KEY (id);


--
-- Name: ic_ligne_ordonnance_medicale_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_ligne_ordonnance_medicale
    ADD CONSTRAINT ic_ligne_ordonnance_medicale_pkey PRIMARY KEY (id);


--
-- Name: ic_materiel_medical_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_materiel_medical
    ADD CONSTRAINT ic_materiel_medical_pkey PRIMARY KEY (id);


--
-- Name: ic_mode_reglement_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_mode_reglement
    ADD CONSTRAINT ic_mode_reglement_pkey PRIMARY KEY (code_mode);


--
-- Name: ic_nature_prestation_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_nature_prestation
    ADD CONSTRAINT ic_nature_prestation_pkey PRIMARY KEY (code_nat);


--
-- Name: ic_ordonnance_medicale_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_ordonnance_medicale
    ADD CONSTRAINT ic_ordonnance_medicale_pkey PRIMARY KEY (num_ord);


--
-- Name: ic_pathologie_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_pathologie
    ADD CONSTRAINT ic_pathologie_pkey PRIMARY KEY (id);


--
-- Name: ic_personne_ic_consultation_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_personne_ic_consultation
    ADD CONSTRAINT ic_personne_ic_consultation_pkey PRIMARY KEY (praticienentite_id_pers, consultations_num_cons);


--
-- Name: ic_personne_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_personne
    ADD CONSTRAINT ic_personne_pkey PRIMARY KEY (id_pers);


--
-- Name: ic_prestation_medicale_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_prestation_medicale
    ADD CONSTRAINT ic_prestation_medicale_pkey PRIMARY KEY (num_prest);


--
-- Name: ic_produit_pharmaceutique_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_produit_pharmaceutique
    ADD CONSTRAINT ic_produit_pharmaceutique_pkey PRIMARY KEY (code_prod);


--
-- Name: ic_rayon_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_rayon
    ADD CONSTRAINT ic_rayon_pkey PRIMARY KEY (id);


--
-- Name: ic_reglement_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_reglement
    ADD CONSTRAINT ic_reglement_pkey PRIMARY KEY (num_reglement);


--
-- Name: ic_rendez_vous_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_rendez_vous
    ADD CONSTRAINT ic_rendez_vous_pkey PRIMARY KEY (num_rdv);


--
-- Name: ic_resultat_examen_medical_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_resultat_examen_medical
    ADD CONSTRAINT ic_resultat_examen_medical_pkey PRIMARY KEY (id);


--
-- Name: ic_role_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_role
    ADD CONSTRAINT ic_role_pkey PRIMARY KEY (code);


--
-- Name: ic_salle_hospitalisation_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_salle_hospitalisation
    ADD CONSTRAINT ic_salle_hospitalisation_pkey PRIMARY KEY (id);


--
-- Name: ic_soin_medical_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_soin_medical
    ADD CONSTRAINT ic_soin_medical_pkey PRIMARY KEY (id);


--
-- Name: ic_specialite_medicale_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_specialite_medicale
    ADD CONSTRAINT ic_specialite_medicale_pkey PRIMARY KEY (code);


--
-- Name: ic_utilisateur_pkey; Type: CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_utilisateur
    ADD CONSTRAINT ic_utilisateur_pkey PRIMARY KEY (identifiant);


SET search_path = public, pg_catalog;

--
-- Name: sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: icare
--

ALTER TABLE ONLY sequence
    ADD CONSTRAINT sequence_pkey PRIMARY KEY (seq_name);


SET search_path = icare, pg_catalog;

--
-- Name: fk_ic_assurance_medical_assureur; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_assurance_medical
    ADD CONSTRAINT fk_ic_assurance_medical_assureur FOREIGN KEY (assureur) REFERENCES ic_assureur(code_assureur);


--
-- Name: fk_ic_patient_categorie_code_nat; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_patient
    ADD CONSTRAINT fk_ic_patient_categorie_code_cat_pat FOREIGN KEY (categorie) REFERENCES ic_categorie_patient(code_cat_pat);

--
-- Name: fk_ic_diagnostic_pathologique_pathologie_id; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_diagnostic_pathologique
    ADD CONSTRAINT fk_ic_diagnostic_pathologique_pathologie_id FOREIGN KEY (pathologie_id) REFERENCES ic_pathologie(id);


--
-- Name: fk_ic_frais_annuel_prestation_anneemedicale_code_annee; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_frais_annuel_prestation
    ADD CONSTRAINT fk_ic_frais_annuel_prestation_anneemedicale_code_annee FOREIGN KEY (anneemedicale_code_annee) REFERENCES ic_annee_medical(code_annee);


--
-- Name: fk_ic_frais_annuel_salle_sallehospitalisation_id; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_frais_annuel_salle
    ADD CONSTRAINT fk_ic_frais_annuel_salle_sallehospitalisation_id FOREIGN KEY (sallehospitalisation_id) REFERENCES ic_salle_hospitalisation(id);


--
-- Name: fk_ic_hospitalisation_salle_id; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_hospitalisation
    ADD CONSTRAINT fk_ic_hospitalisation_salle_id FOREIGN KEY (salle_id) REFERENCES ic_salle_hospitalisation(id);


--
-- Name: fk_ic_ligne_diagnostic_consultation_num_cons; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_ligne_diagnostic
    ADD CONSTRAINT fk_ic_ligne_diagnostic_consultation_num_cons FOREIGN KEY (consultation_num_cons) REFERENCES ic_consultation(num_cons);


--
-- Name: fk_ic_ordonnance_medicale_consultation; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_ordonnance_medicale
    ADD CONSTRAINT fk_ic_ordonnance_medicale_consultation FOREIGN KEY (consultation) REFERENCES ic_consultation(num_cons);


--
-- Name: fk_ic_personne_adresse; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_personne
    ADD CONSTRAINT fk_ic_personne_adresse FOREIGN KEY (adresse) REFERENCES ic_adresse(code_adr);


--
-- Name: fk_ic_personne_ic_consultation_consultations_num_cons; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_personne_ic_consultation
    ADD CONSTRAINT fk_ic_personne_ic_consultation_consultations_num_cons FOREIGN KEY (consultations_num_cons) REFERENCES ic_consultation(num_cons);


--
-- Name: fk_ic_personne_ic_consultation_praticienentite_id_pers; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_personne_ic_consultation
    ADD CONSTRAINT fk_ic_personne_ic_consultation_praticienentite_id_pers FOREIGN KEY (praticienentite_id_pers) REFERENCES ic_personne(id_pers);


--
-- Name: fk_ic_prestation_medicale_nature_code_nat; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_prestation_medicale
    ADD CONSTRAINT fk_ic_prestation_medicale_nature_code_nat FOREIGN KEY (nature_code_nat) REFERENCES ic_nature_prestation(code_nat);


--
-- Name: fk_ic_produit_pharmaceutique_classe_pharmaceutique; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_produit_pharmaceutique
    ADD CONSTRAINT fk_ic_produit_pharmaceutique_classe_pharmaceutique FOREIGN KEY (classe_pharmaceutique) REFERENCES ic_classe_pharmaceutique(code_classe_phar);


--
-- Name: fk_ic_reglement_prestation_num_prest; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY ic_reglement
    ADD CONSTRAINT fk_ic_reglement_prestation_num_prest FOREIGN KEY (prestation_num_prest) REFERENCES ic_prestation_medicale(num_prest);


--
-- Name: fk_join_utilisateur2role_groupe; Type: FK CONSTRAINT; Schema: icare; Owner: icare
--

ALTER TABLE ONLY join_utilisateur2role
    ADD CONSTRAINT fk_join_utilisateur2role_groupe FOREIGN KEY (groupe) REFERENCES ic_role(code);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

