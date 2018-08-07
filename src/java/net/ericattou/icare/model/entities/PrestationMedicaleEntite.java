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
public class PrestationMedicaleEntite extends BaseBeanEntite implements Serializable{
    
    private String libelle;
    private Date datePrestation;
//    private ConsultationEntite consultation;
    private NaturePrestationEntite nature;
    private List<ReglementPrestationEntite> listeReglements;

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Date getDatePrestation() {
        return datePrestation;
    }

    public void setDatePrestation(Date datePrestation) {
        this.datePrestation = datePrestation;
    }

    public NaturePrestationEntite getNature() {
        return nature;
    }

    public void setNature(NaturePrestationEntite nature) {
        this.nature = nature;
    }

    public List<ReglementPrestationEntite> getListeReglements() {
        return listeReglements;
    }

    public void setListeReglements(List<ReglementPrestationEntite> listeReglements) {
        this.listeReglements = listeReglements;
    }
    
    
    
    
}
