/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.io.Serializable;
import java.util.List;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public class ModeReglementEntite extends BaseBeanEntite implements Serializable{
    
    private String libelle;
    
    private List<ReglementPrestationEntite> listeReglements;
    
}
