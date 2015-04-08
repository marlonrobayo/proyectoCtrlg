/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dto;

/**
 *
 * @author HenryRG
 */
public class MensajeDTO {
   
    
       private String emailDestino;
       private String emailOrigen;
       private String emailAsunto;
       private String emailMensaje;
       private String emailpass;

    public MensajeDTO(String emailDestino, String emailOrigen, String emailAsunto, String emailMensaje) {
        this.emailDestino = emailDestino;
        this.emailOrigen = emailOrigen;
        this.emailAsunto = emailAsunto;
        this.emailMensaje = emailMensaje;
        this.emailpass = "Terry2048*+";
   
    }
    /**
     * @return the emailDestino
     */
    public String getEmailDestino() {
        return emailDestino;
    }

    /**
     * @param emailDestino the emailDestino to set
     */
    public void setEmailDestino(String emailDestino) {
        this.emailDestino = emailDestino;
    }

    /**
     * @return the emailOrigen
     */
    public String getEmailOrigen() {
        return emailOrigen;
    }

    /**
     * @param emailOrigen the emailOrigen to set
     */
    public void setEmailOrigen(String emailOrigen) {
        this.emailOrigen = emailOrigen;
    }

    /**
     * @return the emailAsunto
     */
    public String getEmailAsunto() {
        return emailAsunto;
    }

    /**
     * @param emailAsunto the emailAsunto to set
     */
    public void setEmailAsunto(String emailAsunto) {
        this.emailAsunto = emailAsunto;
    }

    /**
     * @return the emailMensaje
     */
    public String getEmailMensaje() {
        return emailMensaje;
    }

    /**
     * @param emailMensaje the emailMensaje to set
     */
    public void setEmailMensaje(String emailMensaje) {
        this.emailMensaje = emailMensaje;
    }

    /**
     * @return the emailpass
     */
    public String getEmailpass() {
        return emailpass;
    }

    /**
     * @param emailpass the emailpass to set
     */
    public void setEmailpass(String emailpass) {
        this.emailpass = emailpass;
    }
      
     
}
