/**
 * 
 */
package net.ericattou.icare.model.bean;

import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.spi.BeanManager;
import javax.faces.model.SelectItem;
import javax.inject.Inject;
import javax.inject.Named;

/**
 * ApplicationBean: a bean providing application scope data
 * @author : Eric ATTOU
 * @version : 1.0
 * @since: 07-08-2018
 */
@ApplicationScoped
@Named("applicationBean")
public class ApplicationBean implements Serializable{
    
    @Inject
    private BeanManager beanManager;
    
    @Inject
    private ConstantIf constant;
    
    
    /**
     * FoundAllItemOfType():  retrieve all item of a given type from a 
     * property file (type.properties) located in /opt/icare/etc/
     * @param type
     * @return 
     */
    public List<SelectItem> FoundAllItemOfType(String type){
     
        return null;
    }
    
    
    
}
