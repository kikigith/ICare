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
-- Name: okapicollege; Type: SCHEMA; Schema: -; Owner: okapicollege
--

CREATE SCHEMA okapicollege;


ALTER SCHEMA okapicollege OWNER TO okapicollege;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = okapicollege, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: annee_etude; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE annee_etude (
    ancien_code character varying(30),
    nouveau_code character varying(30)
);


ALTER TABLE annee_etude OWNER TO postgres;

--
-- Name: audit_basic; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE audit_basic (
    "user" character varying(32) NOT NULL,
    entity character varying(48) NOT NULL,
    entity_id character varying(128) NOT NULL,
    operation character varying(64) NOT NULL,
    date_time timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(128) NOT NULL
);


ALTER TABLE audit_basic OWNER TO postgres;

--
-- Name: comptabilite; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE comptabilite (
    etablissement character varying(8) NOT NULL,
    mention character varying(20) NOT NULL,
    specialite character varying(20) NOT NULL,
    "anneeEtude" character varying(20) NOT NULL,
    statut character varying(16) NOT NULL,
    nationalite character varying(32) NOT NULL,
    "fraisFormation" double precision NOT NULL,
    "fraisInscription" double precision NOT NULL
);


ALTER TABLE comptabilite OWNER TO postgres;

--
-- Name: etudiant_date_naissance_null; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE etudiant_date_naissance_null (
    nom_de_famille character varying(32),
    prenom character varying(100),
    code_pre_inscription character varying(128),
    date_entree date,
    date_modif timestamp without time zone,
    email character varying(48),
    email_secondaire character varying(48),
    encodeur character varying(32),
    etat character varying(16),
    etat_civil character varying(16),
    fax character varying(20),
    identifiant character varying(32),
    handicape smallint,
    localisation character varying(80),
    localisation_secondaire character varying(80),
    matricule character varying(20),
    mot_de_passe character varying(64),
    nombre_enfants integer,
    nr_identite character varying(30),
    nr_secu character varying(20),
    repondant character varying(32),
    site_web character varying(48),
    telephone character varying(20),
    version double precision,
    autoriser_impression_carte smallint,
    date_carte_etudiant date,
    agent_carte_etudiant character varying(32)
);


ALTER TABLE etudiant_date_naissance_null OWNER TO postgres;

--
-- Name: hierachie_entite; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE hierachie_entite (
    etablissement character varying(8) NOT NULL,
    departement character varying(8) NOT NULL,
    "libelleDepartement" character varying(80) NOT NULL,
    mention character varying(20) NOT NULL,
    "libelleMention" character varying(80) NOT NULL,
    specialite character varying(20) NOT NULL,
    "libelleSpecialite" character varying(80) NOT NULL,
    "codeAnneeEtude" character varying(20) NOT NULL,
    "libelleAnneeEtude" character varying(80) NOT NULL
);


ALTER TABLE hierachie_entite OWNER TO postgres;

--
-- Name: history_comptabilite; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE history_comptabilite (
    debut timestamp without time zone DEFAULT now() NOT NULL,
    fin timestamp without time zone DEFAULT '-infinity'::timestamp without time zone NOT NULL,
    date_modif timestamp without time zone DEFAULT '-infinity'::timestamp without time zone NOT NULL,
    date_paiement date,
    encodeur character varying(32),
    inscription character varying(128),
    nr_transaction character varying(128),
    type_paiement character varying(20),
    montant real,
    version double precision,
    id character varying(128),
    intermediaire_de_paiement character varying(32)
);


ALTER TABLE history_comptabilite OWNER TO postgres;

--
-- Name: history_decision_jury; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE history_decision_jury (
    debut timestamp without time zone DEFAULT now() NOT NULL,
    fin timestamp without time zone DEFAULT '-infinity'::timestamp without time zone NOT NULL,
    id character varying(128),
    inscription_dans_annee_etude character varying(128),
    verdict character varying(20),
    grade character varying(20),
    moyenne real,
    semestre integer,
    date_modif timestamp without time zone DEFAULT '-infinity'::timestamp without time zone NOT NULL,
    encodeur character varying(32),
    version double precision
);


ALTER TABLE history_decision_jury OWNER TO postgres;

--
-- Name: history_montant_inscription; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE history_montant_inscription (
    debut timestamp without time zone DEFAULT now() NOT NULL,
    fin timestamp without time zone DEFAULT '-infinity'::timestamp without time zone NOT NULL,
    annee_etude character varying(20),
    date_modif timestamp without time zone DEFAULT '-infinity'::timestamp without time zone NOT NULL,
    encodeur character varying(32),
    frais_formation double precision,
    frais_inscription double precision,
    id character varying(128),
    statut character varying(32),
    zone_de_pays character varying(32),
    version double precision
);


ALTER TABLE history_montant_inscription OWNER TO postgres;

--
-- Name: history_note; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE history_note (
    debut timestamp without time zone DEFAULT now() NOT NULL,
    fin timestamp without time zone DEFAULT '-infinity'::timestamp without time zone NOT NULL,
    date_modif timestamp without time zone DEFAULT '-infinity'::timestamp without time zone NOT NULL,
    date_valeur date,
    encodeur character varying(32),
    id character varying(128),
    scoremax double precision,
    score double precision,
    version double precision,
    ecue character varying(20)
);


ALTER TABLE history_note OWNER TO postgres;

--
-- Name: id_val_er; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE id_val_er (
    id character varying(128) NOT NULL
);


ALTER TABLE id_val_er OWNER TO postgres;

--
-- Name: join_annee_etude2annee_etude; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_annee_etude2annee_etude (
    annee_etude character varying(30) NOT NULL,
    annee_suivante character varying(30) NOT NULL
);


ALTER TABLE join_annee_etude2annee_etude OWNER TO postgres;

--
-- Name: join_annee_etude2type_bac_interdit; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_annee_etude2type_bac_interdit (
    annee_etude_ref character varying(20) NOT NULL,
    type_bac_ref character varying(8) NOT NULL
);


ALTER TABLE join_annee_etude2type_bac_interdit OWNER TO postgres;

--
-- Name: join_annee_etude_2curriculum; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_annee_etude_2curriculum (
    annee_etude character varying(20) NOT NULL,
    curriculum character varying(20) NOT NULL
);


ALTER TABLE join_annee_etude_2curriculum OWNER TO postgres;

--
-- Name: join_autorisation2organisme; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_autorisation2organisme (
    autorisation_ref character varying(128) NOT NULL,
    organisme_ref character varying(8) NOT NULL
);


ALTER TABLE join_autorisation2organisme OWNER TO postgres;

--
-- Name: join_code_pre_inscription2type_bac; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_code_pre_inscription2type_bac (
    code_pre_inscription_ref character varying(128) NOT NULL,
    type_bac_ref character varying(8) NOT NULL
);


ALTER TABLE join_code_pre_inscription2type_bac OWNER TO postgres;

--
-- Name: join_cours_pondere2module_cours; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_cours_pondere2module_cours (
    cours_pondere_ref character varying(128) NOT NULL,
    module_cours_ref character varying(20) NOT NULL
);


ALTER TABLE join_cours_pondere2module_cours OWNER TO postgres;

--
-- Name: join_curriculum2unite_enseignement; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_curriculum2unite_enseignement (
    curriculum_ref character varying(20) NOT NULL,
    unite_enseignement_ref character varying(20) NOT NULL
);


ALTER TABLE join_curriculum2unite_enseignement OWNER TO postgres;

--
-- Name: join_ecue2gestionnaire; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_ecue2gestionnaire (
    ecue_ref character varying(20) NOT NULL,
    identifiant_ref character varying(20) NOT NULL
);


ALTER TABLE join_ecue2gestionnaire OWNER TO postgres;

--
-- Name: join_enseignant2ecue; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_enseignant2ecue (
    enseignant character varying(20) NOT NULL,
    ecue character varying(20) NOT NULL
);


ALTER TABLE join_enseignant2ecue OWNER TO postgres;

--
-- Name: join_etablissement2domaine; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_etablissement2domaine (
    etablissement_ref character varying(8) NOT NULL,
    domaine_ref character varying(20) NOT NULL
);


ALTER TABLE join_etablissement2domaine OWNER TO postgres;

--
-- Name: join_inscription_dans_annee_etude2cours_pondere; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_inscription_dans_annee_etude2cours_pondere (
    inscription_dans_annee_etude_ref character varying(128) NOT NULL,
    cours_pondere_ref character varying(128) NOT NULL
);


ALTER TABLE join_inscription_dans_annee_etude2cours_pondere OWNER TO postgres;

--
-- Name: join_mention2domaine; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_mention2domaine (
    mention_ref character varying(20) NOT NULL,
    domaine_ref character varying(20) NOT NULL
);


ALTER TABLE join_mention2domaine OWNER TO postgres;

--
-- Name: join_module2role_ecriture; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_module2role_ecriture (
    module_ecriture character varying(48) NOT NULL,
    role_ecriture character varying(20) NOT NULL
);


ALTER TABLE join_module2role_ecriture OWNER TO postgres;

--
-- Name: join_module2role_lecture; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_module2role_lecture (
    module_lecture character varying(48) NOT NULL,
    role_lecture character varying(20) NOT NULL
);


ALTER TABLE join_module2role_lecture OWNER TO postgres;

--
-- Name: join_programme2curriculums; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_programme2curriculums (
    programme character varying(20) NOT NULL,
    curriculum character varying(20) NOT NULL
);


ALTER TABLE join_programme2curriculums OWNER TO postgres;

--
-- Name: join_unite_enseignement2ecue; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_unite_enseignement2ecue (
    unite_enseignement_ref character varying(20) NOT NULL,
    ecue_ref character varying(20) NOT NULL
);


ALTER TABLE join_unite_enseignement2ecue OWNER TO postgres;

--
-- Name: join_utilisateur2role; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE join_utilisateur2role (
    identifiant character varying(20) NOT NULL,
    groupe character varying(20) NOT NULL
);


ALTER TABLE join_utilisateur2role OWNER TO postgres;

--
-- Name: liste_comptabilite_inscription; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE liste_comptabilite_inscription (
    matricule character varying(20) NOT NULL,
    nom_de_famille character varying(32) NOT NULL,
    prenom character varying(100) NOT NULL,
    nationalite character varying(3) DEFAULT 'N/A'::character varying NOT NULL,
    "anneeAcademique" character varying(4) NOT NULL,
    "anneeEtude" character varying(20) NOT NULL,
    etablissement character varying(8) NOT NULL,
    montant real NOT NULL,
    type_paiement character varying(20) NOT NULL,
    num_transaction character varying(128) NOT NULL
);


ALTER TABLE liste_comptabilite_inscription OWNER TO postgres;

--
-- Name: liste_etudiant2015_2016; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE liste_etudiant2015_2016 (
    matricule character varying(20) NOT NULL,
    nom_de_famille character varying(32) NOT NULL,
    prenom character varying(100) NOT NULL,
    nationalite character varying(3) DEFAULT 'N/A'::character varying NOT NULL,
    date_naissance date,
    commentaire_date_naissance character varying(32),
    lieu_naissance character varying(64) NOT NULL,
    sexe character varying(8),
    telephone character varying(20),
    email character varying(48),
    date_entree date,
    profession_pere character varying(80),
    profession_mere character varying(80)
);


ALTER TABLE liste_etudiant2015_2016 OWNER TO postgres;

--
-- Name: liste_inscription2015_2016; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE liste_inscription2015_2016 (
    matricule character varying(20) NOT NULL,
    "anneeAcademique" character varying(4) NOT NULL,
    etablissement character varying(8) NOT NULL,
    "anneeEtude" character varying(20) NOT NULL,
    statut character varying(32),
    "dateValidation1" date,
    "dateValidation2" date,
    verdict character varying(20) NOT NULL,
    cpi character varying(128) NOT NULL
);


ALTER TABLE liste_inscription2015_2016 OWNER TO postgres;

--
-- Name: liste_inscription_boa; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE liste_inscription_boa (
    matricule character varying(32),
    nom_de_famille character varying(48),
    prenom character varying(128),
    annee_etude character varying(32),
    montant real,
    type_paiement character varying(20),
    intermediaire_de_paiement character varying(32)
);


ALTER TABLE liste_inscription_boa OWNER TO postgres;

--
-- Name: liste_inscription_boa1; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE liste_inscription_boa1 (
    matricule character varying(32),
    nom_de_famille character varying(48),
    prenom character varying(128),
    nationalite character varying(32),
    code character varying(32),
    annee_etude character varying(32),
    annee_academique character varying(4),
    montant real,
    type_paiement character varying(20),
    intermediaire_de_paiement character varying(32)
);


ALTER TABLE liste_inscription_boa1 OWNER TO postgres;

--
-- Name: liste_resultat2014_2015; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE liste_resultat2014_2015 (
    matricule character varying(20) NOT NULL,
    annee_autorisation character varying(4) NOT NULL,
    annee_etude character varying(20) NOT NULL,
    etablissement character varying(8) NOT NULL,
    verdict character varying(20) NOT NULL
);


ALTER TABLE liste_resultat2014_2015 OWNER TO postgres;

--
-- Name: liste_resultat2015_2016; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE liste_resultat2015_2016 (
    matricule character varying(20) NOT NULL,
    annee_autorisation character varying(4) NOT NULL,
    annee_etude character varying(20) NOT NULL,
    etablissement character varying(8) NOT NULL,
    verdict character varying(20) NOT NULL
);


ALTER TABLE liste_resultat2015_2016 OWNER TO postgres;

--
-- Name: mention; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE mention (
    ancien_code character varying(20),
    nouveau_code character varying(20)
);


ALTER TABLE mention OWNER TO postgres;

