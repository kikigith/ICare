/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.model.plugin;

import net.ericattou.icare.model.entities.PatientEntite;

/**
 *
 * @author kiki
 */
public interface GenerateurNumero {
    
    public String getNumero() throws Exception ;
    public String getNumero(PatientEntite patient) throws Exception ;
    
}
