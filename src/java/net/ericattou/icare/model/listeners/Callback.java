/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.listeners;

import net.ericattou.icare.model.dependencies.BaseBeanEntite;

/**
 *
 * @author kiki
 */
public class Callback {

    public void prePersistAction(Object obj) {
        ((BaseBeanEntite) obj).prePersistAction();
    }

    public void postPersistAction(Object obj) {
        if (!(obj instanceof BaseBeanEntite)) {
            return;
        }
        ((BaseBeanEntite) obj).postPersistAction();
    }

    public void preUpdateAction(Object obj) {
        ((BaseBeanEntite) obj).preUpdateAction();
    }

    public void postUpdateAction(Object obj) {
        if (!(obj instanceof BaseBeanEntite)) {
            return;
        }
        ((BaseBeanEntite) obj).postUpdateAction();

    }

    public void preRemoveAction(Object obj) {
        if (!(obj instanceof BaseBeanEntite)) {
            return;
        }
        ((BaseBeanEntite) obj).preRemoveAction();
    }

    public void postRemoveAction(Object obj) {
        if (!(obj instanceof BaseBeanEntite)) {
            return;
        }
        ((BaseBeanEntite) obj).postRemoveAction();
    }

    public void postLoadAction() {
    }

}