--
-- Name: ok_annee_academique; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_annee_academique (
    code character varying(4) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    debut date NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    fin date NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_annee_academique OWNER TO postgres;

--
-- Name: ok_annee_etude; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_annee_etude (
    acces_libre boolean DEFAULT false NOT NULL,
    categorie_enseignement character varying(32) NOT NULL,
    code character varying(32) NOT NULL,
    cycle character varying(32) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    debut_inscription date,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    entite_gestionnaire character varying(32) NOT NULL,
    fin_inscription date,
    gratuite_possible boolean DEFAULT false NOT NULL,
    libelle character varying(80) NOT NULL,
    niveau integer NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_annee_etude OWNER TO postgres;

--
-- Name: ok_annee_etude_2_type_bac_interdit; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_annee_etude_2_type_bac_interdit (
    annee_etude character varying(32) NOT NULL,
    type_bac_interdit character varying(32) NOT NULL
);


ALTER TABLE ok_annee_etude_2_type_bac_interdit OWNER TO postgres;

--
-- Name: ok_annee_etude_amont_2_annee_etude_aval; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_annee_etude_amont_2_annee_etude_aval (
    annee_etude_amont character varying(20) NOT NULL,
    annee_etude_aval character varying(20) NOT NULL
);


ALTER TABLE ok_annee_etude_amont_2_annee_etude_aval OWNER TO postgres;

--
-- Name: ok_bac; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_bac (
    annee_bac integer NOT NULL,
    commentaire_date_naissance character varying(32),
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_naissance date,
    discriminant integer NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    id character varying(128) NOT NULL,
    lieu_naissance character varying(64) NOT NULL,
    moyenne double precision NOT NULL,
    nationalite character varying(2) NOT NULL,
    nom_de_famille character varying(32) NOT NULL,
    num_table_bac character varying(20),
    prenom character varying(100) NOT NULL,
    sexe character varying(8) NOT NULL,
    statut character varying(8) DEFAULT 'N/A'::character varying NOT NULL,
    type_bac character varying(8) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_bac OWNER TO postgres;

--
-- Name: ok_classeur; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_classeur (
    code character varying(48) NOT NULL,
    date_creation date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    libelle character varying(80) NOT NULL
);


ALTER TABLE ok_classeur OWNER TO postgres;

--
-- Name: ok_commissaire; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_commissaire (
    date_creation date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) NOT NULL,
    id character varying(128) NOT NULL,
    personne character varying(32) NOT NULL,
    role character varying(32) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_commissaire OWNER TO postgres;

--
-- Name: ok_commission; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_commission (
    code character varying(48) NOT NULL,
    date_creation date DEFAULT now() NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) NOT NULL,
    libelle character varying(80) NOT NULL,
    type character varying(32) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_commission OWNER TO postgres;

--
-- Name: ok_commission_2_commissaire; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_commission_2_commissaire (
    commission character varying(32) NOT NULL,
    commissaire character varying(128) NOT NULL
);


ALTER TABLE ok_commission_2_commissaire OWNER TO postgres;

--
-- Name: ok_comptabilite; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_comptabilite (
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_paiement date NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    id character varying(128) NOT NULL,
    inscription character varying(128) NOT NULL,
    intermediaire_de_paiement character varying(32) NOT NULL,
    montant real NOT NULL,
    nr_transaction character varying(128) NOT NULL,
    type_paiement character varying(32) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_comptabilite OWNER TO postgres;

--
-- Name: ok_ecue; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_ecue (
    code character varying(32) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    credit double precision NOT NULL,
    site_web character varying(80),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_ecue OWNER TO postgres;

--
-- Name: ok_ecue_2_utilisateur; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_ecue_2_utilisateur (
    ecue character varying(32) NOT NULL,
    enseignant character varying(32) NOT NULL
);


ALTER TABLE ok_ecue_2_utilisateur OWNER TO postgres;

--
-- Name: ok_entite_academique; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_entite_academique (
    adresse character varying(80) NOT NULL,
    categorie character varying(32) NOT NULL,
    code character varying(32) NOT NULL,
    condition_reussite_complementaire character varying(8) DEFAULT 'OUI'::character varying NOT NULL,
    date_debut_inscription date,
    date_fin_inscription date,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    email character varying(64) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    fax character varying(20),
    libelle character varying(80) NOT NULL,
    moyenne_ponderee character varying(8) DEFAULT 'NON'::character varying NOT NULL,
    note_minimale_par_ecue double precision DEFAULT 5.0 NOT NULL,
    parent character varying(32),
    seuil_validation_ue double precision DEFAULT 12.0 NOT NULL,
    site_web character varying(128),
    telephone character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_entite_academique OWNER TO postgres;

--
-- Name: ok_etudiant; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_etudiant (
    agent_carte_etudiant character varying(32),
    adresse_postale character varying(80) NOT NULL,
    autoriser_impression_carte boolean DEFAULT false NOT NULL,
    categorie_de_candidat character varying(32) NOT NULL,
    civilite character varying(32) NOT NULL,
    date_carte_etudiant date,
    date_entree date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_naissance date NOT NULL,
    date_validation date,
    departement_geo character varying(32) NOT NULL,
    discriminant_matricule character varying(2) NOT NULL,
    email character varying(48) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    etat character varying(32) NOT NULL,
    etat_civil character varying(32) NOT NULL,
    handicap character varying(32) NOT NULL,
    identifiant character varying(32) NOT NULL,
    lieu_naissance character varying(80) NOT NULL,
    matricule character varying(32) NOT NULL,
    mot_de_passe character varying(256) NOT NULL,
    mot_secret character varying(80) DEFAULT 'none'::character varying,
    nationalite character varying(32) DEFAULT 'N/A'::character varying NOT NULL,
    nombre_enfants integer,
    nom_de_famille character varying(48) NOT NULL,
    nom_prenom_mere character varying(128),
    nom_prenom_pere character varying(128),
    nr_identite character varying(48) NOT NULL,
    nr_secu character varying(48),
    prenom character varying(128) NOT NULL,
    profession_mere character varying(32) NOT NULL,
    profession_pere character varying(32) NOT NULL,
    repondant character varying(48),
    revenus_parents character varying(32) NOT NULL,
    sexe character varying(3) NOT NULL,
    telephone character varying(20),
    commentaire_date_naissance character varying(32) NOT NULL,
    validateur character varying(32),
    version double precision DEFAULT 1 NOT NULL,
    date_expiration_carte_etudiant date
);


ALTER TABLE ok_etudiant OWNER TO postgres;

--
-- Name: ok_exoneration; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_exoneration (
    code_exoneration character varying(32),
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    id character varying(128) NOT NULL,
    montant double precision NOT NULL,
    statut character varying(32) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    cycle character varying(32),
    niveau smallint,
    entite_academique character varying(32)
);


ALTER TABLE ok_exoneration OWNER TO postgres;

--
-- Name: ok_fiche_banque; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_fiche_banque (
    code character varying(32) NOT NULL,
    date_creation date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_paiement date,
    encodeur character varying(32) DEFAULT 'admin'::character varying NOT NULL,
    id character varying(128) NOT NULL,
    inscription character varying(128) NOT NULL,
    montant_du real NOT NULL,
    montant_paye real NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_fiche_banque OWNER TO postgres;

--
-- Name: ok_frais; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_frais (
    cycle character varying(2) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    entite_academique character varying(32) NOT NULL,
    frais_formation double precision NOT NULL,
    frais_inscription double precision NOT NULL,
    id character varying(128) NOT NULL,
    niveau smallint NOT NULL,
    statut character varying(32) NOT NULL,
    zone character varying(32) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    annee_academique_creation integer
);


ALTER TABLE ok_frais OWNER TO postgres;

--
-- Name: ok_inscription; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_inscription (
    annee_academique character varying(4) NOT NULL,
    annee_etude character varying(32) NOT NULL,
    avis_commission character varying(80),
    classeur character varying(48) NOT NULL,
    commission character varying(32),
    contrainte character varying(255),
    date_creation date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_validation1 date,
    date_validation2 date,
    diplome_amont character varying(32),
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    etudiant character varying(32) NOT NULL,
    gratuit boolean DEFAULT false NOT NULL,
    id character varying(128) NOT NULL,
    observation character varying(80),
    penalite_formation double precision DEFAULT 0 NOT NULL,
    penalite_inscription double precision DEFAULT 0 NOT NULL,
    piece_fournie character varying(255),
    programme_au_choix character varying(128),
    remarque character varying(255),
    type_autorisation character varying(32) NOT NULL,
    validateur1 character varying(32),
    validateur2 character varying(32),
    verdict_cumule character varying(32),
    version double precision DEFAULT 1 NOT NULL,
    reference_autorisation character varying(32) NOT NULL,
    annee_bac character varying(4),
    statut character varying(32),
    exoneration double precision DEFAULT '-1'::double precision NOT NULL,
    reference_exoneration character varying(32),
    pedagogique boolean DEFAULT false
);


ALTER TABLE ok_inscription OWNER TO postgres;

--
-- Name: ok_module; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_module (
    code character varying(32) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_module OWNER TO postgres;

--
-- Name: ok_module_2_unite_enseignement; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_module_2_unite_enseignement (
    module character varying(32) NOT NULL,
    unite_enseignement character varying(32) NOT NULL
);


ALTER TABLE ok_module_2_unite_enseignement OWNER TO postgres;

--
-- Name: ok_nomenclature_role; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_nomenclature_role (
    code character varying(64) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_nomenclature_role OWNER TO postgres;

--
-- Name: ok_note; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_note (
    annee_academique character varying(4) NOT NULL,
    commentaire character varying(80),
    date date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    ecue character varying(20) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    etudiant character varying(20) NOT NULL,
    id character varying(128) NOT NULL,
    score real NOT NULL,
    score_max real DEFAULT 20.0 NOT NULL,
    trace character varying(32) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_note OWNER TO postgres;

--
-- Name: ok_pays; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_pays (
    code character varying(3) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    zone character varying(32) NOT NULL
);


ALTER TABLE ok_pays OWNER TO postgres;

--
-- Name: ok_profession; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_profession (
    code character varying(32) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    secteur_activite character varying(32) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_profession OWNER TO postgres;

--
-- Name: ok_programme; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_programme (
    annee_academique_creation integer NOT NULL,
    annee_etude character varying(32) NOT NULL,
    code character varying(32) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_programme OWNER TO postgres;

--
-- Name: ok_programme_2_module; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_programme_2_module (
    programme character varying(32) NOT NULL,
    module character varying(32) NOT NULL
);


ALTER TABLE ok_programme_2_module OWNER TO postgres;

--
-- Name: ok_programme_au_choix; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_programme_au_choix (
    agent_acceptation character varying(32),
    code character varying(32) NOT NULL,
    date_acceptation date,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    entite_gestionnaire character varying(32) NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_programme_au_choix OWNER TO postgres;

--
-- Name: ok_programme_au_choix_2_ecue; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_programme_au_choix_2_ecue (
    programme_au_choix character varying(32) NOT NULL,
    ecue character varying(32) NOT NULL
);


ALTER TABLE ok_programme_au_choix_2_ecue OWNER TO postgres;

--
-- Name: ok_relation_entre_module; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_relation_entre_module (
    amont character varying(32) NOT NULL,
    aval character varying(32) NOT NULL,
    condition character varying(32) NOT NULL,
    condition_complementaire boolean NOT NULL,
    id character varying(128) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_relation_entre_module OWNER TO postgres;

--
-- Name: ok_sanction; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_sanction (
    etudiant character varying(32),
    date_debut date NOT NULL,
    date_fin date,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    id character varying(128) NOT NULL,
    motif character varying(128) NOT NULL,
    niveau_exclusion character varying(16),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_sanction OWNER TO postgres;

--
-- Name: ok_statut; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_statut (
    id character varying(128) NOT NULL,
    date_creation date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_validation date,
    encodeur character varying(32) NOT NULL,
    etudiant character varying(32) NOT NULL,
    entite_academique character varying(32) NOT NULL,
    cycle character varying(2) NOT NULL,
    code_statut character varying(32) NOT NULL,
    validateur character varying(32),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_statut OWNER TO postgres;

--
-- Name: ok_type_autorisation; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_type_autorisation (
    code character varying(32) NOT NULL,
    autorite character varying(32) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(64) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_type_autorisation OWNER TO postgres;

--
-- Name: ok_type_bac; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_type_bac (
    code character varying(8) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(80) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_type_bac OWNER TO postgres;

--
-- Name: ok_unite_enseignement; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_unite_enseignement (
    code character varying(32) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    entite_gestionnaire character varying(32) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_unite_enseignement OWNER TO postgres;

--
-- Name: ok_unite_enseignement_2_ecue; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_unite_enseignement_2_ecue (
    unite_enseignement character varying(32) NOT NULL,
    ecue character varying(32) NOT NULL
);


ALTER TABLE ok_unite_enseignement_2_ecue OWNER TO postgres;

--
-- Name: ok_utilisateur; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_utilisateur (
    civilite character varying(32) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    email character varying(48) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    etat character varying(32) NOT NULL,
    identifiant character varying(32) NOT NULL,
    mot_de_passe character varying(256) NOT NULL,
    nom_de_famille character varying(48) NOT NULL,
    prenom character varying(48) NOT NULL,
    telephone character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_utilisateur OWNER TO postgres;

--
-- Name: ok_utilisateur_2_nomenclature_role; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_utilisateur_2_nomenclature_role (
    utilisateur character varying(32) NOT NULL,
    nomenclature_role character varying(64) NOT NULL
);


ALTER TABLE ok_utilisateur_2_nomenclature_role OWNER TO postgres;

--
-- Name: ok_verdict; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE ok_verdict (
    commentaire character varying(80),
    date date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    decision character varying(32) NOT NULL,
    diplome character varying(32) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    grade character varying(32) NOT NULL,
    id character varying(128) NOT NULL,
    inscription character varying(128) NOT NULL,
    jury character varying(32) NOT NULL,
    moyenne real NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE ok_verdict OWNER TO postgres;

--
-- Name: okapicollege_annee_academique; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_annee_academique (
    code character varying(4) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    debut date NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    fin date NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_annee_academique OWNER TO postgres;

--
-- Name: okapicollege_annee_etude; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_annee_etude (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    niveau integer NOT NULL,
    specialite character varying(20) NOT NULL,
    cycle character varying(2) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    debut_inscription date NOT NULL,
    fin_inscription date NOT NULL,
    ecue_au_choix_autorise smallint NOT NULL,
    unite_enseignement_au_choix_autorise smallint NOT NULL,
    unites smallint,
    type_formation character varying(20) NOT NULL,
    acces_libre boolean
);


ALTER TABLE okapicollege_annee_etude OWNER TO postgres;

--
-- Name: okapicollege_autorisation; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_autorisation (
    annee_autorisation character varying(4) NOT NULL,
    annee_diplome integer NOT NULL,
    annee_etude character varying(20) NOT NULL,
    avis_commission character varying(40),
    diplome_authentifie smallint NOT NULL,
    code_pre_inscription character varying(128) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying,
    id character varying(128) NOT NULL,
    lieu_obtention_diplome character varying(32),
    moyenne_diplome double precision,
    num_commission character varying(15),
    observation character varying(50),
    reference_autorisation character varying(32),
    type_autorisation character varying(16) DEFAULT 'N/A'::character varying,
    valide smallint,
    version double precision DEFAULT 1,
    contraintes character varying(255),
    pieces_fournies character varying(255),
    autorite character varying(20) DEFAULT 'N/A'::character varying,
    date_creation date,
    statut character varying(32)
);


ALTER TABLE okapicollege_autorisation OWNER TO postgres;

--
-- Name: okapicollege_bac; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_bac (
    annee_bac integer NOT NULL,
    commentaire_date_naissance character varying(32),
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_naissance date,
    discriminant integer NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying,
    id character varying(128) NOT NULL,
    lieu_naissance character varying(64),
    matricule character varying(13),
    moyenne double precision,
    nationalite character varying(2),
    nom_de_famille character varying(32),
    num_table_bac character varying(20),
    prenom character varying(100),
    sexe character varying(8),
    statut character varying(8) DEFAULT 'N/A'::character varying,
    type_bac character varying(8),
    version double precision DEFAULT 1,
    code_pre_inscription character varying(128)
);


ALTER TABLE okapicollege_bac OWNER TO postgres;

--
-- Name: okapicollege_bacBis; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE "okapicollege_bacBis" (
    annee_bac integer NOT NULL,
    commentaire_date_naissance character varying(32),
    date_modif timestamp without time zone DEFAULT '-infinity'::timestamp without time zone NOT NULL,
    date_naissance date,
    discriminant integer NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    id character varying(128) NOT NULL,
    lieu_naissance character varying(32) NOT NULL,
    matricule character varying(13),
    moyenne double precision NOT NULL,
    nationalite character varying(2) NOT NULL,
    nom_de_famille character varying(32) NOT NULL,
    num_table_bac character varying(20),
    prenom character varying(100) NOT NULL,
    sexe character varying(8) NOT NULL,
    statut character varying(8) DEFAULT 'N/A'::character varying NOT NULL,
    type_bac character varying(8) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    code_pre_inscription character varying(128)
);


ALTER TABLE "okapicollege_bacBis" OWNER TO postgres;

--
-- Name: okapicollege_classeur; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_classeur (
    code character varying(48) NOT NULL,
    date_creation date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) NOT NULL,
    annee_academique character varying(4) NOT NULL,
    annee_etude character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_classeur OWNER TO postgres;

--
-- Name: okapicollege_code_pre_inscription; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_code_pre_inscription (
    categorie_de_candidat character varying(1) NOT NULL,
    id character varying(128) NOT NULL,
    commentaire_date_naissance character varying(32),
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_naissance date,
    discriminant_matricule character varying(2) NOT NULL,
    email character varying(48) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying,
    lieu_naissance character varying(64),
    nom_de_famille character varying(32),
    prenom character varying(100),
    nationalite character varying(3) DEFAULT 'N/A'::character varying,
    departement_geo character varying(20) DEFAULT 'N/A'::character varying,
    nom_prenom_mere character varying(48),
    nom_prenom_pere character varying(48),
    profession_pere character varying(20),
    profession_mere character varying(20),
    sexe character varying(8),
    valide smallint,
    version double precision DEFAULT 1,
    mot_secret character varying(16) DEFAULT 'none'::character varying,
    date_creation date
);


ALTER TABLE okapicollege_code_pre_inscription OWNER TO postgres;

--
-- Name: okapicollege_comptabilite; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_comptabilite (
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_paiement date NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    inscription_dans_annee_etude character varying(128) NOT NULL,
    type_paiement character varying(20) NOT NULL,
    montant real NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    nr_transaction character varying(128) NOT NULL
);


ALTER TABLE okapicollege_comptabilite OWNER TO postgres;

--
-- Name: okapicollege_cours; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_cours (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    intitule character varying(64) NOT NULL,
    site_web character varying(64),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_cours OWNER TO postgres;

--
-- Name: okapicollege_cours_pondere; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_cours_pondere (
    cours character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    id character varying(128) NOT NULL,
    masse_horaire double precision NOT NULL,
    credits double precision NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_cours_pondere OWNER TO postgres;

--
-- Name: okapicollege_curriculum; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_curriculum (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    minimum_requis double precision NOT NULL,
    entite_gestionnaire character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_curriculum OWNER TO postgres;

--
-- Name: okapicollege_decision_jury; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_decision_jury (
    id character varying(128) NOT NULL,
    inscription_dans_annee_etude character varying(128) NOT NULL,
    verdict character varying(20) NOT NULL,
    grade character varying(20),
    semestre integer NOT NULL,
    moyenne real NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying,
    version double precision DEFAULT 1
);


ALTER TABLE okapicollege_decision_jury OWNER TO postgres;

--
-- Name: okapicollege_departement; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_departement (
    code character varying(8) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    email character varying(48) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying,
    etablissement character varying(8),
    fax character varying(20),
    libelle character varying(80),
    localisation character varying(80),
    site_web character varying(64),
    telephone character varying(20),
    version double precision DEFAULT 1
);


ALTER TABLE okapicollege_departement OWNER TO postgres;

--
-- Name: okapicollege_diplome; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_diplome (
    date_emission date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    emis_par character varying(32) NOT NULL,
    etudiant character varying(20) NOT NULL,
    grade character varying(32) NOT NULL,
    id character varying(128) NOT NULL,
    lieu_emission character varying(32),
    nomenclature character varying(20) NOT NULL,
    note double precision,
    nr_serie character varying(32),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_diplome OWNER TO postgres;

--
-- Name: okapicollege_document; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_document (
    date_emission date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    emis_par character varying(32) NOT NULL,
    etudiant character varying(20) NOT NULL,
    id character varying(128) NOT NULL,
    libelle character varying(80) NOT NULL,
    lieu_emission character varying(32) NOT NULL,
    nomenclature character varying(20) NOT NULL,
    nr_serie character varying(32),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_document OWNER TO postgres;

--
-- Name: okapicollege_ecue; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_ecue (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    intitule character varying(64) NOT NULL,
    minimum_requis double precision NOT NULL,
    credit double precision NOT NULL,
    site_web character varying(64),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_ecue OWNER TO postgres;

--
-- Name: okapicollege_ecue_au_choix; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_ecue_au_choix (
    id character varying(128) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    inscription_dans_annee_etude character varying(128) NOT NULL,
    ecue character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_ecue_au_choix OWNER TO postgres;

--
-- Name: okapicollege_etablissement; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_etablissement (
    code character varying(8) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    email character varying(48) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying,
    fax character varying(20),
    libelle character varying(80),
    localisation character varying(80),
    site_web character varying(64),
    telephone character varying(20),
    version double precision DEFAULT 1
);


ALTER TABLE okapicollege_etablissement OWNER TO postgres;

--
-- Name: okapicollege_etudiant; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_etudiant (
    code_pre_inscription character varying(128) NOT NULL,
    date_entree date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    email character varying(48),
    email_secondaire character varying(48),
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying,
    etat character varying(16),
    etat_civil character varying(16),
    fax character varying(20),
    identifiant character varying(32),
    handicape smallint,
    localisation character varying(80),
    localisation_secondaire character varying(80),
    matricule character varying(20) NOT NULL,
    mot_de_passe character varying(64),
    nombre_enfants integer,
    nr_identite character varying(30),
    nr_secu character varying(20),
    repondant character varying(32),
    site_web character varying(48),
    telephone character varying(20),
    version double precision DEFAULT 1,
    autoriser_impression_carte smallint,
    date_carte_etudiant date,
    agent_carte_etudiant character varying(32)
);


ALTER TABLE okapicollege_etudiant OWNER TO postgres;

--
-- Name: okapicollege_exoneration; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_exoneration (
    id character varying(128) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    inscription_dans_annee_etude character varying(128) NOT NULL,
    statut character varying(20) NOT NULL,
    montant double precision NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_exoneration OWNER TO postgres;

--
-- Name: okapicollege_fiche_banque; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_fiche_banque (
    id character varying(128) NOT NULL,
    inscription_dans_annee_etude character varying(128) NOT NULL,
    montant_du double precision NOT NULL,
    montant_paye double precision NOT NULL,
    date_creation date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_paiement date,
    encodeur character varying(32) DEFAULT 'admin'::character varying NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_fiche_banque OWNER TO postgres;

--
-- Name: okapicollege_generateur_sequence_cpi; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_generateur_sequence_cpi (
    id character(1) NOT NULL,
    seq double precision NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_generateur_sequence_cpi OWNER TO postgres;

--
-- Name: okapicollege_generateur_sequence_matricule; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_generateur_sequence_matricule (
    id character varying(2) NOT NULL,
    seq double precision NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_generateur_sequence_matricule OWNER TO postgres;

--
-- Name: okapicollege_generateur_sequence_uid; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_generateur_sequence_uid (
    id character(1) NOT NULL,
    seq integer NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_generateur_sequence_uid OWNER TO postgres;

--
-- Name: okapicollege_horaire; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_horaire (
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    debut timestamp without time zone NOT NULL,
    fin timestamp without time zone NOT NULL,
    encodeur character varying(32) NOT NULL,
    id character varying(128) NOT NULL,
    ecue character varying(20) NOT NULL,
    salle character varying(16) NOT NULL,
    version double precision NOT NULL
);


ALTER TABLE okapicollege_horaire OWNER TO postgres;

--
-- Name: okapicollege_inscription_au_cours_pondere; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_inscription_au_cours_pondere (
    annee_academique character varying(4) NOT NULL,
    cours_pondere character varying(128) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    etudiant character varying(20) NOT NULL,
    id character varying(128) NOT NULL,
    trace character varying(10) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_inscription_au_cours_pondere OWNER TO postgres;

--
-- Name: okapicollege_inscription_dans_annee_etude; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_inscription_dans_annee_etude (
    autorisation character varying(128) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_validation date,
    date_validation_finale date,
    agent_validation character varying(32),
    date_carte_etudiant date,
    agent_carte_etudiant character varying(32),
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying,
    id character varying(128) NOT NULL,
    rdv character varying(128),
    remarque character varying(255),
    version double precision DEFAULT 1,
    autoriser_impression_carte smallint DEFAULT 1,
    date_creation date,
    classeur character varying(48),
    penalite_formation double precision,
    penalite_inscription double precision,
    date_verdict date,
    encodeur_verdict character varying(20),
    verdict character varying(20),
    autoriser_gratuite integer DEFAULT '-1'::integer,
    agent_validation_finale character varying(32),
    x boolean
);


ALTER TABLE okapicollege_inscription_dans_annee_etude OWNER TO postgres;

--
-- Name: okapicollege_mention; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_mention (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    departement character varying(8) NOT NULL,
    email character varying(48) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    fax character varying(20),
    libelle character varying(80) NOT NULL,
    localisation character varying(80),
    site_web character varying(64),
    telephone character varying(20),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_mention OWNER TO postgres;

--
-- Name: okapicollege_montant_inscription; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_montant_inscription (
    annee_etude character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    frais_formation double precision NOT NULL,
    frais_inscription double precision NOT NULL,
    id character varying(128) NOT NULL,
    statut character varying(16) NOT NULL,
    zone_de_pays character varying(32) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_montant_inscription OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_autorite; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_autorite (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_autorite OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_categorie_enseignement; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_categorie_enseignement (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_categorie_enseignement OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_categorie_etudiant; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_categorie_etudiant (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_categorie_etudiant OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_cycle; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_cycle (
    code character varying(2) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_cycle OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_departement_geo; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_departement_geo (
    code character varying(10) NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying
);


ALTER TABLE okapicollege_nomenclature_departement_geo OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_diplome; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_diplome (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_diplome OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_document; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_document (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_document OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_domaine; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_domaine (
    code character varying(20) NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL
);


ALTER TABLE okapicollege_nomenclature_domaine OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_etat; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_etat (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'admin'::character varying NOT NULL,
    libelle character varying(48) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_etat OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_grade; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_grade (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_grade OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_img_format; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_img_format (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'admin'::character varying NOT NULL,
    libelle character varying(48) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_img_format OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_module_cours; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_module_cours (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_module_cours OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_module_privilege; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_module_privilege (
    code character varying(48) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'admin'::character varying NOT NULL,
    libelle character varying(64),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_module_privilege OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_organisme; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_organisme (
    code character varying(8) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_organisme OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_ressource; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_ressource (
    code character varying(48) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'admin'::character varying NOT NULL,
    libelle character varying(64),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_ressource OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_role; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_role (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_role OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_secteur_activite; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_secteur_activite (
    code character varying(20) NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL
);


ALTER TABLE okapicollege_nomenclature_secteur_activite OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_statut; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_statut (
    code character varying(32) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_statut OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_type_bac; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_type_bac (
    code character varying(8) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(80) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_type_bac OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_type_formation; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_type_formation (
    code character varying(20) NOT NULL,
    libelle character varying(80) NOT NULL,
    encodeur character varying(32) DEFAULT 'admin'::character varying NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_type_formation OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_verdict; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_verdict (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_verdict OWNER TO postgres;

--
-- Name: okapicollege_nomenclature_zone; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_nomenclature_zone (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_nomenclature_zone OWNER TO postgres;

--
-- Name: okapicollege_note; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_note (
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    date_valeur date NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    id character varying(128) NOT NULL,
    trace character varying(1) NOT NULL,
    annee_academique character varying(4) NOT NULL,
    ecue character varying(20) NOT NULL,
    etudiant character varying(20) NOT NULL,
    scoremax double precision NOT NULL,
    score double precision NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_note OWNER TO postgres;

--
-- Name: okapicollege_pays; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_pays (
    code character varying(3) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    zone character varying(32) NOT NULL
);


ALTER TABLE okapicollege_pays OWNER TO postgres;

--
-- Name: okapicollege_profession; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_profession (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    secteur_activite character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_profession OWNER TO postgres;

--
-- Name: okapicollege_programme; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_programme (
    code character varying(128) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    semestre smallint NOT NULL,
    annee_academique character varying(4) NOT NULL,
    curriculum character varying(20) NOT NULL,
    annee_etude character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_programme OWNER TO postgres;

--
-- Name: okapicollege_propriete_application; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_propriete_application (
    code character(1) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'admin'::character varying NOT NULL,
    anac character(4) NOT NULL,
    anac_staff character(4),
    fichier_avatar character varying(80) NOT NULL,
    repertoire_logo character varying(80),
    repertoire_photo_migration character varying(80) NOT NULL,
    img_repertoire character varying(80) NOT NULL,
    img_nombre_max_octets integer NOT NULL,
    nationalite_par_defaut character varying(3),
    titre_signature_carte character varying(48) NOT NULL,
    fichier_signature_carte character varying(80) NOT NULL,
    nom_autorite_carte character varying(48) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    duree_validite_carte smallint,
    ldap_base_dn character varying(80) NOT NULL,
    ldap_bind_dn character varying(80) NOT NULL,
    ldap_bind_password character varying(80) NOT NULL,
    ldap_gid_number_etudiant text NOT NULL,
    ldap_homedirectory_basename character varying(80) NOT NULL,
    ldap_login_shell character varying(80) NOT NULL,
    ldap_port integer NOT NULL,
    ldap_server character varying(80) NOT NULL,
    ldap_use_ssl smallint NOT NULL,
    sequence_location character varying(3) NOT NULL,
    db_url_audit character varying(80),
    db_url_okapi character varying(80)
);


ALTER TABLE okapicollege_propriete_application OWNER TO postgres;

--
-- Name: okapicollege_rdv; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_rdv (
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    debut_heure time without time zone NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    fin_heure time without time zone NOT NULL,
    id character varying(128) NOT NULL,
    jour_du_mois date NOT NULL,
    salle character varying(16) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_rdv OWNER TO postgres;

--
-- Name: okapicollege_ressource_salle; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_ressource_salle (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) NOT NULL,
    remarque character varying(48),
    quantite smallint NOT NULL,
    ressource character varying(20) NOT NULL,
    salle character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_ressource_salle OWNER TO postgres;

--
-- Name: okapicollege_salle; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_salle (
    code character varying(16) NOT NULL,
    capacite integer NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    equipement character varying(64),
    localisation character varying(64) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    etablissement character varying(20)
);


ALTER TABLE okapicollege_salle OWNER TO postgres;

--
-- Name: okapicollege_sanction; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_sanction (
    id character varying(128) NOT NULL,
    date_debut date NOT NULL,
    date_fin date,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    niveau_exclusion character varying(16),
    motif character varying(128) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    etudiant character varying(20)
);


ALTER TABLE okapicollege_sanction OWNER TO postgres;

--
-- Name: okapicollege_souscription_module_cours; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_souscription_module_cours (
    id character varying(128) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    annee_etude character varying(20) NOT NULL,
    module_cours character varying(20) NOT NULL,
    niveau_contrainte character varying(11) NOT NULL,
    semestre integer NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_souscription_module_cours OWNER TO postgres;

--
-- Name: okapicollege_specialite; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_specialite (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    email character varying(48) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    fax character varying(20),
    libelle character varying(80) NOT NULL,
    localisation character varying(80),
    mention character varying(20) NOT NULL,
    site_web character varying(64),
    telephone character varying(20),
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_specialite OWNER TO postgres;

--
-- Name: okapicollege_statut; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_statut (
    id character varying(128) NOT NULL,
    date_creation date NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32),
    valide smallint,
    cpi character varying(128),
    specialite character varying(20),
    nomenclature_cycle character varying(2),
    nomenclature_statut character varying(20),
    version double precision DEFAULT 1
);


ALTER TABLE okapicollege_statut OWNER TO postgres;

--
-- Name: okapicollege_type_autorisation; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_type_autorisation (
    code character varying(20) NOT NULL,
    autorite character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(64) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_type_autorisation OWNER TO postgres;

--
-- Name: okapicollege_uid_number; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_uid_number (
    uid_number integer NOT NULL
);


ALTER TABLE okapicollege_uid_number OWNER TO postgres;

--
-- Name: okapicollege_unite_enseignement; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_unite_enseignement (
    code character varying(20) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    libelle character varying(80) NOT NULL,
    minimum_requis double precision NOT NULL,
    entite_gestionnaire character varying(20) NOT NULL,
    categorie_enseignement character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL,
    moyenne_ponderee smallint NOT NULL
);


ALTER TABLE okapicollege_unite_enseignement OWNER TO postgres;

--
-- Name: okapicollege_unite_enseignement_au_choix; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_unite_enseignement_au_choix (
    id character varying(128) NOT NULL,
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    inscription_dans_annee_etude character varying(128) NOT NULL,
    unite_enseignement character varying(20) NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE okapicollege_unite_enseignement_au_choix OWNER TO postgres;

--
-- Name: okapicollege_utilisateur; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE okapicollege_utilisateur (
    date_modif timestamp without time zone DEFAULT now() NOT NULL,
    email character varying(48) NOT NULL,
    encodeur character varying(32) DEFAULT 'Inconnu'::character varying NOT NULL,
    etat character varying(16) NOT NULL,
    identifiant character varying(20) NOT NULL,
    mot_de_passe character varying(64) NOT NULL,
    nom_de_famille character varying(32) NOT NULL,
    prenom character varying(32) NOT NULL,
    telephone character varying(20),
    version double precision DEFAULT 1
);


ALTER TABLE okapicollege_utilisateur OWNER TO postgres;

--
-- Name: point_financier_par_etablissement; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE point_financier_par_etablissement (
    etablissment character varying(8) NOT NULL,
    annee character varying(4) NOT NULL,
    total double precision
);


ALTER TABLE point_financier_par_etablissement OWNER TO postgres;

--
-- Name: rh_generateur_sequence_cpi; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE rh_generateur_sequence_cpi (
    id character(1) NOT NULL,
    nr double precision NOT NULL,
    version double precision DEFAULT 1 NOT NULL
);


ALTER TABLE rh_generateur_sequence_cpi OWNER TO postgres;

--
-- Name: specialite; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE specialite (
    ancien_code character varying(20),
    nouveau_code character varying(20)
);


ALTER TABLE specialite OWNER TO postgres;

--
-- Name: verdict_temp; Type: TABLE; Schema: okapicollege; Owner: postgres
--

CREATE TABLE verdict_temp (
    commentaire character varying(80),
    date date,
    date_modif timestamp without time zone,
    decision character varying(32),
    diplome character varying(32),
    encodeur character varying(32),
    grade character varying(32),
    id character varying(128),
    inscription character varying(128),
    jury character varying(32),
    moyenne real,
    version double precision
);


ALTER TABLE verdict_temp OWNER TO postgres;

--
-- Name: classeur_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_classeur
    ADD CONSTRAINT classeur_pkey PRIMARY KEY (code);


--
-- Name: commission_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_commission
    ADD CONSTRAINT commission_pkey PRIMARY KEY (code);


--
-- Name: comptabilite_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_comptabilite
    ADD CONSTRAINT comptabilite_pkey PRIMARY KEY (id);


--
-- Name: ecue_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_ecue
    ADD CONSTRAINT ecue_pkey PRIMARY KEY (code);


--
-- Name: etudiant_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_etudiant
    ADD CONSTRAINT etudiant_pkey PRIMARY KEY (matricule);


--
-- Name: exoneration_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_exoneration
    ADD CONSTRAINT exoneration_pkey PRIMARY KEY (id);


--
-- Name: frais_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_frais
    ADD CONSTRAINT frais_pkey PRIMARY KEY (id);


--
-- Name: inscription_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_inscription
    ADD CONSTRAINT inscription_pkey PRIMARY KEY (id);


--
-- Name: join_annee_etude2annee_etude_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_annee_etude2annee_etude
    ADD CONSTRAINT join_annee_etude2annee_etude_pkey PRIMARY KEY (annee_etude, annee_suivante);


--
-- Name: join_annee_etude2type_bac_interdit_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_annee_etude2type_bac_interdit
    ADD CONSTRAINT join_annee_etude2type_bac_interdit_pkey PRIMARY KEY (annee_etude_ref, type_bac_ref);


--
-- Name: join_annee_etude_2curriculum_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_annee_etude_2curriculum
    ADD CONSTRAINT join_annee_etude_2curriculum_pkey PRIMARY KEY (annee_etude, curriculum);


--
-- Name: join_autorisation2organisme_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_autorisation2organisme
    ADD CONSTRAINT join_autorisation2organisme_pkey PRIMARY KEY (autorisation_ref, organisme_ref);


--
-- Name: join_code_pre_inscription2type_bac_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_code_pre_inscription2type_bac
    ADD CONSTRAINT join_code_pre_inscription2type_bac_pkey PRIMARY KEY (code_pre_inscription_ref, type_bac_ref);


--
-- Name: join_cours_pondere2module_cours_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_cours_pondere2module_cours
    ADD CONSTRAINT join_cours_pondere2module_cours_pkey PRIMARY KEY (cours_pondere_ref, module_cours_ref);


--
-- Name: join_curriculum2unite_enseignement_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_curriculum2unite_enseignement
    ADD CONSTRAINT join_curriculum2unite_enseignement_pkey PRIMARY KEY (curriculum_ref, unite_enseignement_ref);


--
-- Name: join_ecue2gestionnaire_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_ecue2gestionnaire
    ADD CONSTRAINT join_ecue2gestionnaire_pkey PRIMARY KEY (ecue_ref, identifiant_ref);


--
-- Name: join_enseignant2ecue_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_enseignant2ecue
    ADD CONSTRAINT join_enseignant2ecue_pkey PRIMARY KEY (enseignant, ecue);


--
-- Name: join_etablissement2domaine_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_etablissement2domaine
    ADD CONSTRAINT join_etablissement2domaine_pkey PRIMARY KEY (etablissement_ref, domaine_ref);


--
-- Name: join_inscription_dans_annee_etude2cours_pondere_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_inscription_dans_annee_etude2cours_pondere
    ADD CONSTRAINT join_inscription_dans_annee_etude2cours_pondere_pkey PRIMARY KEY (inscription_dans_annee_etude_ref, cours_pondere_ref);


--
-- Name: join_mention2domaine_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_mention2domaine
    ADD CONSTRAINT join_mention2domaine_pkey PRIMARY KEY (mention_ref, domaine_ref);


--
-- Name: join_module2role_ecriture_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_module2role_ecriture
    ADD CONSTRAINT join_module2role_ecriture_pkey PRIMARY KEY (module_ecriture, role_ecriture);


--
-- Name: join_module2role_lecture_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_module2role_lecture
    ADD CONSTRAINT join_module2role_lecture_pkey PRIMARY KEY (module_lecture, role_lecture);


--
-- Name: join_programme2curriculums_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_programme2curriculums
    ADD CONSTRAINT join_programme2curriculums_pkey PRIMARY KEY (programme, curriculum);


--
-- Name: join_unite_enseignement2ecue_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_unite_enseignement2ecue
    ADD CONSTRAINT join_unite_enseignement2ecue_pkey PRIMARY KEY (unite_enseignement_ref, ecue_ref);


--
-- Name: join_utilisateur2role_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_utilisateur2role
    ADD CONSTRAINT join_utilisateur2role_pkey PRIMARY KEY (identifiant, groupe);


--
-- Name: module_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_module
    ADD CONSTRAINT module_pkey PRIMARY KEY (code);


--
-- Name: nomenclature_role_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_nomenclature_role
    ADD CONSTRAINT nomenclature_role_pkey PRIMARY KEY (code);


--
-- Name: note_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: ok_annee_academique_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_annee_academique
    ADD CONSTRAINT ok_annee_academique_pkey PRIMARY KEY (code);


--
-- Name: ok_annee_etude_2_type_bac_interdit_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_annee_etude_2_type_bac_interdit
    ADD CONSTRAINT ok_annee_etude_2_type_bac_interdit_pkey PRIMARY KEY (annee_etude, type_bac_interdit);


--
-- Name: ok_annee_etude_amont_2_annee_etude_aval_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_annee_etude_amont_2_annee_etude_aval
    ADD CONSTRAINT ok_annee_etude_amont_2_annee_etude_aval_pkey PRIMARY KEY (annee_etude_amont, annee_etude_aval);


--
-- Name: ok_annee_etude_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_annee_etude
    ADD CONSTRAINT ok_annee_etude_pkey PRIMARY KEY (code);


--
-- Name: ok_bac_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_bac
    ADD CONSTRAINT ok_bac_pkey PRIMARY KEY (id);


--
-- Name: ok_commissaire_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_commissaire
    ADD CONSTRAINT ok_commissaire_pkey PRIMARY KEY (id);


--
-- Name: ok_commission_2_commissaire_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_commission_2_commissaire
    ADD CONSTRAINT ok_commission_2_commissaire_pkey PRIMARY KEY (commission, commissaire);


--
-- Name: ok_ecue_2_utilisateur_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_ecue_2_utilisateur
    ADD CONSTRAINT ok_ecue_2_utilisateur_pkey PRIMARY KEY (ecue, enseignant);


--
-- Name: ok_entite_academique_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_entite_academique
    ADD CONSTRAINT ok_entite_academique_pkey PRIMARY KEY (code);


--
-- Name: ok_fiche_banque_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_fiche_banque
    ADD CONSTRAINT ok_fiche_banque_pkey PRIMARY KEY (id);


--
-- Name: ok_module_2_unite_enseignement_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_module_2_unite_enseignement
    ADD CONSTRAINT ok_module_2_unite_enseignement_pkey PRIMARY KEY (module, unite_enseignement);


--
-- Name: ok_programme_2_module_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme_2_module
    ADD CONSTRAINT ok_programme_2_module_pkey PRIMARY KEY (programme, module);


--
-- Name: ok_programme_au_choix_2_ecue_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme_au_choix_2_ecue
    ADD CONSTRAINT ok_programme_au_choix_2_ecue_pkey PRIMARY KEY (programme_au_choix, ecue);


--
-- Name: ok_programme_au_choix_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme_au_choix
    ADD CONSTRAINT ok_programme_au_choix_pkey PRIMARY KEY (code);


--
-- Name: ok_programme_pk; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme
    ADD CONSTRAINT ok_programme_pk PRIMARY KEY (code);


--
-- Name: ok_sanction_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_sanction
    ADD CONSTRAINT ok_sanction_pkey PRIMARY KEY (id);


--
-- Name: ok_statut_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_statut
    ADD CONSTRAINT ok_statut_pkey PRIMARY KEY (id);


--
-- Name: ok_unite_enseignement_2_ecue_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_unite_enseignement_2_ecue
    ADD CONSTRAINT ok_unite_enseignement_2_ecue_pkey PRIMARY KEY (unite_enseignement, ecue);


--
-- Name: ok_unite_enseignement_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_unite_enseignement
    ADD CONSTRAINT ok_unite_enseignement_pkey PRIMARY KEY (code);


--
-- Name: ok_utilisateur_2_nomenclature_role_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_utilisateur_2_nomenclature_role
    ADD CONSTRAINT ok_utilisateur_2_nomenclature_role_pkey PRIMARY KEY (utilisateur, nomenclature_role);


--
-- Name: okapicollege_annee_academique_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_annee_academique
    ADD CONSTRAINT okapicollege_annee_academique_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_annee_etude_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_annee_etude
    ADD CONSTRAINT okapicollege_annee_etude_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_autorisation_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_autorisation
    ADD CONSTRAINT okapicollege_autorisation_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_bac_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_bac
    ADD CONSTRAINT okapicollege_bac_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_classeur_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_classeur
    ADD CONSTRAINT okapicollege_classeur_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_code_pre_inscription_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_code_pre_inscription
    ADD CONSTRAINT okapicollege_code_pre_inscription_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_comptabilite_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_comptabilite
    ADD CONSTRAINT okapicollege_comptabilite_pkey PRIMARY KEY (nr_transaction);


--
-- Name: okapicollege_cours_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_cours
    ADD CONSTRAINT okapicollege_cours_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_cours_pondere_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_cours_pondere
    ADD CONSTRAINT okapicollege_cours_pondere_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_curriculum_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_curriculum
    ADD CONSTRAINT okapicollege_curriculum_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_decision_jury_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_decision_jury
    ADD CONSTRAINT okapicollege_decision_jury_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_departement_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_departement
    ADD CONSTRAINT okapicollege_departement_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_diplome_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_diplome
    ADD CONSTRAINT okapicollege_diplome_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_document_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_document
    ADD CONSTRAINT okapicollege_document_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_ecue_au_choix_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_ecue_au_choix
    ADD CONSTRAINT okapicollege_ecue_au_choix_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_ecue_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_ecue
    ADD CONSTRAINT okapicollege_ecue_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_etablissement_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_etablissement
    ADD CONSTRAINT okapicollege_etablissement_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_etudiant_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_etudiant
    ADD CONSTRAINT okapicollege_etudiant_pkey PRIMARY KEY (matricule);


--
-- Name: okapicollege_exoneration_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_exoneration
    ADD CONSTRAINT okapicollege_exoneration_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_fiche_banque_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_fiche_banque
    ADD CONSTRAINT okapicollege_fiche_banque_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_generateur_sequence_cpi_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_generateur_sequence_cpi
    ADD CONSTRAINT okapicollege_generateur_sequence_cpi_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_generateur_sequence_matricule_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_generateur_sequence_matricule
    ADD CONSTRAINT okapicollege_generateur_sequence_matricule_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_generateur_sequence_uid_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_generateur_sequence_uid
    ADD CONSTRAINT okapicollege_generateur_sequence_uid_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_horaire_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_horaire
    ADD CONSTRAINT okapicollege_horaire_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_inscription_au_cours_pondere_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_inscription_au_cours_pondere
    ADD CONSTRAINT okapicollege_inscription_au_cours_pondere_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_inscription_dans_annee_etude_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_inscription_dans_annee_etude
    ADD CONSTRAINT okapicollege_inscription_dans_annee_etude_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_mention_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_mention
    ADD CONSTRAINT okapicollege_mention_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_montant_inscription_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_montant_inscription
    ADD CONSTRAINT okapicollege_montant_inscription_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_nomenclature_autorite_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_autorite
    ADD CONSTRAINT okapicollege_nomenclature_autorite_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_categorie_enseignement_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_categorie_enseignement
    ADD CONSTRAINT okapicollege_nomenclature_categorie_enseignement_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_categorie_etudiant_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_categorie_etudiant
    ADD CONSTRAINT okapicollege_nomenclature_categorie_etudiant_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_cycle_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_cycle
    ADD CONSTRAINT okapicollege_nomenclature_cycle_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_departement_geo_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_departement_geo
    ADD CONSTRAINT okapicollege_nomenclature_departement_geo_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_diplome_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_diplome
    ADD CONSTRAINT okapicollege_nomenclature_diplome_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_document_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_document
    ADD CONSTRAINT okapicollege_nomenclature_document_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_domaine_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_domaine
    ADD CONSTRAINT okapicollege_nomenclature_domaine_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_etat_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_etat
    ADD CONSTRAINT okapicollege_nomenclature_etat_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_grade_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_grade
    ADD CONSTRAINT okapicollege_nomenclature_grade_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_img_format_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_img_format
    ADD CONSTRAINT okapicollege_nomenclature_img_format_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_module_cours_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_module_cours
    ADD CONSTRAINT okapicollege_nomenclature_module_cours_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_module_privilege_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_module_privilege
    ADD CONSTRAINT okapicollege_nomenclature_module_privilege_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_organisme_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_organisme
    ADD CONSTRAINT okapicollege_nomenclature_organisme_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_ressource_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_ressource
    ADD CONSTRAINT okapicollege_nomenclature_ressource_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_role_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_role
    ADD CONSTRAINT okapicollege_nomenclature_role_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_secteur_activite_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_secteur_activite
    ADD CONSTRAINT okapicollege_nomenclature_secteur_activite_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_statut_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_statut
    ADD CONSTRAINT okapicollege_nomenclature_statut_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_type_bac_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_type_bac
    ADD CONSTRAINT okapicollege_nomenclature_type_bac_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_type_formation_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_type_formation
    ADD CONSTRAINT okapicollege_nomenclature_type_formation_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_verdict_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_verdict
    ADD CONSTRAINT okapicollege_nomenclature_verdict_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_nomenclature_zone_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_nomenclature_zone
    ADD CONSTRAINT okapicollege_nomenclature_zone_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_note_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_note
    ADD CONSTRAINT okapicollege_note_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_pays_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_pays
    ADD CONSTRAINT okapicollege_pays_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_profession_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_profession
    ADD CONSTRAINT okapicollege_profession_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_programme_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_programme
    ADD CONSTRAINT okapicollege_programme_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_propriete_application_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_propriete_application
    ADD CONSTRAINT okapicollege_propriete_application_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_rdv_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_rdv
    ADD CONSTRAINT okapicollege_rdv_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_ressource_salle_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_ressource_salle
    ADD CONSTRAINT okapicollege_ressource_salle_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_salle_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_salle
    ADD CONSTRAINT okapicollege_salle_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_sanction_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_sanction
    ADD CONSTRAINT okapicollege_sanction_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_souscription_module_cours_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_souscription_module_cours
    ADD CONSTRAINT okapicollege_souscription_module_cours_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_specialite_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_specialite
    ADD CONSTRAINT okapicollege_specialite_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_statut_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_statut
    ADD CONSTRAINT okapicollege_statut_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_type_autorisation_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_type_autorisation
    ADD CONSTRAINT okapicollege_type_autorisation_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_uid_number_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_uid_number
    ADD CONSTRAINT okapicollege_uid_number_pkey PRIMARY KEY (uid_number);


--
-- Name: okapicollege_unite_enseignement_au_choix_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_unite_enseignement_au_choix
    ADD CONSTRAINT okapicollege_unite_enseignement_au_choix_pkey PRIMARY KEY (id);


--
-- Name: okapicollege_unite_enseignement_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_unite_enseignement
    ADD CONSTRAINT okapicollege_unite_enseignement_pkey PRIMARY KEY (code);


--
-- Name: okapicollege_utilisateur_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_utilisateur
    ADD CONSTRAINT okapicollege_utilisateur_pkey PRIMARY KEY (identifiant);


--
-- Name: pays_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (code);


--
-- Name: profession_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_profession
    ADD CONSTRAINT profession_pkey PRIMARY KEY (code);


--
-- Name: relation_entre_module_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_relation_entre_module
    ADD CONSTRAINT relation_entre_module_pkey PRIMARY KEY (id);


--
-- Name: rh_generateur_sequence_cpi_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY rh_generateur_sequence_cpi
    ADD CONSTRAINT rh_generateur_sequence_cpi_pkey PRIMARY KEY (id);


--
-- Name: type_autorisation_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_type_autorisation
    ADD CONSTRAINT type_autorisation_pkey PRIMARY KEY (code);


--
-- Name: type_bac_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_type_bac
    ADD CONSTRAINT type_bac_pkey PRIMARY KEY (code);


--
-- Name: utilisateur_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (identifiant);


--
-- Name: verdict_pkey; Type: CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_verdict
    ADD CONSTRAINT verdict_pkey PRIMARY KEY (id);


--
-- Name: comptabilite_intermediaire_de_paiement_nr_transaction_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX comptabilite_intermediaire_de_paiement_nr_transaction_idx ON ok_comptabilite USING btree (intermediaire_de_paiement, nr_transaction);


--
-- Name: entite_academique_cycle_niveau_statut_zone_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX entite_academique_cycle_niveau_statut_zone_idx ON ok_frais USING btree (entite_academique, cycle, niveau, statut, zone, annee_academique_creation);


--
-- Name: inscription_annee_academique_etudiant_annee_etude_id; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX inscription_annee_academique_etudiant_annee_etude_id ON ok_inscription USING btree (annee_academique, etudiant, annee_etude);


--
-- Name: inscription_annee_academique_etudiant_programme_au_choix_id; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX inscription_annee_academique_etudiant_programme_au_choix_id ON ok_inscription USING btree (annee_academique, etudiant, programme_au_choix);


--
-- Name: okapicollege_join_annee_etude2annee_etude_annee_etude1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_annee_etude2annee_etude_annee_etude1_idx ON join_annee_etude2annee_etude USING btree (annee_etude);


--
-- Name: okapicollege_join_annee_etude2annee_etude_annee_suivante2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_annee_etude2annee_etude_annee_suivante2_idx ON join_annee_etude2annee_etude USING btree (annee_suivante);


--
-- Name: okapicollege_join_annee_etude2type_bac_interdit_annee_etude_ref; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_annee_etude2type_bac_interdit_annee_etude_ref ON join_annee_etude2type_bac_interdit USING btree (annee_etude_ref);


--
-- Name: okapicollege_join_annee_etude2type_bac_interdit_type_bac_ref2_i; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_annee_etude2type_bac_interdit_type_bac_ref2_i ON join_annee_etude2type_bac_interdit USING btree (type_bac_ref);


--
-- Name: okapicollege_join_annee_etude_2curriculum_annee_etude1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_annee_etude_2curriculum_annee_etude1_idx ON join_annee_etude_2curriculum USING btree (annee_etude);


--
-- Name: okapicollege_join_annee_etude_2curriculum_curriculum2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_annee_etude_2curriculum_curriculum2_idx ON join_annee_etude_2curriculum USING btree (curriculum);


--
-- Name: okapicollege_join_autorisation2organisme_autorisation_ref1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_autorisation2organisme_autorisation_ref1_idx ON join_autorisation2organisme USING btree (autorisation_ref);


--
-- Name: okapicollege_join_autorisation2organisme_organisme_ref2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_autorisation2organisme_organisme_ref2_idx ON join_autorisation2organisme USING btree (organisme_ref);


--
-- Name: okapicollege_join_code_pre_inscription2type_bac_code_pre_inscri; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_code_pre_inscription2type_bac_code_pre_inscri ON join_code_pre_inscription2type_bac USING btree (code_pre_inscription_ref);


--
-- Name: okapicollege_join_code_pre_inscription2type_bac_type_bac_ref2_i; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_code_pre_inscription2type_bac_type_bac_ref2_i ON join_code_pre_inscription2type_bac USING btree (type_bac_ref);


--
-- Name: okapicollege_join_cours_pondere2module_cours_cours_pondere_ref1; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_cours_pondere2module_cours_cours_pondere_ref1 ON join_cours_pondere2module_cours USING btree (cours_pondere_ref);


--
-- Name: okapicollege_join_cours_pondere2module_cours_module_cours_ref2_; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_cours_pondere2module_cours_module_cours_ref2_ ON join_cours_pondere2module_cours USING btree (module_cours_ref);


--
-- Name: okapicollege_join_curriculum2unite_enseignement_curriculum_ref1; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_curriculum2unite_enseignement_curriculum_ref1 ON join_curriculum2unite_enseignement USING btree (curriculum_ref);


--
-- Name: okapicollege_join_curriculum2unite_enseignement_unite_enseignem; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_curriculum2unite_enseignement_unite_enseignem ON join_curriculum2unite_enseignement USING btree (unite_enseignement_ref);


--
-- Name: okapicollege_join_ecue2gestionnaire_ecue_ref1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_ecue2gestionnaire_ecue_ref1_idx ON join_ecue2gestionnaire USING btree (ecue_ref);


--
-- Name: okapicollege_join_ecue2gestionnaire_identifiant_ref2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_ecue2gestionnaire_identifiant_ref2_idx ON join_ecue2gestionnaire USING btree (identifiant_ref);


--
-- Name: okapicollege_join_enseignant2ecue_ecue2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_enseignant2ecue_ecue2_idx ON join_enseignant2ecue USING btree (ecue);


--
-- Name: okapicollege_join_enseignant2ecue_enseignant1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_enseignant2ecue_enseignant1_idx ON join_enseignant2ecue USING btree (enseignant);


--
-- Name: okapicollege_join_etablissement2domaine_domaine_ref2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_etablissement2domaine_domaine_ref2_idx ON join_etablissement2domaine USING btree (domaine_ref);


--
-- Name: okapicollege_join_etablissement2domaine_etablissement_ref1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_etablissement2domaine_etablissement_ref1_idx ON join_etablissement2domaine USING btree (etablissement_ref);


--
-- Name: okapicollege_join_inscription_dans_annee_etude2cours_pondere_co; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_inscription_dans_annee_etude2cours_pondere_co ON join_inscription_dans_annee_etude2cours_pondere USING btree (cours_pondere_ref);


--
-- Name: okapicollege_join_inscription_dans_annee_etude2cours_pondere_in; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_inscription_dans_annee_etude2cours_pondere_in ON join_inscription_dans_annee_etude2cours_pondere USING btree (inscription_dans_annee_etude_ref);


--
-- Name: okapicollege_join_mention2domaine_domaine_ref2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_mention2domaine_domaine_ref2_idx ON join_mention2domaine USING btree (domaine_ref);


--
-- Name: okapicollege_join_mention2domaine_mention_ref1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_mention2domaine_mention_ref1_idx ON join_mention2domaine USING btree (mention_ref);


--
-- Name: okapicollege_join_programme2curriculums_curriculum2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_programme2curriculums_curriculum2_idx ON join_programme2curriculums USING btree (curriculum);


--
-- Name: okapicollege_join_programme2curriculums_programme1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_programme2curriculums_programme1_idx ON join_programme2curriculums USING btree (programme);


--
-- Name: okapicollege_join_unite_enseignement2ecue_ecue_ref2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_unite_enseignement2ecue_ecue_ref2_idx ON join_unite_enseignement2ecue USING btree (ecue_ref);


--
-- Name: okapicollege_join_unite_enseignement2ecue_unite_enseignement_re; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_unite_enseignement2ecue_unite_enseignement_re ON join_unite_enseignement2ecue USING btree (unite_enseignement_ref);


--
-- Name: okapicollege_join_utilisateur2role_groupe2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_utilisateur2role_groupe2_idx ON join_utilisateur2role USING btree (groupe);


--
-- Name: okapicollege_join_utilisateur2role_identifiant1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_join_utilisateur2role_identifiant1_idx ON join_utilisateur2role USING btree (identifiant);


--
-- Name: okapicollege_okapicollege_annee_etude_cycle3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_annee_etude_cycle3_idx ON okapicollege_annee_etude USING btree (cycle);


--
-- Name: okapicollege_okapicollege_annee_etude_specialite1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_annee_etude_specialite1_idx ON okapicollege_annee_etude USING btree (specialite, cycle, niveau);


--
-- Name: okapicollege_okapicollege_annee_etude_specialite2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_annee_etude_specialite2_idx ON okapicollege_annee_etude USING btree (specialite);


--
-- Name: okapicollege_okapicollege_annee_etude_type_formation4_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_annee_etude_type_formation4_idx ON okapicollege_annee_etude USING btree (type_formation);


--
-- Name: okapicollege_okapicollege_autorisation_annee_autorisation2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_autorisation_annee_autorisation2_idx ON okapicollege_autorisation USING btree (annee_autorisation);


--
-- Name: okapicollege_okapicollege_autorisation_annee_etude3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_autorisation_annee_etude3_idx ON okapicollege_autorisation USING btree (annee_etude);


--
-- Name: okapicollege_okapicollege_autorisation_autorite6_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_autorisation_autorite6_idx ON okapicollege_autorisation USING btree (autorite);


--
-- Name: okapicollege_okapicollege_autorisation_code_pre_inscription1_id; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_autorisation_code_pre_inscription1_id ON okapicollege_autorisation USING btree (code_pre_inscription, annee_autorisation, annee_etude);


--
-- Name: okapicollege_okapicollege_autorisation_code_pre_inscription4_id; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_autorisation_code_pre_inscription4_id ON okapicollege_autorisation USING btree (code_pre_inscription);


--
-- Name: okapicollege_okapicollege_autorisation_statut7_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_autorisation_statut7_idx ON okapicollege_autorisation USING btree (statut);


--
-- Name: okapicollege_okapicollege_autorisation_type_autorisation5_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_autorisation_type_autorisation5_idx ON okapicollege_autorisation USING btree (type_autorisation);


--
-- Name: okapicollege_okapicollege_bac_code_pre_inscription4_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_bac_code_pre_inscription4_idx ON okapicollege_bac USING btree (code_pre_inscription);


--
-- Name: okapicollege_okapicollege_bac_num_table_bac1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_bac_num_table_bac1_idx ON okapicollege_bac USING btree (num_table_bac, annee_bac);


--
-- Name: okapicollege_okapicollege_bac_statut2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_bac_statut2_idx ON okapicollege_bac USING btree (statut);


--
-- Name: okapicollege_okapicollege_bac_type_bac3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_bac_type_bac3_idx ON okapicollege_bac USING btree (type_bac);


--
-- Name: okapicollege_okapicollege_classeur_annee_academique1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_classeur_annee_academique1_idx ON okapicollege_classeur USING btree (annee_academique);


--
-- Name: okapicollege_okapicollege_classeur_annee_etude2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_classeur_annee_etude2_idx ON okapicollege_classeur USING btree (annee_etude);


--
-- Name: okapicollege_okapicollege_code_pre_inscription_categorie_de_can; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_code_pre_inscription_categorie_de_can ON okapicollege_code_pre_inscription USING btree (categorie_de_candidat);


--
-- Name: okapicollege_okapicollege_code_pre_inscription_departement_geo2; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_code_pre_inscription_departement_geo2 ON okapicollege_code_pre_inscription USING btree (departement_geo);


--
-- Name: okapicollege_okapicollege_code_pre_inscription_nationalite1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_code_pre_inscription_nationalite1_idx ON okapicollege_code_pre_inscription USING btree (nationalite);


--
-- Name: okapicollege_okapicollege_code_pre_inscription_nom_de_famille5_; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_code_pre_inscription_nom_de_famille5_ ON okapicollege_code_pre_inscription USING btree (nom_de_famille);


--
-- Name: okapicollege_okapicollege_code_pre_inscription_profession_mere4; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_code_pre_inscription_profession_mere4 ON okapicollege_code_pre_inscription USING btree (profession_mere);


--
-- Name: okapicollege_okapicollege_code_pre_inscription_profession_pere3; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_code_pre_inscription_profession_pere3 ON okapicollege_code_pre_inscription USING btree (profession_pere);


--
-- Name: okapicollege_okapicollege_comptabilite_inscription_dans_annee_e; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_comptabilite_inscription_dans_annee_e ON okapicollege_comptabilite USING btree (inscription_dans_annee_etude);


--
-- Name: okapicollege_okapicollege_cours_pondere_cours1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_cours_pondere_cours1_idx ON okapicollege_cours_pondere USING btree (cours);


--
-- Name: okapicollege_okapicollege_curriculum_entite_gestionnaire1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_curriculum_entite_gestionnaire1_idx ON okapicollege_curriculum USING btree (entite_gestionnaire);


--
-- Name: okapicollege_okapicollege_decision_jury_inscription_dans_annee_; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_decision_jury_inscription_dans_annee_ ON okapicollege_decision_jury USING btree (inscription_dans_annee_etude, semestre);


--
-- Name: okapicollege_okapicollege_departement_etablissement2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_departement_etablissement2_idx ON okapicollege_departement USING btree (etablissement);


--
-- Name: okapicollege_okapicollege_departement_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_departement_libelle1_idx ON okapicollege_departement USING btree (libelle);


--
-- Name: okapicollege_okapicollege_departement_libelle3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_departement_libelle3_idx ON okapicollege_departement USING btree (libelle);


--
-- Name: okapicollege_okapicollege_diplome_etudiant1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_diplome_etudiant1_idx ON okapicollege_diplome USING btree (etudiant);


--
-- Name: okapicollege_okapicollege_diplome_grade2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_diplome_grade2_idx ON okapicollege_diplome USING btree (grade);


--
-- Name: okapicollege_okapicollege_diplome_nomenclature3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_diplome_nomenclature3_idx ON okapicollege_diplome USING btree (nomenclature);


--
-- Name: okapicollege_okapicollege_document_etudiant1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_document_etudiant1_idx ON okapicollege_document USING btree (etudiant);


--
-- Name: okapicollege_okapicollege_document_nomenclature2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_document_nomenclature2_idx ON okapicollege_document USING btree (nomenclature);


--
-- Name: okapicollege_okapicollege_ecue_au_choix_inscription_dans_annee_; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_ecue_au_choix_inscription_dans_annee_ ON okapicollege_ecue_au_choix USING btree (inscription_dans_annee_etude, ecue);


--
-- Name: okapicollege_okapicollege_etablissement_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_etablissement_libelle1_idx ON okapicollege_etablissement USING btree (libelle);


--
-- Name: okapicollege_okapicollege_etudiant_code_pre_inscription2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_etudiant_code_pre_inscription2_idx ON okapicollege_etudiant USING btree (code_pre_inscription);


--
-- Name: okapicollege_okapicollege_etudiant_code_pre_inscription3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_etudiant_code_pre_inscription3_idx ON okapicollege_etudiant USING btree (code_pre_inscription);


--
-- Name: okapicollege_okapicollege_etudiant_identifiant1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_etudiant_identifiant1_idx ON okapicollege_etudiant USING btree (identifiant);


--
-- Name: okapicollege_okapicollege_exoneration_inscription_dans_annee_et; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_exoneration_inscription_dans_annee_et ON okapicollege_exoneration USING btree (inscription_dans_annee_etude);


--
-- Name: okapicollege_okapicollege_exoneration_statut2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_exoneration_statut2_idx ON okapicollege_exoneration USING btree (statut);


--
-- Name: okapicollege_okapicollege_fiche_banque_inscription_dans_annee_e; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_fiche_banque_inscription_dans_annee_e ON okapicollege_fiche_banque USING btree (inscription_dans_annee_etude);


--
-- Name: okapicollege_okapicollege_horaire_ecue1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_horaire_ecue1_idx ON okapicollege_horaire USING btree (ecue);


--
-- Name: okapicollege_okapicollege_horaire_salle2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_horaire_salle2_idx ON okapicollege_horaire USING btree (salle);


--
-- Name: okapicollege_okapicollege_inscription_au_cours_pondere_annee_ac; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_inscription_au_cours_pondere_annee_ac ON okapicollege_inscription_au_cours_pondere USING btree (annee_academique, cours_pondere, etudiant);


--
-- Name: okapicollege_okapicollege_inscription_dans_annee_etude_autorisa; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_inscription_dans_annee_etude_autorisa ON okapicollege_inscription_dans_annee_etude USING btree (autorisation);


--
-- Name: okapicollege_okapicollege_mention_departement2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_mention_departement2_idx ON okapicollege_mention USING btree (departement);


--
-- Name: okapicollege_okapicollege_mention_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_mention_libelle1_idx ON okapicollege_mention USING btree (libelle);


--
-- Name: okapicollege_okapicollege_montant_inscription_annee_etude2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_montant_inscription_annee_etude2_idx ON okapicollege_montant_inscription USING btree (annee_etude);


--
-- Name: okapicollege_okapicollege_montant_inscription_statut3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_montant_inscription_statut3_idx ON okapicollege_montant_inscription USING btree (statut);


--
-- Name: okapicollege_okapicollege_montant_inscription_zone_de_pays1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_montant_inscription_zone_de_pays1_idx ON okapicollege_montant_inscription USING btree (zone_de_pays, statut, annee_etude);


--
-- Name: okapicollege_okapicollege_montant_inscription_zone_de_pays4_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_montant_inscription_zone_de_pays4_idx ON okapicollege_montant_inscription USING btree (zone_de_pays);


--
-- Name: okapicollege_okapicollege_nomenclature_autorite_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_autorite_libelle1_idx ON okapicollege_nomenclature_autorite USING btree (libelle);


--
-- Name: okapicollege_okapicollege_nomenclature_categorie_etudiant_libel; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_categorie_etudiant_libel ON okapicollege_nomenclature_categorie_etudiant USING btree (libelle);


--
-- Name: okapicollege_okapicollege_nomenclature_departement_geo_libelle1; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_departement_geo_libelle1 ON okapicollege_nomenclature_departement_geo USING btree (libelle);


--
-- Name: okapicollege_okapicollege_nomenclature_diplome_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_diplome_libelle1_idx ON okapicollege_nomenclature_diplome USING btree (libelle);


--
-- Name: okapicollege_okapicollege_nomenclature_document_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_document_libelle1_idx ON okapicollege_nomenclature_document USING btree (libelle);


--
-- Name: okapicollege_okapicollege_nomenclature_etat_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_etat_libelle1_idx ON okapicollege_nomenclature_etat USING btree (libelle);


--
-- Name: okapicollege_okapicollege_nomenclature_grade_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_grade_libelle1_idx ON okapicollege_nomenclature_grade USING btree (libelle);


--
-- Name: okapicollege_okapicollege_nomenclature_organisme_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_organisme_libelle1_idx ON okapicollege_nomenclature_organisme USING btree (libelle);


--
-- Name: okapicollege_okapicollege_nomenclature_role_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_role_libelle1_idx ON okapicollege_nomenclature_role USING btree (libelle);


--
-- Name: okapicollege_okapicollege_nomenclature_statut_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_statut_libelle1_idx ON okapicollege_nomenclature_statut USING btree (libelle);


--
-- Name: okapicollege_okapicollege_nomenclature_verdict_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_nomenclature_verdict_libelle1_idx ON okapicollege_nomenclature_verdict USING btree (libelle);


--
-- Name: okapicollege_okapicollege_note_annee_academique1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_note_annee_academique1_idx ON okapicollege_note USING btree (annee_academique);


--
-- Name: okapicollege_okapicollege_note_ecue2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_note_ecue2_idx ON okapicollege_note USING btree (ecue);


--
-- Name: okapicollege_okapicollege_note_etudiant3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_note_etudiant3_idx ON okapicollege_note USING btree (etudiant);


--
-- Name: okapicollege_okapicollege_pays_zone1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_pays_zone1_idx ON okapicollege_pays USING btree (zone);


--
-- Name: okapicollege_okapicollege_profession_secteur_activite1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_profession_secteur_activite1_idx ON okapicollege_profession USING btree (secteur_activite);


--
-- Name: okapicollege_okapicollege_programme_annee_academique1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_programme_annee_academique1_idx ON okapicollege_programme USING btree (annee_academique, annee_etude, semestre);


--
-- Name: okapicollege_okapicollege_programme_annee_academique2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_programme_annee_academique2_idx ON okapicollege_programme USING btree (annee_academique);


--
-- Name: okapicollege_okapicollege_programme_annee_etude4_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_programme_annee_etude4_idx ON okapicollege_programme USING btree (annee_etude);


--
-- Name: okapicollege_okapicollege_programme_curriculum3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_programme_curriculum3_idx ON okapicollege_programme USING btree (curriculum);


--
-- Name: okapicollege_okapicollege_propriete_application_anac1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_propriete_application_anac1_idx ON okapicollege_propriete_application USING btree (anac);


--
-- Name: okapicollege_okapicollege_propriete_application_anac_staff2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_propriete_application_anac_staff2_idx ON okapicollege_propriete_application USING btree (anac_staff);


--
-- Name: okapicollege_okapicollege_rdv_salle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_rdv_salle1_idx ON okapicollege_rdv USING btree (salle);


--
-- Name: okapicollege_okapicollege_ressource_salle_ressource2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_ressource_salle_ressource2_idx ON okapicollege_ressource_salle USING btree (ressource);


--
-- Name: okapicollege_okapicollege_ressource_salle_salle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_ressource_salle_salle1_idx ON okapicollege_ressource_salle USING btree (salle, ressource);


--
-- Name: okapicollege_okapicollege_ressource_salle_salle3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_ressource_salle_salle3_idx ON okapicollege_ressource_salle USING btree (salle);


--
-- Name: okapicollege_okapicollege_ressource_salle_salle4_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_ressource_salle_salle4_idx ON okapicollege_ressource_salle USING btree (salle);


--
-- Name: okapicollege_okapicollege_salle_etablissement1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_salle_etablissement1_idx ON okapicollege_salle USING btree (etablissement);


--
-- Name: okapicollege_okapicollege_sanction_etudiant1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_sanction_etudiant1_idx ON okapicollege_sanction USING btree (etudiant);


--
-- Name: okapicollege_okapicollege_souscription_module_cours_annee_etude; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_souscription_module_cours_annee_etude ON okapicollege_souscription_module_cours USING btree (annee_etude, module_cours);


--
-- Name: okapicollege_okapicollege_specialite_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_specialite_libelle1_idx ON okapicollege_specialite USING btree (libelle);


--
-- Name: okapicollege_okapicollege_specialite_mention2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_specialite_mention2_idx ON okapicollege_specialite USING btree (mention);


--
-- Name: okapicollege_okapicollege_statut_cpi1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_statut_cpi1_idx ON okapicollege_statut USING btree (cpi, nomenclature_cycle, specialite);


--
-- Name: okapicollege_okapicollege_statut_cpi2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_statut_cpi2_idx ON okapicollege_statut USING btree (cpi);


--
-- Name: okapicollege_okapicollege_statut_nomenclature_cycle4_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_statut_nomenclature_cycle4_idx ON okapicollege_statut USING btree (nomenclature_cycle);


--
-- Name: okapicollege_okapicollege_statut_nomenclature_statut5_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_statut_nomenclature_statut5_idx ON okapicollege_statut USING btree (nomenclature_statut);


--
-- Name: okapicollege_okapicollege_statut_specialite3_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_statut_specialite3_idx ON okapicollege_statut USING btree (specialite);


--
-- Name: okapicollege_okapicollege_type_autorisation_autorite2_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_type_autorisation_autorite2_idx ON okapicollege_type_autorisation USING btree (autorite);


--
-- Name: okapicollege_okapicollege_type_autorisation_libelle1_idx; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_type_autorisation_libelle1_idx ON okapicollege_type_autorisation USING btree (libelle);


--
-- Name: okapicollege_okapicollege_unite_enseignement_au_choix_inscripti; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE UNIQUE INDEX okapicollege_okapicollege_unite_enseignement_au_choix_inscripti ON okapicollege_unite_enseignement_au_choix USING btree (inscription_dans_annee_etude, unite_enseignement);


--
-- Name: okapicollege_okapicollege_unite_enseignement_categorie_enseigne; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_unite_enseignement_categorie_enseigne ON okapicollege_unite_enseignement USING btree (categorie_enseignement);


--
-- Name: okapicollege_okapicollege_unite_enseignement_entite_gestionnair; Type: INDEX; Schema: okapicollege; Owner: postgres
--

CREATE INDEX okapicollege_okapicollege_unite_enseignement_entite_gestionnair ON okapicollege_unite_enseignement USING btree (entite_gestionnaire);


--
-- Name: join_annee_etude2type_bac_interdit_annee_etude_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_annee_etude2type_bac_interdit
    ADD CONSTRAINT join_annee_etude2type_bac_interdit_annee_etude_ref_fkey FOREIGN KEY (annee_etude_ref) REFERENCES okapicollege_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_annee_etude2type_bac_interdit_type_bac_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_annee_etude2type_bac_interdit
    ADD CONSTRAINT join_annee_etude2type_bac_interdit_type_bac_ref_fkey FOREIGN KEY (type_bac_ref) REFERENCES okapicollege_nomenclature_type_bac(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_annee_etude_2curriculum_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_annee_etude_2curriculum
    ADD CONSTRAINT join_annee_etude_2curriculum_annee_etude_fkey FOREIGN KEY (annee_etude) REFERENCES okapicollege_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_annee_etude_2curriculum_curriculum_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_annee_etude_2curriculum
    ADD CONSTRAINT join_annee_etude_2curriculum_curriculum_fkey FOREIGN KEY (curriculum) REFERENCES okapicollege_curriculum(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_autorisation2organisme_autorisation_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_autorisation2organisme
    ADD CONSTRAINT join_autorisation2organisme_autorisation_ref_fkey FOREIGN KEY (autorisation_ref) REFERENCES okapicollege_autorisation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_autorisation2organisme_organisme_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_autorisation2organisme
    ADD CONSTRAINT join_autorisation2organisme_organisme_ref_fkey FOREIGN KEY (organisme_ref) REFERENCES okapicollege_nomenclature_organisme(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_code_pre_inscription2type_ba_code_pre_inscription_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_code_pre_inscription2type_bac
    ADD CONSTRAINT join_code_pre_inscription2type_ba_code_pre_inscription_ref_fkey FOREIGN KEY (code_pre_inscription_ref) REFERENCES okapicollege_code_pre_inscription(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_code_pre_inscription2type_bac_type_bac_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_code_pre_inscription2type_bac
    ADD CONSTRAINT join_code_pre_inscription2type_bac_type_bac_ref_fkey FOREIGN KEY (type_bac_ref) REFERENCES okapicollege_nomenclature_type_bac(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_cours_pondere2module_cours_cours_pondere_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_cours_pondere2module_cours
    ADD CONSTRAINT join_cours_pondere2module_cours_cours_pondere_ref_fkey FOREIGN KEY (cours_pondere_ref) REFERENCES okapicollege_cours_pondere(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_cours_pondere2module_cours_module_cours_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_cours_pondere2module_cours
    ADD CONSTRAINT join_cours_pondere2module_cours_module_cours_ref_fkey FOREIGN KEY (module_cours_ref) REFERENCES okapicollege_nomenclature_module_cours(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_curriculum2unite_enseignement_curriculum_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_curriculum2unite_enseignement
    ADD CONSTRAINT join_curriculum2unite_enseignement_curriculum_ref_fkey FOREIGN KEY (curriculum_ref) REFERENCES okapicollege_curriculum(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_curriculum2unite_enseignement_unite_enseignement_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_curriculum2unite_enseignement
    ADD CONSTRAINT join_curriculum2unite_enseignement_unite_enseignement_ref_fkey FOREIGN KEY (unite_enseignement_ref) REFERENCES okapicollege_unite_enseignement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_ecue2gestionnaire_ecue_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_ecue2gestionnaire
    ADD CONSTRAINT join_ecue2gestionnaire_ecue_ref_fkey FOREIGN KEY (ecue_ref) REFERENCES okapicollege_ecue(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_ecue2gestionnaire_identifiant_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_ecue2gestionnaire
    ADD CONSTRAINT join_ecue2gestionnaire_identifiant_ref_fkey FOREIGN KEY (identifiant_ref) REFERENCES okapicollege_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_enseignant2ecue_ecue_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_enseignant2ecue
    ADD CONSTRAINT join_enseignant2ecue_ecue_fkey FOREIGN KEY (ecue) REFERENCES okapicollege_ecue(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_enseignant2ecue_enseignant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_enseignant2ecue
    ADD CONSTRAINT join_enseignant2ecue_enseignant_fkey FOREIGN KEY (enseignant) REFERENCES okapicollege_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_etablissement2domaine_domaine_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_etablissement2domaine
    ADD CONSTRAINT join_etablissement2domaine_domaine_ref_fkey FOREIGN KEY (domaine_ref) REFERENCES okapicollege_nomenclature_domaine(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_etablissement2domaine_etablissement_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_etablissement2domaine
    ADD CONSTRAINT join_etablissement2domaine_etablissement_ref_fkey FOREIGN KEY (etablissement_ref) REFERENCES okapicollege_etablissement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_inscription_dans_annee_e_inscription_dans_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_inscription_dans_annee_etude2cours_pondere
    ADD CONSTRAINT join_inscription_dans_annee_e_inscription_dans_annee_etude_fkey FOREIGN KEY (inscription_dans_annee_etude_ref) REFERENCES okapicollege_inscription_dans_annee_etude(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_inscription_dans_annee_etude2cours__cours_pondere_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_inscription_dans_annee_etude2cours_pondere
    ADD CONSTRAINT join_inscription_dans_annee_etude2cours__cours_pondere_ref_fkey FOREIGN KEY (cours_pondere_ref) REFERENCES okapicollege_cours_pondere(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_mention2domaine_domaine_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_mention2domaine
    ADD CONSTRAINT join_mention2domaine_domaine_ref_fkey FOREIGN KEY (domaine_ref) REFERENCES okapicollege_nomenclature_domaine(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_mention2domaine_mention_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_mention2domaine
    ADD CONSTRAINT join_mention2domaine_mention_ref_fkey FOREIGN KEY (mention_ref) REFERENCES okapicollege_mention(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_programme2curriculums_curriculum_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_programme2curriculums
    ADD CONSTRAINT join_programme2curriculums_curriculum_fkey FOREIGN KEY (curriculum) REFERENCES okapicollege_curriculum(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_programme2curriculums_programme_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_programme2curriculums
    ADD CONSTRAINT join_programme2curriculums_programme_fkey FOREIGN KEY (programme) REFERENCES okapicollege_programme(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_unite_enseignement2ecue_ecue_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_unite_enseignement2ecue
    ADD CONSTRAINT join_unite_enseignement2ecue_ecue_ref_fkey FOREIGN KEY (ecue_ref) REFERENCES okapicollege_ecue(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_unite_enseignement2ecue_unite_enseignement_ref_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_unite_enseignement2ecue
    ADD CONSTRAINT join_unite_enseignement2ecue_unite_enseignement_ref_fkey FOREIGN KEY (unite_enseignement_ref) REFERENCES okapicollege_unite_enseignement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_utilisateur2role_groupe_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_utilisateur2role
    ADD CONSTRAINT join_utilisateur2role_groupe_fkey FOREIGN KEY (groupe) REFERENCES okapicollege_nomenclature_role(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: join_utilisateur2role_identifiant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY join_utilisateur2role
    ADD CONSTRAINT join_utilisateur2role_identifiant_fkey FOREIGN KEY (identifiant) REFERENCES okapicollege_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_annee_etude_2_type_bac_interdit_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_annee_etude_2_type_bac_interdit
    ADD CONSTRAINT ok_annee_etude_2_type_bac_interdit_annee_etude_fkey FOREIGN KEY (annee_etude) REFERENCES ok_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_annee_etude_2_type_bac_interdit_type_bac_interdit_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_annee_etude_2_type_bac_interdit
    ADD CONSTRAINT ok_annee_etude_2_type_bac_interdit_type_bac_interdit_fkey FOREIGN KEY (type_bac_interdit) REFERENCES ok_type_bac(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_annee_etude_amont_2_annee_etude_aval_annee_etude_amont_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_annee_etude_amont_2_annee_etude_aval
    ADD CONSTRAINT ok_annee_etude_amont_2_annee_etude_aval_annee_etude_amont_fkey FOREIGN KEY (annee_etude_amont) REFERENCES ok_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_annee_etude_amont_2_annee_etude_aval_annee_etude_aval_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_annee_etude_amont_2_annee_etude_aval
    ADD CONSTRAINT ok_annee_etude_amont_2_annee_etude_aval_annee_etude_aval_fkey FOREIGN KEY (annee_etude_aval) REFERENCES ok_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_annee_etude_entite_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_annee_etude
    ADD CONSTRAINT ok_annee_etude_entite_academique_fkey FOREIGN KEY (entite_gestionnaire) REFERENCES ok_entite_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_commissaire_utilisateur_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_commissaire
    ADD CONSTRAINT ok_commissaire_utilisateur_fkey FOREIGN KEY (personne) REFERENCES ok_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_commission_2_commissaire_commissaire_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_commission_2_commissaire
    ADD CONSTRAINT ok_commission_2_commissaire_commissaire_fkey FOREIGN KEY (commissaire) REFERENCES ok_commissaire(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_commission_2_commissaire_commission_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_commission_2_commissaire
    ADD CONSTRAINT ok_commission_2_commissaire_commission_fkey FOREIGN KEY (commission) REFERENCES ok_commission(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_comptabilite_inscription_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_comptabilite
    ADD CONSTRAINT ok_comptabilite_inscription_fkey FOREIGN KEY (inscription) REFERENCES ok_inscription(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_ecue_2_utilisateur_ecue_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_ecue_2_utilisateur
    ADD CONSTRAINT ok_ecue_2_utilisateur_ecue_fkey FOREIGN KEY (ecue) REFERENCES ok_ecue(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_ecue_2_utilisateur_enseignant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_ecue_2_utilisateur
    ADD CONSTRAINT ok_ecue_2_utilisateur_enseignant_fkey FOREIGN KEY (enseignant) REFERENCES ok_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_entite_academique_entite_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_entite_academique
    ADD CONSTRAINT ok_entite_academique_entite_academique_fkey FOREIGN KEY (parent) REFERENCES ok_entite_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_etudiant_pays_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_etudiant
    ADD CONSTRAINT ok_etudiant_pays_fkey FOREIGN KEY (nationalite) REFERENCES ok_pays(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_etudiant_utilisateur_1_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_etudiant
    ADD CONSTRAINT ok_etudiant_utilisateur_1_fkey FOREIGN KEY (agent_carte_etudiant) REFERENCES ok_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_etudiant_utilisateur_2_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_etudiant
    ADD CONSTRAINT ok_etudiant_utilisateur_2_fkey FOREIGN KEY (validateur) REFERENCES ok_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_exoneration_entite_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_exoneration
    ADD CONSTRAINT ok_exoneration_entite_academique_fkey FOREIGN KEY (entite_academique) REFERENCES ok_entite_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_fiche_banque_inscription_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_fiche_banque
    ADD CONSTRAINT ok_fiche_banque_inscription_fkey FOREIGN KEY (inscription) REFERENCES ok_inscription(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_frais_entite_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_frais
    ADD CONSTRAINT ok_frais_entite_academique_fkey FOREIGN KEY (entite_academique) REFERENCES ok_entite_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_inscription_annee_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_inscription
    ADD CONSTRAINT ok_inscription_annee_academique_fkey FOREIGN KEY (annee_academique) REFERENCES ok_annee_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_inscription_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_inscription
    ADD CONSTRAINT ok_inscription_annee_etude_fkey FOREIGN KEY (annee_etude) REFERENCES ok_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_inscription_classeur_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_inscription
    ADD CONSTRAINT ok_inscription_classeur_fkey FOREIGN KEY (classeur) REFERENCES ok_classeur(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_inscription_commission_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_inscription
    ADD CONSTRAINT ok_inscription_commission_fkey FOREIGN KEY (commission) REFERENCES ok_commission(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_inscription_etudiant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_inscription
    ADD CONSTRAINT ok_inscription_etudiant_fkey FOREIGN KEY (etudiant) REFERENCES ok_etudiant(matricule) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_inscription_programme_au_choix_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_inscription
    ADD CONSTRAINT ok_inscription_programme_au_choix_fkey FOREIGN KEY (programme_au_choix) REFERENCES ok_programme_au_choix(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_inscription_type_autorisation_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_inscription
    ADD CONSTRAINT ok_inscription_type_autorisation_fkey FOREIGN KEY (type_autorisation) REFERENCES ok_type_autorisation(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_inscription_utilisateur_1_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_inscription
    ADD CONSTRAINT ok_inscription_utilisateur_1_fkey FOREIGN KEY (validateur1) REFERENCES ok_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_inscription_utilisateur_2_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_inscription
    ADD CONSTRAINT ok_inscription_utilisateur_2_fkey FOREIGN KEY (validateur2) REFERENCES ok_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_module_2_unite_enseignement_module_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_module_2_unite_enseignement
    ADD CONSTRAINT ok_module_2_unite_enseignement_module_fkey FOREIGN KEY (module) REFERENCES ok_module(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_module_2_unite_enseignement_unite_enseignement_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_module_2_unite_enseignement
    ADD CONSTRAINT ok_module_2_unite_enseignement_unite_enseignement_fkey FOREIGN KEY (unite_enseignement) REFERENCES ok_unite_enseignement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_note_annee_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_note
    ADD CONSTRAINT ok_note_annee_academique_fkey FOREIGN KEY (annee_academique) REFERENCES ok_annee_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_note_ecu_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_note
    ADD CONSTRAINT ok_note_ecu_fkey FOREIGN KEY (ecue) REFERENCES ok_ecue(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_note_etudiant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_note
    ADD CONSTRAINT ok_note_etudiant_fkey FOREIGN KEY (etudiant) REFERENCES ok_etudiant(matricule) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_programme_2_module_module_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme_2_module
    ADD CONSTRAINT ok_programme_2_module_module_fkey FOREIGN KEY (module) REFERENCES ok_module(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_programme_2_module_programme_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme_2_module
    ADD CONSTRAINT ok_programme_2_module_programme_fkey FOREIGN KEY (programme) REFERENCES ok_programme(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_programme_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme
    ADD CONSTRAINT ok_programme_annee_etude_fkey FOREIGN KEY (annee_etude) REFERENCES ok_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_programme_au_choix_2_ecue_ecue_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme_au_choix_2_ecue
    ADD CONSTRAINT ok_programme_au_choix_2_ecue_ecue_fkey FOREIGN KEY (ecue) REFERENCES ok_ecue(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_programme_au_choix_2_ecue_programme_au_choix_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme_au_choix_2_ecue
    ADD CONSTRAINT ok_programme_au_choix_2_ecue_programme_au_choix_fkey FOREIGN KEY (programme_au_choix) REFERENCES ok_programme_au_choix(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_programme_au_choix_entite_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme_au_choix
    ADD CONSTRAINT ok_programme_au_choix_entite_academique_fkey FOREIGN KEY (entite_gestionnaire) REFERENCES ok_entite_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_programme_au_choix_utilisateur_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_programme_au_choix
    ADD CONSTRAINT ok_programme_au_choix_utilisateur_fkey FOREIGN KEY (agent_acceptation) REFERENCES ok_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_sanction_etudiant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_sanction
    ADD CONSTRAINT ok_sanction_etudiant_fkey FOREIGN KEY (etudiant) REFERENCES ok_etudiant(matricule) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_unite_enseignement_2_ecue_ecue_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_unite_enseignement_2_ecue
    ADD CONSTRAINT ok_unite_enseignement_2_ecue_ecue_fkey FOREIGN KEY (ecue) REFERENCES ok_ecue(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_unite_enseignement_2_ecue_unite_enseignement_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_unite_enseignement_2_ecue
    ADD CONSTRAINT ok_unite_enseignement_2_ecue_unite_enseignement_fkey FOREIGN KEY (unite_enseignement) REFERENCES ok_unite_enseignement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_unite_enseignement_entite_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_unite_enseignement
    ADD CONSTRAINT ok_unite_enseignement_entite_academique_fkey FOREIGN KEY (entite_gestionnaire) REFERENCES ok_entite_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_utilisateur_2_nomenclature_role_nomenclature_role_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_utilisateur_2_nomenclature_role
    ADD CONSTRAINT ok_utilisateur_2_nomenclature_role_nomenclature_role_fkey FOREIGN KEY (nomenclature_role) REFERENCES ok_nomenclature_role(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_utilisateur_2_nomenclature_role_utilisateur_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_utilisateur_2_nomenclature_role
    ADD CONSTRAINT ok_utilisateur_2_nomenclature_role_utilisateur_fkey FOREIGN KEY (utilisateur) REFERENCES ok_utilisateur(identifiant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_verdict_commission_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_verdict
    ADD CONSTRAINT ok_verdict_commission_fkey FOREIGN KEY (jury) REFERENCES ok_commission(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ok_verdict_inscription_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_verdict
    ADD CONSTRAINT ok_verdict_inscription_fkey FOREIGN KEY (inscription) REFERENCES ok_inscription(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_autorisation_annee_autorisation_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_autorisation
    ADD CONSTRAINT okapicollege_autorisation_annee_autorisation_fkey FOREIGN KEY (annee_autorisation) REFERENCES okapicollege_annee_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_autorisation_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_autorisation
    ADD CONSTRAINT okapicollege_autorisation_annee_etude_fkey FOREIGN KEY (annee_etude) REFERENCES okapicollege_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_autorisation_code_pre_inscription_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_autorisation
    ADD CONSTRAINT okapicollege_autorisation_code_pre_inscription_fkey FOREIGN KEY (code_pre_inscription) REFERENCES okapicollege_code_pre_inscription(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_autorisation_statut_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_autorisation
    ADD CONSTRAINT okapicollege_autorisation_statut_fkey FOREIGN KEY (statut) REFERENCES okapicollege_nomenclature_statut(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_autorisation_type_autorisation_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_autorisation
    ADD CONSTRAINT okapicollege_autorisation_type_autorisation_fkey FOREIGN KEY (type_autorisation) REFERENCES okapicollege_type_autorisation(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_bac_code_pre_inscription_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_bac
    ADD CONSTRAINT okapicollege_bac_code_pre_inscription_fkey FOREIGN KEY (code_pre_inscription) REFERENCES okapicollege_code_pre_inscription(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: okapicollege_bac_statut_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_bac
    ADD CONSTRAINT okapicollege_bac_statut_fkey FOREIGN KEY (statut) REFERENCES okapicollege_nomenclature_statut(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_bac_type_bac_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_bac
    ADD CONSTRAINT okapicollege_bac_type_bac_fkey FOREIGN KEY (type_bac) REFERENCES okapicollege_nomenclature_type_bac(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_classeur_annee_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_classeur
    ADD CONSTRAINT okapicollege_classeur_annee_academique_fkey FOREIGN KEY (annee_academique) REFERENCES okapicollege_annee_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_classeur_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_classeur
    ADD CONSTRAINT okapicollege_classeur_annee_etude_fkey FOREIGN KEY (annee_etude) REFERENCES okapicollege_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_code_pre_inscription_categorie_de_candidat_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_code_pre_inscription
    ADD CONSTRAINT okapicollege_code_pre_inscription_categorie_de_candidat_fkey FOREIGN KEY (categorie_de_candidat) REFERENCES okapicollege_nomenclature_categorie_etudiant(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_code_pre_inscription_departement_geo_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_code_pre_inscription
    ADD CONSTRAINT okapicollege_code_pre_inscription_departement_geo_fkey FOREIGN KEY (departement_geo) REFERENCES okapicollege_nomenclature_departement_geo(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_code_pre_inscription_nationalite_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_code_pre_inscription
    ADD CONSTRAINT okapicollege_code_pre_inscription_nationalite_fkey FOREIGN KEY (nationalite) REFERENCES okapicollege_pays(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_code_pre_inscription_profession_mere_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_code_pre_inscription
    ADD CONSTRAINT okapicollege_code_pre_inscription_profession_mere_fkey FOREIGN KEY (profession_mere) REFERENCES okapicollege_profession(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_code_pre_inscription_profession_pere_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_code_pre_inscription
    ADD CONSTRAINT okapicollege_code_pre_inscription_profession_pere_fkey FOREIGN KEY (profession_pere) REFERENCES okapicollege_profession(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_comptabilite_inscription_dans_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_comptabilite
    ADD CONSTRAINT okapicollege_comptabilite_inscription_dans_annee_etude_fkey FOREIGN KEY (inscription_dans_annee_etude) REFERENCES okapicollege_inscription_dans_annee_etude(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_cours_pondere_cours_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_cours_pondere
    ADD CONSTRAINT okapicollege_cours_pondere_cours_fkey FOREIGN KEY (cours) REFERENCES okapicollege_cours(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_curriculum_entite_gestionnaire_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_curriculum
    ADD CONSTRAINT okapicollege_curriculum_entite_gestionnaire_fkey FOREIGN KEY (entite_gestionnaire) REFERENCES okapicollege_departement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_decision_jury_grade_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_decision_jury
    ADD CONSTRAINT okapicollege_decision_jury_grade_fkey FOREIGN KEY (grade) REFERENCES okapicollege_nomenclature_grade(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_decision_jury_inscription_dans_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_decision_jury
    ADD CONSTRAINT okapicollege_decision_jury_inscription_dans_annee_etude_fkey FOREIGN KEY (inscription_dans_annee_etude) REFERENCES okapicollege_inscription_dans_annee_etude(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_decision_jury_verdict_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_decision_jury
    ADD CONSTRAINT okapicollege_decision_jury_verdict_fkey FOREIGN KEY (verdict) REFERENCES okapicollege_nomenclature_verdict(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_departement_etablissement_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_departement
    ADD CONSTRAINT okapicollege_departement_etablissement_fkey FOREIGN KEY (etablissement) REFERENCES okapicollege_etablissement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_diplome_etudiant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_diplome
    ADD CONSTRAINT okapicollege_diplome_etudiant_fkey FOREIGN KEY (etudiant) REFERENCES okapicollege_etudiant(matricule) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_diplome_grade_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_diplome
    ADD CONSTRAINT okapicollege_diplome_grade_fkey FOREIGN KEY (grade) REFERENCES okapicollege_nomenclature_grade(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_diplome_nomenclature_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_diplome
    ADD CONSTRAINT okapicollege_diplome_nomenclature_fkey FOREIGN KEY (nomenclature) REFERENCES okapicollege_nomenclature_diplome(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_document_etudiant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_document
    ADD CONSTRAINT okapicollege_document_etudiant_fkey FOREIGN KEY (etudiant) REFERENCES okapicollege_etudiant(matricule) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_document_nomenclature_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_document
    ADD CONSTRAINT okapicollege_document_nomenclature_fkey FOREIGN KEY (nomenclature) REFERENCES okapicollege_nomenclature_document(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_ecue_au_choix_ecue_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_ecue_au_choix
    ADD CONSTRAINT okapicollege_ecue_au_choix_ecue_fkey FOREIGN KEY (ecue) REFERENCES okapicollege_ecue(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_ecue_au_choix_inscription_dans_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_ecue_au_choix
    ADD CONSTRAINT okapicollege_ecue_au_choix_inscription_dans_annee_etude_fkey FOREIGN KEY (inscription_dans_annee_etude) REFERENCES okapicollege_inscription_dans_annee_etude(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_etudiant_code_pre_inscription_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_etudiant
    ADD CONSTRAINT okapicollege_etudiant_code_pre_inscription_fkey FOREIGN KEY (code_pre_inscription) REFERENCES okapicollege_code_pre_inscription(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_exoneration_inscription_dans_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_exoneration
    ADD CONSTRAINT okapicollege_exoneration_inscription_dans_annee_etude_fkey FOREIGN KEY (inscription_dans_annee_etude) REFERENCES okapicollege_inscription_dans_annee_etude(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_exoneration_statut_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_exoneration
    ADD CONSTRAINT okapicollege_exoneration_statut_fkey FOREIGN KEY (statut) REFERENCES okapicollege_nomenclature_statut(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_fiche_banque_inscription_dans_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_fiche_banque
    ADD CONSTRAINT okapicollege_fiche_banque_inscription_dans_annee_etude_fkey FOREIGN KEY (inscription_dans_annee_etude) REFERENCES okapicollege_inscription_dans_annee_etude(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_horaire_ecue_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_horaire
    ADD CONSTRAINT okapicollege_horaire_ecue_fkey FOREIGN KEY (ecue) REFERENCES okapicollege_ecue(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_horaire_salle_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_horaire
    ADD CONSTRAINT okapicollege_horaire_salle_fkey FOREIGN KEY (salle) REFERENCES okapicollege_salle(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_inscription_au_cours_pondere_annee_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_inscription_au_cours_pondere
    ADD CONSTRAINT okapicollege_inscription_au_cours_pondere_annee_academique_fkey FOREIGN KEY (annee_academique) REFERENCES okapicollege_annee_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_inscription_au_cours_pondere_cours_pondere_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_inscription_au_cours_pondere
    ADD CONSTRAINT okapicollege_inscription_au_cours_pondere_cours_pondere_fkey FOREIGN KEY (cours_pondere) REFERENCES okapicollege_cours_pondere(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_inscription_au_cours_pondere_etudiant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_inscription_au_cours_pondere
    ADD CONSTRAINT okapicollege_inscription_au_cours_pondere_etudiant_fkey FOREIGN KEY (etudiant) REFERENCES okapicollege_etudiant(matricule) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_inscription_dans_annee_etude_autorisation_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_inscription_dans_annee_etude
    ADD CONSTRAINT okapicollege_inscription_dans_annee_etude_autorisation_fkey FOREIGN KEY (autorisation) REFERENCES okapicollege_autorisation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_inscription_dans_annee_etude_classeur_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_inscription_dans_annee_etude
    ADD CONSTRAINT okapicollege_inscription_dans_annee_etude_classeur_fkey FOREIGN KEY (classeur) REFERENCES okapicollege_classeur(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_inscription_dans_annee_etude_classeur_fkey1; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_inscription_dans_annee_etude
    ADD CONSTRAINT okapicollege_inscription_dans_annee_etude_classeur_fkey1 FOREIGN KEY (classeur) REFERENCES okapicollege_classeur(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_inscription_dans_annee_etude_classeur_fkey2; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_inscription_dans_annee_etude
    ADD CONSTRAINT okapicollege_inscription_dans_annee_etude_classeur_fkey2 FOREIGN KEY (classeur) REFERENCES okapicollege_classeur(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_inscription_dans_annee_etude_rdv_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_inscription_dans_annee_etude
    ADD CONSTRAINT okapicollege_inscription_dans_annee_etude_rdv_fkey FOREIGN KEY (rdv) REFERENCES okapicollege_rdv(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: okapicollege_mention_departement_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_mention
    ADD CONSTRAINT okapicollege_mention_departement_fkey FOREIGN KEY (departement) REFERENCES okapicollege_departement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_montant_inscription_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_montant_inscription
    ADD CONSTRAINT okapicollege_montant_inscription_annee_etude_fkey FOREIGN KEY (annee_etude) REFERENCES okapicollege_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_montant_inscription_statut_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_montant_inscription
    ADD CONSTRAINT okapicollege_montant_inscription_statut_fkey FOREIGN KEY (statut) REFERENCES okapicollege_nomenclature_statut(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_montant_inscription_zone_de_pays_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_montant_inscription
    ADD CONSTRAINT okapicollege_montant_inscription_zone_de_pays_fkey FOREIGN KEY (zone_de_pays) REFERENCES okapicollege_nomenclature_zone(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_note_annee_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_note
    ADD CONSTRAINT okapicollege_note_annee_academique_fkey FOREIGN KEY (annee_academique) REFERENCES okapicollege_annee_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_note_ecue_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_note
    ADD CONSTRAINT okapicollege_note_ecue_fkey FOREIGN KEY (ecue) REFERENCES okapicollege_ecue(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_note_etudiant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_note
    ADD CONSTRAINT okapicollege_note_etudiant_fkey FOREIGN KEY (etudiant) REFERENCES okapicollege_etudiant(matricule) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_pays_zone_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_pays
    ADD CONSTRAINT okapicollege_pays_zone_fkey FOREIGN KEY (zone) REFERENCES okapicollege_nomenclature_zone(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_profession_secteur_activite_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_profession
    ADD CONSTRAINT okapicollege_profession_secteur_activite_fkey FOREIGN KEY (secteur_activite) REFERENCES okapicollege_nomenclature_secteur_activite(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_programme_annee_academique_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_programme
    ADD CONSTRAINT okapicollege_programme_annee_academique_fkey FOREIGN KEY (annee_academique) REFERENCES okapicollege_annee_academique(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_programme_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_programme
    ADD CONSTRAINT okapicollege_programme_annee_etude_fkey FOREIGN KEY (annee_etude) REFERENCES okapicollege_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_programme_curriculum_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_programme
    ADD CONSTRAINT okapicollege_programme_curriculum_fkey FOREIGN KEY (curriculum) REFERENCES okapicollege_curriculum(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_rdv_salle_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_rdv
    ADD CONSTRAINT okapicollege_rdv_salle_fkey FOREIGN KEY (salle) REFERENCES okapicollege_salle(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_ressource_salle_ressource_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_ressource_salle
    ADD CONSTRAINT okapicollege_ressource_salle_ressource_fkey FOREIGN KEY (ressource) REFERENCES okapicollege_nomenclature_ressource(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_ressource_salle_salle_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_ressource_salle
    ADD CONSTRAINT okapicollege_ressource_salle_salle_fkey FOREIGN KEY (salle) REFERENCES okapicollege_salle(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_salle_etablissement_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_salle
    ADD CONSTRAINT okapicollege_salle_etablissement_fkey FOREIGN KEY (etablissement) REFERENCES okapicollege_etablissement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_sanction_etudiant_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_sanction
    ADD CONSTRAINT okapicollege_sanction_etudiant_fkey FOREIGN KEY (etudiant) REFERENCES okapicollege_etudiant(matricule) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_souscription_module_cours_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_souscription_module_cours
    ADD CONSTRAINT okapicollege_souscription_module_cours_annee_etude_fkey FOREIGN KEY (annee_etude) REFERENCES okapicollege_annee_etude(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_souscription_module_cours_module_cours_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_souscription_module_cours
    ADD CONSTRAINT okapicollege_souscription_module_cours_module_cours_fkey FOREIGN KEY (module_cours) REFERENCES okapicollege_nomenclature_module_cours(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_type_autorisation_autorite_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_type_autorisation
    ADD CONSTRAINT okapicollege_type_autorisation_autorite_fkey FOREIGN KEY (autorite) REFERENCES okapicollege_nomenclature_autorite(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_unite_enseigneme_inscription_dans_annee_etude_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_unite_enseignement_au_choix
    ADD CONSTRAINT okapicollege_unite_enseigneme_inscription_dans_annee_etude_fkey FOREIGN KEY (inscription_dans_annee_etude) REFERENCES okapicollege_inscription_dans_annee_etude(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_unite_enseignement_au_choi_unite_enseignement_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_unite_enseignement_au_choix
    ADD CONSTRAINT okapicollege_unite_enseignement_au_choi_unite_enseignement_fkey FOREIGN KEY (unite_enseignement) REFERENCES okapicollege_unite_enseignement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_unite_enseignement_categorie_enseignement_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_unite_enseignement
    ADD CONSTRAINT okapicollege_unite_enseignement_categorie_enseignement_fkey FOREIGN KEY (categorie_enseignement) REFERENCES okapicollege_nomenclature_categorie_enseignement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: okapicollege_unite_enseignement_entite_gestionnaire_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY okapicollege_unite_enseignement
    ADD CONSTRAINT okapicollege_unite_enseignement_entite_gestionnaire_fkey FOREIGN KEY (entite_gestionnaire) REFERENCES okapicollege_departement(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: relation_entre_module_relation_entre_module_amont_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_relation_entre_module
    ADD CONSTRAINT relation_entre_module_relation_entre_module_amont_fkey FOREIGN KEY (amont) REFERENCES ok_module(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: relation_entre_module_relation_entre_module_aval_fkey; Type: FK CONSTRAINT; Schema: okapicollege; Owner: postgres
--

ALTER TABLE ONLY ok_relation_entre_module
    ADD CONSTRAINT relation_entre_module_relation_entre_module_aval_fkey FOREIGN KEY (aval) REFERENCES ok_module(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: annee_etude; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE annee_etude FROM PUBLIC;
REVOKE ALL ON TABLE annee_etude FROM postgres;
GRANT ALL ON TABLE annee_etude TO postgres;
GRANT ALL ON TABLE annee_etude TO okapicollege;


--
-- Name: audit_basic; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE audit_basic FROM PUBLIC;
REVOKE ALL ON TABLE audit_basic FROM postgres;
GRANT ALL ON TABLE audit_basic TO postgres;
GRANT ALL ON TABLE audit_basic TO okapicollege;


--
-- Name: comptabilite; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE comptabilite FROM PUBLIC;
REVOKE ALL ON TABLE comptabilite FROM postgres;
GRANT ALL ON TABLE comptabilite TO postgres;
GRANT ALL ON TABLE comptabilite TO okapicollege;


--
-- Name: etudiant_date_naissance_null; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE etudiant_date_naissance_null FROM PUBLIC;
REVOKE ALL ON TABLE etudiant_date_naissance_null FROM postgres;
GRANT ALL ON TABLE etudiant_date_naissance_null TO postgres;
GRANT ALL ON TABLE etudiant_date_naissance_null TO okapicollege;


--
-- Name: hierachie_entite; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE hierachie_entite FROM PUBLIC;
REVOKE ALL ON TABLE hierachie_entite FROM postgres;
GRANT ALL ON TABLE hierachie_entite TO postgres;
GRANT ALL ON TABLE hierachie_entite TO okapicollege;


--
-- Name: history_comptabilite; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE history_comptabilite FROM PUBLIC;
REVOKE ALL ON TABLE history_comptabilite FROM postgres;
GRANT ALL ON TABLE history_comptabilite TO postgres;
GRANT ALL ON TABLE history_comptabilite TO okapicollege;


--
-- Name: history_decision_jury; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE history_decision_jury FROM PUBLIC;
REVOKE ALL ON TABLE history_decision_jury FROM postgres;
GRANT ALL ON TABLE history_decision_jury TO postgres;
GRANT ALL ON TABLE history_decision_jury TO okapicollege;


--
-- Name: history_montant_inscription; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE history_montant_inscription FROM PUBLIC;
REVOKE ALL ON TABLE history_montant_inscription FROM postgres;
GRANT ALL ON TABLE history_montant_inscription TO postgres;
GRANT ALL ON TABLE history_montant_inscription TO okapicollege;


--
-- Name: history_note; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE history_note FROM PUBLIC;
REVOKE ALL ON TABLE history_note FROM postgres;
GRANT ALL ON TABLE history_note TO postgres;
GRANT ALL ON TABLE history_note TO okapicollege;


--
-- Name: id_val_er; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE id_val_er FROM PUBLIC;
REVOKE ALL ON TABLE id_val_er FROM postgres;
GRANT ALL ON TABLE id_val_er TO postgres;
GRANT ALL ON TABLE id_val_er TO okapicollege;


--
-- Name: join_annee_etude2annee_etude; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_annee_etude2annee_etude FROM PUBLIC;
REVOKE ALL ON TABLE join_annee_etude2annee_etude FROM postgres;
GRANT ALL ON TABLE join_annee_etude2annee_etude TO postgres;
GRANT ALL ON TABLE join_annee_etude2annee_etude TO okapicollege;


--
-- Name: join_annee_etude2type_bac_interdit; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_annee_etude2type_bac_interdit FROM PUBLIC;
REVOKE ALL ON TABLE join_annee_etude2type_bac_interdit FROM postgres;
GRANT ALL ON TABLE join_annee_etude2type_bac_interdit TO postgres;
GRANT ALL ON TABLE join_annee_etude2type_bac_interdit TO okapicollege;


--
-- Name: join_annee_etude_2curriculum; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_annee_etude_2curriculum FROM PUBLIC;
REVOKE ALL ON TABLE join_annee_etude_2curriculum FROM postgres;
GRANT ALL ON TABLE join_annee_etude_2curriculum TO postgres;
GRANT ALL ON TABLE join_annee_etude_2curriculum TO okapicollege;


--
-- Name: join_autorisation2organisme; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_autorisation2organisme FROM PUBLIC;
REVOKE ALL ON TABLE join_autorisation2organisme FROM postgres;
GRANT ALL ON TABLE join_autorisation2organisme TO postgres;
GRANT ALL ON TABLE join_autorisation2organisme TO okapicollege;


--
-- Name: join_code_pre_inscription2type_bac; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_code_pre_inscription2type_bac FROM PUBLIC;
REVOKE ALL ON TABLE join_code_pre_inscription2type_bac FROM postgres;
GRANT ALL ON TABLE join_code_pre_inscription2type_bac TO postgres;
GRANT ALL ON TABLE join_code_pre_inscription2type_bac TO okapicollege;


--
-- Name: join_cours_pondere2module_cours; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_cours_pondere2module_cours FROM PUBLIC;
REVOKE ALL ON TABLE join_cours_pondere2module_cours FROM postgres;
GRANT ALL ON TABLE join_cours_pondere2module_cours TO postgres;
GRANT ALL ON TABLE join_cours_pondere2module_cours TO okapicollege;


--
-- Name: join_curriculum2unite_enseignement; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_curriculum2unite_enseignement FROM PUBLIC;
REVOKE ALL ON TABLE join_curriculum2unite_enseignement FROM postgres;
GRANT ALL ON TABLE join_curriculum2unite_enseignement TO postgres;
GRANT ALL ON TABLE join_curriculum2unite_enseignement TO okapicollege;


--
-- Name: join_ecue2gestionnaire; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_ecue2gestionnaire FROM PUBLIC;
REVOKE ALL ON TABLE join_ecue2gestionnaire FROM postgres;
GRANT ALL ON TABLE join_ecue2gestionnaire TO postgres;
GRANT ALL ON TABLE join_ecue2gestionnaire TO okapicollege;


--
-- Name: join_enseignant2ecue; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_enseignant2ecue FROM PUBLIC;
REVOKE ALL ON TABLE join_enseignant2ecue FROM postgres;
GRANT ALL ON TABLE join_enseignant2ecue TO postgres;
GRANT ALL ON TABLE join_enseignant2ecue TO okapicollege;


--
-- Name: join_etablissement2domaine; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_etablissement2domaine FROM PUBLIC;
REVOKE ALL ON TABLE join_etablissement2domaine FROM postgres;
GRANT ALL ON TABLE join_etablissement2domaine TO postgres;
GRANT ALL ON TABLE join_etablissement2domaine TO okapicollege;


--
-- Name: join_inscription_dans_annee_etude2cours_pondere; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_inscription_dans_annee_etude2cours_pondere FROM PUBLIC;
REVOKE ALL ON TABLE join_inscription_dans_annee_etude2cours_pondere FROM postgres;
GRANT ALL ON TABLE join_inscription_dans_annee_etude2cours_pondere TO postgres;
GRANT ALL ON TABLE join_inscription_dans_annee_etude2cours_pondere TO okapicollege;


--
-- Name: join_mention2domaine; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_mention2domaine FROM PUBLIC;
REVOKE ALL ON TABLE join_mention2domaine FROM postgres;
GRANT ALL ON TABLE join_mention2domaine TO postgres;
GRANT ALL ON TABLE join_mention2domaine TO okapicollege;


--
-- Name: join_module2role_ecriture; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_module2role_ecriture FROM PUBLIC;
REVOKE ALL ON TABLE join_module2role_ecriture FROM postgres;
GRANT ALL ON TABLE join_module2role_ecriture TO postgres;
GRANT ALL ON TABLE join_module2role_ecriture TO okapicollege;


--
-- Name: join_module2role_lecture; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_module2role_lecture FROM PUBLIC;
REVOKE ALL ON TABLE join_module2role_lecture FROM postgres;
GRANT ALL ON TABLE join_module2role_lecture TO postgres;
GRANT ALL ON TABLE join_module2role_lecture TO okapicollege;


--
-- Name: join_programme2curriculums; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_programme2curriculums FROM PUBLIC;
REVOKE ALL ON TABLE join_programme2curriculums FROM postgres;
GRANT ALL ON TABLE join_programme2curriculums TO postgres;
GRANT ALL ON TABLE join_programme2curriculums TO okapicollege;


--
-- Name: join_unite_enseignement2ecue; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_unite_enseignement2ecue FROM PUBLIC;
REVOKE ALL ON TABLE join_unite_enseignement2ecue FROM postgres;
GRANT ALL ON TABLE join_unite_enseignement2ecue TO postgres;
GRANT ALL ON TABLE join_unite_enseignement2ecue TO okapicollege;


--
-- Name: join_utilisateur2role; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE join_utilisateur2role FROM PUBLIC;
REVOKE ALL ON TABLE join_utilisateur2role FROM postgres;
GRANT ALL ON TABLE join_utilisateur2role TO postgres;
GRANT ALL ON TABLE join_utilisateur2role TO okapicollege;


--
-- Name: liste_comptabilite_inscription; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE liste_comptabilite_inscription FROM PUBLIC;
REVOKE ALL ON TABLE liste_comptabilite_inscription FROM postgres;
GRANT ALL ON TABLE liste_comptabilite_inscription TO postgres;
GRANT ALL ON TABLE liste_comptabilite_inscription TO okapicollege;


--
-- Name: liste_etudiant2015_2016; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE liste_etudiant2015_2016 FROM PUBLIC;
REVOKE ALL ON TABLE liste_etudiant2015_2016 FROM postgres;
GRANT ALL ON TABLE liste_etudiant2015_2016 TO postgres;
GRANT ALL ON TABLE liste_etudiant2015_2016 TO okapicollege;


--
-- Name: liste_inscription2015_2016; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE liste_inscription2015_2016 FROM PUBLIC;
REVOKE ALL ON TABLE liste_inscription2015_2016 FROM postgres;
GRANT ALL ON TABLE liste_inscription2015_2016 TO postgres;
GRANT ALL ON TABLE liste_inscription2015_2016 TO okapicollege;


--
-- Name: liste_resultat2014_2015; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE liste_resultat2014_2015 FROM PUBLIC;
REVOKE ALL ON TABLE liste_resultat2014_2015 FROM postgres;
GRANT ALL ON TABLE liste_resultat2014_2015 TO postgres;
GRANT ALL ON TABLE liste_resultat2014_2015 TO okapicollege;


--
-- Name: liste_resultat2015_2016; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE liste_resultat2015_2016 FROM PUBLIC;
REVOKE ALL ON TABLE liste_resultat2015_2016 FROM postgres;
GRANT ALL ON TABLE liste_resultat2015_2016 TO postgres;
GRANT ALL ON TABLE liste_resultat2015_2016 TO okapicollege;


--
-- Name: mention; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE mention FROM PUBLIC;
REVOKE ALL ON TABLE mention FROM postgres;
GRANT ALL ON TABLE mention TO postgres;
GRANT ALL ON TABLE mention TO okapicollege;


--
-- Name: ok_annee_academique; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_annee_academique FROM PUBLIC;
REVOKE ALL ON TABLE ok_annee_academique FROM postgres;
GRANT ALL ON TABLE ok_annee_academique TO postgres;
GRANT ALL ON TABLE ok_annee_academique TO okapicollege;


--
-- Name: ok_annee_etude; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_annee_etude FROM PUBLIC;
REVOKE ALL ON TABLE ok_annee_etude FROM postgres;
GRANT ALL ON TABLE ok_annee_etude TO postgres;
GRANT ALL ON TABLE ok_annee_etude TO okapicollege;


--
-- Name: ok_annee_etude_2_type_bac_interdit; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_annee_etude_2_type_bac_interdit FROM PUBLIC;
REVOKE ALL ON TABLE ok_annee_etude_2_type_bac_interdit FROM postgres;
GRANT ALL ON TABLE ok_annee_etude_2_type_bac_interdit TO postgres;
GRANT ALL ON TABLE ok_annee_etude_2_type_bac_interdit TO okapicollege;


--
-- Name: ok_annee_etude_amont_2_annee_etude_aval; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_annee_etude_amont_2_annee_etude_aval FROM PUBLIC;
REVOKE ALL ON TABLE ok_annee_etude_amont_2_annee_etude_aval FROM postgres;
GRANT ALL ON TABLE ok_annee_etude_amont_2_annee_etude_aval TO postgres;
GRANT ALL ON TABLE ok_annee_etude_amont_2_annee_etude_aval TO okapicollege;


--
-- Name: ok_bac; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_bac FROM PUBLIC;
REVOKE ALL ON TABLE ok_bac FROM postgres;
GRANT ALL ON TABLE ok_bac TO postgres;
GRANT ALL ON TABLE ok_bac TO okapicollege;


--
-- Name: ok_classeur; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_classeur FROM PUBLIC;
REVOKE ALL ON TABLE ok_classeur FROM postgres;
GRANT ALL ON TABLE ok_classeur TO postgres;
GRANT ALL ON TABLE ok_classeur TO okapicollege;


--
-- Name: ok_commissaire; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_commissaire FROM PUBLIC;
REVOKE ALL ON TABLE ok_commissaire FROM postgres;
GRANT ALL ON TABLE ok_commissaire TO postgres;
GRANT ALL ON TABLE ok_commissaire TO okapicollege;


--
-- Name: ok_commission; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_commission FROM PUBLIC;
REVOKE ALL ON TABLE ok_commission FROM postgres;
GRANT ALL ON TABLE ok_commission TO postgres;
GRANT ALL ON TABLE ok_commission TO okapicollege;


--
-- Name: ok_commission_2_commissaire; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_commission_2_commissaire FROM PUBLIC;
REVOKE ALL ON TABLE ok_commission_2_commissaire FROM postgres;
GRANT ALL ON TABLE ok_commission_2_commissaire TO postgres;
GRANT ALL ON TABLE ok_commission_2_commissaire TO okapicollege;


--
-- Name: ok_comptabilite; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_comptabilite FROM PUBLIC;
REVOKE ALL ON TABLE ok_comptabilite FROM postgres;
GRANT ALL ON TABLE ok_comptabilite TO postgres;
GRANT ALL ON TABLE ok_comptabilite TO okapicollege;


--
-- Name: ok_ecue; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_ecue FROM PUBLIC;
REVOKE ALL ON TABLE ok_ecue FROM postgres;
GRANT ALL ON TABLE ok_ecue TO postgres;
GRANT ALL ON TABLE ok_ecue TO okapicollege;


--
-- Name: ok_ecue_2_utilisateur; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_ecue_2_utilisateur FROM PUBLIC;
REVOKE ALL ON TABLE ok_ecue_2_utilisateur FROM postgres;
GRANT ALL ON TABLE ok_ecue_2_utilisateur TO postgres;
GRANT ALL ON TABLE ok_ecue_2_utilisateur TO okapicollege;


--
-- Name: ok_entite_academique; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_entite_academique FROM PUBLIC;
REVOKE ALL ON TABLE ok_entite_academique FROM postgres;
GRANT ALL ON TABLE ok_entite_academique TO postgres;
GRANT ALL ON TABLE ok_entite_academique TO okapicollege;


--
-- Name: ok_etudiant; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_etudiant FROM PUBLIC;
REVOKE ALL ON TABLE ok_etudiant FROM postgres;
GRANT ALL ON TABLE ok_etudiant TO postgres;
GRANT ALL ON TABLE ok_etudiant TO okapicollege;


--
-- Name: ok_exoneration; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_exoneration FROM PUBLIC;
REVOKE ALL ON TABLE ok_exoneration FROM postgres;
GRANT ALL ON TABLE ok_exoneration TO postgres;
GRANT ALL ON TABLE ok_exoneration TO okapicollege;


--
-- Name: ok_fiche_banque; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_fiche_banque FROM PUBLIC;
REVOKE ALL ON TABLE ok_fiche_banque FROM postgres;
GRANT ALL ON TABLE ok_fiche_banque TO postgres;
GRANT ALL ON TABLE ok_fiche_banque TO okapicollege;


--
-- Name: ok_frais; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_frais FROM PUBLIC;
REVOKE ALL ON TABLE ok_frais FROM postgres;
GRANT ALL ON TABLE ok_frais TO postgres;
GRANT ALL ON TABLE ok_frais TO okapicollege;


--
-- Name: ok_inscription; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_inscription FROM PUBLIC;
REVOKE ALL ON TABLE ok_inscription FROM postgres;
GRANT ALL ON TABLE ok_inscription TO postgres;
GRANT ALL ON TABLE ok_inscription TO okapicollege;


--
-- Name: ok_module; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_module FROM PUBLIC;
REVOKE ALL ON TABLE ok_module FROM postgres;
GRANT ALL ON TABLE ok_module TO postgres;
GRANT ALL ON TABLE ok_module TO okapicollege;


--
-- Name: ok_module_2_unite_enseignement; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_module_2_unite_enseignement FROM PUBLIC;
REVOKE ALL ON TABLE ok_module_2_unite_enseignement FROM postgres;
GRANT ALL ON TABLE ok_module_2_unite_enseignement TO postgres;
GRANT ALL ON TABLE ok_module_2_unite_enseignement TO okapicollege;


--
-- Name: ok_nomenclature_role; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_nomenclature_role FROM PUBLIC;
REVOKE ALL ON TABLE ok_nomenclature_role FROM postgres;
GRANT ALL ON TABLE ok_nomenclature_role TO postgres;
GRANT ALL ON TABLE ok_nomenclature_role TO okapicollege;


--
-- Name: ok_note; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_note FROM PUBLIC;
REVOKE ALL ON TABLE ok_note FROM postgres;
GRANT ALL ON TABLE ok_note TO postgres;
GRANT ALL ON TABLE ok_note TO okapicollege;


--
-- Name: ok_pays; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_pays FROM PUBLIC;
REVOKE ALL ON TABLE ok_pays FROM postgres;
GRANT ALL ON TABLE ok_pays TO postgres;
GRANT ALL ON TABLE ok_pays TO okapicollege;


--
-- Name: ok_profession; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_profession FROM PUBLIC;
REVOKE ALL ON TABLE ok_profession FROM postgres;
GRANT ALL ON TABLE ok_profession TO postgres;
GRANT ALL ON TABLE ok_profession TO okapicollege;


--
-- Name: ok_programme; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_programme FROM PUBLIC;
REVOKE ALL ON TABLE ok_programme FROM postgres;
GRANT ALL ON TABLE ok_programme TO postgres;
GRANT ALL ON TABLE ok_programme TO okapicollege;


--
-- Name: ok_programme_2_module; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_programme_2_module FROM PUBLIC;
REVOKE ALL ON TABLE ok_programme_2_module FROM postgres;
GRANT ALL ON TABLE ok_programme_2_module TO postgres;
GRANT ALL ON TABLE ok_programme_2_module TO okapicollege;


--
-- Name: ok_programme_au_choix; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_programme_au_choix FROM PUBLIC;
REVOKE ALL ON TABLE ok_programme_au_choix FROM postgres;
GRANT ALL ON TABLE ok_programme_au_choix TO postgres;
GRANT ALL ON TABLE ok_programme_au_choix TO okapicollege;


--
-- Name: ok_programme_au_choix_2_ecue; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_programme_au_choix_2_ecue FROM PUBLIC;
REVOKE ALL ON TABLE ok_programme_au_choix_2_ecue FROM postgres;
GRANT ALL ON TABLE ok_programme_au_choix_2_ecue TO postgres;
GRANT ALL ON TABLE ok_programme_au_choix_2_ecue TO okapicollege;


--
-- Name: ok_relation_entre_module; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_relation_entre_module FROM PUBLIC;
REVOKE ALL ON TABLE ok_relation_entre_module FROM postgres;
GRANT ALL ON TABLE ok_relation_entre_module TO postgres;
GRANT ALL ON TABLE ok_relation_entre_module TO okapicollege;


--
-- Name: ok_sanction; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_sanction FROM PUBLIC;
REVOKE ALL ON TABLE ok_sanction FROM postgres;
GRANT ALL ON TABLE ok_sanction TO postgres;
GRANT ALL ON TABLE ok_sanction TO okapicollege;


--
-- Name: ok_statut; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_statut FROM PUBLIC;
REVOKE ALL ON TABLE ok_statut FROM postgres;
GRANT ALL ON TABLE ok_statut TO postgres;
GRANT ALL ON TABLE ok_statut TO okapicollege;


--
-- Name: ok_type_autorisation; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_type_autorisation FROM PUBLIC;
REVOKE ALL ON TABLE ok_type_autorisation FROM postgres;
GRANT ALL ON TABLE ok_type_autorisation TO postgres;
GRANT ALL ON TABLE ok_type_autorisation TO okapicollege;


--
-- Name: ok_type_bac; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_type_bac FROM PUBLIC;
REVOKE ALL ON TABLE ok_type_bac FROM postgres;
GRANT ALL ON TABLE ok_type_bac TO postgres;
GRANT ALL ON TABLE ok_type_bac TO okapicollege;


--
-- Name: ok_unite_enseignement; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_unite_enseignement FROM PUBLIC;
REVOKE ALL ON TABLE ok_unite_enseignement FROM postgres;
GRANT ALL ON TABLE ok_unite_enseignement TO postgres;
GRANT ALL ON TABLE ok_unite_enseignement TO okapicollege;


--
-- Name: ok_unite_enseignement_2_ecue; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_unite_enseignement_2_ecue FROM PUBLIC;
REVOKE ALL ON TABLE ok_unite_enseignement_2_ecue FROM postgres;
GRANT ALL ON TABLE ok_unite_enseignement_2_ecue TO postgres;
GRANT ALL ON TABLE ok_unite_enseignement_2_ecue TO okapicollege;


--
-- Name: ok_utilisateur; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_utilisateur FROM PUBLIC;
REVOKE ALL ON TABLE ok_utilisateur FROM postgres;
GRANT ALL ON TABLE ok_utilisateur TO postgres;
GRANT ALL ON TABLE ok_utilisateur TO okapicollege;


--
-- Name: ok_utilisateur_2_nomenclature_role; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_utilisateur_2_nomenclature_role FROM PUBLIC;
REVOKE ALL ON TABLE ok_utilisateur_2_nomenclature_role FROM postgres;
GRANT ALL ON TABLE ok_utilisateur_2_nomenclature_role TO postgres;
GRANT ALL ON TABLE ok_utilisateur_2_nomenclature_role TO okapicollege;


--
-- Name: ok_verdict; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE ok_verdict FROM PUBLIC;
REVOKE ALL ON TABLE ok_verdict FROM postgres;
GRANT ALL ON TABLE ok_verdict TO postgres;
GRANT ALL ON TABLE ok_verdict TO okapicollege;


--
-- Name: okapicollege_annee_academique; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_annee_academique FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_annee_academique FROM postgres;
GRANT ALL ON TABLE okapicollege_annee_academique TO postgres;
GRANT ALL ON TABLE okapicollege_annee_academique TO okapicollege;


--
-- Name: okapicollege_annee_etude; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_annee_etude FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_annee_etude FROM postgres;
GRANT ALL ON TABLE okapicollege_annee_etude TO postgres;
GRANT ALL ON TABLE okapicollege_annee_etude TO okapicollege;


--
-- Name: okapicollege_autorisation; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_autorisation FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_autorisation FROM postgres;
GRANT ALL ON TABLE okapicollege_autorisation TO postgres;
GRANT ALL ON TABLE okapicollege_autorisation TO okapicollege;


--
-- Name: okapicollege_bac; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_bac FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_bac FROM postgres;
GRANT ALL ON TABLE okapicollege_bac TO postgres;
GRANT ALL ON TABLE okapicollege_bac TO okapicollege;


--
-- Name: okapicollege_bacBis; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE "okapicollege_bacBis" FROM PUBLIC;
REVOKE ALL ON TABLE "okapicollege_bacBis" FROM postgres;
GRANT ALL ON TABLE "okapicollege_bacBis" TO postgres;
GRANT ALL ON TABLE "okapicollege_bacBis" TO okapicollege;


--
-- Name: okapicollege_classeur; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_classeur FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_classeur FROM postgres;
GRANT ALL ON TABLE okapicollege_classeur TO postgres;
GRANT ALL ON TABLE okapicollege_classeur TO okapicollege;


--
-- Name: okapicollege_code_pre_inscription; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_code_pre_inscription FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_code_pre_inscription FROM postgres;
GRANT ALL ON TABLE okapicollege_code_pre_inscription TO postgres;
GRANT ALL ON TABLE okapicollege_code_pre_inscription TO okapicollege;


--
-- Name: okapicollege_comptabilite; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_comptabilite FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_comptabilite FROM postgres;
GRANT ALL ON TABLE okapicollege_comptabilite TO postgres;
GRANT ALL ON TABLE okapicollege_comptabilite TO okapicollege;


--
-- Name: okapicollege_cours; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_cours FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_cours FROM postgres;
GRANT ALL ON TABLE okapicollege_cours TO postgres;
GRANT ALL ON TABLE okapicollege_cours TO okapicollege;


--
-- Name: okapicollege_cours_pondere; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_cours_pondere FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_cours_pondere FROM postgres;
GRANT ALL ON TABLE okapicollege_cours_pondere TO postgres;
GRANT ALL ON TABLE okapicollege_cours_pondere TO okapicollege;


--
-- Name: okapicollege_curriculum; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_curriculum FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_curriculum FROM postgres;
GRANT ALL ON TABLE okapicollege_curriculum TO postgres;
GRANT ALL ON TABLE okapicollege_curriculum TO okapicollege;


--
-- Name: okapicollege_decision_jury; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_decision_jury FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_decision_jury FROM postgres;
GRANT ALL ON TABLE okapicollege_decision_jury TO postgres;
GRANT ALL ON TABLE okapicollege_decision_jury TO okapicollege;


--
-- Name: okapicollege_departement; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_departement FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_departement FROM postgres;
GRANT ALL ON TABLE okapicollege_departement TO postgres;
GRANT ALL ON TABLE okapicollege_departement TO okapicollege;


--
-- Name: okapicollege_diplome; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_diplome FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_diplome FROM postgres;
GRANT ALL ON TABLE okapicollege_diplome TO postgres;
GRANT ALL ON TABLE okapicollege_diplome TO okapicollege;


--
-- Name: okapicollege_document; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_document FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_document FROM postgres;
GRANT ALL ON TABLE okapicollege_document TO postgres;
GRANT ALL ON TABLE okapicollege_document TO okapicollege;


--
-- Name: okapicollege_ecue; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_ecue FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_ecue FROM postgres;
GRANT ALL ON TABLE okapicollege_ecue TO postgres;
GRANT ALL ON TABLE okapicollege_ecue TO okapicollege;


--
-- Name: okapicollege_ecue_au_choix; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_ecue_au_choix FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_ecue_au_choix FROM postgres;
GRANT ALL ON TABLE okapicollege_ecue_au_choix TO postgres;
GRANT ALL ON TABLE okapicollege_ecue_au_choix TO okapicollege;


--
-- Name: okapicollege_etablissement; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_etablissement FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_etablissement FROM postgres;
GRANT ALL ON TABLE okapicollege_etablissement TO postgres;
GRANT ALL ON TABLE okapicollege_etablissement TO okapicollege;


--
-- Name: okapicollege_etudiant; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_etudiant FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_etudiant FROM postgres;
GRANT ALL ON TABLE okapicollege_etudiant TO postgres;
GRANT ALL ON TABLE okapicollege_etudiant TO okapicollege;


--
-- Name: okapicollege_exoneration; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_exoneration FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_exoneration FROM postgres;
GRANT ALL ON TABLE okapicollege_exoneration TO postgres;
GRANT ALL ON TABLE okapicollege_exoneration TO okapicollege;


--
-- Name: okapicollege_fiche_banque; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_fiche_banque FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_fiche_banque FROM postgres;
GRANT ALL ON TABLE okapicollege_fiche_banque TO postgres;
GRANT ALL ON TABLE okapicollege_fiche_banque TO okapicollege;


--
-- Name: okapicollege_generateur_sequence_cpi; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_generateur_sequence_cpi FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_generateur_sequence_cpi FROM postgres;
GRANT ALL ON TABLE okapicollege_generateur_sequence_cpi TO postgres;
GRANT ALL ON TABLE okapicollege_generateur_sequence_cpi TO okapicollege;


--
-- Name: okapicollege_generateur_sequence_matricule; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_generateur_sequence_matricule FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_generateur_sequence_matricule FROM postgres;
GRANT ALL ON TABLE okapicollege_generateur_sequence_matricule TO postgres;
GRANT ALL ON TABLE okapicollege_generateur_sequence_matricule TO okapicollege;


--
-- Name: okapicollege_generateur_sequence_uid; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_generateur_sequence_uid FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_generateur_sequence_uid FROM postgres;
GRANT ALL ON TABLE okapicollege_generateur_sequence_uid TO postgres;
GRANT ALL ON TABLE okapicollege_generateur_sequence_uid TO okapicollege;


--
-- Name: okapicollege_horaire; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_horaire FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_horaire FROM postgres;
GRANT ALL ON TABLE okapicollege_horaire TO postgres;
GRANT ALL ON TABLE okapicollege_horaire TO okapicollege;


--
-- Name: okapicollege_inscription_au_cours_pondere; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_inscription_au_cours_pondere FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_inscription_au_cours_pondere FROM postgres;
GRANT ALL ON TABLE okapicollege_inscription_au_cours_pondere TO postgres;
GRANT ALL ON TABLE okapicollege_inscription_au_cours_pondere TO okapicollege;


--
-- Name: okapicollege_inscription_dans_annee_etude; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_inscription_dans_annee_etude FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_inscription_dans_annee_etude FROM postgres;
GRANT ALL ON TABLE okapicollege_inscription_dans_annee_etude TO postgres;
GRANT ALL ON TABLE okapicollege_inscription_dans_annee_etude TO okapicollege;


--
-- Name: okapicollege_mention; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_mention FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_mention FROM postgres;
GRANT ALL ON TABLE okapicollege_mention TO postgres;
GRANT ALL ON TABLE okapicollege_mention TO okapicollege;


--
-- Name: okapicollege_montant_inscription; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_montant_inscription FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_montant_inscription FROM postgres;
GRANT ALL ON TABLE okapicollege_montant_inscription TO postgres;
GRANT ALL ON TABLE okapicollege_montant_inscription TO okapicollege;


--
-- Name: okapicollege_nomenclature_autorite; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_autorite FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_autorite FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_autorite TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_autorite TO okapicollege;


--
-- Name: okapicollege_nomenclature_categorie_enseignement; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_categorie_enseignement FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_categorie_enseignement FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_categorie_enseignement TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_categorie_enseignement TO okapicollege;


--
-- Name: okapicollege_nomenclature_categorie_etudiant; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_categorie_etudiant FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_categorie_etudiant FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_categorie_etudiant TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_categorie_etudiant TO okapicollege;


--
-- Name: okapicollege_nomenclature_cycle; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_cycle FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_cycle FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_cycle TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_cycle TO okapicollege;


--
-- Name: okapicollege_nomenclature_departement_geo; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_departement_geo FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_departement_geo FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_departement_geo TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_departement_geo TO okapicollege;


--
-- Name: okapicollege_nomenclature_diplome; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_diplome FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_diplome FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_diplome TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_diplome TO okapicollege;


--
-- Name: okapicollege_nomenclature_document; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_document FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_document FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_document TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_document TO okapicollege;


--
-- Name: okapicollege_nomenclature_domaine; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_domaine FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_domaine FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_domaine TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_domaine TO okapicollege;


--
-- Name: okapicollege_nomenclature_etat; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_etat FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_etat FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_etat TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_etat TO okapicollege;


--
-- Name: okapicollege_nomenclature_grade; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_grade FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_grade FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_grade TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_grade TO okapicollege;


--
-- Name: okapicollege_nomenclature_img_format; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_img_format FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_img_format FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_img_format TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_img_format TO okapicollege;


--
-- Name: okapicollege_nomenclature_module_cours; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_module_cours FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_module_cours FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_module_cours TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_module_cours TO okapicollege;


--
-- Name: okapicollege_nomenclature_module_privilege; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_module_privilege FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_module_privilege FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_module_privilege TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_module_privilege TO okapicollege;


--
-- Name: okapicollege_nomenclature_organisme; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_organisme FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_organisme FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_organisme TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_organisme TO okapicollege;


--
-- Name: okapicollege_nomenclature_ressource; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_ressource FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_ressource FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_ressource TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_ressource TO okapicollege;


--
-- Name: okapicollege_nomenclature_role; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_role FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_role FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_role TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_role TO okapicollege;


--
-- Name: okapicollege_nomenclature_secteur_activite; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_secteur_activite FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_secteur_activite FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_secteur_activite TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_secteur_activite TO okapicollege;


--
-- Name: okapicollege_nomenclature_statut; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_statut FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_statut FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_statut TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_statut TO okapicollege;


--
-- Name: okapicollege_nomenclature_type_bac; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_type_bac FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_type_bac FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_type_bac TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_type_bac TO okapicollege;


--
-- Name: okapicollege_nomenclature_type_formation; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_type_formation FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_type_formation FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_type_formation TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_type_formation TO okapicollege;


--
-- Name: okapicollege_nomenclature_verdict; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_verdict FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_verdict FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_verdict TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_verdict TO okapicollege;


--
-- Name: okapicollege_nomenclature_zone; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_nomenclature_zone FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_nomenclature_zone FROM postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_zone TO postgres;
GRANT ALL ON TABLE okapicollege_nomenclature_zone TO okapicollege;


--
-- Name: okapicollege_note; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_note FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_note FROM postgres;
GRANT ALL ON TABLE okapicollege_note TO postgres;
GRANT ALL ON TABLE okapicollege_note TO okapicollege;


--
-- Name: okapicollege_pays; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_pays FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_pays FROM postgres;
GRANT ALL ON TABLE okapicollege_pays TO postgres;
GRANT ALL ON TABLE okapicollege_pays TO okapicollege;


--
-- Name: okapicollege_profession; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_profession FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_profession FROM postgres;
GRANT ALL ON TABLE okapicollege_profession TO postgres;
GRANT ALL ON TABLE okapicollege_profession TO okapicollege;


--
-- Name: okapicollege_programme; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_programme FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_programme FROM postgres;
GRANT ALL ON TABLE okapicollege_programme TO postgres;
GRANT ALL ON TABLE okapicollege_programme TO okapicollege;


--
-- Name: okapicollege_propriete_application; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_propriete_application FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_propriete_application FROM postgres;
GRANT ALL ON TABLE okapicollege_propriete_application TO postgres;
GRANT ALL ON TABLE okapicollege_propriete_application TO okapicollege;


--
-- Name: okapicollege_rdv; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_rdv FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_rdv FROM postgres;
GRANT ALL ON TABLE okapicollege_rdv TO postgres;
GRANT ALL ON TABLE okapicollege_rdv TO okapicollege;


--
-- Name: okapicollege_ressource_salle; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_ressource_salle FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_ressource_salle FROM postgres;
GRANT ALL ON TABLE okapicollege_ressource_salle TO postgres;
GRANT ALL ON TABLE okapicollege_ressource_salle TO okapicollege;


--
-- Name: okapicollege_salle; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_salle FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_salle FROM postgres;
GRANT ALL ON TABLE okapicollege_salle TO postgres;
GRANT ALL ON TABLE okapicollege_salle TO okapicollege;


--
-- Name: okapicollege_sanction; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_sanction FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_sanction FROM postgres;
GRANT ALL ON TABLE okapicollege_sanction TO postgres;
GRANT ALL ON TABLE okapicollege_sanction TO okapicollege;


--
-- Name: okapicollege_souscription_module_cours; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_souscription_module_cours FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_souscription_module_cours FROM postgres;
GRANT ALL ON TABLE okapicollege_souscription_module_cours TO postgres;
GRANT ALL ON TABLE okapicollege_souscription_module_cours TO okapicollege;


--
-- Name: okapicollege_specialite; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_specialite FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_specialite FROM postgres;
GRANT ALL ON TABLE okapicollege_specialite TO postgres;
GRANT ALL ON TABLE okapicollege_specialite TO okapicollege;


--
-- Name: okapicollege_statut; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_statut FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_statut FROM postgres;
GRANT ALL ON TABLE okapicollege_statut TO postgres;
GRANT ALL ON TABLE okapicollege_statut TO okapicollege;


--
-- Name: okapicollege_type_autorisation; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_type_autorisation FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_type_autorisation FROM postgres;
GRANT ALL ON TABLE okapicollege_type_autorisation TO postgres;
GRANT ALL ON TABLE okapicollege_type_autorisation TO okapicollege;


--
-- Name: okapicollege_uid_number; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_uid_number FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_uid_number FROM postgres;
GRANT ALL ON TABLE okapicollege_uid_number TO postgres;
GRANT ALL ON TABLE okapicollege_uid_number TO okapicollege;


--
-- Name: okapicollege_unite_enseignement; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_unite_enseignement FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_unite_enseignement FROM postgres;
GRANT ALL ON TABLE okapicollege_unite_enseignement TO postgres;
GRANT ALL ON TABLE okapicollege_unite_enseignement TO okapicollege;


--
-- Name: okapicollege_unite_enseignement_au_choix; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_unite_enseignement_au_choix FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_unite_enseignement_au_choix FROM postgres;
GRANT ALL ON TABLE okapicollege_unite_enseignement_au_choix TO postgres;
GRANT ALL ON TABLE okapicollege_unite_enseignement_au_choix TO okapicollege;


--
-- Name: okapicollege_utilisateur; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE okapicollege_utilisateur FROM PUBLIC;
REVOKE ALL ON TABLE okapicollege_utilisateur FROM postgres;
GRANT ALL ON TABLE okapicollege_utilisateur TO postgres;
GRANT ALL ON TABLE okapicollege_utilisateur TO okapicollege;


--
-- Name: point_financier_par_etablissement; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE point_financier_par_etablissement FROM PUBLIC;
REVOKE ALL ON TABLE point_financier_par_etablissement FROM postgres;
GRANT ALL ON TABLE point_financier_par_etablissement TO postgres;
GRANT ALL ON TABLE point_financier_par_etablissement TO okapicollege;


--
-- Name: rh_generateur_sequence_cpi; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE rh_generateur_sequence_cpi FROM PUBLIC;
REVOKE ALL ON TABLE rh_generateur_sequence_cpi FROM postgres;
GRANT ALL ON TABLE rh_generateur_sequence_cpi TO postgres;
GRANT ALL ON TABLE rh_generateur_sequence_cpi TO okapicollege;


--
-- Name: specialite; Type: ACL; Schema: okapicollege; Owner: postgres
--

REVOKE ALL ON TABLE specialite FROM PUBLIC;
REVOKE ALL ON TABLE specialite FROM postgres;
GRANT ALL ON TABLE specialite TO postgres;
GRANT ALL ON TABLE specialite TO okapicollege;


--
-- PostgreSQL database dump complete
--

