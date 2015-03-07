/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Dto.ClientesDTO;
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
public class ClienteDAO {
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn;

    public ClienteDAO() {
           }
    
    public ArrayList listarTodosClientes() throws MyErrorExcepcion, SQLException {
        ArrayList<ClientesDTO> milistaClie = new ArrayList();
        cnn = PoolConection.getInstance();
        try {
            pstmt = cnn.prepareStatement("select NitCliente, NombreCliente, CllienteSAp, RadicacionFactura, TipoDeRadicacion, Analista from clientscorporativos");

            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    ClientesDTO listaCliesnte= new ClientesDTO();
                    listaCliesnte.setNitCliente(rs.getString("NitCliente"));
                    listaCliesnte.setNombreCliente(rs.getString("NombreCliente"));
                    listaCliesnte.setSapCodigoCliente(rs.getString("CllienteSAp"));
                    listaCliesnte.setRadicacionCliente(rs.getString("RadicacionFactura"));
                    listaCliesnte.setTipoRadCliente(rs.getString("TipoDeRadicacion"));
                    listaCliesnte.setAnalistacliente(rs.getString("Analista"));
                    milistaClie.add(listaCliesnte);             
             
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
        return  milistaClie;    
    }
    
}
