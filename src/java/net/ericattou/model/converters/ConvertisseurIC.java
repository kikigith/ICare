/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.model.converters;

import java.io.Serializable;
import java.util.Map;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import net.ericattou.icare.controller.dao.DaoInterface;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author kiki
 */


@FacesConverter(value = "convertisseurIC")
public class ConvertisseurIC implements Converter, Serializable{
    
    private static final Long serialVersionUID=Long.MIN_VALUE;
    @SuppressWarnings("unused")
    @PersistenceContext(unitName = "icarePU")
    private EntityManager icEm;
    
    @Inject
    private DaoInterface dao;
    
    
    public ConvertisseurIC(){
        try {
            EntityManagerFactory emf=Persistence.createEntityManagerFactory("icarePU");
            icEm=emf.createEntityManager();
        } catch (Exception e) {
        }
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public Object getAsObject(FacesContext fc, UIComponent uic, String objId) throws ConverterException,UnsupportedOperationException  {
       
        Object entity;
        if (StringUtils.isEmpty(objId)) {
            entity = null;
        } else {

            Class cl = getClasse(fc, uic);
            if (BaseBeanEntite.class.isAssignableFrom(cl)) {
                                    entity = icEm.find(cl, objId);
            } else {
                entity = null;
            }
            
        }
        return entity;
        
    }
    
    @Override
    public String getAsString(FacesContext fc, UIComponent uic, Object t) throws ConverterException{
        if(t == null || (! (t instanceof BaseBeanEntite ))){
            return "";
        }else {
            BaseBeanEntite entity = (BaseBeanEntite) t;
            String id = StringUtils.isEmpty(entity.getId()) ? "": entity.getId();
            return id;
        }
    }
    
    @SuppressWarnings("unchecked")
    private Class getClasse(FacesContext fc, UIComponent uic) {
        Map<String, Object> uicAttrs = uic.getAttributes();
        
        if (uicAttrs.containsKey("icConvertedEntity") && (!StringUtils.isEmpty((String) uicAttrs.get("icConvertedEntity")))) {
            String icEntityName = (String) uicAttrs.get("icConvertedEntity");
            
            if (icEntityName.indexOf('.') > 0) {
                try {
                    return Class.forName(icEntityName);
                } catch (ClassNotFoundException cnfe) {
                    return null;
                }
                
            }
            //The class name refer to a relative classe ie it doesn't contains full package name
            Package pk = this.getClass().getPackage();
            String pName = pk.getName();

            //Find the parent package
            int modelIndex = pName.lastIndexOf('.');
            if (modelIndex < 0) {
                return null;
            }
            
            String modelClassName = pName.substring(0, modelIndex) + "." + icEntityName;
            try {
                return Class.forName(modelClassName);
            } catch (ClassNotFoundException cnfe) {
                modelClassName = pName + "." + icEntityName;
                try {
                    return Class.forName(modelClassName);
                } catch (ClassNotFoundException cne) {
                    return null;
                }
            }
            
        }
        return uic.getValueExpression("value").getType(fc.getELContext());
        
    }

    
}
