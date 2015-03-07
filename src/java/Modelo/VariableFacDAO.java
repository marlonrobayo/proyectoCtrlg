/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Dto.VariableFacDTO;
import Utilidades.MyErrorExcepcion;
import Utilidades.PoolConection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author HenryRG
 */
public class VariableFacDAO {
  
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn;

    public VariableFacDAO() {
     
    }
    
     public ArrayList listarTodosVarFac() throws MyErrorExcepcion, SQLException {
        ArrayList<VariableFacDTO> miListaVarFac = new ArrayList();
        cnn = PoolConection.getInstance();
         try {
         pstmt =cnn.prepareStatement("SELECT CodVariablesFacturables, NombreVariableFact "
                 + "FROM variablesfacturables");
         
         rs = pstmt.executeQuery();
             if (rs != null) {
                 while (rs.next()) {
                   VariableFacDTO listaVar = new VariableFacDTO();
                   listaVar.setCodVariableFac(rs.getInt("CodVariablesFacturables"));
                   listaVar.setNombreVariableFac(rs.getString("NombreVariableFact"));
                   miListaVarFac.add(listaVar);
                }
             }
         } catch (SQLException ex) {
             
             System.out.println("Se produjo un error " + ex.getMessage());
         }finally{
              if (rs != null) 
                 try { rs.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (pstmt != null) 
                 try { pstmt.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }
       
        }
         
     return miListaVarFac;
     } 
   }
