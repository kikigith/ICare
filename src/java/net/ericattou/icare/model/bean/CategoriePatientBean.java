/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.bean;

import java.io.Serializable;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.ericattou.icare.model.entities.CategoriePatientEntite;
import org.apache.deltaspike.core.api.scope.ViewAccessScoped;

/**
 *
 * @author kiki
 */
@Named("categoriePatientBean")
@ViewAccessScoped
public class CategoriePatientBean extends MasterBean implements Serializable {
    
    private static final long serialVersionUID=Long.MIN_VALUE;
    private CategoriePatientEntite categoriePatient;
    
    @PersistenceContext(unitName = "icarePU")
    private EntityManager icEm;

    
    
    
    public String makeLazyListAction(){
        return null;
    }
    
    
    
    public CategoriePatientEntite getCategoriePatient() {
        return categoriePatient;
    }

    public void setCategoriePatient(CategoriePatientEntite categoriePatient) {
        this.categoriePatient = categoriePatient;
    }
    
    
    
    
    
    
    
}
