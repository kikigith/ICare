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
public interface ConstantIf {
     public String getPatternAnacId();

    public String getPatternAnacLibelle();

    /**
     * @return PATTERN_CODE
     */
    public String getPatternCode();

    /**
     * @return PATTERN_USERNAME
     */
    public String getPatternUsername();

    /**
     * @return CODE_REUSSITE
     */
    public String getCodeReussite();

    /**
     * @return CHOIX_ANNEE_ETUDE_AUTOMATIQUE
     */
    public String getChoixAnneeEtudeAutomatique();

    public String getChoixAnneeEtudeManuelControle();

    /**
     * @return CHOIX_ANNEE_ETUDE_MANUEL_IMPOSE
     */
    public String getChoixAnneeEtudeManuelImpose();

    /**
     * @return the INCLUDE_FILE_LOCATION
     */
    public int getProfondeurEntiteAcadelique();

    /**
     * @return the INCLUDE_FILE_LOCATION
     */
    public String getIncludeFileLocation();

    /**
     * @return the COMPONENT_DETAIL_LOCATION
     */
    public String getComponentDetailLocation();

    /**
     * @return the COMPONENT_SUMMARY_LOCATION
     */
    public String getComponentSummaryLocation();

    /**
     * @return the CONTROLLER_CLASS
     */
    public String getControllerClass();

    /**
     * @return the DIALOG
     */
    public String getDialog();

    /**
     * @return the LIST_DIALOG
     */
    public String getListDialog();

    /**
     * @return the ENTITY_PACKAGE
     */
    public String getEntityPackage();

    /**
     * @return the MAIN_ENTITY
     */
    public String getMainEntity();

    /**
     * @return the NOT_APPLICABLE
     */
    public String getNotApplicable();

    /**
     * @return the O2M_ENTITY
     */
    public String getO2MEntity();

    /**
     * @return the OPCODE_DELETE_MULTI
     */
    public String getOpcodeDeleteMulti();

    /**
     * @return the OPCODE_DELETE_SINGLE
     */
    public String getOpcodeDeleteSingle();

    /**
     * @return the OPCODE_DISPLAY
     */
    public String getOpcodeDisplay();

    /**
     * @return the OPCODE_EDIT
     */
    public String getOpcodeEdit();

    /**
     * @return the OPCODE_NEW
     */
    public String getOpcodeNew();

    /**
     * @return the TAXONOMIE_DIR
     */
    public String getTaxonomieDir();
}
