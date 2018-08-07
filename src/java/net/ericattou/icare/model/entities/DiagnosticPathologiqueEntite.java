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
public class DiagnosticPathologiqueEntite extends BaseBeanEntite implements Serializable{
    private DiagnosticEntite diagnostic;
    private PathologieEntite pathologie;
    private String statusPathologie="Soupçon";
    private String observation;
    private String description;

    /**
     * @return the diagnostic
     */
    public DiagnosticEntite getDiagnostic() {
        return diagnostic;
    }

    /**
     * @param diagnostic the diagnostic to set
     */
    public void setDiagnostic(DiagnosticEntite diagnostic) {
        this.diagnostic = diagnostic;
    }

    /**
     * @return the pathologie
     */
    public PathologieEntite getPathologie() {
        return pathologie;
    }

    /**
     * @param pathologie the pathologie to set
     */
    public void setPathologie(PathologieEntite pathologie) {
        this.pathologie = pathologie;
    }

    /**
     * @return the statusPathologie
     */
    public String getStatusPathologie() {
        return statusPathologie;
    }

    /**
     * @param statusPathologie the statusPathologie to set
     */
    public void setStatusPathologie(String statusPathologie) {
        this.statusPathologie = statusPathologie;
    }

    /**
     * @return the observation
     */
    public String getObservation() {
        return observation;
    }

    /**
     * @param observation the observation to set
     */
    public void setObservation(String observation) {
        this.observation = observation;
    }
    
    
    
    
    
}
