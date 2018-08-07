/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.entities;

import java.io.Serializable;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public class LitEntite extends BaseBeanEntite implements Serializable{
    
    private String numLit;
    private SalleHospitalisationEntite salle;
    
    
    
}
