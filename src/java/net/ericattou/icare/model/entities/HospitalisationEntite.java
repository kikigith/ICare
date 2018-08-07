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
public class HospitalisationEntite extends BaseBeanEntite implements Serializable{
    private Date dateEntree=new Date();
    private Date dateSortie=new Date();
    private PatientEntite patient;
    private SalleHospitalisationEntite salle;
    private String observation;

    /**
     * @return the dateEntree
     */
    public Date getDateEntree() {
        return dateEntree;
    }

    /**
     * @param dateEntree the dateEntree to set
     */
    public void setDateEntree(Date dateEntree) {
        this.dateEntree = dateEntree;
    }

    /**
     * @return the dateSortie
     */
    public Date getDateSortie() {
        return dateSortie;
    }

    /**
     * @param dateSortie the dateSortie to set
     */
    public void setDateSortie(Date dateSortie) {
        this.dateSortie = dateSortie;
    }

    /**
     * @return the patient
     */
    public PatientEntite getPatient() {
        return patient;
    }

    /**
     * @param patient the patient to set
     */
    public void setPatient(PatientEntite patient) {
        this.patient = patient;
    }

    /**
     * @return the salle
     */
    public SalleHospitalisationEntite getSalle() {
        return salle;
    }

    /**
     * @param salle the salle to set
     */
    public void setSalle(SalleHospitalisationEntite salle) {
        this.salle = salle;
    }

    /**
     * @return the observation
     */
    public String getObservation() {
        return observation;
    }

    /**
     * @param observation the observation to set
     */
    public void setObservation(String observation) {
        this.observation = observation;
    }
    
    
    
    
}
