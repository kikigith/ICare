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
public class RendezVousMedicalEntite extends BaseBeanEntite implements Serializable{
    private PatientEntite patient;//M20
    private ConsultationEntite consultation;//O2O
    private Date dateRdv;

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
     * @return the dateRdv
     */
    public Date getDateRdv() {
        return dateRdv;
    }

    /**
     * @param dateRdv the dateRdv to set
     */
    public void setDateRdv(Date dateRdv) {
        this.dateRdv = dateRdv;
    }
    
    
    
    
}
