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
public class AnneeMedicaleEntite extends BaseBeanEntite implements Serializable{
    private Date dateDebut;
    private Date dateFin;
    private List<FraisAnnuelPrestationEntite> lesFrais;

    /**
     * @return the dateDebut
     */
    public Date getDateDebut() {
        return dateDebut;
    }

    /**
     * @param dateDebut the dateDebut to set
     */
    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    /**
     * @return the dateFin
     */
    public Date getDateFin() {
        return dateFin;
    }

    /**
     * @param dateFin the dateFin to set
     */
    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }
    
    
    
}
