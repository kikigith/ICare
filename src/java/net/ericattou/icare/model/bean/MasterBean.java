/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.enterprise.inject.Any;
import javax.enterprise.inject.spi.Bean;
import javax.enterprise.inject.spi.BeanManager;
import javax.enterprise.util.AnnotationLiteral;
import javax.inject.Inject;
import net.bilima.okapiUtils.utils.JSFUtility;
import net.ericattou.icare.controller.dao.DaoInterface;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;
import net.ericattou.icare.model.lazy.ICareLazyModel;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.primefaces.context.RequestContext;

/**
 *
 * @author kiki
 */
public class MasterBean implements Serializable {

    private List<BaseBeanEntite> selections;
    private BaseBeanEntite selection;
    private BaseBeanEntite toggledRow = null;
    private List<? extends BaseBeanEntite>  listResult;
    private String profilSelectionne;
    private String beanName;

    @Inject
    private DialogBean dialogBean;
    @Inject
    private BeanManager beanManager;
    @Inject
    private ConstantIf constant;

    @Inject
    protected DaoInterface dao;

    private String id = null;
    private String listNameToBeUpdatedOnReturnFromDelete;
    private String selecteurProfil = "fiche";

    private BaseBeanEntite nouvelleFiche;
    private BaseBeanEntite nouvelleFiche_M2O;

    private ICareLazyModel<? extends BaseBeanEntite> iCareLazyModel = null;
    private boolean alive=Boolean.FALSE;
    
    protected String classeFQDN;
    protected String viewRoot; //initialiser par la classe fille

    public ICareLazyModel<? extends BaseBeanEntite> getICareLazyModel() {
        return iCareLazyModel;
    }

    public List<? extends BaseBeanEntite> getListResult() {
        return listResult;
    }

    public void setListResult(List<? extends BaseBeanEntite> listResult) {
        this.listResult = listResult;
    }

    
    public String showDetailsDialog(String ficheSelectionne) {
        this.profilSelectionne = ficheSelectionne;
        if (toggledRow == null) {
            if (selections == null || selections.isEmpty()) {
                return null;
            }

        } else {
            toggledRow = selections.get(0);

        }
        return "details?faces-redirect=true";
    }

    public String dlgEditAction(BaseBeanEntite record, String faceletsComponent, String header) {
        dialogBean.setFiche(record);
        String beanName = getBeanName();
        dialogBean.setCallerNameAndClass(beanName, this.getClass());
        showDialog(constant.getDialog(), constant.getOpcodeEdit(), faceletsComponent, header);
        return null;
    }

    public void dlgDeleteActionListener(String type, String listProperty, String faceletsComponent, String header) {
        String beanName = getBeanName();
        dialogBean.setCallerNameAndClass(beanName, this.getClass());
        listNameToBeUpdatedOnReturnFromDelete = listProperty;

        if (type.equals(constant.getMainEntity())) {
            if (selections == null || selections.isEmpty()) {
                JSFUtility.addWarnMessage("Veuillez sélectionner les fiches à supprimer");
                return;
            }
            dialogBean.setFiches(selections);
            showDialog(constant.getDialog(), constant.getOpcodeDeleteMulti(), faceletsComponent, header);
        } else if (type.equals(constant.getO2MEntity())) {
            if (selection == null) {
                JSFUtility.addWarnMessage("Veuillez sélectionner la fiche à supprimer");
                return;
            }
            dialogBean.setFiche(selection);
            showDialog(constant.getDialog(), constant.getOpcodeDeleteMulti(), faceletsComponent, header);

        }
    }

    public void dlgNewActionListener(String className, String faceletsComponent, String header) {

        try {
            Object obj = fromName2Instance(className);
            if (obj == null) {
                JSFUtility.addErrorMessage("la classe '" + className + "' est incompatible avec la classe BaseBeanEntite");
                return;
            }
            dialogBean.setFiche((BaseBeanEntite) obj);
            String beanName = getBeanName();
            dialogBean.setCallerNameAndClass(beanName, this.getClass());
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException exc) {
            JSFUtility.addErrorMessage(JSFUtility.expandException(exc));
            return;
        }
        showDialog(constant.getDialog(), constant.getOpcodeNew(), faceletsComponent, header);
    }

    public String profileAction(String selecteurProfil) {
        this.selecteurProfil = selecteurProfil;
        nouvelleFiche_M2O = null;
        if (toggledRow == null) {
            if (selections == null || selections.isEmpty() || selections.size() > 1) {
                JSFUtility.addErrorMessage("Veuillez sélectionner une fiche");
                return null;

            } else if (selections.size() > 1) {
                JSFUtility.addErrorMessage("Vous avez sélectionner plusieurs fiches pour le profil. Vous ne pouvez en sélectionner qu'une");
                return null;

            }
            toggledRow = selections.get(0);
        }
        if (selections != null && (!selections.isEmpty()) && (!toggledRow.getId().equals(selections.get(0).getId()))) {
            toggledRow = selections.get(0);
        }
        return "profil?faces-redirect=true";
    }

