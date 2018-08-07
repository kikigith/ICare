/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.lazy;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import net.ericattou.icare.controller.dao.DaoInterface;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;
import org.apache.commons.lang3.StringUtils;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortOrder;

/**
 *
 * @author Edmond B. Mulemangabo <edmond.mulemangabo@uclouvain.be>
 */
/**
 *
 * @author Edmond B. Mulemangabo <edmond.mulemangabo@uclouvain.be>
 * @param <T> Classe h�ritant de EntiteBaseBean
 */
public class ICareLazyModel<T extends BaseBeanEntite> extends LazyDataModel<T> implements Serializable {

    private static final long serialVersionUID = Long.MIN_VALUE;
    /**
     * remplacer "," par <COMMA_ESCAPE_SEQUENCE> dans getRowKey() et remettre
     * "," en place dans getRowData(); bug dans Primefaces quand on utilise
     * 'selectMode="multiple"' dans p:dataTable
     *
     */
    private static final String COMMA_ESCAPE_SEQUENCE = "#_1_X_2_Y_3_Z_#"; // sert � remplacer temprairement
    private boolean singleResult = Boolean.FALSE;
    private boolean jpqlVersion = Boolean.FALSE;

    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    private Class<T> queryClass = null;
    private Class<T> rootClass = null;
    private CriteriaBuilder resultBuilder;
    private CriteriaBuilder countBuilder;
    private Root<T> countRoot;
    private Root<T> resultRoot;
    private CriteriaQuery<Long> countQuery;
    private CriteriaQuery<T> resultQuery;
    private Predicate resultPermanentPredicate;
    private Predicate countPermanentPredicate;
    //private Map<String, Object> params;
    private Map<String, Path<String>> resultForeignKeyMap = new HashMap<>(1);
    private Map<String, Path<String>> countForeignKeyMap = new HashMap<>(1);

    private String resultSql;
    private String countSql;
    private String whereStatement;
    private String alias;
    private Map<String, Object> params;

