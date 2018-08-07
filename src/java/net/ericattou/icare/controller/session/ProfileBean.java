/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.controller.session;

import java.io.Serializable;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import net.bilima.okapiUtils.utils.JSFUtility;
import net.ericattou.icare.controller.dao.DaoInterface;
import net.ericattou.icare.model.entities.RoleEntite;
import net.ericattou.icare.model.entities.UtilisateurEntite;

/**
 *
 * @author kiki
 */
@Named("profileBean")
@SessionScoped
public class ProfileBean implements Serializable {

    private Utilisateur utilisateurCourant = null;
    private String nomUtilisateur = "";
    private long beanCreationTime = (new Date()).getTime();

    @Inject
    DaoInterface dao;

    @PersistenceContext(unitName = "icarePU")
    private EntityManager icEm;

    @PostConstruct
    public void init() {
        initUserAccount();
    }

    private void initUserAccount() {
        FacesContext context = FacesContext.getCurrentInstance();
        if (context != null) {
            Principal principal = context.getExternalContext().getUserPrincipal();
            if (principal != null) {
                utilisateurCourant = new Utilisateur();
                utilisateurCourant.setIdentifiant(principal.getName());
                String sql = "SELECT u FROM  UtilisateurEntite u"
                        + " WHERE u.id = :userId";
                TypedQuery<UtilisateurEntite> q = icEm.createQuery(sql, UtilisateurEntite.class);
                q.setParameter("userId", principal.getName());
                UtilisateurEntite user = q.getSingleResult();
                utilisateurCourant.setNom(user.getNomDeFamille());
                utilisateurCourant.setPrenom(user.getPrenom());
                utilisateurCourant.setSessionEndormie(Boolean.FALSE);
                String uSql = "SELECT role FROM  UserEntite u"
                        + " JOIN FETCH u.roles role "
                        + " WHERE u.id = :userId";
                try {
                    TypedQuery<RoleEntite> tq = icEm.createQuery(uSql, RoleEntite.class);
                    tq.setParameter("userId", principal.getName());
                    List<RoleEntite> roles = tq.getResultList();
                    if (roles != null && (!roles.isEmpty())) {
                        List<String> roleIds = new ArrayList<>(roles.size());
                        for (RoleEntite role : roles) {
                            roleIds.add(role.getId().toUpperCase());
                        }
                        utilisateurCourant.setRoles(roleIds);

                    }

                } catch (Exception e) {
                }
            }

        }

    }

    public String getNomComplet() {
        if (utilisateurCourant == null) {
            return null;
        }
        return utilisateurCourant.getNomComplet();
    }

    public boolean isAuthenticated() {
        FacesContext context = FacesContext.getCurrentInstance();
        Principal principal = context.getExternalContext().getUserPrincipal();
        if (principal == null) {
            return Boolean.FALSE;
        }
        if (utilisateurCourant == null) {
            initUserAccount();
        }
        return Boolean.TRUE;
    }

    public boolean isUserInRole(List<String> roleIds) {
        String sql = "SELECT COUNT(role.id) FROM UtilisateurEntite user "
                + "JOIN FETCH user.roles role "
                + "WHERE user.id = :userId AND role.id IN :roleIds";
        Map<String, Object> params = new HashMap<>(2);
        params.put("userId", utilisateurCourant.getIdentifiant());
        params.put("roleIds", roleIds);
        try {
            Long one = dao.lookupNumberHavingSqlQueryDetached(sql, params);
            if (one != null && one >= 1L) {
                return Boolean.TRUE;
            }
        } catch (Exception e) {
            JSFUtility.addException(e);
        }
        return Boolean.FALSE;

    }

    public boolean hasAnyRole(String liste) {
        if (utilisateurCourant == null) {
            this.initUserAccount();
            if (utilisateurCourant == null) {
                return Boolean.FALSE;
            }

        }

        if (utilisateurCourant.isAdmin()) {
            return Boolean.TRUE;
        }

        List<String> roleIds = new ArrayList<>();
        roleIds.add("admin");
        StringTokenizer tk = new StringTokenizer(liste, ",");
        while (tk.hasMoreTokens()) {
            roleIds.add(tk.nextToken());
        }
        return isUserInRole(roleIds);
    }

    public String getIdentifiant() {
        if (utilisateurCourant == null) {
            return null;
        }
        return utilisateurCourant.getIdentifiant();
    }

}
