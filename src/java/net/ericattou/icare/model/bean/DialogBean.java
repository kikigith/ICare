/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.bean;

import java.io.Serializable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;
import javax.inject.Named;
import net.bilima.okapiUtils.utils.JSFUtility;
import net.ericattou.icare.controller.dao.DaoInterface;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;
import org.apache.commons.lang3.StringUtils;
import org.primefaces.context.RequestContext;

/**
 *
 * @author kiki
 */
@SessionScoped
@Named("dialogBean")
public class DialogBean implements DialogIf, Serializable {

    private static final Long serialVersionUID = Long.MIN_VALUE;

    private BaseBeanEntite fiche;
    private String header;
    private String opCode = "display";
    private String component;
    private List<? extends BaseBeanEntite> fiches;

    @Inject
    private DaoInterface dao;
    @Inject
    private ConstantIf constant;
    private String callerBeanName;
    private Class<? extends MasterBean> callerBeanClass;
    private final String UNKNOWN = "Entity_Class_Not_Found";

    public boolean isAlive() {
        return Boolean.TRUE;
    }

    public String getObjectClassName() {
        if (opCode.equals(constant.getOpcodeEdit())
                || opCode.equals(constant.getOpcodeNew())
                || opCode.equals(constant.getOpcodeDeleteSingle())
                || opCode.equals(constant.getOpcodeDisplay())) {
            if (fiche == null) {
                return UNKNOWN;
            }
            return fiche.getClass().getSimpleName();
        } else if (opCode.equals(constant.getOpcodeDeleteMulti())) {
            if (fiches != null && (!fiches.isEmpty())) {
                return fiches.get(0).getClass().getSimpleName();
            }
        }
        return UNKNOWN;
    }

    public <T extends MasterBean> T getCallerBean() {

        if (StringUtils.isEmpty(callerBeanName) || callerBeanClass == null) {
            return null;
        }
        FacesContext context = FacesContext.getCurrentInstance();
        T bean = (T) context.getApplication().evaluateExpressionGet(context, "#{" + callerBeanName + "}", callerBeanClass);
        return bean;

    }

    @Override
    public void deleteAndCloseDialog(ActionEvent event) {
        try {
            if (opCode.equals(constant.getOpcodeDeleteMulti())) {
                if (fiches != null && (!fiches.isEmpty())) {
                    dao.delete(fiches);
                }
            } else if (opCode.equals(constant.getOpcodeDeleteSingle())) {
                if (fiche != null) {
                    dao.delete(fiche);
                }
            } else {
                JSFUtility.addErrorMessage("L'opCode '" + opCode + "' n'est pas utilisable dans une suppression de fiche");
                return;
            }
            RequestContext.getCurrentInstance().closeDialog(opCode);
        } catch (Exception exc) {
            JSFUtility.addErrorMessage(exc.getMessage());
        }
    }

    public void setCallerNameAndClass(String callerBeanName, Class<? extends MasterBean> callerBeanClass) {
        this.callerBeanName = callerBeanName;
        this.callerBeanClass = callerBeanClass;
    }

    @Override
    public List<? extends BaseBeanEntite> getFiches() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return fiches;
    }

    @Override
    public void setFiche(BaseBeanEntite fiche) {
        this.fiche = fiche;
    }

    @Override
    public BaseBeanEntite getFiche() {
        return fiche;
    }

    @Override
    public void setFiches(List<? extends BaseBeanEntite> fiches) {
        this.fiches=fiches;
    }

    @Override
    public void setComponent(String component) {
        this.component=component;
    }

    @Override
    public String getComponent() {
        return component;
    }

    @Override
    public void setHeader(String header) {
        this.header=header;
    }

    @Override
    public String getHeader() {
        return header;
    }

    @Override
    public void setOpCode(String opCode) {
        this.opCode=opCode;
    }

    @Override
    public String getOpCode() {
       return opCode;
    }

    @Override
    public void saveAndCloseDialog(ActionEvent evt) {
       try {  
        if(fiche.isNouvelleFiche()){
           
                dao.save(fiche);
            
        }else{
        dao.update(fiche);
        }
        RequestContext.getCurrentInstance().closeDialog(fiche);
       } catch (Exception ex) {
               JSFUtility.addErrorMessage(ex.getMessage());
            }
    }

    @Override
    public void deleteAndReturnRecord(ActionEvent event) {
        try {
            if (opCode.equals(constant.getOpcodeDeleteMulti())) {
                if (fiches != null && (!fiches.isEmpty())) {
                    dao.delete(fiches);
                }
            } else if (opCode.equals(constant.getOpcodeDeleteSingle())) {
                if (fiche != null) {
                    dao.delete(fiche);
                }
            } else {
                JSFUtility.addErrorMessage("L'opCode '" + opCode + "' n'est pas utilisable dans une suppression de fiche");
                return;
            }
            RequestContext.getCurrentInstance().closeDialog(fiche);
        } catch (Exception exc) {
            JSFUtility.addException(exc);
        }
    }

}
