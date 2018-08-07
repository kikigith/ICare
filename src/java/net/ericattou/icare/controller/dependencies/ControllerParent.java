/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.controller.dependencies;

import java.io.Serializable;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author kiki
 */
public abstract class ControllerParent implements Serializable{
    
    private static final long serialVersionUID=Long.MIN_VALUE;
   
   
    @SuppressWarnings("unused")
    @PersistenceContext(unitName = "healthPlusPU")
    
    @Inject
    private EntityManager entityManager;
    
    @Inject
    protected transient Logger logger;
    
    
}
