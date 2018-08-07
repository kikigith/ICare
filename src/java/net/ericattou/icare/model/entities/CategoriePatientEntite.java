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
public class CategoriePatientEntite extends BaseBeanEntite implements Serializable{
    
//    private String code;
    private String libelle;
    private List<PatientEntite> lesPatients = new ArrayList<>();
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

    public List<PatientEntite> getLesPatients() {
        return lesPatients;
    }

    public void setLesPatients(List<PatientEntite> lesPatients) {
        this.lesPatients = lesPatients;
    }
    
    @Override
    public String toString(){
    return getId()+"<->"+getLibelle();
    }
    
    
    
    
}
