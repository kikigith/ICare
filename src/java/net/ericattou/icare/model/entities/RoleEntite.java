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
public class RoleEntite extends BaseBeanEntite implements Serializable{
    private final static long serialVersionUID = Long.MIN_VALUE;
    
    private String libelle;
    private List<UtilisateurEntite> utilisateurs = new ArrayList<>();

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public List<UtilisateurEntite> getUtilisateurs() {
        return utilisateurs;
    }

    public void setUtilisateurs(List<UtilisateurEntite> utilisateurs) {
        this.utilisateurs = utilisateurs;
    }
    
    
    
    
}
