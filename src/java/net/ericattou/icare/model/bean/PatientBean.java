/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.bean;

import java.io.Serializable;
import javax.faces.event.ActionEvent;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;
import net.ericattou.icare.model.entities.CategoriePatientEntite;
import net.ericattou.icare.model.entities.PatientEntite;
import net.ericattou.icare.model.lazy.ICareLazyModel;
import org.apache.deltaspike.core.api.scope.ViewAccessScoped;

/**
 *
 * @author kiki
 */
@Named("patientBean")
@ViewAccessScoped
public class PatientBean extends MasterBean implements Serializable{
    private PatientEntite patient;
    
    private CategoriePatientEntite categorie;
    
    @PersistenceContext(unitName = "icarePU")
    private EntityManager icEm;

    public PatientEntite getPatient() {
        return patient;
    }

    public void setPatient(PatientEntite patient) {
        this.patient = patient;
    }

    public CategoriePatientEntite getCategorie() {
        return categorie;
    }

    public void setCategorie(CategoriePatientEntite categorie) {
        this.categorie = categorie;
    }
    
    
    
    
    public void searchByID(ActionEvent event){
    
    if(patient==null){
    return; 
    }
    
        try {
            setICareLazyModel((ICareLazyModel<? extends BaseBeanEntite>) new ICareLazyModel(PatientEntite.class,
                    dao,icEm));
            CriteriaBuilder builder=icEm.getCriteriaBuilder();
            Root<PatientEntite> resultRoot=(Root<PatientEntite>) getICareLazyModel().getResultRoot();
            
            Predicate condition=builder.equal(builder.upper(resultRoot.<String>get("id")), patient.getId().toUpperCase());
        } catch (Exception e) {
        }
    }
    
}
