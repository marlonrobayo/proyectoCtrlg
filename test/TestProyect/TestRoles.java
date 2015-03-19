package TestProyect;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Dto.RolesDTO;
import Modelo.RolesDAO;
import Utilidades.MyErrorExcepcion;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author HenryRG
 */
public class TestRoles {
    
    private RolesDTO rol1;
    private RolesDTO rol2;
    private RolesDTO rol3;
    private RolesDTO rol4;
    
    
    
    private List <RolesDTO> ListRoles;
    
    
    public TestRoles() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        ListRoles = new ArrayList<>();
        rol1 = new RolesDTO();
        rol2 = new RolesDTO();
        rol3 = new RolesDTO();
        rol4 = new RolesDTO();
        
        rol1.setRolid(1);
        rol1.setNamerol("Administrador");
        
        rol2.setRolid(2);
        rol2.setNamerol("Analista");
        
        rol3.setRolid(3);
        rol3.setNamerol("Gerente");
        
        rol4.setRolid(4);
        rol4.setNamerol("Coordinador");
        
        ListRoles.add(rol1);
        ListRoles.add(rol2);
        ListRoles.add(rol3);
        ListRoles.add(rol4);
    }
    
    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
     @Test
     public void PruebaListRoles()  {
     
        try {
            RolesDAO rolLista1 = new  RolesDAO();
            List <RolesDTO> miList1 = rolLista1.listarRoles();
            
            assertEquals(miList1.get(0).getRolid(),ListRoles.get(0).getRolid());
            assertEquals(miList1.get(0).getNamerol(),ListRoles.get(0).getNamerol());
            assertEquals(miList1.get(1).getRolid(),ListRoles.get(1).getRolid());
            assertEquals(miList1.get(1).getNamerol(),ListRoles.get(1).getNamerol());
            assertEquals(miList1.get(2).getRolid(),ListRoles.get(2).getRolid());
            assertEquals(miList1.get(2).getNamerol(),ListRoles.get(2).getNamerol());
            assertEquals(miList1.get(3).getRolid(),ListRoles.get(3).getRolid());
            assertEquals(miList1.get(3).getNamerol(),ListRoles.get(3).getNamerol());
            
            
        } catch (SQLException | MyErrorExcepcion ex) {
            Logger.getLogger(TestRoles.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
     
     
}
