/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Dto.RolesDTO;
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
public class RolesDAO {
    
    PreparedStatement pstmt1 = null;
    ResultSet rs1 = null;
    Connection cnn;

    public RolesDAO() {
            }
     
    
    
    public ArrayList listarRoles() throws SQLException, MyErrorExcepcion {
        ArrayList<RolesDTO> miLista1 = new ArrayList();
        cnn = PoolConection.getInstance();
        try {
            pstmt1 = cnn.prepareStatement("SELECT idroles, NombreRol FROM roles");
            rs1 = pstmt1.executeQuery();
            if (rs1 != null) {
                while (rs1.next()) {
                    RolesDTO lisROL = new RolesDTO();
                    lisROL.setRolid(rs1.getInt("idroles"));
                    lisROL.setNamerol(rs1.getString("NombreRol"));
                    miLista1.add(lisROL);
                }
            }
            
        } catch (SQLException ex) {
            System.out.println("Se produjo un error " + ex.getMessage());
        }
        finally {
           if (rs1 != null) 
                 try { rs1.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (pstmt1 != null) 
                 try { pstmt1.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }
        }
        return miLista1;
    }
    
    
    public RolesDTO listarByIdRol(int pk) throws SQLException, MyErrorExcepcion {
        cnn = PoolConection.getInstance();
        RolesDTO pna = new RolesDTO();        
        String sql = "select idroles, NombreRol from roles where idroles=?";
        try {
            pstmt1 = cnn.prepareStatement(sql);
            pstmt1.setInt(1, pk);
            rs1 = pstmt1.executeQuery();
            if (rs1.next()){
                pna.setRolid(rs1.getInt("idroles"));
                pna.setNamerol(rs1.getString("NombreRol"));
               
            } else {
                System.out.println("El codigo Ingresado no existe en el sistema.");
                pna = null;
            }
        } catch (SQLException sqle) {
            System.out.println("Se produjo un error " + sqle.getMessage());
        } finally {
            if (rs1 != null) 
                 try { rs1.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (pstmt1 != null) 
                 try { pstmt1.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }
        }
        return pna;
    }
    
    public String crearRegistroRol(RolesDTO newRol) throws SQLException, MyErrorExcepcion {
         cnn = PoolConection.getInstance();
        String salida = "";
      String sql = "INSERT INTO roles (NombreRol) VALUES (?)";
      String sql2 = "INSERT INTO rolespaginaspermisos (tbidroles,tbidPaginas) VALUES (?,?)";
        try {
            pstmt1 = cnn.prepareStatement(sql);
            pstmt1.setString(1, newRol.getNamerol());
           
            if (pstmt1.executeUpdate() > 0) {
                salida = "Se creo el Rol con exito.";
            } else {
                salida = "Se produjo un error al crear el registro!!";
            }
        } catch (SQLException sqle) {
            salida = ("Se produjo un error " + sqle.getMessage());
        } finally {
           if (rs1 != null) 
                 try { rs1.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (pstmt1 != null) 
                 try { pstmt1.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }
        }
       return salida;
    }
    
    
    public String modificarRegistroRol(RolesDTO newRol) throws SQLException, MyErrorExcepcion {
        cnn = PoolConection.getInstance();
        String salida = "";
        int rst;
        String sql = "UPDATE roles SET NombreRol=? WHERE idroles=? ";
        try {
            pstmt1 = cnn.prepareStatement(sql);
            pstmt1.setInt(2, newRol.getRolid());
            pstmt1.setString(1, newRol.getNamerol());
           
           
            rst = pstmt1.executeUpdate();
            if ( rst > 0) {
               
                salida = "Informacion del Proceso:El registro se actualizo con exito.";
           
            } else {
                salida = "Informacion del Proceso:Se produjo un error al actualizar el registro!!";
                
            }
        } catch (SQLException sqle) {
            salida = ("Se produjo un error " + sqle.getMessage());
        } finally {
           if (rs1 != null) 
                 try { rs1.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (pstmt1 != null) 
                 try { pstmt1.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }
        }
        return salida;
    
}
    
    public String EliminarRegistroRol(int deleteId) throws SQLException, MyErrorExcepcion {
        cnn = PoolConection.getInstance();
       int rst;
       String salida; 
     String sql = "DELETE FROM roles WHERE idroles=?";
        try {
            pstmt1 = cnn.prepareStatement(sql);
            pstmt1.setInt(1, deleteId);
            rst = pstmt1.executeUpdate();
            if ( rst > 0) {
               
                salida = "Informacion del Proceso:El registro fue eliminado con exito.";
           
            } else {
                
                salida = "Informacion del Proceso:No se pudo eliminar el registro!, no existe.";
                
            }
        } catch (SQLException sqle) {
            salida = ("Se produjo un error " + sqle.getMessage());
        } finally {
           if (rs1 != null) 
                 try { rs1.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (pstmt1 != null) 
                 try { pstmt1.close();} 
             catch (SQLException ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
             }
             if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }
        }
        return salida;
    }
        
}
