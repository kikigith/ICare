/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public class NaturePrestationEntite extends BaseBeanEntite implements Serializable{
//    private String code;
    private String libelle;
    private List<PrestationMedicaleEntite> lesPrestations=new ArrayList<PrestationMedicaleEntite>();

    public List<PrestationMedicaleEntite> getLesPrestations() {
        return lesPrestations;
    }

    public void setLesPrestations(List<PrestationMedicaleEntite> lesPrestations) {
        this.lesPrestations = lesPrestations;
    }

    
//    
//    public String getCode() {
//        return code;
//    }
//
//    public void setCode(String code) {
//        this.code = code;
//    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    
    
    
 
}
