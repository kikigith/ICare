/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author kiki
 */
public class PatientEntite extends PersonneEntite {
    
//    private List<ConsultationEntite> listeRdvs;
    private AssuranceMedicaleEntite assurance;//La fiche d'assurance(prise en charge) si le patient en a
    private List<RendezVousMedicalEntite> rdvDuPatient=new ArrayList<>();//Les rdv du patient
    private CategoriePatientEntite categorie;

    /**
     * @return the assurance
     */
    public AssuranceMedicaleEntite getAssurance() {
        return assurance;
    }

    /**
     * @param assurance the assurance to set
     */
    public void setAssurance(AssuranceMedicaleEntite assurance) {
        this.assurance = assurance;
    }

    /**
     * @return the rdvDuPatient
     */
    public List<RendezVousMedicalEntite> getRdvDuPatient() {
        return rdvDuPatient;
    }

    /**
     * @param rdvDuPatient the rdvDuPatient to set
     */
    public void setRdvDuPatient(List<RendezVousMedicalEntite> rdvDuPatient) {
        this.rdvDuPatient = rdvDuPatient;
    }

    public CategoriePatientEntite getCategorie() {
        return categorie;
    }

    public void setCategorie(CategoriePatientEntite categorie) {
        this.categorie = categorie;
    }
    
    
    
    
    
    
}
