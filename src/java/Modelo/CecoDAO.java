/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Dto.CecoDTO;
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
public class CecoDAO {
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn;

    public CecoDAO() {
       
    }
    
     public ArrayList listarTodosCeco() throws MyErrorExcepcion, SQLException {
        ArrayList<CecoDTO> miListaCeco = new ArrayList();
        cnn = PoolConection.getInstance();
         try {
         pstmt =cnn.prepareStatement("SELECT CECO_Cod, CECONombre, tbidNitCliente, EncargadoNegocio FROM centroscostos");         
         rs = pstmt.executeQuery();
             if (rs != null) {
                 while (rs.next()) {
                   CecoDTO listaCeco = new CecoDTO();
                   listaCeco.setCodCeco(rs.getString("CECO_Cod"));
                   listaCeco.setNombreCeco(rs.getString("CECONombre"));
                   listaCeco.setEncargadoCeco(rs.getString("EncargadoNegocio"));
                   miListaCeco.add(listaCeco);
                   
                 }
             }
         
         } catch (SQLException ex) {
             throw new MyErrorExcepcion("Se produjo un error " + ex.getMessage());
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
         
     return miListaCeco;
     }
    
}
