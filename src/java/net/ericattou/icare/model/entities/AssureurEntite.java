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
public class AssureurEntite extends BaseBeanEntite implements Serializable{
    private String denomination;
    private List<AssuranceMedicaleEntite> lesAssures=new ArrayList<>();

    /**
     * @return the denomination
     */
    public String getDenomination() {
        return denomination;
    }

    /**
     * @param denomination the denomination to set
     */
    public void setDenomination(String denomination) {
        this.denomination = denomination;
    }

    /**
     * @return the lesAssures
     */
    public List<AssuranceMedicaleEntite> getLesAssures() {
        return lesAssures;
    }

    /**
     * @param lesAssures the lesAssures to set
     */
    public void setLesAssures(List<AssuranceMedicaleEntite> lesAssures) {
        this.lesAssures = lesAssures;
    }
    
    
}
