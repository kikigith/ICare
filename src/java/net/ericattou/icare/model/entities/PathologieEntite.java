/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.io.Serializable;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public class PathologieEntite extends BaseBeanEntite implements Serializable {

    private String libelle;
    private String caracteristique;

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

    /**
     * @return the caracteristique
     */
    public String getCaracteristique() {
        return caracteristique;
    }

    /**
     * @param caracteristique the caracteristique to set
     */
    public void setCaracteristique(String caracteristique) {
        this.caracteristique = caracteristique;
    }
    
    
    

}
