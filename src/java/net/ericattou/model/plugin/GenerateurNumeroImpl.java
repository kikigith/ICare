/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.model.plugin;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.ericattou.icare.controller.session.ProfileBean;
import net.ericattou.icare.model.bean.ApplicationBean;
import net.ericattou.icare.model.entities.PatientEntite;
import org.apache.deltaspike.core.api.scope.ViewAccessScoped;

/**
 *
 * @author kiki
 */
@Named("pluginGenerationNumero")
@ViewAccessScoped
public class GenerateurNumeroImpl implements GenerateurNumero, Serializable{

    private final static long serialVersionUID=Long.MIN_VALUE;
    private PatientEntite patient;
    
    @PersistenceContext(unitName = "icarePU")
    private EntityManager icEm;
    
    @Inject
    private ProfileBean profileBean;
    
    @Inject
    private ApplicationBean applicationBean;
    
    public GenerateurNumeroImpl() {
    }

    public String genererNumero(PatientEntite patient) throws Exception {
        this.patient = patient;
        return getNumero();
    }
    
    @Override
    public String getNumero() throws Exception {
        long initialSeq;
        String numero="P";
        String timestamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
        numero=numero.concat(timestamp);
        return numero;
    }

    @Override
    public String getNumero(PatientEntite patient) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
