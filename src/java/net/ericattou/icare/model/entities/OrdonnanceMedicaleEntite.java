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
public class OrdonnanceMedicaleEntite extends BaseBeanEntite implements Serializable {
    private ConsultationEntite consultation;//M2O
    private Date dateOrdonnance=new Date();
    private List<LigneOrdonnanceEntite> ligneOrdonnance=new ArrayList<>();
    private RendezVousMedicalEntite rdvSuivant;

    /**
     * @return the consultation
     */
    public ConsultationEntite getConsultation() {
        return consultation;
    }

    /**
     * @param consultation the consultation to set
     */
    public void setConsultation(ConsultationEntite consultation) {
        this.consultation = consultation;
    }

    /**
     * @return the dateOrdonnance
     */
    public Date getDateOrdonnance() {
        return dateOrdonnance;
    }

    /**
     * @param dateOrdonnance the dateOrdonnance to set
     */
    public void setDateOrdonnance(Date dateOrdonnance) {
        this.dateOrdonnance = dateOrdonnance;
    }

    /**
     * @return the ligneOrdonnance
     */
    public List<LigneOrdonnanceEntite> getLigneOrdonnance() {
        return ligneOrdonnance;
    }

    /**
     * @param ligneOrdonnance the ligneOrdonnance to set
     */
    public void setLigneOrdonnance(List<LigneOrdonnanceEntite> ligneOrdonnance) {
        this.ligneOrdonnance = ligneOrdonnance;
    }

    /**
     * @return the rdvSuivant
     */
    public RendezVousMedicalEntite getRdvSuivant() {
        return rdvSuivant;
    }

    /**
     * @param rdvSuivant the rdvSuivant to set
     */
    public void setRdvSuivant(RendezVousMedicalEntite rdvSuivant) {
        this.rdvSuivant = rdvSuivant;
    }
    
    
    
}
