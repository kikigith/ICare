/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ericattou.icare.model.bean;

import javax.faces.event.ActionEvent;
import javax.inject.Inject;
import net.ericattou.icare.model.entities.CategoriePatientEntite;
import net.ericattou.icare.model.entities.PatientEntite;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;

/**
 *
 * @author kiki
 */
@RunWith(Arquillian.class)
public class PatientBeanTest {

    @Inject
    private PatientBean patientBean;
    
    @Deployment
    public static JavaArchive createDeploymentArchive() {
        return ShrinkWrap.create(JavaArchive.class)
                .addClass(PatientBean.class)
                .addAsManifestResource(EmptyAsset.INSTANCE, "beans.xml");
    }

    public PatientBeanTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getPatient method, of class PatientBean.
     */
    @Test
    public void testGetPatient() {
        System.out.println("getPatient");
        PatientBean instance = new PatientBean();
        PatientEntite expResult = null;
        PatientEntite result = instance.getPatient();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setPatient method, of class PatientBean.
     */
    @Test
    public void testSetPatient() {
        System.out.println("setPatient");
        PatientEntite patient = null;
        PatientBean instance = new PatientBean();
        instance.setPatient(patient);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCategorie method, of class PatientBean.
     */
    @Test
    public void testGetCategorie() {
        System.out.println("getCategorie");
        PatientBean instance = new PatientBean();
        CategoriePatientEntite expResult = null;
        CategoriePatientEntite result = instance.getCategorie();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setCategorie method, of class PatientBean.
     */
    @Test
    public void testSetCategorie() {
        System.out.println("setCategorie");
        CategoriePatientEntite categorie = null;
        PatientBean instance = new PatientBean();
        instance.setCategorie(categorie);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of searchByID method, of class PatientBean.
     */
    @Test
    public void testSearchByID() {
        System.out.println("searchByID");
        ActionEvent event = null;
        PatientBean instance = new PatientBean();
        instance.searchByID(event);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

}
