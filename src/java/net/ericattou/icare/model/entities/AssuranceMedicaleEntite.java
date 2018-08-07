/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public class AssuranceMedicaleEntite extends BaseBeanEntite implements Serializable{
    private List<PatientEntite> lesPatientsAssures;
    private AssureurEntite assureur;
    private Date dateDelivrance;
    private Date dateExpiration;
    private Double tauxVitamine;
    private Double taux;

    public List<PatientEntite> getLesPatientsAssures() {
        return lesPatientsAssures;
    }

    public void setLesPatientsAssures(List<PatientEntite> lesPatientsAssures) {
        this.lesPatientsAssures = lesPatientsAssures;
    }
    

    
    
    
    
    /**
     * @return the tauxVitamine
     */
    public Double getTauxVitamine() {
        return tauxVitamine;
    }

    /**
     * @param tauxVitamine the tauxVitamine to set
     */
    public void setTauxVitamine(Double tauxVitamine) {
        this.tauxVitamine = tauxVitamine;
    }

    /**
     * @return the taux
     */
    public Double getTaux() {
        return taux;
    }

    /**
     * @param taux the taux to set
     */
    public void setTaux(Double taux) {
        this.taux = taux;
    }

    /**
     * @return the dateDelivrance
     */
    public Date getDateDelivrance() {
        return dateDelivrance;
    }

    /**
     * @return the dateExpiration
     */
    public Date getDateExpiration() {
        return dateExpiration;
    }
    
    
    
}
