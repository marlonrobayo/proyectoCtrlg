/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Dto.TipoMonedaDTO;
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
public class TipoMonedaDAO {
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn;

    public TipoMonedaDAO() {
       }
    
     public ArrayList listarTodosTipoMoneda() throws SQLException, MyErrorExcepcion {
        ArrayList<TipoMonedaDTO> miListaTipMon = new ArrayList();
                cnn = PoolConection.getInstance();

         try {
         pstmt =cnn.prepareStatement("SELECT idtiposmoneda, nombreTipoMoneda, TRM FROM tiposmoneda");
         
         rs = pstmt.executeQuery();
             if (rs != null) {
                 while (rs.next()) {
                   TipoMonedaDTO listaMonT = new TipoMonedaDTO();
                   listaMonT.setIdTipoMoneda(rs.getInt("idtiposmoneda"));
                   listaMonT.setNombreTipoMoneda(rs.getString("nombreTipoMoneda"));
                   listaMonT.setTrmTipoMoneda(rs.getDouble("TRM"));
                   miListaTipMon.add(listaMonT);
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
         
     return miListaTipMon;
    
    
}
    
}
