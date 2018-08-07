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
import net.ericattou.icare.model.entities.RendezVousMedicalEntite;
import net.ericattou.icare.model.lazy.ICareLazyModel;

/**
 *
 * @author kiki
 */
@Named("rdvBean")
public class RdvBean extends MasterBean implements Serializable{
    
    private RendezVousMedicalEntite rdv;
    
    @PersistenceContext(unitName = "icarePU")
    private EntityManager icEm;

    public RendezVousMedicalEntite getRdv() {
        return rdv;
    }

    public void setRdv(RendezVousMedicalEntite rdv) {
        this.rdv = rdv;
    }
    
    public void searchByID(ActionEvent event){
        if(rdv==null){
            return;
        }
        try {
            setICareLazyModel((ICareLazyModel<? extends BaseBeanEntite>) new ICareLazyModel(RendezVousMedicalEntite.class,
            dao, icEm));
            CriteriaBuilder builder=icEm.getCriteriaBuilder();
            Root<RendezVousMedicalEntite> resultRoot = (Root<RendezVousMedicalEntite>) getICareLazyModel().getResultRoot();
            
            Predicate condition = builder.equal(builder.upper(resultRoot.<String>get("id")), rdv.getId().toUpperCase());
        } catch (Exception e) {
        }
    }
    
    
    
}
