/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Transient;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public class UtilisateurEntite extends BaseBeanEntite implements Serializable{
    private static final long serialVersionUID = Long.MIN_VALUE;
    
    private String nomDeFamille;
    private String prenom;
    private String motDePasse;
    
    @Transient
    private String motDePasseConfirme;
    
    private String email;
    private String telephone;
    private Date dateCreation;
    private List<RoleEntite> roles =new ArrayList<>();

    public String getNomDeFamille() {
        return nomDeFamille;
    }

    public void setNomDeFamille(String nomDeFamille) {
        this.nomDeFamille = nomDeFamille;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Date getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(Date dateCreation) {
        this.dateCreation = dateCreation;
    }

    public List<RoleEntite> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleEntite> roles) {
        this.roles = roles;
    }
    
    
    
    
            
}
