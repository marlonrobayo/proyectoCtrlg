/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Dto.PersonasDTO;
//import Utilidades.Conectardb;
import Utilidades.MyErrorExcepcion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Utilidades.PoolConection;

//import java.util.logging.Level;
//import java.util.logging.Logger;

/**
 *
 * @author HenryRG
 */
public class LoginDAO {
    
    Connection cnn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public LoginDAO()  {
        
    }
    public PersonasDTO validarUsuario(String loginuser , String pass ) throws MyErrorExcepcion, SQLException {
        PersonasDTO Usuariologin = new PersonasDTO();
        cnn = PoolConection.getInstance();
        try {
            pstmt = cnn.prepareStatement("select nombreapellido, estado, correo, clave from personas where correo=? and clave=md5(?)");
            System.out.println("66666");                                         
            pstmt.setString(1, loginuser);
            pstmt.setString(2, pass);
            rs = pstmt.executeQuery();
            pstmt.toString();
            if (rs !=null && rs.next())  {
                                   
                    Usuariologin.setNombreCompleto(rs.getString("nombreapellido"));
                    Usuariologin.setLoginuser(rs.getString("correo"));
                    Usuariologin.setContrasena(rs.getString("clave"));           
                }
            else {
               Usuariologin=null;
              //throw new MyErrorExcepcion("Usuario no encotrado");
            }
            

        } catch (SQLException ex) {
            //Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new MyErrorExcepcion("error al consultar.. " + ex.getSQLState());
        } 
        finally {
             
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
         return Usuariologin;

    }
    
}
