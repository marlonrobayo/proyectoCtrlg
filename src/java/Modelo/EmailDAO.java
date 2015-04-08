/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Dto.MensajeDTO;
import Utilidades.PoolConection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HenryRG
 */
public class EmailDAO {    
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    Connection cnn;

    public EmailDAO() throws SQLException {
        cnn = PoolConection.getInstance();
    }


    public String crearRegistroMail(MensajeDTO newCorreo) {
        String salida = "";
        String sql = "INSERT INTO emails (destino, origen, asunto, mensaje) VALUES (?,?,?,?)";
        try {
            pstmt = cnn.prepareStatement(sql);
            pstmt.setString(1, newCorreo.getEmailDestino());
            pstmt.setString(2, newCorreo.getEmailOrigen());
            pstmt.setString(3, newCorreo.getEmailAsunto());
            pstmt.setString(4, newCorreo.getEmailMensaje());
            if (pstmt.executeUpdate() > 0) {
                salida = "Se registro el email con exito.";
            } else {
                salida = "Se produjo un error al crear el registro!!";
            }
        } catch (SQLException sqle) {
            salida = ("Se produjo un error " + sqle.getMessage());
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(MensajeDTO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return salida;
    }

    
}
