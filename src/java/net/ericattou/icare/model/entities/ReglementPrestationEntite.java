/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.io.Serializable;
import java.util.Date;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public class ReglementPrestationEntite extends BaseBeanEntite implements Serializable{
    
    private Long numReglement;
    private Date dateReglement;
    private ModeReglementEntite modeReglement;
    private PrestationMedicaleEntite prestation;

    public Date getDateReglement() {
        return dateReglement;
    }

    public void setDateReglement(Date dateReglement) {
        this.dateReglement = dateReglement;
    }

    public ModeReglementEntite getModeReglement() {
        return modeReglement;
    }

    public void setModeReglement(ModeReglementEntite modeReglement) {
        this.modeReglement = modeReglement;
    }

    public PrestationMedicaleEntite getPrestation() {
        return prestation;
    }

    public void setPrestation(PrestationMedicaleEntite prestation) {
        this.prestation = prestation;
    }
    
    
    
}
