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
public class CategoriePraticienEntite extends BaseBeanEntite implements Serializable{
    
    private String libelle;
    private List<PraticienEntite> lesPraticiens = new ArrayList<>();

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
     * @return the lesPraticiens
     */
    public List<PraticienEntite> getLesPraticiens() {
        return lesPraticiens;
    }

    /**
     * @param lesPraticiens the lesPraticiens to set
     */
    public void setLesPraticiens(List<PraticienEntite> lesPraticiens) {
        this.lesPraticiens = lesPraticiens;
    }
    
    
    
}