    /**
     *
     * @param opCode type d'action du formulaire du dialogue
     * @param classFQDN nom complet de la classe d'objet expos้ dasn le dialogue
     * @param header en-tete du dialogue
     */
    public void showDialog(String dialog, String opCode, String faceletsComponent, String header) {
        // InputStream input = FacesContext.getCurrentInstance().getExternalContext().getResourceAsStream(constant.getComponentDetailLocation());

        // attributs du dialogue en tant que composant Primefaces
        Map<String, Object> options = new HashMap<>();
        options.put("resizable", Boolean.TRUE);
        options.put("maximizable", Boolean.TRUE);
        options.put("minimizable", Boolean.TRUE);
        options.put("draggable", Boolean.TRUE);
        options.put("modal", Boolean.TRUE);
        options.put("header", header);
        options.put("width", 640);
        options.put("height", 540);
        options.put("contentWidth", "100%");
        options.put("contentHeight", "100%");
        options.put("headerElement", "customheader");
        options.put("showHeader", Boolean.TRUE);
        options.put("includeViewParams", Boolean.TRUE);

        // initialiser les param่tres URL du dialogue
        Map<String, List<String>> params = new HashMap<>();

        // param่tre "opCode" de l'URL du dialogue
        List<String> paramList = new ArrayList<>(1);
        paramList.add(opCode);
        params.put("opCode", paramList);

        // param่tre "component" de l'URL du dialogue
        paramList = new ArrayList<>(1);
        paramList.add(faceletsComponent);
        params.put("component", paramList);

        // param่tre "header" du dialogue. Il ne s'affiche pas via l'option "header" !!!!
        paramList = new ArrayList<>(1);
        paramList.add(header);
        params.put("header", paramList);

        // afficher le dialogue
        RequestContext.getCurrentInstance().openDialog(dialog, options, params);
    }

    /**
     * convertir un nom de classe en format FQDN en une instance d'objet.
     * V้rifier que l'objet est une instance de EntiteBaseBean
     *
     * @param className nom de la classe.
     * @return obj un objet instance de classFQDN; null si l'objet n'est pas une
     * instance de EntiteBaseBean
     * @throws ClassNotFoundException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    protected Object fromName2Instance(String className)
            throws ClassNotFoundException, InstantiationException, IllegalAccessException {
        String classFQDN = className;
        // if the name isn't in FQDN format, make it FQDN
        if (!className.contains(".")) {
//            classFQDN = constant.getEntityPackage() + "." + className;
            classFQDN = "net.ericattou.icare.model.entities" + "." + className;
        }
        Class<?> clazz = Class.forName(classFQDN);
        Object obj = clazz.newInstance();
        if (!(obj instanceof BaseBeanEntite)) {
            return null;
        }
        return obj;
    }

    public void postProcessXLSX(Object document) {
        //Get the 1st sheet from the XLSX document
        XSSFWorkbook workbook = (XSSFWorkbook) document;
        XSSFSheet sheet = workbook.getSheetAt(0);

        XSSFRow header = sheet.getRow(0);
        XSSFCellStyle cellStyle = workbook.createCellStyle();

        /* We will now specify a background cell color */
        cellStyle.setFillPattern(XSSFCellStyle.FINE_DOTS);
        cellStyle.setFillForegroundColor(IndexedColors.BLUE.getIndex());
        cellStyle.setFillBackgroundColor(IndexedColors.RED.getIndex());

        Iterator<Row> rowIterator = sheet.rowIterator();
        while (rowIterator.hasNext()) {
            Row row = rowIterator.next();
            Iterator<Cell> cellIterator = row.cellIterator();
            while (cellIterator.hasNext()) {
                Cell cell = cellIterator.next();
                cell.setCellStyle(cellStyle);
            }
            break;

        }

    }

    public boolean getAlive() {
        return Boolean.TRUE;
    }

    public BaseBeanEntite getToggledRow() {
        return toggledRow;
    }

    public void setToggledRow(BaseBeanEntite toggledRow) {
        this.toggledRow = toggledRow;
    }

    public String getProfilSelectionne() {
        return profilSelectionne;
    }

    protected String getBeanName() {
        if (!StringUtils.isEmpty(beanName)) {
            return beanName;
        }
        Set<Bean<?>> beans = beanManager.getBeans(Object.class, new AnnotationLiteral<Any>() {
            private static final long serialVersionUID = 1L;
        });
        for (Bean<?> bean : beans) {
            if (bean.getBeanClass() == this.getClass()) {
                beanName = bean.getName();
                break;
            }
        }
        return beanName;
    }

    public String getClasseFQDN() {
        return classeFQDN;
    }

    public void setClasseFQDN(String classeFQDN) {
        this.classeFQDN = classeFQDN;
    }

    public String getViewRoot() {
        return viewRoot;
    }

    public void setViewRoot(String viewRoot) {
        this.viewRoot = viewRoot;
    }
    public List<String> getLesEtablissements() {
        return null;

    }

    public List<String> getSpecialitesEtablissement(String etablissement) {
        List<String> specialites = new ArrayList<>();

        return specialites;
    }


    public void setProfilSelectionne(String profilSelectionne) {
        this.profilSelectionne = profilSelectionne;
    }

    public List<BaseBeanEntite> getSelections() {
        return selections;
    }

    public void setSelections(List<BaseBeanEntite> selections) {
        this.selections = selections;
    }

    public void setICareLazyModel(ICareLazyModel<? extends BaseBeanEntite> iCareLazyModel) {
        this.iCareLazyModel = iCareLazyModel;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
