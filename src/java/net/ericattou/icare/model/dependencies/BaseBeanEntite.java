/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.dependencies;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author kiki
 */
public abstract class BaseBeanEntite implements Comparable, Serializable {

    private static final long serialVersionUID = Long.MIN_VALUE;
    private String id;
    private String encodeur = "inconnu";
    private Date dateModif = new Date();
    private Long version;

    public void prePersistAction() {
    }

    public void postPersistAction() {

    }

    public void preRemoveAction() {
    }

    public void postRemoveAction() {
    }

    public void preUpdateAction() {
    }

    public void postUpdateAction() {
    }

    public void postLoadAction() {
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the encodeur
     */
    public String getEncodeur() {
        return encodeur;
    }

    /**
     * @param encodeur the encodeur to set
     */
    public void setEncodeur(String encodeur) {
        this.encodeur = encodeur;
    }

    /**
     * @return the dateModif
     */
    public Date getDateModif() {
        return dateModif;
    }

    /**
     * @param dateModif the dateModif to set
     */
    public void setDateModif(Date dateModif) {
        this.dateModif = dateModif;
    }

    /**
     * @return the version
     */
    public Long getVersion() {
        return version;
    }

    /**
     * @param version the version to set
     */
    public void setVersion(Long version) {
        this.version = version;
    }

    /**
     * @return the nouvelleFiche
     */
    public boolean isNouvelleFiche() {
        return (getVersion() == null);
    }

    @Override
    public int compareTo(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String toString() {
        return id;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null || (!(obj instanceof BaseBeanEntite))) {
            return false;
        }

        BaseBeanEntite thatObject = (BaseBeanEntite) obj;
        if (this == thatObject) {
            return true;
        }
        if ((thatObject.getId() == null) || (this.getId() == null)) {
            return false;
        }
        return getId().equals(thatObject.getId());
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 59 * hash + Objects.hashCode(this.version);
        hash = 59 * hash + Objects.hashCode(this.id);
        return hash;
    }
}
