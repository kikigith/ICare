/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.sequence;

import java.io.Serializable;
import org.eclipse.persistence.annotations.Cache;

/**
 *
 * @author kiki
 */

@Cache(disableHits = true) /*Go to database for any queries*/
public class GenerateurSequenceNumeroEntite implements Serializable{
    private static final long serialVersionUID =Long.MIN_VALUE;
    
    private String id;
    private double seq;
    private Long version;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getSeq() {
        return seq;
    }

    public void setSeq(double seq) {
        this.seq = seq;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }
    
    
    
            
    
}