    private final EntityManager entityManager;
    private final DaoInterface dao;
    // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    public ICareLazyModel(Class<T> classz, DaoInterface dao, EntityManager entityManager) {
        this.dao = dao;
        this.entityManager = entityManager;
        queryClass = rootClass = classz;
        _init();
    }

    public ICareLazyModel(Class<T> queryClass, Class<T> rootClass, DaoInterface dao, EntityManager entityManager) {
        //lazyLoad = new LazyLoad(queryClass, rootClass/*, entityManager*/);
        this.queryClass = queryClass;
        this.rootClass = rootClass;
        this.dao = dao;
        this.entityManager = entityManager;
        _init();
    }

    public ICareLazyModel(
            String resultSql,
            String countSql,
            String whereStatement,/*where statement must contain 'WHERE' */
            String alias,
            Map<String, Object> params,
            DaoInterface dao,
            EntityManager entityManager) {
//        lazyLoad = new LazyLoad(
//                resultSql,
//                countSql,
//                whereStatement,
//                alias,
//                params/*,
//             dao*/
//        );
        this.dao = dao;
        this.entityManager = entityManager;
        this.resultSql = resultSql;
        this.countSql = countSql;
        this.whereStatement = whereStatement;
        this.alias = alias;
        this.params = params;
        jpqlVersion = Boolean.TRUE;
    }

    @Override
    public List<T> load(int first, int pageSize, String sortField, SortOrder sortOrder, Map<String, Object/*EbM-5*/> filters) {
        if (singleResult) {
            return (List<T>) this.getWrappedData();
        }
        List<T> retval = null;
        if (jpqlVersion) {
            try {
                // v�rifier que le cast long->int peut se faire sans modifier la valeur du nombre
                long longNumber = countJpql(filters);
                if (longNumber < Integer.MIN_VALUE || longNumber > Integer.MAX_VALUE) {
                    throw new IllegalArgumentException(longNumber + " cannot be cast to int without changing its value.");
                }
                setRowCount((int) longNumber);
                retval = getResultListJpql(first, pageSize, sortField, sortOrder, filters);
            } catch (Exception e) {
                throw new IllegalArgumentException(e.getMessage());
            }

        } else {
            // v�rifier que le cast long->int peut se faire sans modifier la valeur du nombre
            long longNumber = count(filters);
            if (longNumber < Integer.MIN_VALUE || longNumber > Integer.MAX_VALUE) {
                throw new IllegalArgumentException(longNumber + " cannot be cast to int without changing its value.");
            }
            setRowCount((int) longNumber);
            retval = getResultList(first, pageSize, sortField, sortOrder, filters);
        }
        return retval;
    }

    /**
     * retrouver la clef de la classe Entit�. remplacer "," par
     * COMMA_ESCAPE_SEQUENCE et faire l'inverse dans getRowData(). bug dans
     * Primefaces ? quand on utilise 'selectMode="multiple"' dans p:dataTable
     *
     * @param entite objet de la classse Entit�
     * @return key la clef de l'objet Entit�
     */
    @Override
    public Object getRowKey(T entite) {
        String key = entite.getId();
        if (key != null && (!key.isEmpty())) {
            key = key.replaceAll(",", COMMA_ESCAPE_SEQUENCE);
        }
        return key;
    }

    /**
     * retrouver l'objet de la classe Entit� � partir de sa clef. remplacer
     * COMMA_ESCAPE_SEQUENCE par "," et faire l'inverse dans getRowKey(). bug
     * dans Primefaces ? quand on utilise 'selectMode="multiple"' dans
     * p:dataTable
     *
     * @param rowKey clef de l'objet
     * @return key la clef de l'objet Entit�
     */
    @Override
    public T getRowData(String rowKey) {
        List<T> entites = (List<T>) this.getWrappedData();
        String key = rowKey.replaceAll(COMMA_ESCAPE_SEQUENCE, ",");
        for (T entite : entites) {
            if (entite.getId().equals(key)) {
                return entite;
            }
        }

        return null;
    }

    public <P extends BaseBeanEntite> void setSingleResultWrappedData(P obj) {
        List<P> list = new ArrayList<>(1);
        list.add(obj);
        setWrappedData(list);
        setRowCount(1);
        singleResult = Boolean.TRUE;
        //setRowIndex(1);
    }

    // Begin LazyLoad >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    /*
             * transformer les filters en conditions.
             * @filters filtres transmis par JSF
             * @returm null si le Map des filtres est null; un Map contenant 2 �l�ments : les param�tres (clef = "param") et les conditions (clef = "condition")
     */
    private Map<String, Object> makeFilterCondition(Map<String, Object> filters) {
        if (filters == null || filters.isEmpty()) {
            return null;
        }
        String wildCard = "%";
        String condition = "";

        Map<String, Object> map = new HashMap<>(2);
        Map<String, Object> paramMap = new HashMap<>(filters.size());
        int counter = 1;
        String paramKey;
        for (Map.Entry<String, Object> filter : filters.entrySet()) {
            paramKey = "filter" + counter;
            if (!StringUtils.isEmpty(condition)) {
                condition = condition + " AND ";
            }
            condition = condition + alias + "." + filter.getKey() + " LIKE :" + paramKey;
            paramMap.put(paramKey, wildCard + filter.getValue() + wildCard);
            counter++;
        }
        map.put("param", paramMap);
        map.put("condition", condition);
        return map;
    }

    public long countJpql(Map<String, Object> filters) throws Exception {
        Map<String, Object> filterConditions = makeFilterCondition(filters);
        String wherePhrase;
        Map<String, Object> newParams = params;
        if (filterConditions == null) {
            wherePhrase = whereStatement;
        } else {
            wherePhrase = (StringUtils.isEmpty(whereStatement))
                    ? (String) filterConditions.get("condition")
                    : whereStatement + " AND " + (String) filterConditions.get("condition");
            if (newParams != null) {
                newParams = new HashMap<>(params.size() + ((Map<String, Object>) filterConditions.get("param")).size());
                newParams.putAll(params);
                newParams.putAll((Map<String, Object>) filterConditions.get("param"));
            }
        }
        String sql = countSql + (StringUtils.isEmpty(wherePhrase) ? "" : " " + wherePhrase);
        long result = dao.lookupNumberHavingSqlQueryDetached(sql, newParams);
        return result;
    }

    public List<T> getResultListJpql(int first, int pageSize, String sortField, SortOrder sortOrder, Map<String, Object> filters) throws Exception {
        Map<String, Object> filterConditions = makeFilterCondition(filters);
        String wherePhrase;
        Map<String, Object> newParams = params;
        if (filterConditions == null) {
            wherePhrase = whereStatement;
        } else {
            wherePhrase = (StringUtils.isEmpty(whereStatement))
                    ? (String) filterConditions.get("condition")
                    : whereStatement + " AND " + (String) filterConditions.get("condition");
            if (newParams != null) {
                newParams = new HashMap<>(params.size() + ((Map<String, Object>) filterConditions.get("param")).size());
                newParams.putAll(params);
                newParams.putAll((Map<String, Object>) filterConditions.get("param"));
            }
        }
        String orderByStatement = "";
        if (!StringUtils.isEmpty(sortField)) {
            orderByStatement = " ORDER BY " + alias + "." + sortField;
            switch (sortOrder) {
                case ASCENDING:
                    orderByStatement = orderByStatement + " ASC";
                    break;
                case DESCENDING:
                    orderByStatement = orderByStatement + " DESC";
                    break;
                default:
                    break;
            }
        }
        String sql = resultSql + (StringUtils.isEmpty(wherePhrase) ? "" : " " + wherePhrase) + (StringUtils.isEmpty(orderByStatement) ? "" : " " + orderByStatement);
        List<T> result = dao.lazyLookup(sql, newParams, first, pageSize);
        return result;
    }

    // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    private void _init() {
        resultBuilder = entityManager.getCriteriaBuilder();
        countBuilder = entityManager.getCriteriaBuilder();
        resultPermanentPredicate = resultBuilder.equal(resultBuilder.literal(1), 1); // get all records by default

        resultQuery = resultBuilder.createQuery(queryClass);
        resultRoot = resultQuery.from(rootClass);
        resultQuery.select(resultRoot);

        countQuery = countBuilder.createQuery(Long.class);
        countRoot = countQuery.from(queryClass);
        countQuery.select(countBuilder.count(countRoot));
    }

    private Predicate getFilterCondition(/*Map<String, Path<String>> foreignKeyMap,*/CriteriaBuilder builder, Root<T> entityObj, Map<String, Object> filters) {
        Predicate filterCondition = builder.conjunction();
        String wildCard = "%";
        for (Map.Entry<String, Object> filter : filters.entrySet()) {
            String value = wildCard + filter.getValue() + wildCard;

            if (!StringUtils.isEmpty(filter.getValue().toString())) {
                if (filter.getKey().indexOf((int) '.') > 0) {
                    String[] tokens = filter.getKey().split("\\.");
                    Path<? extends BaseBeanEntite> entityPath = entityObj.get(tokens[0]);
                    for (int i = 1; i < tokens.length - 1; i++) {
                        entityPath = entityPath.get(tokens[i]);
                    }
                    Path<String> pathValue = entityPath.get(tokens[tokens.length - 1]);
                    filterCondition = builder.and(filterCondition, builder.like(pathValue, value));
                } else {
                    javax.persistence.criteria.Path<String> path = entityObj.get(filter.getKey());
                    filterCondition = builder.and(filterCondition, builder.like(path, value));
                }
//                    else if (foreignKeyMap.containsKey(filter.getKey())) {
//                        filterCondition = builder.and(filterCondition, builder.like(foreignKeyMap.get(filter.getKey()), value));
//                    }
            }
        }
        return filterCondition;
    }

    public long count(Map<String, Object> filters) {
        if (jpqlVersion) {
            try {
                return countJpql(filters);
            } catch (Exception e) {
                return 0; // ????? can't we really do better in such a case ?
            }
        }
        //CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        Predicate condition = countPermanentPredicate;
        if (filters != null && (!filters.isEmpty())) {
            Predicate filterCondition = getFilterCondition(/*countForeignKeyMap, */countBuilder, countRoot, filters);
            if (filterCondition != null) {
                condition = (condition != null)
                        ? countBuilder.and(condition, filterCondition)
                        : filterCondition;
            }
        }
        if (condition != null) {
            countQuery.where(condition);
        }
        //countQuery.select(countBuilder.count(countRoot));
        TypedQuery<Long> tq = entityManager.createQuery(countQuery);
        //tq.setHint("javax.persistence.cache.storeMode", "REFRESH"); // EbM 2013 10 02
//        if (params != null && (!params.isEmpty())) {
//            for (String key : params.keySet()) {
//                tq.setParameter(key, params.get(key));
//            }
//        }
        return tq.getSingleResult().intValue();
    }

    public List<T> getResultList(int first, int pageSize, String sortField, SortOrder sortOrder, Map<String, Object> filters) {
        if (jpqlVersion) {
            try {
                return getResultListJpql(first, pageSize, sortField, sortOrder, filters);
            } catch (Exception e) {
                return null; // ??? Can't we really do better in such a case ?
            }
        }
        //CriteriaBuilder builder = entityManager.getCriteriaBuilder();

        Predicate condition = resultPermanentPredicate;
        if (filters != null && (!filters.isEmpty())) {
            Predicate filterCondition = getFilterCondition(/*resultForeignKeyMap, */resultBuilder, resultRoot, filters);
            if (filterCondition != null) {
                condition = (condition != null)
                        ? resultBuilder.and(condition, filterCondition)
                        : filterCondition;
            }
        }
//        if (condition != null) {
//            resultQuery.where(condition);
//        }
        resultQuery.where(condition);
        // resultQuery.select(resultRoot);
        if (!StringUtils.isEmpty(sortField)) {
            if (sortField.indexOf((int) '.') > 0) {
                String[] tokens = sortField.split("\\.");
                Path<? extends BaseBeanEntite> entityPath = resultRoot.get(tokens[0]);
                for (int i = 1; i < tokens.length - 1; i++) {
                    entityPath = entityPath.get(tokens[i]);
                }
                Path<String> pathValue = entityPath.get(tokens[tokens.length - 1]);
                if (sortOrder == SortOrder.ASCENDING) {
                    resultQuery.orderBy(resultBuilder.asc(pathValue));
                } else if (sortOrder == SortOrder.DESCENDING) {
                    resultQuery.orderBy(resultBuilder.desc(pathValue));
                }
            } else if (sortOrder == SortOrder.ASCENDING) {
                resultQuery.orderBy(resultBuilder.asc(resultRoot.get(sortField)));
            } else if (sortOrder == SortOrder.DESCENDING) {
                resultQuery.orderBy(resultBuilder.desc(resultRoot.get(sortField)));
            }
        }
        TypedQuery<T> tq = entityManager.createQuery(resultQuery);
        return tq.setFirstResult(first).setMaxResults(pageSize).getResultList();
    }

    public void setResultConditions(Predicate predicate) {
        this.resultPermanentPredicate = predicate;
    }

    public void setCountConditions(Predicate predicate) {
        this.countPermanentPredicate = predicate;
    }

    /**
     * @return the countRoot
     */
    public Root<T> getCountRoot() {
        return countRoot;
    }

    /**
     * @param countRoot the countRoot to set
     */
    public void setCountRoot(Root<T> countRoot) {
        this.countRoot = countRoot;
    }

    /**
     * @return the resultRoot
     */
    public Root<T> getResultRoot() {
        return resultRoot;
    }

    /**
     * @param resultRoot the resultRoot to set
     */
    public void setResultRoot(Root<T> resultRoot) {
        this.resultRoot = resultRoot;
    }

    /**
     * @return the countQuery
     */
    public CriteriaQuery<Long> getCountQuery() {
        return countQuery;
    }

    /**
     * @param countQuery the countQuery to set
     */
    public void setCountQuery(CriteriaQuery<Long> countQuery) {
        this.countQuery = countQuery;
    }

    /**
     * @return the resultQuery
     */
    public CriteriaQuery<T> getResultQuery() {
        return resultQuery;
    }

    /**
     * @param resultQuery the resultQuery to set
     */
    public void setResultQuery(CriteriaQuery<T> resultQuery) {
        this.resultQuery = resultQuery;
    }

    /**
     * @return the countBuilder
     */
    public CriteriaBuilder getCountBuilder() {
        return countBuilder;
    }

    /**
     * @param countBuilder the countBuilder to set
     */
    public void setCountBuilder(CriteriaBuilder countBuilder) {
        this.countBuilder = countBuilder;
    }

    /**
     * @return the builder
     */
    public CriteriaBuilder getResultBuilder() {
        return resultBuilder;
    }

    /**
     *
     * @param resultBuilder the builder to set
     */
    public void setResultBuilder(CriteriaBuilder resultBuilder) {
        this.resultBuilder = resultBuilder;
    }

    /**
     * @return the resultForeignKeyMap
     */
    public Map<String, Path<String>> getResultForeignKeyMap() {
        return resultForeignKeyMap;
    }

    /**
     * @param resultForeignKeyMap the resultForeignKeyMap to set
     */
    public void setResultForeignKeyMap(Map<String, Path<String>> resultForeignKeyMap) {
        this.resultForeignKeyMap = resultForeignKeyMap;
    }

    /**
     * @return the countForeignKeyMap
     */
    public Map<String, Path<String>> getCountForeignKeyMap() {
        return countForeignKeyMap;
    }

    /**
     * @param countForeignKeyMap the countForeignKeyMap to set
     */
    public void setCountForeignKeyMap(Map<String, Path<String>> countForeignKeyMap) {
        this.countForeignKeyMap = countForeignKeyMap;
    }

    /**
     * @return the queryClass
     */
    public Class<T> getQueryClass() {
        return queryClass;
    }

    /**
     * @param queryClass the queryClass to set
     */
    public void setQueryClass(Class<T> queryClass) {
        this.queryClass = queryClass;
    }

    /**
     * @return the rootClass
     */
    public Class<T> getRootClass() {
        return rootClass;
    }

    /**
     * @param rootClass the rootClass to set
     */
    public void setRootClass(Class<T> rootClass) {
        this.rootClass = rootClass;
    }

    // End LazyLaod <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
}
