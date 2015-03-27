/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Dto.PersonasDTO;
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
public class PersonasDAO {
    
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    PreparedStatement pstmt1 = null;
    ResultSet rs1 = null;
       
    Connection cnn;
      
    public PersonasDAO() {
             }
    
    
    public ArrayList listarTodos() throws SQLException, MyErrorExcepcion {
        ArrayList<PersonasDTO> miLista2 = new ArrayList();
        cnn = PoolConection.getInstance();
        try {
            pstmt = cnn.prepareStatement("select Cedula, NombreApellido, Estado, Correo, NombreRol, Clave from personas\n" +
"inner join personasroles on personasroles.tbidPersona=personas.cedula \n" +
"inner join roles on roles.idroles=personasroles.tbidroles\n" +
"order by Cedula");
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    PersonasDTO lisPersona = new PersonasDTO();
                    lisPersona.setCc(rs.getString("Cedula"));
                    lisPersona.setNombreCompleto(rs.getString("NombreApellido"));
                    lisPersona.setEstadouser(rs.getInt("Estado"));
                    lisPersona.setLoginuser(rs.getString("Correo"));
                    lisPersona.setRoluser(rs.getString("NombreRol"));
                    lisPersona.setContrasena(rs.getString("Clave"));
                    miLista2.add(lisPersona);
                }
            }
            
        } catch (SQLException ex) {
            throw new MyErrorExcepcion("Se produjo un error al traer la consulta " + ex.getMessage());
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
        return miLista2;
    }
    
    
 public PersonasDTO listarByIdPer(String pk) throws SQLException, MyErrorExcepcion {
        PersonasDTO pna1 = new PersonasDTO();
        cnn = PoolConection.getInstance();
        try {
        String sql = "select Cedula, NombreApellido, Estado, Correo, NombreRol, Clave from personas\n" +
"inner join personasroles on personasroles.tbidPersona=personas.cedula \n" +
"inner join roles on roles.idroles=personasroles.tbidroles WHERE Cedula=?";
        
            pstmt = cnn.prepareStatement(sql);
            pstmt.setString(1, pk);
            rs = pstmt.executeQuery();
            if (rs != null && rs.next()){
                pna1.setCc(rs.getString("Cedula"));
                pna1.setNombreCompleto(rs.getString("NombreApellido"));
                pna1.setRoluser(rs.getString("NombreRol"));
                pna1.setEstadouser(rs.getInt("Estado"));
                pna1.setLoginuser(rs.getString("Correo"));
                pna1.setContrasena(rs.getString("Clave"));
            } else {
                System.out.println("El codigo Ingresado no existe en el sistema.");
                
                //pna1 = null;
            }
        } catch (SQLException sqle) {
            System.out.println("Se produjo un error al consultar" + sqle.getMessage());
        } finally {
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
        return pna1;
    }

 
 public String crearRegistroPersona(PersonasDTO newuser, String cedula) throws SQLException, MyErrorExcepcion {
        
        String salida = "";
        cnn = PoolConection.getInstance();
        try {
            String sql1 = "SELECT Cedula FROM personas WHERE Cedula=?";
            pstmt1 = cnn.prepareStatement(sql1);
            pstmt1.setString(1, cedula);
            rs1 = pstmt1.executeQuery();
            rs1.toString();
            if (rs1.absolute(1)== true){
                salida = "El usuario ya existe en el sistema con la cedula:"+ cedula;  
            } else{
                
            String sql = "INSERT INTO personas (cedula, nombreapellido, estado, correo, clave, celular, aprobado, fecharegistro) VALUES (?,?,?,?,md5(?),?,?,?)";            
            pstmt = cnn.prepareStatement(sql);
            pstmt.setString(1, newuser.getCc());
            pstmt.setString(2, newuser.getNombreCompleto());
            pstmt.setInt(3, newuser.getEstadouser());
            pstmt.setString(4, newuser.getLoginuser());
            pstmt.setString(5, newuser.getContrasena());
            pstmt.setInt(6, newuser.getCelu());
            pstmt.setInt(7, newuser.getAproba());
            pstmt.setString(8, newuser.getFehcaIn());
            
            
            if (pstmt.executeUpdate() > 0) {
                salida += "Se creo el usuario con exito ";
                pstmt = null;
            } else {
                salida += "Se produjo un error al crear el usuario!!";
                pstmt = null;
            }
            String sql2 = "INSERT INTO personasroles (tbidPersona, tbidroles) VALUES (?,?)";            
            pstmt = cnn.prepareStatement(sql2);
            pstmt.setString(1, cedula );
            pstmt.setInt(2, newuser.getRoluserint());
                        
            if (pstmt.executeUpdate() > 0) {
                salida += "y permisos asignados correctamente";
            } else {
                salida += "y no se pudo vincular el Rol";
            }
            
            }
        } catch (SQLException sqle) {
            salida = ("Se produjo un error " + sqle.getMessage());
        } finally {
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
       return salida;
    }
 
 public String EliminarRegistroClient(String deleteId) throws MyErrorExcepcion, SQLException {
       cnn = PoolConection.getInstance();
       int rst;
       String salida; 
       String sql = "DELETE * FROM personas WHERE Cedula=?";
        try {
            pstmt = cnn.prepareStatement(sql);
            pstmt.setString(1, deleteId);
            rst = pstmt.executeUpdate();
            if ( rst > 0) {
               
                salida = "El registro fue eliminado con exito.";
           
            } else {
                
                salida = "No se pudo eliminar el registro!, no existe.";
                
            }
        } catch (SQLException sqle) {
            salida = ("Se produjo un error " + sqle.getMessage());
        } finally {
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
        return salida;
    }
 
  public String modificarRegistro(PersonasDTO newUser) throws SQLException, MyErrorExcepcion {
       cnn = PoolConection.getInstance();
        String salida = "";
        int rst;
        String sql = "UPDATE personas SET NombreApellido=?, Estado=?, Correo=?, Clave=md5(?) WHERE Cedula=?";
        
        try {
            pstmt = cnn.prepareStatement(sql);
            pstmt.setString(5, newUser.getCc());
            pstmt.setString(1, newUser.getNombreCompleto());
            pstmt.setInt(2, newUser.getEstadouser());
            pstmt.setString(3, newUser.getLoginuser());                 
            pstmt.setString(4, newUser.getContrasena()); 
            rst = pstmt.executeUpdate();
            if ( rst > 0) {
               
                salida += "El Usuario fue actualizo con exito, ";
                pstmt = null;
           
            } else {
                salida += "Se produjo un error al actualizar el registro, los";
                pstmt = null;
            }
            
            String sql1 = "UPDATE personasroles SET tbidroles=? WHERE tbidPersona=?";
            pstmt = cnn.prepareStatement(sql1);
            pstmt.setString(2, newUser.getCc());
            pstmt.setInt(1, newUser.getRoluserint());        
            rst = pstmt.executeUpdate();
            if ( rst > 0) {
               
                salida += "Felicitaciones";
           
            } else {
                salida += "permisos no sufrieron cambios";
                
            }
 
            
        } catch (SQLException sqle) {
            salida = ("Se produjo un error " + sqle.getMessage());
        } finally {
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
        return salida;
    }
 
   
}
