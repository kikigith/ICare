/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.util.List;



/**
 *
 * @author kiki
 */
public class PraticienEntite extends PersonneEntite {
    private CategoriePraticienEntite categoriePraticien;
    private SpecialiteMedicaleEntite specialitePraticien;
    
    private List<ConsultationEntite> consultations;

    /**
     * @return the categoriePraticien
     */
    public CategoriePraticienEntite getCategoriePraticien() {
        return categoriePraticien;
    }

    /**
     * @param categoriePraticien the categoriePraticien to set
     */
    public void setCategoriePraticien(CategoriePraticienEntite categoriePraticien) {
        this.categoriePraticien = categoriePraticien;
    }

    /**
     * @return the specialitePraticien
     */
    public SpecialiteMedicaleEntite getSpecialitePraticien() {
        return specialitePraticien;
    }

    /**
     * @param specialitePraticien the specialitePraticien to set
     */
    public void setSpecialitePraticien(SpecialiteMedicaleEntite specialitePraticien) {
        this.specialitePraticien = specialitePraticien;
    }
    
    
    
    
    
    
    
}
