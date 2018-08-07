/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.bean;

/**
 *
 * @author kiki
 */
public class Constants {

    public static final long serialVersionUID = Long.MIN_VALUE;
    public static final String CHOIX_ANNEE_ETUDE_AUTOMATIQUE = "choix_annee_etude_automatique";
    public static final String CHOIX_ANNEE_ETUDE_MANUEL_CONTROLE = "choix_annee_etude_manuel_controle";
    public static final String CHOIX_ANNEE_ETUDE_MANUEL_IMPOSE = "choix_annee_etude_manuel_impose";
    public static final String COMPONENT_DETAIL_LOCATION = "/resources/entite/detail";
    public static final String COMPONENT_SUMMARY_LOCATION = "/resources/entite/summary";
    public static final String CONTROLLER_CLASS = "net.bilima.okapiCollege.model.bean.BeanParent";
    public static final String DIALOG = "/views/dialog/dialog.xhtml";
    public static final String ENTITY_PACKAGE = "net.bilima.okapiCollege.model.entity";
    public static final String INCLUDE_FILE_LOCATION = "/resources/entite/detail/inc.xhtml"; // fichier utilis้ par views/dialog/dialog.xhtml
    public static final String LIST_DIALOG = "/views/dialog/listDialog.xhtml";
    public static final String MAIN_ENTITY = "mainEntity";
    public static final String NOT_APPLICABLE = "N/A";
    public static final String O2M_ENTITY = "o2mEntity";
    public static final String OPCODE_DELETE_MULTI = "delete_multi";
    public static final String OPCODE_DELETE_SINGLE = "delete_single";
    public static final String OPCODE_DISPLAY = "display";
    public static final String OPCODE_EDIT = "edit";
    public static final String OPCODE_NEW = "new";
    public static final String PATTERN_ANAC_ID = "^\\d{4}$";
    public static final String PATTERN_ANAC_LIBELLE = "^\\d{4}\\-\\d{4}$";
    public static final String PATTERN_CODE = "^[\\p{Upper}_\\-\\.\\d/]+$";
    public static final String PATTERN_USERNAME = "^\\p{Lower}[\\p{Lower}\\d\\.\\-_@]+$";
    public static final int PROFONDEUR_ENTITE_ACADEMIQUE = 6; // profondeur maximale de la hi้rarchie des Entit้s Acad้miques
    public static final String REUSSITE_PROP_FILE = "code_reussite";
    public static final String TAXONOMIE_DIR = "/opt/okapi/etc/properties";

}
