/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Dto.PermisosDTO;
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
public class PermisosDAO {
    
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn;

    public PermisosDAO() {
        
    }

    public ArrayList listarTodos(String correo) throws SQLException, MyErrorExcepcion {
        ArrayList<PermisosDTO> miLista = new ArrayList();
       cnn = PoolConection.getInstance();

        try {
            pstmt = cnn.prepareStatement("SELECT paginaspermisos.url, paginaspermisos.nombre, roles.idroles, roles.NombreRol\n" +
"FROM paginaspermisos INNER  JOIN rolespaginaspermisos ON paginaspermisos.idPaginas = rolespaginaspermisos.tbidPaginas \n" +
"INNER  JOIN roles ON rolespaginaspermisos.tbidroles = roles.idroles\n" +
"INNER  JOIN personasroles ON roles.idroles = personasroles.tbidroles\n" +
"INNER JOIN personas ON personasroles.tbidPersona = personas.Cedula\n" +
"WHERE  personas.Correo=?");
            pstmt.setString(1, correo);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    PermisosDTO listMenu = new PermisosDTO();
                    listMenu.setUrl(rs.getString("paginaspermisos.url"));
                    listMenu.setNombrePagina(rs.getString("paginaspermisos.nombre"));
                    listMenu.setRolIdPermi(rs.getInt("roles.idroles"));
                    listMenu.setRolNombrePermi(rs.getString("roles.NombreRol"));

                    miLista.add(listMenu);

                }
            }
                     } catch (SQLException ex) {
            System.out.println("Se produjo un error " + ex.getMessage());
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
        return miLista;
    }
    
}
