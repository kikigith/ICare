/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.controller.dao;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.metamodel.Metamodel;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;
import net.ericattou.interceptor.PersistCallback;
import org.eclipse.persistence.config.HintValues;
import org.eclipse.persistence.config.QueryHints;

/**
 *
 * @author kiki
 */
@Stateless
@TransactionAttribute(TransactionAttributeType.NOT_SUPPORTED)
public class DaoImplemented implements DaoInterface {

    @PersistenceContext(unitName = "icarePU")
    private EntityManager icEm;
    
    @EJB
    private PersistCallback persistCallback;

    /**
     * @Inject Todo inject qualifiers*
     */

    @Override
    public int getCount(CriteriaQuery<Long> criteriaQuery) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List executeCriteriaQuery(CriteriaQuery criteriaQuery, int firstResult, int pageSize, int maxFetchDepth, Map params) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List executeQuery(String sql, int firstResult, int pageSize, int maxFetchDepth, Map params) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List executeCriteriaQuery(CriteriaQuery criteriaQuery, int maxFetchDepth) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object executeCriteriaQuerySingle(CriteriaQuery criteriaQuery, int maxFetchDepth, Map params) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Metamodel getMetamodel() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public CriteriaBuilder getCriteriaBuilder() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> void saveUnlessExists(List<T> entities) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Number lookupCountDetached(String sql, Map<String, Object> params) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object lookupSingleDetached(String sql, Map<String, Object> params) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> T lookupSingleDetached(String sql, Map<String, Object> params, Class<T> classz) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List lookupHavingSqlQueryDetachedAny(String sql, Map<String, Object> params, Class classz) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> List<? extends BaseBeanEntite> lookupHavingSqlQuery(String sql, Map<String, Object> params, Class<T> classz) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> List<? extends BaseBeanEntite> lookupHavingSqlQueryDetached(String sql, Map<String, Object> params, Class<T> classz) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void flush() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T> T getSingleResult(String sql, Map<String, Object> params, Class<T> klassz) throws Exception {
        TypedQuery<T> tq;
        if(icEm ==null){
            throw new Exception("EntityManager is not a valid object");
        }
        
        tq = icEm.createQuery(sql, klassz);
        tq.setHint(QueryHints.READ_ONLY,HintValues.FALSE);
        
        if(params !=null){
            Iterator<String> iter = params.keySet().iterator();
            while(iter.hasNext()){
                String p = iter.next();
                tq.setParameter(p, params.get(p));
            }
        }
        
        try {
            return tq.getSingleResult();
        } catch (NoResultException nre) {
            return null;
        }catch (Exception e) {
            throw new Exception("query.getSingleResult() failed" + e.getMessage());
        }
    }
    
    

    @Override
    public <T > List<T> getResultList(String sql,Map<String,Object> params, Class<T> klassz) throws Exception {
        TypedQuery<T> tq=null;
        if(icEm==null){
        throw new Exception("Invalid entity manager");
        }
        tq=icEm.createQuery(sql,klassz);
         if (params != null) {
            Iterator<String> iter = params.keySet().iterator();
            while (iter.hasNext()) {
                String p = iter.next();
                tq.setParameter(p, params.get(p));
            }
        }
        List<T> res = tq.getResultList();
        if (res == null || res.isEmpty()) {
            return null;
        }
        return res;
        
    }

    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public <T extends BaseBeanEntite> void save(T entity) throws Exception {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        persistCallback.persistEntityOperation(entity);
        icEm.persist(entity);
//        if(entity.isObserved()){
//            postPersistEntityEvent.fire(entite);
//        }
    }

    @Override
    public void saveArray(Object[] entities) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void refresh(BaseBeanEntite entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> void delete(T entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> void delete(T[] tab) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> void delete(List<T> entities) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> T update(T entity) throws Exception {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
icEm.persist(entity);return entity;
    }

    @Override
    public <T extends BaseBeanEntite> void detach(T entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> void updateList(List<T> entities) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> void update(T[] entities) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> T findById(Class<T> classz, String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> List<T> doNativeStatement(String sql, Map<Integer, String> params, Class<T> classz) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T> T getReference(Class<T> klazz, String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends Number> T lookupNumberHavingSqlQueryDetached(String sql, Map<String, Object> params) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T extends BaseBeanEntite> List<T> lazyLookup(String sql, Map<String, Object> params, int first, int pageSize) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public <T> List lookupAny(String sql, Map<String, Object> params, Class<T> classz) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
