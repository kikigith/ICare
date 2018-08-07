/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.interceptor;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import net.bilima.okapiUtils.utils.JSFUtility;
import net.ericattou.icare.controller.dao.DaoInterface;
import net.ericattou.icare.controller.session.ProfileBean;
import net.ericattou.icare.model.bean.utils.MiscDataPicker;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;
import net.ericattou.icare.model.entities.AdresseEntite;
import net.ericattou.icare.model.entities.CategoriePatientEntite;
import net.ericattou.icare.model.entities.OrdonnanceMedicaleEntite;
import net.ericattou.icare.model.entities.PatientEntite;
import net.ericattou.icare.model.entities.RayonEntite;
import net.ericattou.icare.model.entities.UtilisateurEntite;
import net.ericattou.model.plugin.GenerateurNumero;
import org.apache.deltaspike.core.util.StringUtils;

/**
 *
 * @author kiki
 */
@Stateless
public class PersistCallback {

    @PersistenceContext(unitName = "icarePU")
    private EntityManager icEm;

    @Inject
    DaoInterface dao;

    @Inject
    private MiscDataPicker dataPicker;
    
    @Inject
    private ProfileBean profileBean;
    
    @Inject
    private GenerateurNumero generateurNumero;

    public void persistEntityOperation(BaseBeanEntite entite) throws Exception {

        String userId = null;

        FacesContext facesContext = FacesContext.getCurrentInstance();
        if (facesContext == null) {
            userId = "admin";
        } else {
            userId = profileBean.getIdentifiant();
        }

        if (StringUtils.isEmpty(userId)) {
            throw new Exception("L'utilisateur actuel est inconnu");
        }

        UtilisateurEntite user;
        String sql = "SELECT u FROM UtilisateurEntite u WHERE u.id = :identifiant";
        Map<String, Object> params = new HashMap<>(1);
        params.put("identifiant", userId);

        user = dao.getSingleResult(sql, params, UtilisateurEntite.class);
        if (user == null) {
            throw new Exception("L'utilisateur " + userId + " est introuvable");
        }

        entite.setDateModif(new Date());
        entite.setEncodeur(JSFUtility.getCurrentUserName());
        String vId = entite.getId();

        if (!StringUtils.isEmpty(vId)) {
            BaseBeanEntite entiteExistant = dao.findById(entite.getClass(), vId);
            if (entiteExistant != null) {
                throw new Exception("Impossible de sauvegarder la fiche d'identité '" + vId
                        + "' . Une autre fiche existe sous cette identité");
            }
        }

        switch (entite.getClass().getSimpleName()) {

            case "AdresseEntite": {
                AdresseEntite adresseEntite = (AdresseEntite) entite;
                break;
            }
            case "CategoriePatientEntite": {
                CategoriePatientEntite categoriePatientEntite = (CategoriePatientEntite) entite;
                break;
            }
            case "OrdonnanceMedicaleEntite": {
                OrdonnanceMedicaleEntite ordonnanceMedicaleEntite = (OrdonnanceMedicaleEntite) entite;
                break;
            }
            case "RayonEntite": {
                RayonEntite rayonEntite = (RayonEntite) entite;
                break;
            }
            case "PatientEntite": {
                PatientEntite patientEntite = (PatientEntite) entite;
                
                patientEntite.setId(generateurNumero.getNumero());

                break;
            }
            case "ProduitPharmaceutiqueEntite": {
                RayonEntite rayonEntite = (RayonEntite) entite;
                break;
            }
            default:
                break;
        }

    }
}
