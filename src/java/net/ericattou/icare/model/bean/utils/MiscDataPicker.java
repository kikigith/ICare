/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.bean.utils;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.enterprise.inject.Produces;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.bilima.okapiUtils.utils.JSFUtility;
import net.ericattou.controller.qualifiers.ToutesLesCategoriesQualifier;
import net.ericattou.icare.controller.dao.DaoInterface;
import net.ericattou.icare.model.entities.AdresseEntite;
import net.ericattou.icare.model.entities.CategoriePatientEntite;
import net.ericattou.icare.model.entities.PatientEntite;
import org.apache.deltaspike.core.util.StringUtils;

/**
 *
 * @author kiki
 */
@Named("dataPicker")
public class MiscDataPicker implements Serializable{
    
    @PersistenceContext(unitName="icarePU")
    private EntityManager icEm;
    @Inject
    private DaoInterface dao;
    
    
    public List<PatientEntite> suggestPatientFromID (String patientPrefix){
        if (StringUtils.isEmpty(patientPrefix)) {
           return null; 
        } 
        String sql = "SELECT p FROM PatientEntite p"+
                "WHERE p.id LIKE  :patientPrefix";
        Map<String, Object> map=new HashMap(1);
        map.put("patientPrefix",patientPrefix.toUpperCase()+"%");
        try {
            return dao.getResultList(sql,map, PatientEntite.class);
        } catch (Exception e) {
        }
    
    return null;
    }
    
    
    @Produces
    @ToutesLesCategoriesQualifier
    @Named
    public List<CategoriePatientEntite> getToutesLesCategories(){
        
        String sql = "SELECT c FROM CategoriePatientEntite c ORDER BY c.id ASC";
        
        List<CategoriePatientEntite> list;
        
        try {
            list= (List<CategoriePatientEntite>) dao.getResultList(sql,null, CategoriePatientEntite.class);
            return list;
        } catch (Exception e) {
            JSFUtility.addMessage(JSFUtility.expandException(e));
        }
        return null;
    }
    
    @Produces
    @Named
    public List<AdresseEntite> getToutesLesAdresses(){
        
        String sql = "SELECT a FROM AdresseEntite a ORDER BY a.id ASC";
        
        List<AdresseEntite> list;
        
        try {
            list= (List<AdresseEntite>) dao.getResultList(sql,null, AdresseEntite.class);
            return list;
        } catch (Exception e) {
            JSFUtility.addMessage(JSFUtility.expandException(e));
        }
        return null;
    }
    
    
}
