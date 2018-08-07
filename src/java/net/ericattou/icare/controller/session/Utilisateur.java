/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.controller.session;

import java.io.Serializable;
import java.util.List;
import java.util.StringTokenizer;
import javax.faces.context.FacesContext;
import org.apache.deltaspike.core.util.StringUtils;
import sun.util.locale.StringTokenIterator;

/**
 *
 * @author kiki
 */
public class Utilisateur implements Serializable{
    private String nom=null;
    private String prenom=null;
    private String identifiant=null;
    private List<String> roles;
    private boolean sessionEndormie;
    private boolean admin=Boolean.FALSE;
    
    
    
    public Utilisateur(){
        nom="";
        prenom="";
        identifiant="";
        sessionEndormie=Boolean.FALSE;
        
    }
    
    
    public boolean hasAnyRoles(String liste){
        if(roles==null){
            return Boolean.FALSE;
        }
        if(admin){
            return Boolean.TRUE;}
        StringTokenizer tk=new StringTokenizer(liste,",");
        while(tk.hasMoreElements()){
            String roleId=tk.nextToken();
            if(FacesContext.getCurrentInstance()
                    .getExternalContext()
                    .isUserInRole(roleId)){
                return Boolean.TRUE;
            }
        }
        return Boolean.FALSE;
    
    }
    
    
    public String getNomComplet(){
        String s=StringUtils.isEmpty(nom) ? "":nom;
        s=StringUtils.isEmpty(prenom) ? s : s+ " " + prenom;
        return StringUtils.isEmpty(s) ? identifiant : s;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getIdentifiant() {
        return identifiant;
    }

    public void setIdentifiant(String identifiant) {
        this.identifiant = identifiant;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

    public boolean isSessionEndormie() {
        return sessionEndormie;
    }

    public void setSessionEndormie(boolean sessionEndormie) {
        this.sessionEndormie = sessionEndormie;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }
    
    
    
    
}
