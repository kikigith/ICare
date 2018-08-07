/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public class ConsultationEntite extends BaseBeanEntite implements Serializable {
    
    private String pouls;
    private String poids;
    private String temperature;
    private String taille;
    private String observations;
    private RendezVousMedicalEntite rdv;//O2O =>patient
    private Date dateConsultation=new Date();
//    private SpecialiteMedicaleEntite specialite;
//    private PatientEntite patient;
    private PraticienEntite praticien;
    private List<PoserDiagnosticEntite> lesDiagnostics=new ArrayList<>();
    private List<OrdonnanceMedicaleEntite> lesOrdonnances=new ArrayList<>();
    private List<ResultatExamenEntite> lesExamens=new ArrayList<>();

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }
    public String getPouls() {
        return pouls;
    }

    public void setPouls(String pouls) {
        this.pouls = pouls;
    }

    public String getPoids() {
        return poids;
    }

    public void setPoids(String poids) {
        this.poids = poids;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public String getTaille() {
        return taille;
    }

    public void setTaille(String taille) {
        this.taille = taille;
    }

    public PraticienEntite getPraticien() {
        return praticien;
    }

    public void setPraticien(PraticienEntite praticien) {
        this.praticien = praticien;
    }
    

    
    /**
     * @return the rdv
     */
    public RendezVousMedicalEntite getRdv() {
        return rdv;
    }

    /**
     * @param rdv the rdv to set
     */
    public void setRdv(RendezVousMedicalEntite rdv) {
        this.rdv = rdv;
    }

    /**
     * @return the dateConsultation
     */
    public Date getDateConsultation() {
        return dateConsultation;
    }

    /**
     * @param dateConsultation the dateConsultation to set
     */
    public void setDateConsultation(Date dateConsultation) {
        this.dateConsultation = dateConsultation;
    }

    /**
     * @return the specialite
     */
//    public SpecialiteMedicaleEntite getSpecialite() {
//        return specialite;
//    }
//
//    /**
//     * @param specialite the specialite to set
//     */
//    public void setSpecialite(SpecialiteMedicaleEntite specialite) {
//        this.specialite = specialite;
//    }

    /**
     * @return the lesDiagnostics
     */
    public List<PoserDiagnosticEntite> getLesDiagnostics() {
        return lesDiagnostics;
    }

    /**
     * @param lesDiagnostics the lesDiagnostics to set
     */
    public void setLesDiagnostics(List<PoserDiagnosticEntite> lesDiagnostics) {
        this.lesDiagnostics = lesDiagnostics;
    }

    /**
     * @return the lesOrdonnances
     */
    public List<OrdonnanceMedicaleEntite> getLesOrdonnances() {
        return lesOrdonnances;
    }

    /**
     * @param lesOrdonnances the lesOrdonnances to set
     */
    public void setLesOrdonnances(List<OrdonnanceMedicaleEntite> lesOrdonnances) {
        this.lesOrdonnances = lesOrdonnances;
    }

    /**
     * @return the lesExamens
     */
    public List<ResultatExamenEntite> getLesExamens() {
        return lesExamens;
    }

    /**
     * @param lesExamens the lesExamens to set
     */
    public void setLesExamens(List<ResultatExamenEntite> lesExamens) {
        this.lesExamens = lesExamens;
    }
    
    
    
    
}
