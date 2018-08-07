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
public class ProduitPharmaceutiqueEntite extends BaseBeanEntite implements Serializable {
    private String designation;
    private ClassePharmaceutiqueEntite classe;

    /**
     * @return the designation
     */
    public String getDesignation() {
        return designation;
    }

    /**
     * @param designation the designation to set
     */
    public void setDesignation(String designation) {
        this.designation = designation;
    }

    /**
     * @return the classe
     */
    public ClassePharmaceutiqueEntite getClasse() {
        return classe;
    }

    /**
     * @param classe the classe to set
     */
    public void setClasse(ClassePharmaceutiqueEntite classe) {
        this.classe = classe;
    }
    
    
    
}
