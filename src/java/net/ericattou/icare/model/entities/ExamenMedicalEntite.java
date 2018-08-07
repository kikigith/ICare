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
public class ExamenMedicalEntite extends BaseBeanEntite implements Serializable{
//    private String code;
    private List<ResultatExamenEntite> lesResultats;//O2M
    private String libelle;
    

    

    /**
     * @return the libelle
     */
    public String getLibelle() {
        return libelle;
    }

    /**
     * @param libelle the libelle to set
     */
    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    
    
    
    
    
    
    
    
    
}
