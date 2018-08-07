/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.bean;

import java.util.List;
import javax.faces.event.ActionEvent;
import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public interface DialogIf {
    public BaseBeanEntite getFiche();
    public void setFiche(BaseBeanEntite fiche);
    public List<? extends BaseBeanEntite> getFiches();
    public void setFiches(List<? extends BaseBeanEntite> fiches);
    public void setComponent(String header);
    public String getComponent();
    public void setHeader(String header);
    public String getHeader();
    public void setOpCode(String opCode);
    public String getOpCode();
    public void saveAndCloseDialog(ActionEvent evt);
    public void deleteAndCloseDialog(ActionEvent event);
    public void deleteAndReturnRecord(ActionEvent event);
}
