/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.bean;

import java.io.Serializable;
import javax.inject.Named;

/**
 *
 * @author kiki
 */
@Named("constant")
public class ConstantImpl implements ConstantIf, Serializable {

    private final String COMPONENT_DETAIL_LOCATION = "/resources/entite/detail";
    private final String COMPONENT_SUMMARY_LOCATION = "/resources/component/model/summary";
    private final String DIALOG_FRAME = "/views/dialog/dialog.xhtml";
    private final String LIST_DIALOG_FRAME = "/views/dialog/listdialog.xhtml";
    private final String OPCODE_DELETE_MULTI = "delete_multi";
    private final String OPCODE_DELETE_SINGLE = "delete_single";
    private final String OPCODE_DISPLAY = "display";
    private final String OPCODE_EDIT = "edit";
    private final String OPCODE_NEW = "new";
    private final String INCLUDE_FILE_LOCATION = "/resources/entite/detail/inc.xhtml";
    private final String MAIN_ENTITY = "mainEntity";
    private final String NOT_APPLICABLE = "N/A";
    private final String ENTITY_PACKAGE = "net.ericattou.icare.model.entities";

    @Override
    public String getPatternAnacId() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getPatternAnacLibelle() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getPatternCode() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getPatternUsername() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getCodeReussite() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getChoixAnneeEtudeAutomatique() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getChoixAnneeEtudeManuelControle() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

    }

    @Override
    public String getChoixAnneeEtudeManuelImpose() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getProfondeurEntiteAcadelique() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getIncludeFileLocation() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return INCLUDE_FILE_LOCATION;
    }

    @Override
    public String getComponentDetailLocation() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return COMPONENT_DETAIL_LOCATION;
    }

    @Override
    public String getComponentSummaryLocation() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return COMPONENT_SUMMARY_LOCATION;
    }

    @Override
    public String getControllerClass() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getDialog() {
        return DIALOG_FRAME;
    }

    @Override
    public String getListDialog() {
        return LIST_DIALOG_FRAME;
    }

    @Override
    public String getEntityPackage() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getMainEntity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getNotApplicable() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getO2MEntity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getOpcodeDeleteMulti() {
        return OPCODE_DELETE_MULTI;
    }

    @Override
    public String getOpcodeDeleteSingle() {
        return OPCODE_DELETE_SINGLE;
    }

    @Override
    public String getOpcodeDisplay() {
        return OPCODE_DISPLAY;
    }

    @Override
    public String getOpcodeEdit() {
        return OPCODE_EDIT;
    }

    @Override
    public String getOpcodeNew() {
        return OPCODE_NEW;
    }

    @Override
    public String getTaxonomieDir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
