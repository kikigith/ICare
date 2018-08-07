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
public class LigneOrdonnanceEntite extends BaseBeanEntite implements Serializable{
    private ProduitPharmaceutiqueEntite produit;
    private OrdonnanceMedicaleEntite ordonnance;
    private String posologie;
    private String commentaire;

    /**
     * @return the produit
     */
    public ProduitPharmaceutiqueEntite getProduit() {
        return produit;
    }

    /**
     * @param produit the produit to set
     */
    public void setProduit(ProduitPharmaceutiqueEntite produit) {
        this.produit = produit;
    }

    /**
     * @return the ordonnance
     */
    public OrdonnanceMedicaleEntite getOrdonnance() {
        return ordonnance;
    }

    /**
     * @param ordonnance the ordonnance to set
     */
    public void setOrdonnance(OrdonnanceMedicaleEntite ordonnance) {
        this.ordonnance = ordonnance;
    }

    /**
     * @return the dosagePrescrit
     */
    public String getPosologie() {
        return posologie;
    }

    /**
     * @param posologie the dosagePrescrit to set
     */
    public void setPosologie(String posologie) {
        this.posologie = posologie;
    }

    /**
     * @return the commentaire
     */
    public String getCommentaire() {
        return commentaire;
    }

    /**
     * @param commentaire the commentaire to set
     */
    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }
    
    
    
}
