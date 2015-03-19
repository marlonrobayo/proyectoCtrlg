/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestProyect;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import Dto.ItemDTO;
import Modelo.ItemDAO;
import Utilidades.MyErrorExcepcion;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author HenryRG
 */
public class TestItemFacturable {
    
    private ItemDTO item1;
    private ItemDTO item2;
    private ItemDTO item3;
    private ItemDTO item4;
    private ItemDTO item5;
    private ItemDTO item6;
    
    private ItemDTO item7;
    private ItemDTO item8;
    private ItemDTO item9;
    private ItemDTO item10;
    private ItemDTO item11;
    private ItemDTO item12;
    
    private List <ItemDTO> ListItemF;
    
    public TestItemFacturable() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    
        ListItemF = new ArrayList<>();
        item1 = new ItemDTO();
        item2 = new ItemDTO();
        item3 = new ItemDTO();
        item4 = new ItemDTO();
        item5 = new ItemDTO();
        item6 = new ItemDTO();     
        
        item7 = new ItemDTO();
        item8 = new ItemDTO();
        item9 = new ItemDTO();
        item10 = new ItemDTO();
        item11 = new ItemDTO();
        item12 = new ItemDTO();
                
                
//        item1.setItemID(1);
//        item1.setNamerol("Administrador");
//        
//        item2.setItemCoordinador(2);
//        item2.setItemCorte("Analista");
//        
//        item3.setItemValorUnit(3);
//        item3.setNamerol("Gerente");
//        
//        item4.setItemVariableFac(4);
//        item4.setNamerol("Coordinador");
//        
//        item5.setItemCeCo(5);
//        item5.setNamerol("Coordinador");
//        
//        item6.setItemTipoMoneda(6);
//        item6.setNamerol("Coordinador");
//        
//        item7.setItemID(1);
//        item7.setNamerol("Administrador");
//        
//        item8.setItemCoordinador(2);
//        item8.setItemCorte("Analista");
//        
//        item9.setItemValorUnit(3);
//        item9.setNamerol("Gerente");
//        
//        item10.setItemVariableFac(4);
//        item10.setNamerol("Coordinador");
//        
//        item11.setItemCeCo(5);
//        item11.setNamerol("Coordinador");
//        
//        item12.setItemTipoMoneda(6);
//        item12.setNamerol("Coordinador");
//        
//              
//        ListItemF.add(item1);
//        ListItemF.add(item2);
//        ListItemF.add(item5);
//        ListItemF.add(item4);
//        ListItemF.add(item5);
//        ListItemF.add(item6);        
//        ListItemF.add(item7);
//        ListItemF.add(item8);
//        ListItemF.add(item9);
//        ListItemF.add(item10);
//        ListItemF.add(item11);
//        ListItemF.add(item12);
//        
//        
//        
//        
//        
    }
//     
       @After
       public void tearDown() {    }
//
//    // TODO add test methods here.
//    // The methods must be annotated with annotation @Test. For example:
//    //
    @Test
     public void PruebaListItemFacturable()  {
//     
//        try {
//            ItemDAO listarItems = new  ItemDAO();
//            List <ItemDTO> miList2 = listarItems.listarTodosItem("C215");
//            
//            assertEquals(miList2.get(0).getRolid(),ListItemF.get(0).getRolid());
//            assertEquals(miList2.get(0).getNamerol(),ListItemF.get(0).getNamerol());
//            assertEquals(miList2.get(1).getRolid(),ListItemF.get(1).getRolid());
//            assertEquals(miList2.get(1).getNamerol(),ListItemF.get(1).getNamerol());
//            assertEquals(miList2.get(2).getRolid(),ListItemF.get(2).getRolid());
//            assertEquals(miList2.get(2).getNamerol(),ListItemF.get(2).getNamerol());
//            assertEquals(miList2.get(3).getRolid(),ListItemF.get(3).getRolid());
//            assertEquals(miList2.get(3).getNamerol(),ListItemF.get(3).getNamerol());
//            
//            
//        } catch (SQLException | MyErrorExcepcion ex) {
//            Logger.getLogger(TestRoles.class.getName()).log(Level.SEVERE, null, ex);
//        }
     }
    
}
