/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.io.Serializable;
import java.util.Date;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public class ResultatExamenEntite extends BaseBeanEntite implements Serializable{
    
    private String resultat;
    private String observation;
    private Date datePrescription;
    private String prescripteur;
    private Date dateRealisation;
    private String realisateur;
    
    private ConsultationEntite consultation;//M2O
    private ExamenMedicalEntite examen;//M2O

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    public Date getDatePrescription() {
        return datePrescription;
    }

    public void setDatePrescription(Date datePrescription) {
        this.datePrescription = datePrescription;
    }

    public String getPrescripteur() {
        return prescripteur;
    }

    public void setPrescripteur(String prescripteur) {
        this.prescripteur = prescripteur;
    }

    public Date getDateRealisation() {
        return dateRealisation;
    }

    public void setDateRealisation(Date dateRealisation) {
        this.dateRealisation = dateRealisation;
    }

    public String getRealisateur() {
        return realisateur;
    }

    public void setRealisateur(String realisateur) {
        this.realisateur = realisateur;
    }

    public ConsultationEntite getConsultation() {
        return consultation;
    }

    public void setConsultation(ConsultationEntite consultation) {
        this.consultation = consultation;
    }

    public ExamenMedicalEntite getExamen() {
        return examen;
    }

    public void setExamen(ExamenMedicalEntite examen) {
        this.examen = examen;
    }
    
    
    
    
}
